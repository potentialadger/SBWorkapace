package com.activity.bean;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRegistrationsRepository extends JpaRepository<EventRegistrationsBean, Integer> {
    Optional<EventRegistrationsBean> findByRegistrationID(Integer registrationID);
    List<EventRegistrationsBean> findByEventNoAndUserNo(Integer eventNo, Integer userNo);
}
