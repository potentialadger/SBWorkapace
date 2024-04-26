package com.match.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.user.bean.UserBean;

public interface UserRepository extends JpaRepository<UserBean, Integer> {
	
    @Query("SELECT u.nickName, u.goalNo, u.MBTI, u.bloodType, u.userNo FROM UserBean u")
    List<Object[]> findUserFields();
}
