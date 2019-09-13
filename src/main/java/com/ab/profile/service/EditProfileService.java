package com.ab.profile.service;

import java.util.List;

import com.ab.profile.entity.Profile;
import com.ab.profile.entity.Skill;
import com.ab.profile.entity.SkillCategory;
import com.ab.profile.form.SignUpForm;


public interface EditProfileService 
{

	Profile createNewProfile(SignUpForm signUpForm);
	
	List<Skill> listSkills(long idProfile);

	List<SkillCategory> listSkillCategories();
	
	void updateSkills(long idProfile, List<Skill> skills);
}
