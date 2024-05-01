package com.forum.service;

import java.util.List;

import com.forum.bean.PostsBean;

public interface PostsServiceInterface {

	List<PostsBean> getPostsBeanKeyword(String postsBeanKeyword);

	List<PostsBean> getAllPosts();

	void insertPosts(PostsBean posts);

	void deletePosts(Integer postsNo);

	PostsBean getPostsNo(Integer postsNo);
	
	void updatePosts(PostsBean posts);
}