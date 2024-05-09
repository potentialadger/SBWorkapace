package com.forum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.forum.dao.LikesDaoInterface;
import com.user.bean.UserBean;

@Service
public class LikesService implements LikesServiceInterface {

	@Autowired
	private LikesDaoInterface likesDao;
	
	// 查詢文章底下的檢舉
	@Override
	public List<LikesBean> findByPostNo(int postNo) {
		return likesDao.findByPostNo(postNo);
	}
  	
	    @Override
		public List<LikesBean> getAllPostsLikes() {
			return likesDao.findAll();
		}
	    
	    @Override
	    public LikesBean findByUserAndPost(UserBean user, PostsBean post) {
	        return likesDao.findByUserAndPost(user, post);
	    }

	    @Override
		public LikesBean checkAndInsertLike(UserBean user, PostsBean post) {
			// 檢查是否已存在按讚記錄
			LikesBean existingLike = findByUserAndPost(user, post);

			// 如果已存在，則刪除該按讚記錄；否則，插入新的按讚記錄
			if (existingLike != null) {
				likesDao.delete(existingLike);
				return null;
			} else {
				LikesBean newLike = new LikesBean();
				newLike.setUserBean(user);
				newLike.setPostsBean(post);
				return likesDao.save(newLike);
			}
		}
	}

	    
