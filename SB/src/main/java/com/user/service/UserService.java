package com.user.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.repository.TagsRepository;
import com.user.bean.UserBean;
import com.user.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository uRepository;

	// 多對多
//	@Autowired
//	private TagsRepository tRepository;

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

}

// ---------- 個性標籤 - 多對多 ---------------

//所有的標籤用repository放到set裡面，再用set方法取出
//先做新增
//再做selectAll



// 新增 User 時，並設置其關聯的 Tag
//public UserBean createUserWithTags(UserBean user, List<Integer> tagNos) {
//    UserBean newUser = uRepository.save(user);
//    Set<Tag> tags = new HashSet<>();
//    for (Integer tagId : tagIds) {
//        Tag tag = tagRepository.findById(tagId);
//        		tags.add(tag);
//    }
//    newUser.setTags(tags);
//    return userRepository.save(newUser);
//}
