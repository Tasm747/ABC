package com.ab.profile.service.impl;

import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationAdapter;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.ab.profile.entity.Profile;
import com.ab.profile.entity.Skill;
import com.ab.profile.entity.SkillCategory;
import com.ab.profile.exception.CantCompleteClientRequestException;
import com.ab.profile.form.SignUpForm;
import com.ab.profile.repository.search.ProfileSearchRepository;
import com.ab.profile.repository.storage.ProfileRepository;
import com.ab.profile.repository.storage.SkillCategoryRepository;
import com.ab.profile.service.EditProfileService;
import com.ab.profile.util.DataUtil;

@Service
@SuppressWarnings("unchecked")
public class EditProfileServiceImpl implements EditProfileService 
{
	private static final Logger LOGGER = LoggerFactory.getLogger(EditProfileServiceImpl.class);
	@Autowired
	private ProfileRepository profileRepository;
	
	@Autowired
	private ProfileSearchRepository profileSearchRepository;
	
	@Autowired
	private SkillCategoryRepository skillCategoryRepository;
	
	@Value("${generate.uid.suffix.length}")
	private int generateUidSuffixLength;

	@Value("${generate.uid.alphabet}")
	private String generateUidAlphabet;

	@Value("${generate.uid.max.try.count}")
	private int maxTryCountToGenerateUid;
	
	@Override
	@Transactional
	public Profile createNewProfile(SignUpForm signUpForm) 
	{
		Profile profile = new Profile();
		profile.setUid(generateProfileUid(signUpForm));
		profile.setFirstName(DataUtil.capitalizeName(signUpForm.getFirstName()));
		profile.setLastName(DataUtil.capitalizeName(signUpForm.getLastName()));
		profile.setPassword(signUpForm.getPassword());
		profile.setCompleted(false);
		profileRepository.save(profile);
		registerCreateIndexProfileIfTrancationSuccess(profile);
		return profile;
	}

	private String generateProfileUid(SignUpForm signUpForm) throws CantCompleteClientRequestException 
	{
		String baseUid = DataUtil.generateProfileUid(signUpForm);
		String uid = baseUid;
		for (int i = 0; profileRepository.countByUid(uid) > 0; i++) 
		{
			uid = DataUtil.regenerateUidWithRandomSuffix(baseUid, generateUidAlphabet, generateUidSuffixLength);
			if (i >= maxTryCountToGenerateUid) {
				throw new CantCompleteClientRequestException("Can't generate unique uid for profile: " + baseUid+": maxTryCountToGenerateUid detected");
			}
		}
		return uid;
	}
	
	private void registerCreateIndexProfileIfTrancationSuccess(final Profile profile) 
	{
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() 
		{
			@Override
			public void afterCommit() 
			{
				LOGGER.info("New profile created: {}", profile.getUid());
				profile.setCertificates(Collections.EMPTY_LIST);
				profile.setPractics(Collections.EMPTY_LIST);
				profile.setLanguages(Collections.EMPTY_LIST);
				profile.setSkills(Collections.EMPTY_LIST);
				profile.setCourses(Collections.EMPTY_LIST);
				profileSearchRepository.save(profile);
				LOGGER.info("New profile index created: {}", profile.getUid());
			}
		});
	}

	@Override
	public List<Skill> listSkills(long idProfile) 
	{
		return profileRepository.findOne(idProfile).getSkills();
	}

	@Override
	public List<SkillCategory> listSkillCategories() 
	{
		return skillCategoryRepository.findAll(new Sort("id"));
	}
	
	@Override
	@Transactional
	public void updateSkills(long idProfile, List<Skill> updatedData) 
	{
		Profile profile = profileRepository.findOne(idProfile);
		if (CollectionUtils.isEqualCollection(updatedData, profile.getSkills())) 
		{
			LOGGER.debug("Profile skills: nothing to update");
			return;
		}
		else 
		{
			profile.setSkills(updatedData);
			profileRepository.save(profile);
			registerUpdateIndexProfileSkillsIfTransactionSuccess(idProfile, updatedData);
		}
	}
	
	private void registerUpdateIndexProfileSkillsIfTransactionSuccess(final long idProfile, final List<Skill> updatedData) 
	{
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() 
		{
			@Override
			public void afterCommit() 
			{
				LOGGER.info("Profile skills updated");
				updateIndexProfileSkills(idProfile, updatedData);
			}
		});
	}

	private void updateIndexProfileSkills(long idProfile, List<Skill> updatedData)
	{
		Profile profile = profileSearchRepository.findOne(idProfile);
		profile.setSkills(updatedData);
		profileSearchRepository.save(profile);
		LOGGER.info("Profile skills index updated");
	}
}
