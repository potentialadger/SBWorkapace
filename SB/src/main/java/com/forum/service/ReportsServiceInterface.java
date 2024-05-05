package com.forum.service;

import java.util.List;

import com.forum.bean.ReportsBean;

public interface ReportsServiceInterface {

	List<ReportsBean> getAllReports();

	void insertReports(ReportsBean reports);

	void deleteReports(Integer reportsNo);
	
}