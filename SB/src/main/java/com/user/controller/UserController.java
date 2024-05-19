package com.user.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;

import org.apache.http.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.group.dto.GroupDto;
import com.match.bean.TagsBean;
import com.user.bean.FriendStateBean;
import com.user.bean.StateBean;
import com.user.bean.UserBean;
import com.user.bean.UserBean_Vo;
import com.user.bean.UserImageBean;
import com.user.dto.LinePayDto;
import com.user.service.FriendStateService;
import com.user.service.StateService;
import com.user.service.UserImageService;
import com.user.service.UserMailService;
import com.user.service.UserService;
import com.user.util.UserUtil;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes(names = { "userData" })
public class UserController {

	@Autowired
	private UserService uService;
	
	@Autowired
	private UserImageService uImgService;
	
	@Autowired
	private FriendStateService fsService;
	
	@Autowired
	private StateService stateService;
	
	@Autowired
	private UserMailService userMailService;

	@PostMapping("/userSignUp")
	public String processSignUpAction(@RequestParam("account") String account,
			@RequestParam("password") String password, @RequestParam("UCName") String UCName,
			@RequestParam("UEName") String UEName, @RequestParam("Email") String email,
			@RequestParam("Birthday") String birthday, @RequestParam("Phone") String phone,
			@RequestParam("UserAddress") String userAddress, @RequestParam("gender") Integer gender,
			@RequestParam("key") String key, @RequestParam("avatar") MultipartFile avatar, 
			Model m) {

		UserBean insertBean = new UserBean();
		
		// 處理頭貼圖片
		if(!avatar.isEmpty() || avatar.getSize() > 0)
		{
			String uploadImgPath = UserUtil.uploadImg(avatar);
			insertBean.setAvatar(uploadImgPath);
		}
		else {
			insertBean.setAvatar("userDefault.png");
		}
		

		insertBean.setUserAccount(account);
		insertBean.setUserPassword(password);
		insertBean.setUserChineseName(UCName);
		insertBean.setUserEnglishName(UEName);
		insertBean.setEmail(email);

		birthday += " 00-00-00";
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-ss");
		LocalDateTime birthdayDateTime = LocalDateTime.parse(birthday, dateTimeFormatter);
		insertBean.setBirthday(birthdayDateTime);

		insertBean.setPhone(phone);
		insertBean.setUserAddress(userAddress);
		insertBean.setGender(gender);
		insertBean.setSuspension(0);
		insertBean.setVerify(0);
		insertBean.setIsDelete(0);

		insertBean.setCreationDatetime(LocalDateTime.now());
		insertBean.setLastLoginDatetime(LocalDateTime.now());

		if (key.equals("AdgerSoHandsome")) {
			insertBean.setIsManager(1);
		} else {
			insertBean.setIsManager(0);
		}

		insertBean.setPoint(0);

		UserBean creatUser = uService.creatUser(insertBean);
		
		//將頭貼存進使用者圖片的資料庫裡
		UserImageBean userImageBean = new UserImageBean(creatUser, creatUser.getAvatar());
		uImgService.saveUserImageBean(userImageBean);
		
		return "user/html/NewLogin.html";
	}

	@PostMapping("/userLogin")
	public String processLoginAction(@RequestParam("account") String account, @RequestParam("password") String password,
			Model m, HttpServletRequest request) {

		UserBean loginBean = new UserBean();
		loginBean.setUserAccount(account);
		loginBean.setUserPassword(password);

		UserBean resultBean = uService.getLoginUserData(loginBean);

		if (resultBean == null) {
			return "user/jsp/LoginError.jsp";
		} else {
			// 更新最後登入時間
			resultBean = uService.updateUserLastLoginTime(resultBean);

			m.addAttribute("userData", resultBean);
//			request.getSession().setAttribute("userData", resultBean);

			if (resultBean.getIsManager() == 1) {
				return "redirect:/users";
			} else {
				return "redirect:/aboutMe";
			}
		}
	}

	@GetMapping("/users")
	public String processFindAllUsersAction(Model m) {
		List<UserBean> allUserData = uService.getAllUserData();

		m.addAttribute("userBeans", allUserData);
		m.addAttribute("result", "有" + allUserData.size() + "個使用者");

		return "user/jsp/userDate_BackSatge.jsp";
	}

