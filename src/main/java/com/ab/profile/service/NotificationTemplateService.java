package com.ab.profile.service;

import com.ab.profile.model.NotificationMessage;

public interface NotificationTemplateService 
{

	NotificationMessage createNotificationMessage (String templateName, Object model);
}
