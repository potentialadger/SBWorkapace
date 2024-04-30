package com.forum.service;

import java.util.List;

import com.forum.bean.CategoriesBean;

public interface CategoriesServiceInterface {
	
	List<CategoriesBean> getCategoryKeyword(String categoryKeyword);
	
	List<CategoriesBean> getAllCategories();
        
	void insertCategory(CategoriesBean category);
	
	void deleteCategory(Integer categoryNo);
    
}
