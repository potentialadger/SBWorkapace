package com.forum.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.forum.bean.PostsBean;

public interface PostsDaoInterface extends JpaRepository<PostsBean, Integer>{


}
