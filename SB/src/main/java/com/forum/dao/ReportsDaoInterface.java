package com.forum.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.forum.bean.ReportsBean;

public interface ReportsDaoInterface extends JpaRepository<ReportsBean, Integer> {

    
}