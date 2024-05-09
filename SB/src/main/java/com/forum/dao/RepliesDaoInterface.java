package com.forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.forum.bean.RepliesBean;

public interface RepliesDaoInterface extends JpaRepository<RepliesBean, Integer>{

	 @Query( "SELECT r FROM RepliesBean r WHERE LOWER(r.content) LIKE LOWER(CONCAT('%', :keyword, '%'))")
	    List<RepliesBean> findByContentContaining(@Param("keyword") String keyword);
}
