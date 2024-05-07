package com.forum.service;

import java.util.List;

import com.forum.bean.LikesBean;

public interface LikesServiceInterface {
	
    
    List<LikesBean> getAllPostsLikes();
    
    void insertLikesPosts(LikesBean likes);
}
