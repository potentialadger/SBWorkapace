package com.forum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.LikesBean;
import com.forum.dao.LikesDaoInterface;

@Service
public class LikesService implements LikesServiceInterface {

	@Autowired
	private LikesDaoInterface likesDao;
	

	    @Override
		public List<LikesBean> getAllPostsLikes() {
			return likesDao.findAll();
		}
	    
	    @Override
		public void insertLikesPosts(LikesBean likesForum) {
	    	likesDao.save(likesForum);
		}
	    
	    
}