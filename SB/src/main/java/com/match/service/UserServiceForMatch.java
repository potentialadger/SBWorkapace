package com.match.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.bean.GoalsBean;
import com.user.bean.UserBean;
import com.match.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserServiceForMatch implements IUserService {

    private final UserRepository userRepos;

    @Autowired
    public UserServiceForMatch(UserRepository userRepos) {
        this.userRepos = userRepos;
    }

    @Override
    public UserBean getById(int userNo) {
        // 实现从数据库中根据userNo查询UserBean的逻辑
        return userRepos.findById(userNo).orElse(null);
    }

    @Override
    public UserBean updateUser(UserBean uBean) {
        // 实现更新UserBean的逻辑
        return userRepos.save(uBean);
    }
    
	@Override
	public List<UserBean> findAll() {
		return userRepos.findAll();
		
	}
}