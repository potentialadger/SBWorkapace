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

import com.forum.bean.CategoriesBean;
import com.forum.bean.PostsBean;
import com.forum.service.CategoriesService;
import com.forum.service.PostsServiceInterface;
import com.user.bean.UserBean;
import com.user.service.UserService;

@Controller
@RequestMapping("/posts")
public class PostsController {

	@Autowired
	private PostsServiceInterface postsService;
	private CategoriesService categoriesService;
	private UserService userService;

	// 單筆查詢
	@GetMapping("/OnePosts")
	public String getPostsBeanKeyword(@RequestParam("postsBeanKeyword") String postsBeanKeyword, Model m) {
		List<PostsBean> postsList = postsService.getPostsBeanKeyword(postsBeanKeyword);
		if (postsList != null && !postsList.isEmpty()) {
			m.addAttribute("postsM", postsList);
		} else {
			m.addAttribute("noData", true);
		}
		return "/forum/backstage/categories/jsp/SelectCategories.jsp";
	}

	// 全部查詢
	@GetMapping("/AllPosts")
	public String getAllPosts(Model m) {

		List<PostsBean> postsList = postsService.getAllPosts();
		
		if (postsList != null && !postsList.isEmpty()) {
			m.addAttribute("postsM", postsList);
		} else {
			m.addAttribute("noData", true);
		}
		return "/forum/backstage/categories/jsp/SelectCategories.jsp";
	}

	
	// 刪除
	@DeleteMapping("/DeletePosts")
	public String deletePosts(@RequestParam("postsNo") String postsNo) {

		postsService.deletePosts(Integer.parseInt(postsNo));

		return "redirect:/posts/PostAll";

	}

	// 更新用查詢
	@GetMapping("/UpdateSelectPosts")
	public String getPostsNo(@RequestParam("postsNo") String postsNo, Model m) {

		PostsBean posts = postsService.getPostsNo(Integer.parseInt(postsNo));

		m.addAttribute("updateSelect", posts);

		return "/forum/jsp/Update.jsp";
	
	}

}