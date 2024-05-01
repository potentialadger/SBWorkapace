package com.match.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.match.bean.SocialPhotosBean;

public interface SocialPhotosRepository extends JpaRepository<SocialPhotosBean, Integer> {

}
