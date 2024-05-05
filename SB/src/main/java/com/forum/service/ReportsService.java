package com.forum.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.ReportsBean;
import com.forum.dao.ReportsDaoInterface;


@Service
public class ReportsService implements ReportsServiceInterface {

    @Autowired
    private ReportsDaoInterface reportsDaoInterface; 	

	@Override
	public List<ReportsBean> getAllReports() {
		return reportsDaoInterface.findAll();
	}

	@Override
	public void insertReports(ReportsBean reports) {
		reportsDaoInterface.save(reports);
	}

	@Override
	public void deleteReports(Integer reportsNo) {
		reportsDaoInterface.deleteById(reportsNo);
	}
  
 }
