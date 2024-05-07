package com.forum.controller;

public class LikeRequest {
    private Integer userNo; 
    
    private Integer postsNo; 
    

    public Integer getUserNo() {
        return userNo;
    }

    public void setUserNo(Integer userNo) {
        this.userNo = userNo;
    }

    public Integer getPostsNo() {
        return postsNo;
    }

    public void setPostsNo(Integer postsNo) {
        this.postsNo = postsNo;
    }
    
    
}