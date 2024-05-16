package com.user.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.bean.UserImageBean;
import com.user.repository.UserImagesRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserImageService {

	@Autowired
	private UserImagesRepository uImgRepository;

	public UserImageBean saveUserImageBean(UserImageBean UIB) {
		return uImgRepository.save(UIB);
	}
	

	

}
