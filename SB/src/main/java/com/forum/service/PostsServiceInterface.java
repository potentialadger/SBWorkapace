package com.forum.service;

import java.util.List;

import com.forum.bean.PostsBean;

public interface PostsServiceInterface {

	PostsBean findByPostNo(Integer postNo);
	
	List<PostsBean> findPosts();

	void insertPosts(PostsBean post);

	void deleteByPostNo(Integer postNo);

	void update(PostsBean post);

}
