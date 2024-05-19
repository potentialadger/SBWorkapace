package com.user.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.bean.FriendStateBean;
import com.user.bean.UserBean;
import com.user.repository.FriendStateRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class FriendStateService {

	@Autowired
	private FriendStateRepository fsRepository;

	public FriendStateBean saveOrUpdateFriendState(FriendStateBean friendStateBean) {
		return fsRepository.save(friendStateBean);
	}
	
	public FriendStateBean findFriendState(UserBean userBean, UserBean friendBean) {
		return fsRepository.findFriendState(userBean, friendBean);
	}
	
	public void deleteFriendState(FriendStateBean fsBean) {
		fsRepository.delete(fsBean);
	}
}
