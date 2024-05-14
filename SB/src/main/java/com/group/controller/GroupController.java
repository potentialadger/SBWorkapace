package com.group.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.dto.GroupDto;
import com.group.model.Group;
import com.group.model.Item;
import com.group.model.ItemSpecification;
import com.group.service.GroupService;
import com.group.service.ItemService;
import com.group.service.ItemSpecService;
import com.user.bean.UserBean;
import com.user.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService gService;
	
	@Autowired
	private ItemService iService;
	
	@Autowired
	private ItemSpecService itemSpecService;
	
	@Autowired
	private UserService userService;
	
//	全活躍活動
	@GetMapping(value = "/groups")
	public String findAllGroup(Model m, HttpServletRequest request) {
		List<Group> groups = gService.findAllGroup();
		
		HttpSession session = request.getSession();
//		UserBean user = (UserBean)session.getAttribute("userData");
		UserBean user = userService.getUserData(1);
		
		m.addAttribute("groups", groups);
		m.addAttribute("userData", user);
		
		return "group/jsp/groups.jsp";
	}
	
//	個人開的活動
	@GetMapping(value = "/mygroups")
	public String findGroupByUser(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
//		UserBean userbean = (UserBean)session.getAttribute("userData");
//		int userNo = userbean.getUserNo();
		Integer userNo = 1;
		
		System.out.println("aaa");
		List<Group> groups = gService.findGroupByUser(userNo);
		m.addAttribute("groups",groups);
		return "group/jsp/mygroup.jsp";
	}
	
//	全活躍活動依開團時間升序
	@GetMapping(value = "/groupsbystimeasc")
	@ResponseBody
	public List<Group> findAllGroupByStartTimeAsc() {
		List<Group> groups = gService.findAllGroupsByStartTimeAsc();
		return groups;
	}
	
//	全活躍活動依開團時間降序
	@GetMapping(value = "/groupsbystimedesc")
	@ResponseBody
	public List<Group> findAllGroupByStartTimeDesc(){
		List<Group> groups = gService.findAllGroupsByStartTimeDesc();
		return groups;
	}
	
//	全活躍活動依結團時間升序
	@GetMapping(value = "/groupsbyetimeasc")
	@ResponseBody
	public List<Group> findAllGroupByEndTimeAsc(){
		List<Group> groups = gService.findALLGroupsByEndTimeAsc();
		return groups;
	}
	
//	全活躍活動依結團時間降序
	@GetMapping(value = "/groupsbyetimedesc")
	@ResponseBody
	public List<Group> findAllGroupByEndTimeDesc(){
		List<Group> groups = gService.findALLGroupsByEndTimeDesc();
		return groups;
	}
	
//	依搜尋找活躍活動
	@GetMapping(value = "/groupsbysearch")
	@ResponseBody
	public List<Group> findGroupBySearch(@RequestParam("search") String search){
		List<Group> groups = gService.findGroupBySearch(search);
		return groups;
	}
	
//	後臺全活躍活動
	@GetMapping(value = "/backgroups")
	public String findAllGroupBack(Model m) {
		List<Group> groups = gService.findAllGroup();
		m.addAttribute("groups", groups);
		return "group/jsp/backallgroups.jsp";
	}
	
//	查詢被下架團購
	@PostMapping(value = "/bannedgroup/{eventno}")
	public String bannedGroupByEventNo(@PathVariable("eventno") Integer eventno) {
		gService.deleteGroup(eventno);
		return "redirect:/group/backgroups";
	}
	
