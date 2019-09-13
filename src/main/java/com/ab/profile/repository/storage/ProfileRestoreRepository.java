package com.ab.profile.repository.storage;

import org.springframework.data.repository.CrudRepository;

import com.ab.profile.entity.ProfileRestore;


public interface ProfileRestoreRepository extends CrudRepository<ProfileRestore, Long> 
{
	
	ProfileRestore findByToken(String token);
}
