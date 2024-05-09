package com.forum.service;

import java.util.List;

import com.forum.bean.PostsBean;
import com.forum.bean.ReportsBean;
import com.user.bean.UserBean;

public interface ReportsServiceInterface {
	
	// 用文章去找檢舉
	List<ReportsBean> findByPostNo(int postNo);

	List<ReportsBean> getAllReports();

	void deleteReports(Integer reportsNo);
	
	ReportsBean findByUserAndPost(UserBean user, PostsBean post);
	    
	ReportsBean checkAndInsertReports(UserBean user, PostsBean post, String reason);
	
}