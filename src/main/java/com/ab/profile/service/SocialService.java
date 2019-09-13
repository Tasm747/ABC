package com.ab.profile.service;

import com.ab.profile.entity.Profile;

public interface SocialService<T> 
{

	Profile loginViaSocialNetwork(T model);
}
