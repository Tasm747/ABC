package com.ab.profile.service;

import com.ab.profile.entity.Profile;
import com.ab.profile.model.NotificationMessage;

public interface NotificationSenderService 
{

	void sendNotification(NotificationMessage message);

	String getDestinationAddress(Profile profile);
}
