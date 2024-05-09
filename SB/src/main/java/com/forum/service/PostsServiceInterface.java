package com.forum.service;

import java.util.List;

import com.forum.bean.PostsBean;

public interface PostsServiceInterface {
	
	// 用分類去找文章
	List<PostsBean> findBycategoryNo(int categoryNo);
	
	List<PostsBean> getPostsBeanKeyword(String postsBeanKeyword);

	List<PostsBean> getAllPosts();

	void insertPosts(PostsBean posts);

	void deletePosts(Integer postsNo);

	PostsBean getPostsNo(Integer postsNo);
	
	void updatePosts(PostsBean posts);
	
	 // 刪除文章的相關回覆
    void deletePostAndReplies(int postNo);
}