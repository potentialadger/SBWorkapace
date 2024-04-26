package com.forum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.PostsBean;
import com.forum.dao.PostsDaoInterface;

import java.util.List;

@Service
public class PostsService implements PostsServiceInterface {

    @Autowired
    private PostsDaoInterface postsDao;
    
    @Override
    public PostsBean findByPostNo(Integer postNo) {
    	//Optional 中的 orElse(null) 方法 當沒有找到對應的實體時返回 null	
    	System.out.println(postsDao.findById(postNo).orElse(null));
    	return postsDao.findById(postNo).orElse(null);
    }
    
    @Override
    public List<PostsBean> findPosts() {
        return postsDao.findAll();
    }


    @Override
    public void insertPosts(PostsBean post) {
        postsDao.save(post);
    }

    @Override
    public void deleteByPostNo(Integer postNo) {
        postsDao.deleteById(postNo);
    }

    @Override
    public void update(PostsBean post) {
        postsDao.save(post);
    }
}