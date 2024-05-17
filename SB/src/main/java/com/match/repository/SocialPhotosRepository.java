package com.match.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.match.bean.SocialPhotosBean;

public interface SocialPhotosRepository extends JpaRepository<SocialPhotosBean, Integer> {
	
/*    @Query(value="from SocialPhotosBean where photoTheme like %:photoTheme%")
    public List<SocialPhotosBean> findByPhotoTheme(@Param("photoTheme") String photoTheme);*/
    
                                                  //實體類   //實體類
    @Query("select p from SocialPhotosBean p where p.userNo = :userNo and p.photoPath = :photoPath")
    public List<SocialPhotosBean> findByUserNoAndPhotoPath(@Param("userNo") Integer userNo, @Param("photoPath") String photoPath);

    
    
    List<SocialPhotosBean> findByUserNo(Integer userNo); 
}
