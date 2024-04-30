package com.match.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.match.bean.TagsBean;

public interface TagsRepository extends JpaRepository<TagsBean, Integer> {
	
//    @Query(value="from GoalsBean where goalName like %:goalName%")
//    public List<TagsBean> findByTagName(@Param("tagName") String tagName);

}