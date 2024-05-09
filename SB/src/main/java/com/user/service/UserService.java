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

	// 個性標籤 - 多對多
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

	
// ---------- 個性標籤 - 多對多 ---------------

//所有的標籤用repository放到set裡面，再用set方法取出
//先做新增
//再做selectAll

	
	
// 操作這個UserBean的方法都是針對使用者的操作，例如將標籤附加到使用者、從使用者中移除標籤、更新使用者的標籤關聯等。
	
	
// 將一組標籤附加到現有的使用者對象上 (實際上是更新/因為原本就有user了)
	public UserBean attachTagsToUser(UserBean user, List<Integer> tagNos) {
//		UserBean newUser = uRepository.save(user);   //不需要新創一個user
		
		Set<TagsBean> tags = new HashSet<>();
		for (Integer tagNo : tagNos) {
			Optional<TagsBean> opTag = tRepository.findById(tagNo);   //Repository 查詢方法返回的是一个 Optional 對象
			TagsBean tag = null;
			if (opTag.isPresent()) {
				tag = opTag.get();
			}

			if (tag != null) {
				tags.add(tag);
			} else {
				throw new IllegalArgumentException("標籤不存在: " + tagNo);
			}
		}
		user.setTags(tags); // 記得要去UserBean增加getters and setters
		return uRepository.save(user);
	}


//獲取單個用戶及其關聯的標籤
	public UserBean getUserWithTags(int userNo) {
		Optional<UserBean> optionalUser = uRepository.findById(userNo);
		if (optionalUser.isPresent()) {
			UserBean user = optionalUser.get();
			Set<TagsBean> tags = user.getTags();
			user.setTags(tags); // 確保實體關係被正確加載
			return user;
		}
		return null;    //如果其中一個編號不存在，或者使用者或標籤不存在，該方法將返回 null
	}
	
//獲取多個用戶及其關聯的標籤
	public List<UserBean> getAllUsersWithTags() {
	    List<UserBean> usersWithTags = new ArrayList<>();
	    List<UserBean> allUsers = uRepository.findAll();

	    for (UserBean user : allUsers) {
	        UserBean userWithTags = getUserWithTags(user.getUserNo());
	        if (userWithTags != null) {
	            usersWithTags.add(userWithTags);
	        }
	    }

	    return usersWithTags;
	}

//從用戶中移除多個標籤
	public UserBean removeTagsFromUser(int userNo, List<Integer> tagNos) {
		Optional<UserBean> optionalUser = uRepository.findById(userNo);
		if (optionalUser.isPresent()) {
			UserBean user = optionalUser.get();
			Set<TagsBean> tags = user.getTags();

			for (Integer tagNo : tagNos) {
				Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
				if (optionalTag.isPresent()) {
					tags.remove(optionalTag.get());
				} else {
					throw new IllegalArgumentException("標籤不存在: " + tagNo);
				}
			}

			user.setTags(tags);
			return uRepository.save(user);
		}
		return null;
	}

// 更新與現有使用者關聯的標籤。
	public UserBean updateUserWithTags(UserBean updatedUser, List<Integer> tagNos) {
		Optional<UserBean> optionalUser = uRepository.findById(updatedUser.getUserNo());
		if (optionalUser.isPresent()) {
			UserBean user = optionalUser.get();

			// 清空原有的標籤關聯
			user.getTags().clear();

			// 添加新的標籤關聯
			Set<TagsBean> tags = new HashSet<>();
			for (Integer tagNo : tagNos) {
				Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
				if (optionalTag.isPresent()) {
					tags.add(optionalTag.get());
				} else {
					throw new IllegalArgumentException("標籤不存在: " + tagNo);
				}
			}
			user.setTags(tags);

			return uRepository.save(user);
		}
		return null;
	}
	
	// ---------- LINEPAY金流 ---------------
	private static final String LinePayUrl = "https://api-pay.line.me/v2/payments/request";
	private static final String ChannelSecret = "4a91e36157b573b652b027d2b69935cb";
    private static final String ChannelId = "2003913073";

    public UserBean getRequestLinePay(UserBean user, Integer amount, String currency, String productName, String confirmUrl) throws ParseException, IOException, JSONException {
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
        	if(jsonObject.optJSONObject("return").optString("returnCode").equals("0000")) {
        		user.setPoint(user.getPoint() + Integer.parseInt(productName));
        		return uRepository.save(user);
        	}
        }
        
        return null;
	}
	

}