	@GetMapping("/user/{userno}")
	public String processFindUserForUpdateAction(@PathVariable("userno") int userNo, Model m) {
		UserBean resultBean = uService.getUserData(userNo);
		m.addAttribute("user", resultBean);

		return "user/jsp/UserUpdate.jsp";
	}
	
	@GetMapping("/userResponseBody/{userno}")
	@ResponseBody
	public UserBean processResponseBodyFindUserForUpdateAction(@PathVariable("userno") int userNo) {
		UserBean resultBean = uService.getUserData(userNo);

		return resultBean;
	}

	@PutMapping("/userUpdate")
	public String processUpdateUserAction(@RequestParam("userNo") Integer userNo,
			@RequestParam("account") String account, @RequestParam("password") String password,
			@RequestParam("UCName") String UCName, @RequestParam("UEName") String UEName,
			@RequestParam("avatar") MultipartFile avatar,
			@RequestParam("email") String email, @RequestParam("birthday") String birthday,
			@RequestParam("phone") String phone, @RequestParam("address") String address,
			@RequestParam("creationDateTime") String creationDateTime,
			@RequestParam("lastLoginDatetime") String lastLoginDatetime, @RequestParam("gender") Integer gender,
			@RequestParam("suspension") Integer suspension,
			@RequestParam("verify") Integer verify, @RequestParam("isDelete") Integer isDelete,
			@RequestParam("isManager") Integer isManager, Model m) {

		DateTimeFormatter birthdayDF = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'hh:mm");

//		UserBean userBean = new UserBean();
		UserBean userBean = uService.getUserData(userNo);
		
		userBean.setUserAccount(account);
		userBean.setUserPassword(password);
		userBean.setUserChineseName(UCName);
		userBean.setUserEnglishName(UEName);
//		userBean.setNickName(nickName);
		
		if(!avatar.isEmpty() || avatar.getSize() > 0)
		{
			String uploadImgPath = UserUtil.uploadImg(avatar);
			userBean.setAvatar(uploadImgPath);
		}
//		userBean.setAvatar(avatar);
		userBean.setEmail(email);

		birthday += " 00-00-00";
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-ss");
		LocalDateTime birthdayDateTime = LocalDateTime.parse(birthday, dateTimeFormatter);
		userBean.setBirthday(birthdayDateTime);

		userBean.setPhone(phone);
		userBean.setUserAddress(address);

		userBean.setCreationDatetime(LocalDateTime.parse(creationDateTime));
		userBean.setLastLoginDatetime(LocalDateTime.parse(lastLoginDatetime));

		userBean.setGender(gender);
//		userBean.setGoalNo(goalNo);
//		userBean.setBloodType(bloodType);
//		userBean.setMBTI(MBTI);
		userBean.setSuspension(suspension);
		userBean.setIsDelete(verify);
		userBean.setVerify(isDelete);
		userBean.setIsManager(isManager);

		UserBean updateUserBean = uService.updateUser(userBean);
		int updateRow = 1;

		m.addAttribute("changeState", "更新");
		m.addAttribute("changeRow", updateRow + "");
		m.addAttribute("changeNo", userBean.getUserNo() + "");

		return "redirect:/users";
	}

	@DeleteMapping("/user/{deleteNo}")
	public String processDeleteAction(@PathVariable("deleteNo") int userNo, Model m) {
		uService.deleteUser(userNo);

		return "redirect:/users";
	}


