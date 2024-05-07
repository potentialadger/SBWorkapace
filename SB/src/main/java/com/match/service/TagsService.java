package com.match.service;

import java.util.Collections;
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


    
    
    //---ManyToMany
    
    
    public Optional<TagsBean> getOneById(Integer tagNo) {
        return tRepository.findById(tagNo);
    }
    

}