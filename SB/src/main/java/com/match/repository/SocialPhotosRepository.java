package com.match.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.match.bean.SocialPhotosBean;
public interface SocialPhotosRepository extends JpaRepository<SocialPhotosBean, Integer> {
	
	@Query(value="from SocialPhotosBean where photoTheme like %:photoTheme%")
	public List<SocialPhotosBean> findByPhotoTheme(@Param("photoTheme") String photoTheme);

}
