package com.forum.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.PostsBean;
import com.forum.service.PostsServiceInterface;

@Controller
@RequestMapping("/posts")
public class PostsController {

	@Autowired
	private PostsServiceInterface service;

	// 單筆查詢
	@GetMapping("/OnePosts")
	public String findByPostNo(@RequestParam("postNo") String postNo, Model m) {
	    PostsBean post = service.findByPostNo(Integer.parseInt(postNo));
	    if (post != null) {
	        List<PostsBean> postsList = new ArrayList<>();
	        postsList.add(post);
	        m.addAttribute("posts", postsList);
	    } else {
	        m.addAttribute("noData", true);
	    }
	    return "/forum/jsp/SelectPosts.jsp";
	}

	// 全部查詢
	@GetMapping("/PostAll")
	public String findPosts(Model m) {

		List<PostsBean> postsBeans = service.findPosts();

		m.addAttribute

		("posts", postsBeans);

		return "/forum/jsp/SelectPosts.jsp";
	}

	// 新增
	@PostMapping("/InsertPosts")
	public String insertPosts(
			@RequestParam("title") String title, 
			@RequestParam("content") String content,
			@RequestParam("user_no") String user_no
//			@RequestParam("title") String title
			) {
		PostsBean post = new PostsBean();
//		post.setUser_no(user_no);
//		post.setCategory_no(1);
//		post.setTitle(title);
		post.setContent(content);
		post.setCreation_date(new Date());
		post.setView_count(0);
		post.setLike_count(0);
		post.setStatus("正常");

		service.insertPosts(post);

		return "/forum/jsp/InsertPosts.jsp";
	}

	// 刪除
	@DeleteMapping("/DeletePosts")
	public String deleteByPostNo(@RequestParam("postno") String postno) {

		service.deleteByPostNo(Integer.parseInt(postno));

		return "redirect:/posts/PostAll";

	}

	// 更新用查詢
	@GetMapping("/SelectUpdatePosts")
	public String findByPostNoUpdate(@RequestParam("postNo") String postNo, Model m) {

		PostsBean post = service.findByPostNo(Integer.parseInt(postNo));

		m.addAttribute("update", post);

		return "/forum/jsp/Update.jsp";
	}

	// 更新
	@PutMapping("/UpdatePosts")
	public String update(
			@RequestParam("post_no") String postNo,
			@RequestParam("user_no") String userNo, 
			@RequestParam("category_no") String categoryNo,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam("creation_date") String creationDate,
			@RequestParam("view_count") String viewCount,
			@RequestParam("like_count") String likeCount,
			@RequestParam("status") String status	
			) {
	   
		PostsBean postToUpdate = service.findByPostNo(Integer.parseInt(postNo));				
	    
	    postToUpdate.setTitle(title);
	    postToUpdate.setContent(content);
	    postToUpdate.setStatus(status);

	    service.update(postToUpdate);

		return "redirect:/posts/PostAll";
	}
}