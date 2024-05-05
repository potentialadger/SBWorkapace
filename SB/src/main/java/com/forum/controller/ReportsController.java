package com.forum.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.PostsBean;
import com.forum.bean.ReportsBean;
import com.forum.service.PostsServiceInterface;
import com.forum.service.ReportsService;
import com.user.bean.UserBean;
import com.user.service.UserService;

@Controller
@RequestMapping("/reports")
public class ReportsController {

	@Autowired
	private ReportsService reportsService;

	@Autowired
	private PostsServiceInterface postsService;

	@Autowired
	private UserService userService;

	// 全部查詢
	@GetMapping("/AllReports")
	public String getAllReports(Model m) {

		List<ReportsBean> reportsList = reportsService.getAllReports();

		m.addAttribute("reportsM", reportsList);

		return "/forum/backstage/reports/jsp/SelectReports.jsp";
	}

	// 檢舉用查詢文章
	@GetMapping("/SelectReportsPosts")
	public String getPostsNo(@RequestParam("postsNo") String postsNo, Model m) {

		PostsBean posts = postsService.getPostsNo(Integer.parseInt(postsNo));

		m.addAttribute("reportsPosts", posts);

		return "/forum/backstage/reports/jsp/InsertReports.jsp";
	}

	// 新增
	@PostMapping("/InsertReports")
	public String insertReports(@RequestParam("post_no") Integer post_no, 
			@RequestParam("user_no") Integer user_no,
			@RequestParam("reason") String reason
			) {

		PostsBean posts = postsService.getPostsNo(post_no);
		UserBean user = userService.getUserData(user_no);

		ReportsBean reports = new ReportsBean();
		reports.setPostsBean(posts);
		reports.setUserBean(user);
		reports.setReason(reason);
		reports.setReport_date(new Date());

		reportsService.insertReports(reports);

		return "redirect:/reports/AllReports";
	}

	// 刪除
	@DeleteMapping("/DeleteReports")
	public String deleteReports(
			@RequestParam("reportNo") String reportNo, 
			@RequestParam("postNo") String postNo) {

		reportsService.deleteReports(Integer.parseInt(reportNo));
		
		postsService.deletePosts(Integer.parseInt(postNo));
		
		return "redirect:/reports/AllReports";

	}
}
