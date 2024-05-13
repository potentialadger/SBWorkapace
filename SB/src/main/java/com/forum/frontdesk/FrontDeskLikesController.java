package com.forum.frontdesk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.forum.service.LikesService;
import com.forum.service.PostsServiceInterface;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("/likesFrontDesk")
public class FrontDeskLikesController {
	
	@Autowired
	private LikesService likesService;
	
	@Autowired
	private PostsServiceInterface postsService;
	
	//前台 喜歡 及 收回
		@PostMapping("/likeOrUnlike")
		public String  likeOrUnlike(
				 @RequestParam("user_no") Integer user_no,
			     @RequestParam("post_no") Integer post_no, 			
				HttpSession session) {
		    UserBean userData = (UserBean) session.getAttribute("userData");
		    PostsBean posts = postsService.getPostsNo(post_no);

		    // 檢查使用者對該文章的按讚狀態
		    LikesBean existingLike = likesService.findByUserAndPost(userData, posts);

		    if (existingLike != null) {
		        // 如果已經按讚，則取消按讚
		    	likesService.checkAndInsertLike(userData, posts); 
		    } else {
		        // 如果未按讚，則執行按讚
		        likesService.checkAndInsertLike(userData, posts); 
		    }
		    return "redirect:/postsFrontDesk/SelectPosts?postsNo=" + post_no + "&title=" + posts.getTitle();
		}
	}
