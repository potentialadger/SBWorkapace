package com.activity.bean;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRegistrationsRepository extends JpaRepository<EventRegistrationsBean, Integer> {

	
	Optional<EventRegistrationsBean> findByRegistration(Integer RegistrationID);

	


}
