package com.forum.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.forum.bean.RepliesBean;

public interface RepliesServiceInterface {

	List<RepliesBean> getRepliesBeanKeyword(String repliesBeanKeyword);

	List<RepliesBean> getAllReplies();

	void insertReplies(RepliesBean replies);

	void deleteReplies(Integer repliesNo);

	RepliesBean getRepliesNo(Integer repliesNo);
	
	void updateReplies(RepliesBean replies);
}
