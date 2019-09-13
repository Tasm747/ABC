package com.ab.profile.service;

import com.ab.profile.entity.Profile;


public interface NotificationManagerService 
{

	void sendRestoreAccessLink(Profile profile, String restoreLink);

	void sendPasswordChanged(Profile profile);
}
