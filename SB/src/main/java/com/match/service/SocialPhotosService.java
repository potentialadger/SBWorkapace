package com.match.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.bean.SocialPhotosBean;
import com.match.repository.SocialPhotosRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class SocialPhotosService {

    @Autowired
    private SocialPhotosRepository spRepos;

    
    
    // 查詢單張照片
    public SocialPhotosBean getById(Integer photoNo) {
        Optional<SocialPhotosBean> opPhoto = spRepos.findById(photoNo);
        if (opPhoto.isPresent()) {
            return opPhoto.get();
        }
        return null;
    }

    
    
    // 查詢所有照片
    public List<SocialPhotosBean> findAll() {
        return spRepos.findAll();
    }

    
    
    // 根據用戶ID查詢照片
    /*public List<SocialPhotosBean> findByUserNo(Integer userNo) {
        return spRepos.findByUserNo(userNo);
    }*/
    
    
    
    
    // Match 實作 - 根據用戶編號查詢照片路徑
    public List<String> findByUserNo(Integer userNo) {
        List<SocialPhotosBean> photosBeans = spRepos.findByUserNo(userNo);
        List<String> photoPaths = new ArrayList<>();
        for (SocialPhotosBean photoBean : photosBeans) {
            photoPaths.add(photoBean.getPhotoPath());
        }
        return photoPaths;
    }

    
    // 新增或更新照片
    public SocialPhotosBean insertOrUpdate(Integer userNo, String photoPath, String theme) {
    	
        // 檢查是否存在具有相同 userNo 和 theme 的照片記錄
        List<SocialPhotosBean> existingPhotos = spRepos.findByUserNoAndPhotoTheme(userNo, theme);
        
        if (!existingPhotos.isEmpty()) {
            // 如果存在具有相同 userNo 和 theme 的照片記錄，則更新第一條記錄的 photoPath
            SocialPhotosBean existingPhoto = existingPhotos.get(0);
            existingPhoto.setPhotoPath(photoPath);
            return spRepos.save(existingPhoto);
            
        } else {
            // 如果不存在具有相同 userNo 和 theme 的照片記錄，則插入新照片
            SocialPhotosBean photo = new SocialPhotosBean();
            photo.setUserNo(userNo);
            photo.setPhotoPath(photoPath);
            photo.setPhotoTheme(theme);
            return spRepos.save(photo);
        }
    }
    
    
    
 // 新增或更新照片
 /* public SocialPhotosBean insertOrUpdate(Integer userNo, String photoPath) {
    SocialPhotosBean photo = new SocialPhotosBean();
    photo.setUserNo(userNo);
    photo.setPhotoPath(photoPath);

    
    // 檢查是否存在具有相同 userNo 和 photoPath 的照片紀錄
    List<SocialPhotosBean> existingPhotos = spRepos.findByUserNoAndPhotoPath(userNo, photoPath);
    if (!existingPhotos.isEmpty()) {
    	
    // 如果存在具有相同 userNo 和 photoPath 的照片紀錄,則更新第一條紀錄的 photoPath
    SocialPhotosBean existingPhoto = existingPhotos.get(0);
    existingPhoto.setPhotoPath(photoPath);
    return spRepos.save(existingPhoto);
    } else {
    	
    // 如果不存在具有相同 userNo 和 photoPath 的照片紀錄,則插入新照片
    return spRepos.save(photo);
    }
    }*/

    
    
    // 刪除照片
    public void deleteById(Integer photoNo) {
        spRepos.deleteById(photoNo);
    }
}
	
	
	
	
	
//	//新增照片
//	public SocialPhotosBean insert(SocialPhotosBean spBean) {  // 為什麼參數接收的是整個bean? 因為要用save()?
//		return spRepos.save(spBean);                           // 實際新增
//	}
//	
//	//修改照片
//	public SocialPhotosBean update(SocialPhotosBean spBean) {
//		return spRepos.save(spBean);
//	}

	
	

	
