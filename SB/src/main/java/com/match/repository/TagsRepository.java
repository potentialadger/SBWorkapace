package com.match.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.match.bean.TagsBean;

public interface TagsRepository extends JpaRepository<TagsBean, Integer> {

}
