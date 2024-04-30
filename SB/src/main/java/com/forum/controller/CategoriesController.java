package com.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.CategoriesBean;
import com.forum.service.CategoriesServiceInterface;

@Controller
@RequestMapping("/CategoriesController")
public class CategoriesController {

	@Autowired
	private CategoriesServiceInterface categoriesService;

	// 單筆查詢
	@GetMapping("/OneCategories")
	public String getCategoryKeyword(@RequestParam("categoryKeyword") String categoryKeyword, Model m) {
		List<CategoriesBean> categoriesList = categoriesService.getCategoryKeyword(categoryKeyword);
		if (categoriesList != null) {
			m.addAttribute("CategoriesM", categoriesList);
		} else {
			m.addAttribute("noData", true);
		}
		return "/categories/backstage/jsp/SelectCategories.jsp";
	}

	// 全部查詢
	@GetMapping("/CategoriesAll")
	public String findPosts(Model m) {

		List<CategoriesBean> categoriesBean = categoriesService.getAllCategories();

		m.addAttribute

		("CategoriesM", categoriesBean);

		return "/categories/backstage/jsp/SelectCategories.jsp";
	}

	// 新增
	@PostMapping("/InsertCategories")
	public String insertCategory(@RequestParam("title_name") String title_name) {

		CategoriesBean categories = new CategoriesBean();

		categories.setTitle_name(title_name);

		categoriesService.insertCategory(categories);

		return "";
	}

	// 刪除
	@DeleteMapping("/DeleteCategories")
	public String deleteCategory(@RequestParam("categoryNo") String categoryNo) {

		categoriesService.deleteCategory(Integer.parseInt(categoryNo));

		return "";

	}

}