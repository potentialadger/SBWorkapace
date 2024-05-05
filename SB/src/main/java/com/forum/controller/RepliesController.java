package com.forum.controller;

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
import com.forum.bean.RepliesBean;
import com.forum.service.PostsServiceInterface;
import com.forum.service.RepliesService;
import com.user.bean.UserBean;
import com.user.service.UserService;

@Controller
@RequestMapping("/replies")
public class RepliesController {

	@Autowired
	private RepliesService repliesService;

	@Autowired
	private PostsServiceInterface postsService;

	@Autowired
	private UserService userService;

	// 單筆查詢
	@GetMapping("/OneReplies")
	public String getRepliesBeanKeyword(@RequestParam("repliesBeanKeyword") String repliesBeanKeyword, Model m) {
		List<RepliesBean> repliesList = repliesService.getRepliesBeanKeyword(repliesBeanKeyword);
		if (repliesList != null && !repliesList.isEmpty()) {
			m.addAttribute("repliesM", repliesList);
		} else {
			m.addAttribute("noData", true);
		}
		return "/forum/backstage/replies/jsp/SelectReplies.jsp";
	}

	// 全部查詢
	@GetMapping("/AllReplies")
	public String getAllReplies(Model m) {

		List<RepliesBean> RepliesList = repliesService.getAllReplies();

		m.addAttribute("repliesM", RepliesList);

		return "/forum/backstage/replies/jsp/SelectReplies.jsp";
	}

	// 新增
	@PostMapping("/InsertReplies")
	public String insertReplies(
			@RequestParam("post_no") int post_no, 
			@RequestParam("user_no") int user_no,
			@RequestParam("content") String content
			) {
		
		PostsBean posts = postsService.getPostsNo(post_no);
		UserBean user = userService.getUserData(user_no);
		
		RepliesBean replies = new RepliesBean();
		replies.setPostsBean(posts);
		replies.setUserBean(user);
		replies.setContent(content);
		replies.setUpdate_date(new Date());
		
		repliesService.insertReplies(replies);
		
		return "redirect:/posts/AllPosts";
	}

	// 刪除
	@DeleteMapping("/DeleteReplies")
	public String deleteReplies(@RequestParam("repliesNo") String repliesNo) {

		repliesService.deleteReplies(Integer.parseInt(repliesNo));

		return "redirect:/replies/AllReplies";

	}
	
	//更新用查詢
	@GetMapping("/UpdateSelectReplies")
	public String getRepliesNo(@RequestParam("repliesNo") String repliesNo, Model m) {

		RepliesBean replies = repliesService.getRepliesNo(Integer.parseInt(repliesNo));

		m.addAttribute("updateSelect", replies);
		
		return "/forum/backstage/replies/jsp/UpdateReplies.jsp";

	}
	
	//更新
	@PutMapping("/UpdateReplies")
	public String updateReplies(
			@RequestParam("reply_no") int reply_no, 
			@RequestParam("post_no") int post_no, 
			@RequestParam("user_no") int user_no,
			@RequestParam("content") String content,
			@RequestParam("update_date") String update_date
			) {
		
		UserBean user = userService.getUserData(user_no);
		
		PostsBean posts = postsService.getPostsNo(post_no);				
		
		RepliesBean repliesToUpdate = repliesService.getRepliesNo(reply_no);
		
		repliesToUpdate.setUserBean(user);
		repliesToUpdate.setPostsBean(posts);
		repliesToUpdate.setContent(content);
		repliesToUpdate.setUpdate_date(new Date());
		
		repliesService.updateReplies(repliesToUpdate);
		
		return "redirect:/replies/AllReplies";
	}
}
