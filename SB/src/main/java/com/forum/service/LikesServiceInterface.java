package com.forum.service;

import java.util.List;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.user.bean.UserBean;

public interface LikesServiceInterface {
	
    
    List<LikesBean> getAllPostsLikes();
    
    LikesBean findByUserAndPost(UserBean user, PostsBean post);
    
    LikesBean checkAndInsertLike(UserBean user, PostsBean post);
    
}
