package com.forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.forum.bean.PostsBean;

public interface PostsDaoInterface extends JpaRepository<PostsBean, Integer>{

	 @Query("SELECT p FROM PostsBean p WHERE LOWER(p.title) LIKE LOWER(CONCAT('%', :keyword, '%'))")
	    List<PostsBean> findByTitleContaining(@Param("keyword") String keyword);
}
