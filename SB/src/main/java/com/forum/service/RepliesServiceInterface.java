package com.forum.service;

import java.util.List;


import com.forum.bean.RepliesBean;

public interface RepliesServiceInterface {

	List<RepliesBean> getRepliesBeanKeyword(String repliesBeanKeyword);

	List<RepliesBean> getAllReplies();

	void insertReplies(RepliesBean replies);

	void deleteReplies(Integer repliesNo);

	RepliesBean getRepliesNo(Integer repliesNo);
	
	void updateReplies(RepliesBean replies);
	
	//找文章底下的回覆
	List<RepliesBean> findByPostNo(int postNo);
}