//	新增團購
	@PostMapping(value = "/insertgroup")
	public String insertGroup(@ModelAttribute GroupDto newGroup, HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		UserBean userbean = (UserBean)session.getAttribute("userData");
//		Integer userNo = userbean.getUserNo();
		Integer userNo = 1;
		
		String address = null;
		String account = null;
		String minTotalAmount = null;
		String minTotalQuantity = null;
		
		String title = newGroup.getgTitle();
		String description = newGroup.getgDescription();
		Date endTime = newGroup.getgEndTime();
		if(!newGroup.getgMinTotalAmount().isEmpty()) {
			minTotalAmount = newGroup.getgMinTotalAmount();
		} else {
			minTotalAmount = "0";
		}
		if(!newGroup.getgMinTotalQuantity().isEmpty()) {
			minTotalQuantity = newGroup.getgMinTotalQuantity();
		} else {
			minTotalQuantity = "0";
		}
		String[] payments = newGroup.getPayment();
		if(Arrays.asList(payments).contains("1")) {
			account = newGroup.getAccount();
		}else if (Arrays.asList(payments).contains("2")) {
			address = newGroup.getAddress();
		}
		Group group = gService.insertGroup(userNo, title, description, endTime, payments, minTotalQuantity, minTotalAmount, account, address);
		
		session.setAttribute("eventno", group.getEventNo());
		m.addAttribute("group", group);
		
		return "group/jsp/insertitem.jsp";
	}
	
//	修改團購資訊
	@PostMapping(value = "/updategroup")
	public String updateGroup(@RequestParam("eventno") int eventno, @RequestParam("gtitle") String title, @RequestParam("gdescription") String description, @RequestParam("gendtime") @DateTimeFormat(pattern = "yyyy-MM-dd") Date gEndTime,
			 @RequestParam("payment") String[] pay, @RequestParam("mintotalquantity") String mintotalquantity, @RequestParam("mintotalamount") String mintotalamount, @RequestParam("account") String account, 
			 @RequestParam("address") String address) {
		gService.updateGroup(eventno, title, description, gEndTime, pay, Integer.parseInt(mintotalquantity), Integer.parseInt(mintotalamount), account, address);
		return "redirect:/group/mygroups";
	}
//	查詢單筆團購
	@GetMapping("/eachgroup/{eventno}")
	public String findGroupByEventNo(@PathVariable("eventno") Integer eventno, Model m, HttpServletRequest request) {
		Group group = gService.findGroupByEventNo(eventno);
		List<Item> items = iService.findItemsByEventNo(eventno);
		HashMap<Integer, List<ItemSpecification>> specsmap = new HashMap<>();
		HttpSession session = request.getSession();
		
		for (Item item : items) {
			Integer itemno = item.getItemNo();
			List<ItemSpecification> itemspecs = itemSpecService.findItemSpecByItemNo(itemno);
			specsmap.put(itemno, itemspecs);
		}

		session.setAttribute("group", group);
		m.addAttribute("group", group);
		m.addAttribute("items", items);
		m.addAttribute("itemspecmap", specsmap);
		
		return "group/jsp/eachgroup.jsp";
	}
	
	@GetMapping("/groups100")
	public String getDirect100(HttpServletRequest request) {
		HttpSession session = request.getSession();
//		UserBean user = (UserBean)session.getAttribute("userData");
		UserBean user = userService.getUserData(1);
		
		userService.insertPoint100(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups300")
	public String getDirect300(HttpServletRequest request) {
		HttpSession session = request.getSession();
//		UserBean user = (UserBean)session.getAttribute("userData");
		UserBean user = userService.getUserData(1);
		
		userService.insertPoint300(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups500")
	public String getDirect500(HttpServletRequest request) {
		HttpSession session = request.getSession();
//		UserBean user = (UserBean)session.getAttribute("userData");
		UserBean user = userService.getUserData(1);
		
		userService.insertPoint500(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups1000")
	public String getDirect1000(HttpServletRequest request) {
		HttpSession session = request.getSession();
//		UserBean user = (UserBean)session.getAttribute("userData");
		UserBean user = userService.getUserData(1);
		
		userService.insertPoint1000(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups2000")
	public String getDirect2000(HttpServletRequest request) {
		HttpSession session = request.getSession();
//		UserBean user = (UserBean)session.getAttribute("userData");
		UserBean user = userService.getUserData(1);
		
		userService.insertPoint2000(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups3000")
	public String getDirect3000(HttpServletRequest request) {
		HttpSession session = request.getSession();
//		UserBean user = (UserBean)session.getAttribute("userData");
		UserBean user = userService.getUserData(1);
		
		userService.insertPoint3000(user);
		
		return "redirect:/group/groups";
	}
	
}
