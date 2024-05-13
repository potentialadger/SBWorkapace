package com.forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.forum.bean.PostsBean;

public interface PostsDaoInterface extends JpaRepository<PostsBean, Integer> {

	// 用分類去找文章
	@Query("SELECT p FROM PostsBean p WHERE p.categoriesBean.category_no = :categoryNo")
	List<PostsBean> findBycategoryNo(@Param("categoryNo") int categoryNo);
	
	// 模糊查詢關鍵字標題
	@Query("SELECT p FROM PostsBean p WHERE LOWER(p.title) LIKE LOWER(CONCAT('%', :keyword, '%'))")
	List<PostsBean> findByTitleContaining(@Param("keyword") String keyword);
	
	// 依照瀏覽次數排序
	@Query("SELECT p FROM PostsBean p ORDER BY p.view_count DESC")
	List<PostsBean> findAllByOrderByViewCountDesc();
	
	// 更新瀏覽次數
	@Query("UPDATE PostsBean p SET p.view_count = :viewCount WHERE p.post_no = :postId")
	void updateViewCount(@Param("postId") Integer postId, @Param("viewCount") Integer viewCount);
}
