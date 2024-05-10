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

	@Autowired
	private RepliesService repliesService;

	// 查詢文章底下的檢舉
	@Override
	public List<PostsBean> findBycategoryNo(int categoryNo) {
		return postsDao.findBycategoryNo(categoryNo);
	}

	// 關鍵字模糊查詢標題
	@Override
	public List<PostsBean> getPostsBeanKeyword(String postsBeanKeyword) {
		return postsDao.findByTitleContaining(postsBeanKeyword);
	}

	// 查詢全部
	@Override
	public List<PostsBean> getAllPosts() {
		return postsDao.findAll();
	}

	// 新增
	@Override
	public void insertPosts(PostsBean post) {
		postsDao.save(post);
	}

	// 依照編號刪除
	@Override
	public void deletePosts(Integer postsNo) {
		postsDao.deleteById(postsNo);
	}

	// 編號查詢單筆
	@Override
	public PostsBean getPostsNo(Integer postsNo) {
		Optional<PostsBean> postsOptional = postsDao.findById(postsNo);
		return postsOptional.orElse(null);
	}

	// 更新
	@Override
	public void updatePosts(PostsBean posts) {
		postsDao.save(posts);
	}

	// 刪除文章的相關回覆
	@Override
	public void deletePostAndReplies(int postNo) {
		// 先刪除文章的相關回覆
		repliesService.deleteReplies(postNo);
		// 然后刪除文章
		postsDao.deleteById(postNo);
	}
	
	// 更新瀏覽次數
	
}
