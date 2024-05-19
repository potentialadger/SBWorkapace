package com.user.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.user.bean.FriendStateBean;
import com.user.bean.UserBean;

public interface FriendStateRepository extends JpaRepository<FriendStateBean, Integer> {
	
	@Query(value = "from FriendStateBean where userBean = ?1 AND friendBean = ?2")
	public FriendStateBean findFriendState(UserBean userBean, UserBean friendBean);
}
