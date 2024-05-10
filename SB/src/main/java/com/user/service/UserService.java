package com.user.service;

import java.io.IOException;
import java.net.http.HttpClient;
import java.time.LocalDateTime;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;


import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;


import org.apache.http.ParseException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import org.hibernate.Hibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
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
	
	
//	// 取得使用者資料
//    public Optional<UserBean> getDataById(Integer userNo) {
//        return uRepository.findById(userNo);
//    }
//    
//    // 獲取所有使用者及其關聯的標籤  // ..? 不是所有資料是只有標籤的資料
//    public List<UserBean> getAllUsersWithTags() {
//        List<UserBean> users = uRepository.findAll();
//        for (UserBean user : users) {
//            Hibernate.initialize(user.getTagsBeans());                       // Hibernate.initialize(user.getTagsBeans());：使用 Hibernate 的 initialize 方法來強制初始化每個使用者對象中的標籤集合。這樣做是為了在返回結果時確保標籤集合已經加載，避免了懶加載引起的應用程式錯誤。
//        }
//        return users;
//    }
//    
//    
//    // 使用者添加一個或多個標籤
//    public UserBean addTagsToUser(Integer userNo, List<Integer> tagNos) {
//        Optional<UserBean> optionalUser = uRepository.findById(userNo);
//        if (optionalUser.isPresent()) {
//            UserBean user = optionalUser.get();
//            Set<TagsBean> tags = user.getTagsBeans();
//            for (Integer tagNo : tagNos) {
//                Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
//                if (optionalTag.isPresent()) {
//                    tags.add(optionalTag.get());
//                }
//            }
//            user.setTagsBeans(tags);
//            return uRepository.save(user);
//        } else {
//            throw new IllegalArgumentException("User not found with id: " + userNo);
//        }
//    }
//    
//    
//    
//    
//	// 使用者移除一個或多個標籤
//    public UserBean removeTagsFromUser(Integer userNo, List<Integer> tagNos) {
//        Optional<UserBean> optionalUser = uRepository.findById(userNo);
//        if (optionalUser.isPresent()) {
//            UserBean user = optionalUser.get();
//            Set<TagsBean> tags = user.getTagsBeans();
//            for (Integer tagNo : tagNos) {
//                Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
//                if (optionalTag.isPresent()) {
//                    tags.remove(optionalTag.get());
//                }
//            }
//            user.setTagsBeans(tags);
//            return uRepository.save(user);
//        } else {
//            throw new IllegalArgumentException("User not found with id: " + userNo);
//        }
//    }
//   
//	
//    
//    
//	
//    //----Test----	
//	
//	
//
////所有的標籤用repository放到set裡面，再用set方法取出
////先做新增
////再做selectAll
//
//	
//	
//
//// 操作這個UserBean的方法都是針對使用者的操作，例如將標籤附加到使用者、從使用者中移除標籤、更新使用者的標籤關聯等。
//	
//	
//// 將一組標籤附加到現有的使用者對象上 (實際上是更新/因為原本就有user了)
//	public UserBean attachTagsToUser(UserBean user, List<Integer> tagNos) {
////		UserBean newUser = uRepository.save(user);   //不需要新創一個user
//		
//		Set<TagsBean> tags = new HashSet<>();
//		for (Integer tagNo : tagNos) {
//			Optional<TagsBean> opTag = tRepository.findById(tagNo);   //Repository 查詢方法返回的是一个 Optional 對象
//			TagsBean tag = null;
//			if (opTag.isPresent()) {
//				tag = opTag.get();
//			}
//
//			if (tag != null) {
//				tags.add(tag);
//			} else {
//				throw new IllegalArgumentException("標籤不存在: " + tagNo);
//			}
//		}
//		user.setTags(tags); // 記得要去UserBean增加getters and setters
//		return uRepository.save(user);
//	}
//
//
////獲取單個用戶及其關聯的標籤
//	public UserBean getUserWithTags(int userNo) {
//		Optional<UserBean> optionalUser = uRepository.findById(userNo);
//		if (optionalUser.isPresent()) {
//			UserBean user = optionalUser.get();
//			Set<TagsBean> tags = user.getTags();
//			user.setTags(tags); // 確保實體關係被正確加載
//			return user;
//		}
//		return null;    //如果其中一個編號不存在，或者使用者或標籤不存在，該方法將返回 null
//	}
//	
////獲取多個用戶及其關聯的標籤
//	public List<UserBean> getAllUsersWithTags() {
//	    List<UserBean> usersWithTags = new ArrayList<>();
//	    List<UserBean> allUsers = uRepository.findAll();
//
//	    for (UserBean user : allUsers) {
//	        UserBean userWithTags = getUserWithTags(user.getUserNo());
//	        if (userWithTags != null) {
//	            usersWithTags.add(userWithTags);
//	        }
//	    }
//
//	    return usersWithTags;
//	}
//
////從用戶中移除多個標籤
//	public UserBean removeTagsFromUser(int userNo, List<Integer> tagNos) {
//		Optional<UserBean> optionalUser = uRepository.findById(userNo);
//		if (optionalUser.isPresent()) {
//			UserBean user = optionalUser.get();
//			Set<TagsBean> tags = user.getTags();
//
//			for (Integer tagNo : tagNos) {
//				Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
//				if (optionalTag.isPresent()) {
//					tags.remove(optionalTag.get());
//				} else {
//					throw new IllegalArgumentException("標籤不存在: " + tagNo);
//				}
//			}
//
//			user.setTags(tags);
//			return uRepository.save(user);
//		}
//		return null;
//	}
//
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
	
	// ---------- LINEPAY金流 ---------------
	private static final String LinePayUrl = "https://sandbox-api-pay.line.me/v2/payments/request";
	private static final String ChannelSecret = "64e9607268ad77d84190c95c76a58054";
    private static final String ChannelId = "2004736885";

    public String getRequestLinePay(UserBean user, Integer amount, String currency, String productName, String confirmUrl) throws ParseException, IOException, JSONException {
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost post = new HttpPost(LinePayUrl);
		post.setHeader("Content-Type", "application/json");
		post.setHeader("X-LINE-ChannelId", ChannelId);
		post.setHeader("X-LINE-ChannelSecret", ChannelSecret);
		
		Random random = new Random();
		int raNum = random.nextInt(10000);
		
		String orderId = "Point" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + raNum;
		
		String json = String.format("{\"amount\": %d, \"productName\": \"%s\", \"currency\": \"%s\", \"confirmUrl\": \"%s\", \"orderId\": \"%s\"}",
				amount, productName, currency, confirmUrl, orderId);

        StringEntity entity = new StringEntity(json);
        post.setEntity(entity);
        
        CloseableHttpResponse response = client.execute(post);
        int statusCode = response.getStatusLine().getStatusCode();
        String responseBody = EntityUtils.toString(response.getEntity());
        
        if(statusCode == 200) {
        	JSONObject jsonObject = new JSONObject(responseBody);
        	System.out.println("回傳: " + jsonObject.optString("returnCode"));
        	if(jsonObject.optString("returnCode").equals("0000")) {
        		String confirmWeb = jsonObject.getJSONObject("info").getJSONObject("paymentUrl").getString("web");
        		return confirmWeb;
        	}
        }
        
        return null;
	}
    
    public UserBean insertPoint100(UserBean user) {
    	user.setPoint(user.getPoint() + 100);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint300(UserBean user) {
    	user.setPoint(user.getPoint() + 310);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint500(UserBean user) {
    	user.setPoint(user.getPoint() + 520);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint1000(UserBean user) {
    	user.setPoint(user.getPoint() + 1050);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint2000(UserBean user) {
    	user.setPoint(user.getPoint() + 2150);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint3000(UserBean user) {
    	user.setPoint(user.getPoint() + 3250);
    	return uRepository.save(user);
    }
    

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
