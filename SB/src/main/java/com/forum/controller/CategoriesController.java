package com.forum.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.CategoriesBean;
import com.forum.bean.PostsBean;
import com.forum.service.CategoriesServiceInterface;

@Controller
@RequestMapping("/CategoriesController")
public class CategoriesController {
	
	@Autowired
	private CategoriesServiceInterface categoriesService;
	
	// 單筆查詢
	@GetMapping("/OneCategories")
	public String getCategoryByNo(@RequestParam("categoryNo") String categoryNo, Model m) {
		CategoriesBean Categories = categoriesService.getCategoryByNo(Integer.parseInt(categoryNo));
	    if (Categories != null) {
	        List<PostsBean> postsList = new ArrayList<>();
	        postsList.add(post);
	        m.addAttribute("posts", postsList);
	    } else {
	        m.addAttribute("noData", true);
	    }
	    return "/forum/jsp/SelectPosts.jsp";
	}
	
	
}
