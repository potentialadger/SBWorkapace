package com.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.forum.service.LikesService;
import com.forum.service.PostsService;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/likes")
public class LikesController {

	@Autowired
	private LikesService likesService;
	
	@Autowired
	private PostsService postsService;

	// 所有紀錄
	@GetMapping("/AllPostslikes")
	public String getAllPostsLikes(Model m) {

		List<LikesBean> PostsLikesList = likesService.getAllPostsLikes();

		m.addAttribute("PostsLikesListM", PostsLikesList);

		return "/forum/backstage/likes/jsp/SelectLikes.jsp";
	}
	
	// 新增喜歡
	@PostMapping("/InsertlikesPosts")
	public String insertLikesPosts(
			@RequestParam("postsNo") int postsNo,
			Model m,
			HttpSession session
			) {
		
		PostsBean posts = postsService.getPostsNo(postsNo);
		UserBean userData = (UserBean) session.getAttribute("userData");
		
		LikesBean likes = new LikesBean();
		likes.setPostsBean(posts);
		likes.setUserBean(userData);
		
		likesService.insertLikesPosts(likes);
			
		return "redirect:/posts/AllPosts";
	}
	
	
	
}
