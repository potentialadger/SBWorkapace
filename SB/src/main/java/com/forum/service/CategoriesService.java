package com.forum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.CategoriesBean;
import com.forum.dao.CategoriesDaointerface;

@Service
public class CategoriesService implements CategoriesServiceInterface {

	@Autowired
	private CategoriesDaointerface CategoriesDaointerDao;

	@Override
	public CategoriesBean getCategoryByNo(Integer categoryNo) {
		// Optional 中的 orElse(null) 方法 當沒有找到對應的實體時返回 null
		return CategoriesDaointerDao.findById(categoryNo).orElse(null);
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