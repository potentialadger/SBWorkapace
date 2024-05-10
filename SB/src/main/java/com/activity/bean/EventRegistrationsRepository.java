package com.activity.bean;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRegistrationsRepository extends JpaRepository<EventRegistrationsBean, Integer> {
    List<EventRegistrationsBean> findByEventNoAndUserNo(Integer eventNo, Integer userNo);
}
