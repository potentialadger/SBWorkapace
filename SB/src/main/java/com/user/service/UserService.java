package com.user.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.bean.UserBean;
import com.user.reoisitory.UserReoisitory;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {
	
	@Autowired
	private UserReoisitory uReoisitory;
	
	
	public UserBean creatUser(UserBean userBean) {
		return uReoisitory.save(userBean);
	}
	
	public UserBean getLoginUserData(UserBean userBean) {
		return uReoisitory.getLoginUserData(userBean.getUserAccount(), userBean.getUserPassword());
	}
	
	public UserBean getUserData(int userNo) {
		Optional<UserBean> op = uReoisitory.findById(userNo);
		
		if(op.isPresent()) return op.get();
		
		return null;
	}
	
	public List<UserBean> getAllUserData() {
		return uReoisitory.findAll();
	}
	
	public int deleteUser(int userNo) {
		uReoisitory.deleteById(userNo);
		return 1;
	}
	
	
	public UserBean updateUser(UserBean inputUserBean) {
		return uReoisitory.save(inputUserBean);
	}
	
	public UserBean updateUserLastLoginTime(UserBean user) {
		user.setLastLoginDatetime(LocalDateTime.now());
		UserBean resultBean = uReoisitory.save(user);
		return resultBean;
	}
	
}






