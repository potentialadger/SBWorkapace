package com.forum.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
	
	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
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
		return "/forum/backstage/posts/jsp/SelectPosts.jsp";
	}

	// 全部查詢
	@GetMapping("/AllPosts")
	public String getAllPosts(Model m) {

		List<PostsBean> postsList = postsService.getAllPosts();

		m.addAttribute("postsM", postsList);

		return "/forum/backstage/posts/jsp/SelectPosts.jsp";
	}

	// 新增
	@PostMapping("/InsertPosts")
	public String insertPosts(@RequestParam("user_no") int user_no, 
			@RequestParam("category_no") int category_no,
			@RequestParam("title") String title, 
			@RequestParam("content") String content,
			@RequestParam("image_url") String image_url, 
			@RequestParam("update_date") String update_date, 
			@RequestParam("view_count") String view_count) {

		UserBean user = userService.getUserData(user_no);

		CategoriesBean category = categoriesService.getCategoryNo(category_no);

		PostsBean posts = new PostsBean();
		posts.setUserBean(user);
		posts.setCategoriesBean(category);
		posts.setTitle(title);
		posts.setContent(content);
		posts.setImage_url(image_url);
		posts.setView_count(Integer.parseInt(view_count));
		posts.setUpdate_date(new Date());

		postsService.insertPosts(posts);

		return "/forum/jsp/InsertPosts.jsp";
	}

	// 刪除
	@DeleteMapping("/DeletePosts")
	public String deletePosts(@RequestParam("postsNo") String postsNo) {

		postsService.deletePosts(Integer.parseInt(postsNo));

		return "redirect:/posts/AllPosts";

	}

	// 更新用查詢和分類
	@GetMapping("/UpdateSelectPosts")
	public String getPostsNo(@RequestParam("postsNo") String postsNo, Model m) {

		PostsBean posts = postsService.getPostsNo(Integer.parseInt(postsNo));

		m.addAttribute("updateSelect", posts);
		
		List<CategoriesBean> categoriesList = categoriesService.getAllCategories();
		
		m.addAttribute("categoriesList", categoriesList);
		

		return "/forum/backstage/posts/jsp/Update.jsp";

	}

	// 更新
	@PutMapping("/UpdatePosts")
	public String updatePosts(
			@RequestParam("post_no") Integer post_no, 
			@RequestParam("user_no") int user_no,
			@RequestParam("category_no") int category_no, 
			@RequestParam("title") String title,
			@RequestParam("content") String content, 
			@RequestParam("image_url") String image_url,
			@RequestParam("update_date") String update_date)
			{

		UserBean user = userService.getUserData(user_no);

		CategoriesBean category = categoriesService.getCategoryNo(category_no);

		PostsBean postsToUpdate = postsService.getPostsNo(post_no);

		postsToUpdate.setUserBean(user);
		postsToUpdate.setCategoriesBean(category);
		postsToUpdate.setTitle(title);
		postsToUpdate.setContent(content);
		postsToUpdate.setImage_url(image_url);
		postsToUpdate.setUpdate_date(new Date());

		postsService.updatePosts(postsToUpdate);

		return "redirect:/posts/AllPosts";
	}

}