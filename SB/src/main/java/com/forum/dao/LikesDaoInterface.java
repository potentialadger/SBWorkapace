package com.forum.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import com.forum.bean.LikesBean;

public interface LikesDaoInterface extends JpaRepository<LikesBean, Integer> {


}
