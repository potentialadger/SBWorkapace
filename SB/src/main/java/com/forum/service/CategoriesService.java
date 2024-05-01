package com.forum.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.CategoriesBean;
import com.forum.dao.CategoriesDaointerface;

@Service
public class CategoriesService implements CategoriesServiceInterface {

	@Autowired
	private CategoriesDaointerface CategoriesDaointerDao;

	@Override
	public List<CategoriesBean> getCategoryKeyword(String categoryKeyword) {
		
		return CategoriesDaointerDao.findByTitleNameContaining(categoryKeyword);
	}
	
	@Override
	public CategoriesBean getCategoryNo(Integer categoryNo) {
		Optional<CategoriesBean> categoryOptional = CategoriesDaointerDao.findById(categoryNo);
		return categoryOptional.orElse(null);
	}

	@Override
	public List<CategoriesBean> getAllCategories() {
		return CategoriesDaointerDao.findAll();
	}

	@Override
	public void insertCategory(CategoriesBean Categories) {
		CategoriesDaointerDao.save(Categories);
	}

	@Override
	public void deleteCategory(Integer categoryNo) {
		CategoriesDaointerDao.deleteById(categoryNo);
	}

}