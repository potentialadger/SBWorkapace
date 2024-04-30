package com.user.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.user.bean.UserBean;

public interface UserRepository extends JpaRepository<UserBean, Integer> {

	@Query(value = "from UserBean where userAccount = ?1 and userPassword = ?2")
	public UserBean getLoginUserData(String userAccount, String userPassword);
	
	
	@Query("SELECT u.nickName, u.goalNo, u.MBTI, u.bloodType, u.userNo FROM UserBean u")
    List<Object[]> findUserFields();
}
