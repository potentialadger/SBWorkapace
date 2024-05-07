package com.user.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.user.bean.UserBean;
import com.user.service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes(names = { "userData" })
public class UserController {

	@Autowired
	private UserService uService;

	@PostMapping("/userSignUp")
	public String processSignUpAction(@RequestParam("account") String account,
			@RequestParam("password") String password, @RequestParam("UCName") String UCName,
			@RequestParam("UEName") String UEName, @RequestParam("Email") String email,
			@RequestParam("Birthday") String birthday, @RequestParam("Phone") String phone,
			@RequestParam("UserAddress") String userAddress, @RequestParam("gender") Integer gender,
			@RequestParam("key") String key, Model m) {

		UserBean insertBean = new UserBean();
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

		uService.creatUser(insertBean);

		return "user/html/LogIn.html";
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

			System.out.println(resultBean.getLastLoginDatetime());
			m.addAttribute("userData", resultBean);
//			request.getSession().setAttribute("userData", resultBean);

			if (resultBean.getIsManager() == 1) {
				return "ManagerIndex.jsp";
			} else {
				return "user/jsp/UserHomePage.jsp";
			}
		}
	}

	@GetMapping("/users")
	public String processFindAllUsersAction(Model m) {
		List<UserBean> allUserData = uService.getAllUserData();

		m.addAttribute("userBeans", allUserData);
		m.addAttribute("result", "有" + allUserData.size() + "個使用者");

		return "user/jsp/ManagerHomePage.jsp";
	}

	@GetMapping("/user/{userno}")
	public String processFindUserForUpdateAction(@PathVariable("userno") int userNo, Model m) {
		UserBean resultBean = uService.getUserData(userNo);
		m.addAttribute("user", resultBean);

		return "user/jsp/UserUpdate.jsp";
	}

	@PutMapping("/userUpdate")
	public String processUpdateUserAction(@RequestParam("userNo") Integer userNo,
			@RequestParam("account") String account, @RequestParam("password") String password,
			@RequestParam("UCName") String UCName, @RequestParam("UEName") String UEName,
			@RequestParam("nickName") String nickName, @RequestParam("avatar") String avatar,
			@RequestParam("email") String email, @RequestParam("birthday") String birthday,
			@RequestParam("phone") String phone, @RequestParam("address") String address,
			@RequestParam("creationDateTime") String creationDateTime,
			@RequestParam("lastLoginDatetime") String lastLoginDatetime, @RequestParam("gender") Integer gender,
			@RequestParam("goalNo") Integer goalNo, @RequestParam("bloodType") String bloodType,
			@RequestParam("MBTI") String MBTI, @RequestParam("suspension") Integer suspension,
			@RequestParam("verify") Integer verify, @RequestParam("isDelete") Integer isDelete,
			@RequestParam("isManager") Integer isManager, Model m) {

		DateTimeFormatter birthdayDF = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'hh:mm");

		UserBean userBean = new UserBean();
		userBean.setUserNo(userNo);
		userBean.setUserAccount(account);
		userBean.setUserPassword(password);
		userBean.setUserChineseName(UCName);
		userBean.setUserEnglishName(UEName);
		userBean.setNickName(nickName);
		userBean.setAvatar(avatar);
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
		userBean.setGoalNo(goalNo);
		userBean.setBloodType(bloodType);
		userBean.setMBTI(MBTI);
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
	
	
	
//---ManyToMany
	
	
	@GetMapping(path = "/findUser/{userNo}.json", produces = "application/json;charset=UTF-8")
	ResponseEntity<UserBean> userBean(@PathVariable("userNo") Integer userNo) {
	Optional<UserBean> optional = uService.getOneById(userNo);
	if (optional.isPresent()) {
	return ResponseEntity.ok(optional.get());
	}
	return ResponseEntity.notFound().build();
	}
	
	
	
	

	
	
// -----------Tags------------
	
	
//	  // 查詢所有用戶（UserBean），並返回它們的清單
//	  @GetMapping("/allUsersProfile")
//	  public ResponseEntity<List<UserBean>> getAllUserBeans(@RequestParam(required = false) String userChineseName) {
//	    List<UserBean> userBeans = new ArrayList<UserBean>();                         //創建一個空的 userBeans 清單，用於存儲從服務（uService）中搜尋到的用戶。
//
//	    if (userChineseName == null)
//	    	uService.findAll().forEach(userBeans::add);                               //使用條件判斷式檢查傳入的參數 userChineseName 是否為空。如果為空，則調用 uService.findAll() 方法檢索所有的用戶，並將它們添加到 userBeans 清單中
//	    else
//	    	uService.findByUserChineseName(userChineseName).forEach(userBeans::add);  //否則，調用 uService.findByUserChineseName(userChineseName) 方法檢索標題中包含指定文字的用戶，並將它們添加到 userBeans 清單中
//
//	    if (userBeans.isEmpty()) {                                                    //檢查 userBeans 清單是否為空。如果是空的，則返回一個 HTTP 狀態碼為 NO_CONTENT 的回應實體，這表示沒有可返回的資源。   
//	      return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//	    }
//
//	    return new ResponseEntity<>(userBeans, HttpStatus.OK);                        //如果 userBeans 清單不為空，則返回一個 HTTP 狀態碼為 OK 的回應實體，並將 userBeans 清單作為回應主體返回給客戶端
//	  }	
//	  
//	  
//	  //根據提供的使用者 ID 查詢資料庫中的使用者
//	  @GetMapping("/allUsersProfile/{userNo}")
//	  public ResponseEntity<UserBean> getById(@PathVariable("userNo") Integer userNo) {
//		  UserBean resultBean = uService.findById(userNo);
//
//	    return new ResponseEntity<>(resultBean, HttpStatus.OK);
//	  }
	
	
	
//-------------	  
	
	
	

	// 為使用者附加標籤(更新)
//	@PostMapping("/users/{userNo}/addTags")
//	public String attachTagsToUser(@PathVariable("userNo") int userNo, @RequestParam("tagNos") List<Integer> tagNos) {
//	    UserBean user = uService.getUserData(userNo);
//	    uService.attachTagsToUser(user, tagNos);
//	    return "redirect:/users/" + userNo;
//	}

//	// 獲取單個使用者及其關聯的標籤
//	@GetMapping("/usertags/{userNo}")
//	public String getUserWithTags(@PathVariable("userNo") Integer userNo, Model model) {
//		UserBean userWithTags = uService.getUserWithTags(userNo);
//		model.addAttribute("user", userWithTags);
//		return "redirect:usertagsHP";
//	}
//
//	// 獲取所有使用者及其關聯的標籤
//	@GetMapping("/userstags")
//	public String getAllUsersWithTags(Model model) {
//		List<UserBean> usersWithTags = uService.getAllUsersWithTags();
//		model.addAttribute("users", usersWithTags);
//		return "redirect:usertagsHP";
//	}
//
//	// 從使用者移除標籤
//	@DeleteMapping("/users/{userNo}/tags")
//	public String removeTagsFromUser(@PathVariable("userNo") int userNo, @RequestParam("tagNos") List<Integer> tagNos) {
//		uService.removeTagsFromUser(userNo, tagNos);
//		return "redirect:/users/" + userNo;
//	}
//
//	// 更新與現有使用者關聯的標籤
//	@PutMapping("/users/{userNo}/updateTags")
//	public String updateUserWithTags(@PathVariable("userNo") int userNo, @RequestParam("tagNos") List<Integer> tagNos) {
//		UserBean user = uService.getUserData(userNo);
//		uService.updateUserWithTags(user, tagNos);
//		return "redirect:/users/" + userNo;
//	}
//	
//	
//	// 關聯 UserBean 與 TagsBean
//	@PostMapping("/users/{userNo}/tags")
//	public String associateUserWithTags(@PathVariable Integer userNo, @RequestParam("tagNos") List<Integer> tagNos) {
//	    uService.associateUserWithTags(userNo, tagNos);
//	    return "redirect:/usertagsHP";
//	}
	
}
