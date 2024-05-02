package com.match.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.match.bean.SocialPhotosBean;
import com.match.repository.SocialPhotosRepository;
import jakarta.transaction.Transactional;

@Service
@Transactional                                                           //這個注解用於指示 Spring 框架管理的方法應該遵循事務。事務是一組操作，它們要麼全部成功完成，要麼全部失敗並回滾到初始狀態。
public class SocialPhotosService {
	
	@Autowired  //用於將 Repository 自動注入到 Service 類中
	private SocialPhotosRepository spRepos;
	
	
    // 查詢單張照片
	public SocialPhotosBean getById(Integer photoNo) {                   // 接收一個整數參數 photoNo，該參數是照片的唯一標識符。  //使用照片的唯一標識符 photoNo 來查詢資料庫，尋找具有相應標識符的社交照片對象。  //如果找到了該照片，則將其作為 SocialPhotosBean 對象返回。  //如果未找到該照片（即查詢結果為空），則返回 null。
		
		Optional<SocialPhotosBean> opPhoto = spRepos.findById(photoNo);  // 使用 findById 方法從 spRepos 中查詢照片。方法返回一個 Optional<SocialPhotosBean> 對象

		if(opPhoto.isPresent()) {                                        // 檢查 opPhoto 中是否存在查詢的照片  //isPresent() : Optional中的方法，用於檢查 Optional 對象是否包含一個非空值
			return opPhoto.get();                                        // true : 調用 Optional 類中的get()
		}
		
		return null;
	}
	
	
	// 查詢所有照片
	public List<SocialPhotosBean> findAll(){
		return spRepos.findAll();                                        // 檢索資料庫中所有的照片記錄
	}
	
	
	// 根據主題查詢照片
    public List<SocialPhotosBean> findByPhotoTheme(String photoTheme) {
        return spRepos.findByPhotoTheme(photoTheme);
    }
    
    
    // 根據用戶ID和主題查詢照片
    public SocialPhotosBean findByUserNoAndPhotoTheme(Integer userNo, String photoTheme) {       //接收兩個參數：userNo 和 photoTheme
        List<SocialPhotosBean> photos = spRepos.findByUserNoAndPhotoTheme(userNo, photoTheme);   //根據 userNo 和 photoTheme 查詢資料庫並返回符合條件的照片列表
        if (photos.isEmpty()) {                                                                  //if判斷
            return null;
        } else {
            return photos.get(0);                                                                //返回符合條件的第一張照片
        }
    }
    
    
    // 新增或更新照片                                                                 //檔案上傳的
    public SocialPhotosBean insertOrUpdate(Integer userNo, String photoTheme, String photoPath) {
        SocialPhotosBean existingPhoto = findByUserNoAndPhotoTheme(userNo, photoTheme);
        if (existingPhoto != null) {
            // 如果該用戶在指定主題下已有照片,則覆蓋原有照片
            existingPhoto.setPhotoPath(photoPath);   //檔案上傳的傳到這裡                                        //將新的照片路徑 photoPath 設置到現有照片對象 existingPhoto 中的 photoPath 屬性中。
            return spRepos.save(existingPhoto);
        } else {
            // 如果該用戶在指定主題下沒有照片,則插入新照片
            SocialPhotosBean newPhoto = new SocialPhotosBean();                                  //它將創建一個新的照片物件 newPhoto，並設置其用戶ID、照片主題和照片路徑，然後將這個新照片保存到資料庫中
            newPhoto.setUserNo(userNo);
            newPhoto.setPhotoTheme(photoTheme);
            newPhoto.setPhotoPath(photoPath);
            return spRepos.save(newPhoto);
        }
    }
    
    
	//刪除照片
	public void deleteById(Integer photoNo) {
		spRepos.deleteById(photoNo);
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

	
	

	

}
