package com.forum.service;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.RepliesBean;
import com.forum.dao.RepliesDaoInterface;

@Service
public class RepliesService implements RepliesServiceInterface{
	
	@Autowired
	private RepliesDaoInterface repliesDao;
	
	@Override
	public List<RepliesBean> getRepliesBeanKeyword(String repliesBeanKeyword) {

		return repliesDao.findByContentContaining(repliesBeanKeyword);
	}

	@Override
	public List<RepliesBean> getAllReplies() {
		return repliesDao.findAll();
	}

	@Override
	public void insertReplies(RepliesBean replies) {
		repliesDao.save(replies);
	}

	@Override
	public void deleteReplies(Integer repliesNo) {
		repliesDao.deleteById(repliesNo);
	}

	@Override
	public RepliesBean getRepliesNo(Integer repliesNo) {
		Optional<RepliesBean> repliesOptional = repliesDao.findById(repliesNo);
		return repliesOptional.orElse(null);
	}

	@Override
	public void updateReplies(RepliesBean replies) {
		repliesDao.save(replies);
	}

}
