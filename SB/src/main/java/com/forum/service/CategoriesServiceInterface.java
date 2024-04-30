package com.forum.service;

import java.util.List;

import com.forum.bean.CategoriesBean;

public interface CategoriesServiceInterface {
	
	CategoriesBean getCategoryByNo(Integer categoryNo);
	
	List<CategoriesBean> getAllCategories();
        
	void insertCategory(CategoriesBean category);
	
	void deleteCategory(Integer categoryNo);
    
}
