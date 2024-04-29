package com.match.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.bean.TagsBean;
import com.match.repository.TagsRepository;
import com.user.bean.UserBean;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class TagsService {

    @Autowired
    private TagsRepository tRepository;


    // 查詢單個標籤
    public TagsBean getTagById(Integer tagNo) {
        Optional<TagsBean> opTag = tRepository.findById(tagNo);
        
		if(opTag.isPresent()) {
			return opTag.get();
		}
		
		return null;
	}	
    
	//用tagName查詢
	public List<TagsBean> findByTagName(String tagName){   //TagsRepository 新增方法
		return tRepository.findByTagName(tagName);
	}
	
    // 查詢所有標籤
    public List<TagsBean> findAll() {
        return tRepository.findAll();
    }

    // 新增標籤
    public TagsBean insert(TagsBean tBean) {
        return tRepository.save(tBean);
    }
    
    // 刪除標籤
    public void deleteById(Integer tagNo) {
        tRepository.deleteById(tagNo);
    }

    // 更新標籤
    public TagsBean update(TagsBean tBean) {
        return tRepository.save(tBean);
    }

    // 獲取與標籤關聯的所有用戶
    public Set<UserBean> getUsersForTag(Integer tagNo) {
        Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
        if (optionalTag.isPresent()) {
            TagsBean tag = optionalTag.get();
            return new HashSet<>(tag.getUsers()); // 返回一個新的HashSet副本,避免直接暴露實體的集合引用
        }
        return null;
    }


    // 從標籤移除關聯用戶 (?)
    public TagsBean removeUserFromTag(Integer tagNo, UserBean uBean) {
        Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
        if (optionalTag.isPresent()) {
            TagsBean tag = optionalTag.get();
            Set<UserBean> users = new HashSet<>(tag.getUsers()); // 創建一個新的HashSet副本
            users.remove(uBean);
            tag.setUsers(users);
            return tRepository.save(tag);
        }
        return null;
    }
    
    // 為標籤添加關聯用戶 (?)  //用戶註冊時自動分配標籤 時使用的
//    public TagsBean addUserToTag(Integer tagNo, UserBean uBean) {
//        Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
//        if (optionalTag.isPresent()) {
//            TagsBean tag = optionalTag.get();
//            Set<UserBean> users = new HashSet<>(tag.getUsers()); // 創建一個新的HashSet副本  
//            users.add(uBean);
//            tag.setUsers(users);  //要在TagsBean 對users getters and setters
//            return tRepository.save(tag);
//        }
//        return null;
//    }
}