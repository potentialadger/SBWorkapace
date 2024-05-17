package com.match.service;

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
    public List<SocialPhotosBean> findByUserNo(Integer userNo) {
        return spRepos.findByUserNo(userNo);
    }

 // 新增或更新照片
 // 新增或更新照片
    public SocialPhotosBean insertOrUpdate(Integer userNo, String photoPath) {
        SocialPhotosBean photo = new SocialPhotosBean();
        photo.setUserNo(userNo);
        photo.setPhotoPath(photoPath);

        // 如果 photoTheme 为 null,则设置一个随机数作为默认值
        if (photo.getPhotoTheme() == null) {
            Random rand = new Random();
            int randomTheme = rand.nextInt(1000);
            photo.setPhotoTheme(String.valueOf(randomTheme));
        }

        // 检查是否存在具有相同 userNo 和 photoPath 的照片记录
        List<SocialPhotosBean> existingPhotos = spRepos.findByUserNoAndPhotoPath(userNo, photoPath);

        if (!existingPhotos.isEmpty()) {
            // 如果存在具有相同 userNo 和 photoPath 的照片记录,则更新第一条记录的 photoPath
            SocialPhotosBean existingPhoto = existingPhotos.get(0);
            existingPhoto.setPhotoPath(photoPath);
            return spRepos.save(existingPhoto);
        } else {
            // 如果不存在具有相同 userNo 和 photoPath 的照片记录,则插入新照片
            return spRepos.save(photo);
        }
    }

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

	
	

	
