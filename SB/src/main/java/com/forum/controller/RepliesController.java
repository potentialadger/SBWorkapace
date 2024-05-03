package com.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.RepliesBean;
import com.forum.service.PostsServiceInterface;
import com.forum.service.RepliesService;
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
}
