package com.user.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.bean.TagsBean;
import com.match.repository.TagsRepository;
import com.user.bean.UserBean;
import com.user.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository uRepository;

	@Autowired
	private TagsRepository tRepository;

	public UserBean creatUser(UserBean userBean) {
		return uRepository.save(userBean);
	}

	public UserBean getLoginUserData(UserBean userBean) {
		return uRepository.getLoginUserData(userBean.getUserAccount(), userBean.getUserPassword());
	}

	public UserBean getUserData(int userNo) {
		Optional<UserBean> op = uRepository.findById(userNo);

		if (op.isPresent())
			return op.get();

		return null;
	}
	public List<UserBean> getAllUserData() {
		return uRepository.findAll();
	}

	public int deleteUser(int userNo) {
		uRepository.deleteById(userNo);
		return 1;
	}

	public UserBean updateUser(UserBean inputUserBean) {
		return uRepository.save(inputUserBean);
	}

	public UserBean updateUserLastLoginTime(UserBean user) {
		user.setLastLoginDatetime(LocalDateTime.now());
		UserBean resultBean = uRepository.save(user);
		return resultBean;
	}

	

	
//---Tags : ManyToMany
	
	
	// 取得使用者資料
    public Optional<UserBean> getDataById(Integer userNo) {
        return uRepository.findById(userNo);
    }
    
    // 獲取所有使用者及其關聯的標籤  // ..? 不是所有資料是只有標籤的資料
    public List<UserBean> getAllUsersWithTags() {
        List<UserBean> users = uRepository.findAll();
        for (UserBean user : users) {
            Hibernate.initialize(user.getTagsBeans());                       // Hibernate.initialize(user.getTagsBeans());：使用 Hibernate 的 initialize 方法來強制初始化每個使用者對象中的標籤集合。這樣做是為了在返回結果時確保標籤集合已經加載，避免了懶加載引起的應用程式錯誤。
        }
        return users;
    }
    
    
    // 使用者添加一個或多個標籤
    public UserBean addTagsToUser(Integer userNo, List<Integer> tagNos) {
        Optional<UserBean> optionalUser = uRepository.findById(userNo);
        if (optionalUser.isPresent()) {
            UserBean user = optionalUser.get();
            Set<TagsBean> tags = user.getTagsBeans();
            for (Integer tagNo : tagNos) {
                Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
                if (optionalTag.isPresent()) {
                    tags.add(optionalTag.get());
                }
            }
            user.setTagsBeans(tags);
            return uRepository.save(user);
        } else {
            throw new IllegalArgumentException("User not found with id: " + userNo);
        }
    }
    
    
    
    
	// 使用者移除一個或多個標籤
    public UserBean removeTagsFromUser(Integer userNo, List<Integer> tagNos) {
        Optional<UserBean> optionalUser = uRepository.findById(userNo);
        if (optionalUser.isPresent()) {
            UserBean user = optionalUser.get();
            Set<TagsBean> tags = user.getTagsBeans();
            for (Integer tagNo : tagNos) {
                Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
                if (optionalTag.isPresent()) {
                    tags.remove(optionalTag.get());
                }
            }
            user.setTagsBeans(tags);
            return uRepository.save(user);
        } else {
            throw new IllegalArgumentException("User not found with id: " + userNo);
        }
    }
   
	
    
    
	
    //----Test----	
	
	

//所有的標籤用repository放到set裡面，再用set方法取出
//先做新增
//再做selectAll

	
	
//// 更新與現有使用者關聯的標籤。
//	public UserBean updateUserWithTags(UserBean updatedUser, List<Integer> tagNos) {
//		Optional<UserBean> optionalUser = uRepository.findById(updatedUser.getUserNo());
//		if (optionalUser.isPresent()) {
//			UserBean user = optionalUser.get();
//
//			// 清空原有的標籤關聯
//			user.getTags().clear();
//
//			// 添加新的標籤關聯
//			Set<TagsBean> tags = new HashSet<>();
//			for (Integer tagNo : tagNos) {
//				Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
//				if (optionalTag.isPresent()) {
//					tags.add(optionalTag.get());
//				} else {
//					throw new IllegalArgumentException("標籤不存在: " + tagNo);
//				}
//			}
//			user.setTags(tags);
//
//			return uRepository.save(user);
//		}
//		return null;
//	}
//	
//
//	
//	
//	//關聯 UserBean 與 TagsBean
//	public UserBean associateUserWithTags(Integer userNo, List<Integer> tagNos) {
//	    // 獲取 UserBean
//	    Optional<UserBean> optionalUser = uRepository.findById(userNo);
//	    if (optionalUser.isPresent()) {
//	        UserBean user = optionalUser.get();
//	        Set<TagsBean> tags = new HashSet<>();
//
//	        // 獲取 TagsBean 列表
//	        for (Integer tagNo : tagNos) {
//	            Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
//	            if (optionalTag.isPresent()) {
//	                TagsBean tag = optionalTag.get();
//	                tags.add(tag);
//	                tag.getUsers().add(user); // 將 UserBean 添加到 TagsBean 的 users 集合中
//	                tRepository.save(tag); // 保存 TagsBean
//	            }
//	        }
//
//	        // 關聯 UserBean 與 TagsBean
//	        user.setTags(tags);
//
//	        // 保存 UserBean
//	        return uRepository.save(user);
//	    }
//	    return null;
//	}
	

}
