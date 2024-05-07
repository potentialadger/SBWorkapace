package com.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.forum.service.LikesService;
import com.forum.service.PostsServiceInterface;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/likes")
public class LikesController {

	@Autowired
	private LikesService likesService;
	
	@Autowired
	private PostsServiceInterface postsService;

	// 所有紀錄
	@GetMapping("/AllPostslikes")
	public String getAllPostsLikes(Model m) {

		List<LikesBean> PostsLikesList = likesService.getAllPostsLikes();

		m.addAttribute("PostsLikesListM", PostsLikesList);

		return "/forum/backstage/likes/jsp/SelectLikes.jsp";
	}
	
	@PostMapping("/likeOrUnlike")
	public String  likeOrUnlike(@ModelAttribute LikeRequest request, HttpSession session) {
	    UserBean userData = (UserBean) session.getAttribute("userData");
	    PostsBean posts = postsService.getPostsNo(request.getPostsNo());

	    // 檢查使用者對該文章的按讚狀態
	    LikesBean existingLike = likesService.findByUserAndPost(userData, posts);

	    if (existingLike != null) {
	        // 如果已經按讚，則取消按讚
	    	likesService.checkAndInsertLike(userData, posts); 
	    } else {
	        // 如果未按讚，則執行按讚
	        likesService.checkAndInsertLike(userData, posts); 
	    }
	    return"redirect:/posts/AllPosts";
	}
}