	@GetMapping("getTopBarData")
	@ResponseBody
	public UserBean_Vo getTopBarData(HttpSession session) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		UserBean_Vo userBean_Vo = userBean.getUserBean_Vo();
		return userBean_Vo;
	}
	
	@GetMapping("aboutMe")
	public String abountAction(HttpSession session, Model m) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		m.addAttribute("userBean", userBean);
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return "user/jsp/aboutMe_FontSatge.jsp";
	}
	
	@GetMapping("aboutMeForUpdate")
	public String aboutMeForUpdateAction(HttpSession session, Model m) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		m.addAttribute("userBean", userBean);
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return "user/jsp/updateAboutMe_FontSatge.jsp";
	}
	
	@PutMapping("/aboutMeUserUpdate")
	public String processaboutMeUserUpdateAction(@RequestParam("userNo") Integer userNo,
			@RequestParam("UCName") String UCName, @RequestParam("UEName") String UEName,
			@RequestParam("avatar") MultipartFile avatar,
			@RequestParam("email") String email, @RequestParam("birthday") String birthday,
			@RequestParam("phone") String phone, @RequestParam("address") String address,
			@RequestParam("gender") Integer gender,
			 Model m) {

		DateTimeFormatter birthdayDF = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'hh:mm");

//		UserBean userBean = new UserBean();
		UserBean userBean = uService.getUserData(userNo);
		
		if(!avatar.isEmpty() || avatar.getSize() > 0)
		{
			String uploadImgPath = UserUtil.uploadImg(avatar);
			userBean.setAvatar(uploadImgPath);
			
			UserImageBean userImageBean = new UserImageBean(userBean, uploadImgPath);
			uImgService.saveUserImageBean(userImageBean);
		}
		
		userBean.setUserChineseName(UCName);
		userBean.setUserEnglishName(UEName);
//		userBean.setNickName(nickName);
		
		userBean.setEmail(email);

		birthday += " 00-00-00";
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-ss");
		LocalDateTime birthdayDateTime = LocalDateTime.parse(birthday, dateTimeFormatter);
		userBean.setBirthday(birthdayDateTime);

		userBean.setPhone(phone);
		userBean.setUserAddress(address);

//		userBean.setCreationDatetime(LocalDateTime.parse(creationDateTime));
//		userBean.setLastLoginDatetime(LocalDateTime.parse(lastLoginDatetime));

		userBean.setGender(gender);
//		userBean.setGoalNo(goalNo);
//		userBean.setBloodType(bloodType);
//		userBean.setMBTI(MBTI);
//		userBean.setSuspension(suspension);
//		userBean.setIsDelete(verify);
//		userBean.setVerify(isDelete);
//		userBean.setIsManager(isManager);

		UserBean updateUserBean = uService.updateUser(userBean);
		int updateRow = 1;

		m.addAttribute("changeState", "更新");
		m.addAttribute("changeRow", updateRow + "");
		m.addAttribute("changeNo", userBean.getUserNo() + "");

		return "redirect:/aboutMe";
	}
	
	@GetMapping("userPhotos")
	public String userPhotosAction(HttpSession session, Model m) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		m.addAttribute("userBean", userBean);
		m.addAttribute("userImagesCount", userBean.getUserImages().size());
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return "user/jsp/MyPhoto_FontSatge.jsp";
	}
	
	@PostMapping("userUploadImages")
	public String userUploadImagesAction(HttpSession session, Model m,@RequestParam("images") MultipartFile[] imgs) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		for(MultipartFile img : imgs) {
			if(!img.isEmpty() || img.getSize() > 0)
			{
				String uploadImgPath = UserUtil.uploadImg(img);
				
				UserImageBean userImageBean = new UserImageBean(userBean, uploadImgPath);
				uImgService.saveUserImageBean(userImageBean);
			}
		}
		return "redirect:/userPhotos";
	}
	
	@GetMapping("userFriends")
	public String userFriendsAction(HttpSession session, Model m) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		
		StateBean state = stateService.findStateBystateName("好友");
		
		List<FriendStateBean> friendStateBeans = fsService.findSomeStateFriendState(userBean, state);
		
		List<UserBean> friendBeans = new ArrayList<UserBean>();
		
		for(FriendStateBean fsBean : friendStateBeans) {
			friendBeans.add(fsBean.getFriendBean());
		}
		
		m.addAttribute("userBean", userBean);
		
		m.addAttribute("userFriendsCount", friendBeans.size());
		m.addAttribute("userFriends", friendBeans);
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return "user/jsp/MyFriends_FontSatge.jsp";
	}
	
	
	@GetMapping("userSearch")
	@ResponseBody
	public List<UserBean_Vo> findUserBySearch(@RequestParam("search") String search){
		List<UserBean> findUserBySearch = uService.findUserBySearch(search);
		List<UserBean_Vo> userBean_Vos = new ArrayList<UserBean_Vo>();
		
		for(UserBean ub : findUserBySearch) {
			userBean_Vos.add(ub.getUserBean_Vo());
		}
		
		return userBean_Vos;
	}
	
	@GetMapping("setOtherUserNo/{userNo}")
	public String setOtherUserBean(@PathVariable("userNo") Integer userNo, HttpSession session, Model m) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		if(uBean.getUserNo() == userNo) {
			return "redirect:/aboutMe";
		}
		else {
			UserBean otherUserBean = uService.getUserData(userNo);
			session.setAttribute("otherUserData", otherUserBean);
			
			return "redirect:/otherAboutMe";
		}
	}
	
	@GetMapping("otherAboutMe")
	public String otherAbountAction(HttpSession session, Model m) {
		UserBean uBean = (UserBean)session.getAttribute("otherUserData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		UserBean loginUserBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> loginUserById = uService.getDataById(loginUserBean.getUserNo());
		loginUserBean = loginUserById.get();
		
		FriendStateBean findFriendState = fsService.findFriendState(loginUserBean, uBean);
		
		m.addAttribute("findFriendState", findFriendState);
		m.addAttribute("userBean", userBean);
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return "user/jsp/other_AboutMe_FontSatge.jsp";
	}
	
	@GetMapping("otherUserPhotos")
	public String otherUserPhotosAction(HttpSession session, Model m) {
		UserBean uBean = (UserBean)session.getAttribute("otherUserData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		m.addAttribute("userBean", userBean);
		m.addAttribute("userImagesCount", userBean.getUserImages().size());
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return "user/jsp/other_MyPhoto_FontSatge.jsp";
	}
	
	@GetMapping("otherUserFriends")
	public String otherUserFriendsAction(HttpSession session, Model m) {
		UserBean uBean = (UserBean)session.getAttribute("otherUserData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		List<FriendStateBean> friendStateBeans = userBean.getFriendStates();
		
		List<UserBean> friendBeans = new ArrayList<UserBean>();
		
		for(FriendStateBean fsBean : friendStateBeans) {
			friendBeans.add(fsBean.getFriendBean());
		}
		
		m.addAttribute("userBean", userBean);
		
		m.addAttribute("userFriendsCount", friendBeans.size());
		m.addAttribute("userFriends", friendBeans);
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return "user/jsp/other_MyFriends_FontSatge.jsp";
	}
	
	
	@GetMapping("otherAboutMe/{userNo}")
	public String otherAbountIDAction(@PathVariable("userNo") Integer userNo, HttpSession session, Model m) {
		UserBean userBean = uService.getUserData(userNo);
		session.setAttribute("otherUserData", userBean);
		
		
		
		UserBean loginUserBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> loginUserById = uService.getDataById(loginUserBean.getUserNo());
		loginUserBean = loginUserById.get();
		
		FriendStateBean findFriendState = fsService.findFriendState(loginUserBean, userBean);
		
		m.addAttribute("findFriendState", findFriendState);
		m.addAttribute("userBean", userBean);
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		if(loginUserBean.getUserNo() == userNo) {
			return "redirect:/aboutMe";
		}
		
		return "user/jsp/other_AboutMe_FontSatge.jsp";
	}
	
	@GetMapping("otherUserPhotos/{userNo}")
	public String otherUserPhotosIDAction(@PathVariable("userNo") Integer userNo, HttpSession session, Model m) {
		UserBean userBean = uService.getUserData(userNo);
		session.setAttribute("otherUserData", userBean);
		
		m.addAttribute("userBean", userBean);
		m.addAttribute("userImagesCount", userBean.getUserImages().size());
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		UserBean loginUserBean = (UserBean)session.getAttribute("userData");
		if(loginUserBean.getUserNo() == userNo) {
			return "redirect:/userPhotos";
		}
		return "user/jsp/other_MyPhoto_FontSatge.jsp";
	}
	
	@GetMapping("otherUserFriends/{userNo}")
	public String otherUserFriendsIDAction(@PathVariable("userNo") Integer userNo, HttpSession session, Model m) {
		UserBean userBean = uService.getUserData(userNo);
		session.setAttribute("otherUserData", userBean);
		
		List<FriendStateBean> friendStateBeans = userBean.getFriendStates();
		
		List<UserBean> friendBeans = new ArrayList<UserBean>();
		
		for(FriendStateBean fsBean : friendStateBeans) {
			friendBeans.add(fsBean.getFriendBean());
		}
		
		m.addAttribute("userBean", userBean);
		
		m.addAttribute("userFriendsCount", friendBeans.size());
		m.addAttribute("userFriends", friendBeans);
		m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		
		UserBean loginUserBean = (UserBean)session.getAttribute("userData");
		if(loginUserBean.getUserNo() == userNo) {
			return "redirect:/userFriends";
		}
		
		return "user/jsp/other_MyFriends_FontSatge.jsp";
	}
	
	@GetMapping("forgetPasswordToSendMail")
	public String forgetPasswordAction(@RequestParam("email")String email, @RequestParam("account")String account, Model m) throws MessagingException {
		
		UserBean findForgetUserBean = uService.findForgetUserBean(email, account);
		if(findForgetUserBean == null)
		{
			m.addAttribute("err", "並未找到此帳號");
			return "user/jsp/forgot-passwordErr.jsp";
		}
		
		String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < 12; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }

        String randomPassword = sb.toString();
		
        findForgetUserBean.setUserPassword(randomPassword);
        uService.updateUser(findForgetUserBean);
        
		
		List<String> receivers = new ArrayList<String>();
		receivers.add(findForgetUserBean.getEmail());
		
		String mailContent = "<h1>密碼重設</h1>";
		mailContent += "<p>驗證碼："+ randomPassword + "</p>";
		mailContent += "<a href=\"http://localhost:8080/resetPassword\">點此重新設定密碼</a>";
		
		userMailService.sendPlainText(receivers, "SocialBook 忘記密碼", mailContent);
		return "redirect:/sendMailSuccess";
	}
	@GetMapping("checkAndResetPassword")
	public String checkAndResetPasswordAction(@RequestParam("verificationCode")String verificationCode, @RequestParam("newPassword")String newPassword, Model m) {
		UserBean uBean = uService.checkVerificationCode(verificationCode);
		
		if(uBean == null) {
			return "user/jsp/reset-passwordErr.jsp";
		}
		
		uBean.setUserPassword(newPassword);
		uService.updateUser(uBean);
		
		return "redirect:/resetPasswordSuccess";
	}
	

	// ---Tags : ManyToMany

	// 獲取單個使用者及其關聯的標籤
	@GetMapping(path = "/getUserTags/{userNo}")
	public ResponseEntity<Set<TagsBean>> getUserTags(@PathVariable("userNo") Integer userNo) {
		Optional<UserBean> opUser = uService.getDataById(userNo);
		if (opUser.isPresent()) {
			UserBean user = opUser.get();
			Set<TagsBean> tags = user.getTagsBeans();
			return ResponseEntity.ok(tags);
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	
    // 指定返回 JSON 格式的資料，以及資料的編碼格式為 UTF-8
    // @GetMapping(path = "/getUserTags/{userNo}", produces = "application/json;charset=UTF-8"
	
	
	// 獲取所有使用者及其關聯的標籤
//	@GetMapping(path = "/getAllUsersWithTags")
//	public ResponseEntity<List<Set<TagsBean>>> getAllUsersWithTags() {
//	    List<Set<TagsBean>> userTags = uService.getAllUsersWithTags();
//	    return ResponseEntity.ok(userTags);
//	}
	
	
	
	// 獲取所有使用者及所有資料
	@GetMapping(path = "/getAllUsersWithTags")
	public ResponseEntity<List<UserBean>> getAllUsersWithTags() {
		List<UserBean> users = uService.getAllUsersWithTags();
		return ResponseEntity.ok(users);
	}
	
	
	
	// 使用者添加一個或多個標籤 (返回該所有用戶資料)
	@PostMapping(path = "/addUserTags/{userNo}/tags")
	public ResponseEntity<UserBean> addTagsToUser(@PathVariable Integer userNo, @RequestBody List<Integer> tagNos) {
		try {
			UserBean updatedUser = uService.addTagsToUser(userNo, tagNos);
			return ResponseEntity.ok(updatedUser);
		} catch (IllegalArgumentException ex) {
			return ResponseEntity.notFound().build();
		}
	}
	
	
	
	// 使用者添加一個或多個標籤 (只返回關聯的標籤資料)
//	@PostMapping("/addUserTags/{userNo}/tags")
//	public ResponseEntity<Set<TagsBean>> addTagsToUser(@PathVariable Integer userNo, @RequestBody List<Integer> tagNos) {
//	    try {
//	        UserBean updatedUser = uService.addTagsToUser(userNo, tagNos);
//	        return ResponseEntity.ok(updatedUser.getTagsBeans());
//	    } catch (IllegalArgumentException ex) {
//	        return ResponseEntity.notFound().build();
//	    }
//	}
	
	

	// 使用者移除一個或多個標籤 (返回標籤資料)
	@DeleteMapping(path = "/deleteUserTags/{userNo}/tags")
	public ResponseEntity<UserBean> removeTagsFromUser(@PathVariable Integer userNo,
			@RequestBody List<Integer> tagNos) {
		try {
			UserBean updatedUser = uService.removeTagsFromUser(userNo, tagNos);
			return ResponseEntity.ok(updatedUser);
		} catch (IllegalArgumentException ex) {
			return ResponseEntity.notFound().build();
		}
	}

	// 更新與現有使用者關聯的標籤
//	@PutMapping("/users/{userNo}/updateTags")
//	public String updateUserWithTags(@PathVariable("userNo") int userNo, @RequestParam("tagNos") List<Integer> tagNos) {
//		UserBean user = uService.getUserData(userNo);
//		uService.updateUserWithTags(user, tagNos);
//		return "redirect:/users/" + userNo;
//	}
	
	
	
// -----------前端實作Tags------
	
	
    // 保存使用者選擇的標籤
    @PostMapping("/{userNo}/tags")
    public ResponseEntity<?> saveUserTags(@PathVariable("userNo") Integer userNo, 
                                          @RequestBody List<Integer> tagNos) {
        try {
            UserBean user = uService.addTagsToUser(userNo, tagNos);
            return ResponseEntity.ok(user);
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.notFound().build();
        }
    }
    
    
    // 處理標籤更新
    @PostMapping("/updateTags")
    public ResponseEntity<UserBean> updateTags(@RequestBody List<String> selectedTags, HttpSession session) {
        System.err.println(selectedTags);
    	try {
            // 從 session 中獲取當前使用者
            UserBean userBean = (UserBean) session.getAttribute("userData");
            
            // 更新使用者的標籤
            uService.updateUserTags(userBean, selectedTags);
            
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
	
	
	
	
	


	
	
// -----------前端創建資料-------
	
	
	
	            //創建交友資料的路徑
	@GetMapping("/createMatchProfile")           
    public String createMatchProfile(HttpSession session, Model m) {
        UserBean uBean = (UserBean)session.getAttribute("userData");     //從存使用者資料的session中取出它放資料的變數   //為什麼要轉成UserBean的型態?因為userData只有存資料，它不知道每個資料的型態是什麼，UserBean會設定每個屬性的型態
        Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
        UserBean userBean = dataById.get();

        //載入已經儲存的資料到輸入框
        m.addAttribute("userBean", userBean);
        m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        
        uBean.setNickName(userBean.getNickName());
        uBean.setBloodType(userBean.getBloodType());
        uBean.setMBTI(userBean.getMBTI());
        uBean.setGoalNo(userBean.getGoalNo());
        
        // 將更新後的用戶資料保存到資料庫
        uService.updateUser(uBean);
        
        // 重設 session 中的 "userData" attribute
        session.setAttribute("userData", uBean);
        
        return "match/jsp/MatchProfileCreate.jsp";
    }
	
	
	
	
	//當會員點擊 fa-solid fa-user-pen 按鈕時,表單將被提交到 /editMatchProfile 路徑,並由 processEditMatchProfile 方法處理。在該方法中,我們更新資料庫中的用戶資料,並跳轉到 MatchProfileEdit.jsp 頁面
	
	                        //編輯交友資料的路徑     //傳資料到前端的方式
	@RequestMapping(value = "/editMatchProfile", method = {RequestMethod.GET, RequestMethod.POST})
	public String editMatchProfile(@RequestParam(value = "nickName", required = false) String nickName,   //將 @RequestParam 註解的 required 屬性設置為 false,表示這些參數是可選的。這樣即使在重新整理頁面時沒有傳遞這些參數,也不會拋出異常。
	                               @RequestParam(value = "bloodType", required = false) String bloodType,
	                               @RequestParam(value = "MBTI", required = false) String MBTI,
	                               @RequestParam(value = "goalNo", required = false) Integer goalNo,
	                               HttpSession session, Model m) {

	    UserBean uBean = (UserBean)session.getAttribute("userData");
	    Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
	    UserBean userBean = dataById.get();
	    
	    // 如果請求參數為 null,則從 userBean 中獲取對應的屬性值
	    nickName = (nickName != null) ? nickName : userBean.getNickName();           //在方法中添加相應的邏輯來處理請求參數為 null 的情況。你可以從 session 中獲取用戶資料,並將其設置到模型中,以便在頁面中顯示。
	    bloodType = (bloodType != null) ? bloodType : userBean.getBloodType();
	    MBTI = (MBTI != null) ? MBTI : userBean.getMBTI();
	    goalNo = (goalNo != null) ? goalNo : userBean.getGoalNo();
	    
	    // 設置表單提交的數據到 UserBean 對象中
	    userBean.setNickName(nickName);
	    userBean.setBloodType(bloodType);
	    userBean.setMBTI(MBTI);
	    userBean.setGoalNo(goalNo);
	    
	    // 將更新後的用戶資料保存到資料庫
	    uService.updateUser(userBean);
	    
	    // 載入已經儲存的資料到輸入框
	    m.addAttribute("userBean", userBean);
	    m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	    m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	    
	    // 重設 session 中的 "userData" attribute
	    session.setAttribute("userData", userBean);
	    
	    return "match/jsp/MatchProfileEdit.jsp";
	}
	
	
	


    						//配對頁面的路徑	      //傳資料到前端的方式
	@RequestMapping(value = "/matchPage", method = {RequestMethod.GET, RequestMethod.POST})
	public String matchPage(@RequestParam(value = "nickName", required = false) String nickName,
	                        @RequestParam(value = "bloodType", required = false) String bloodType,
	                        @RequestParam(value = "MBTI", required = false) String MBTI,
	                        @RequestParam(value = "goalNo", required = false) Integer goalNo,
	                        @RequestParam(value = "birthday", required = false) Integer birthday,

	                        HttpSession session, Model m) {

	    UserBean uBean = (UserBean)session.getAttribute("userData");
	    Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
	    UserBean userBean = dataById.get();
	    
	    // 如果請求參數為 null,則從 userBean 中獲取對應的屬性值
	    nickName = (nickName != null) ? nickName : userBean.getNickName();
	    bloodType = (bloodType != null) ? bloodType : userBean.getBloodType();
	    MBTI = (MBTI != null) ? MBTI : userBean.getMBTI();
	    goalNo = (goalNo != null) ? goalNo : userBean.getGoalNo();

	    
	    // 設置表單提交的數據到 UserBean 對象中
	    userBean.setNickName(nickName);
	    userBean.setBloodType(bloodType);
	    userBean.setMBTI(MBTI);
	    userBean.setGoalNo(goalNo);
	    
	    // 將更新後的用戶資料保存到資料庫
	    uService.updateUser(userBean);
	    
	    // 載入已經儲存的資料到輸入框
	    m.addAttribute("userBean", userBean);
	    m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	    m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	    
	    // 重設 session 中的 "userData" attribute
	    session.setAttribute("userData", userBean);
	    
	    return "match/jsp/MatchPage.jsp";
	}
	
	

//	-----------LinePay------------

	@PostMapping("/getLinePay")
	@ResponseBody
	public String getRequestLinePay(@RequestBody LinePayDto linePayOrder, HttpServletRequest request, Model m) throws ParseException, IOException, JSONException {
		Integer amount = linePayOrder.getAmount();
		String confirmUrl = linePayOrder.getConfirmUrl();
		String currency = linePayOrder.getCurrency();
		String productName = linePayOrder.getProductName();
		
		System.out.println("amount = " + amount);
		System.out.println("url = " + confirmUrl);
		System.out.println("currency = " + currency);
		System.out.println("product = " + productName);
		
		HttpSession session = request.getSession();
//		UserBean userBean = (UserBean)session.getAttribute("userData");
		UserBean userBean = uService.getUserData(1);
		
		String confirmWeb = uService.getRequestLinePay(userBean, amount, currency, productName, confirmUrl);
		System.out.println("回傳網址:--------------------" + confirmWeb);
		
		return confirmWeb;
	}
	



	
	

}
