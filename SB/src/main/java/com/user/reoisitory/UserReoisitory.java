package com.user.reoisitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.user.bean.UserBean;

public interface UserReoisitory extends JpaRepository<UserBean, Integer> {

	@Query(value = "from UserBean where userAccount = ?1 and userPassword = ?2")
	public UserBean getLoginUserData(String userAccount, String userPassword);
}
