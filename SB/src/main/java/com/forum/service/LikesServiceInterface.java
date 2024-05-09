package com.forum.service;

import java.util.List;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.user.bean.UserBean;

public interface LikesServiceInterface {
	
	// 用文章去找喜歡紀錄
	List<LikesBean> findByPostNo(int postNo);
    
    List<LikesBean> getAllPostsLikes();
    
    LikesBean findByUserAndPost(UserBean user, PostsBean post);
    
    LikesBean checkAndInsertLike(UserBean user, PostsBean post);
    
}
