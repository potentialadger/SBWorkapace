package com.forum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.PostsBean;
import com.forum.dao.PostsDaoInterface;

import java.util.List;
import java.util.Optional;

@Service
public class PostsService implements PostsServiceInterface {

	@Autowired
	private PostsDaoInterface postsDao;

	@Override
	public List<PostsBean> getPostsBeanKeyword(String postsBeanKeyword) {

		return postsDao.findByTitleContaining(postsBeanKeyword);
	}

	@Override
	public List<PostsBean> getAllPosts() {
		return postsDao.findAll();
	}

	@Override
	public void insertPosts(PostsBean post) {
		postsDao.save(post);
	}

	@Override
	public void deletePosts(Integer postsNo) {
		postsDao.deleteById(postsNo);
	}

	@Override
	public PostsBean getPostsNo(Integer postsNo) {
		Optional<PostsBean> postsOptional = postsDao.findById(postsNo);
		return postsOptional.orElse(null);
	}

	@Override
	public void updatePosts(PostsBean posts) {
		postsDao.save(posts);
	}
}