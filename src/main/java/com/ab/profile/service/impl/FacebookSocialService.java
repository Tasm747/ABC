package com.ab.profile.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ab.profile.entity.Profile;
import com.ab.profile.repository.storage.ProfileRepository;
import com.ab.profile.service.SocialService;
import com.restfb.types.User;

@Service
public class FacebookSocialService implements SocialService<User> 
{

	@Autowired
	private ProfileRepository profileRepository;
	
	@Override
	public Profile loginViaSocialNetwork(User model) 
	{
		if(StringUtils.isNotBlank(model.getEmail())) 
		{
			Profile p = profileRepository.findByEmail(model.getEmail());
			if(p != null)
			{
				return p;
			}
		}
		//TODO Signup required here
		return null;
	}

}
