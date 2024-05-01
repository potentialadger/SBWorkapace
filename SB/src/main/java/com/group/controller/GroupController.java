package com.group.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.model.Group;
import com.group.service.GroupService;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService gService;
	
//	全活躍活動
	@GetMapping(value = "/groups", produces = "text/plain;charset=UTF-8")
	public String findAllGroup(Model m) {
		List<Group> groups = gService.findAllGroup();
		m.addAttribute("groups", groups);
		return "group/jsp/groups";
	}
	
//	個人開的活動
	@GetMapping(value = "/mygroups", produces = "text/plain;charset=UTF-8")
	public String findGroupByUser(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
//		UserBean userbean = (UserBean)session.getAttribute("userData");
//		int userNo = userbean.getUserNo();
		Integer userNo = 1;
		
		List<Group> groups = gService.findGroupByUser(userNo);
		m.addAttribute("groups",groups);
		return "group/jsp/mygroups";
	}
	
//	全活躍活動依開團時間升序
	@GetMapping(value = "/groupsbystimeasc", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public List<Group> findAllGroupByStartTimeAsc() {
		List<Group> groups = gService.findAllGroupsByStartTimeAsc();
		return groups;
	}
	
//	全活躍活動依開團時間降序
	@GetMapping(value = "/groupsbystimedesc", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public List<Group> findAllGroupByStartTimeDesc(){
		List<Group> groups = gService.findAllGroupsByStartTimeDesc();
		return groups;
	}
	
//	全活躍活動依結團時間升序
	@GetMapping(value = "/groupsbyetimeasc", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public List<Group> findAllGroupByEndTimeAsc(){
		List<Group> groups = gService.findALLGroupsByEndTimeAsc();
		return groups;
	}
	
//	全活躍活動依結團時間降序
	@GetMapping(value = "/groupsbyetimedesc", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public List<Group> findAllGroupByEndTimeDesc(){
		List<Group> groups = gService.findALLGroupsByEndTimeDesc();
		return groups;
	}
	
//	依搜尋找活躍活動
	@GetMapping(value = "/groupsbysearch", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public List<Group> findGroupBySearch(@RequestParam("search") String search){
		List<Group> groups = gService.findGroupBySearch(search);
		return groups;
	}
	
//	後臺全活躍活動
	@GetMapping(value = "/backgroups", produces = "text/plain;charset=UTF-8")
	public String findAllGroupBack(Model m) {
		List<Group> groups = gService.findAllGroup();
		m.addAttribute("groups", groups);
		return "group/jsp/backallgroups.jsp";
	}
	
//	查詢被下架團購
	@PostMapping(value = "/bannedgroup/{eventno}", produces = "text/plain;charset=UTF-8")
	public String bannedGroupByEventNo(@PathVariable("eventno") Integer eventno) {
		gService.deleteGroup(eventno);
		return "redirect:/group/backgroups";
	}
	
//	新增團購
	@PostMapping(value = "/insertgroup", produces = "text/plain;charset=UTF-8")
	public String insertGroup(@RequestParam("gtitle") String title, @RequestParam("gdescription") String description, @RequestParam("gendtime") @DateTimeFormat(pattern = "yyyy-MM-dd") Date gEndTime,
			 @RequestParam("payment") String[] pay, @RequestParam("mintotalquantity") String mintotalquantity, @RequestParam("mintotalamount") String mintotalamount, @RequestParam("account") String account, 
			 @RequestParam("address") String address, HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		UserBean userbean = (UserBean)session.getAttribute("userData");
		
//		Integer userNo = userbean.getUserNo();
		
		Integer userNo = 1;
		
		Group group = gService.insertGroup(userNo, title, description, gEndTime, pay, mintotalquantity, mintotalamount, account, address);
		Integer eventno = group.getEventno();
		session.setAttribute("eventno", eventno);
		m.addAttribute("group",group);
		
		System.out.println("new eventno = " + eventno);
		
		return "group/jsp/insertgroup.jsp";
	}
	
//	修改團購資訊
	@PostMapping(value = "/updategroup", produces = "text/plain;charset=UTF-8")
	public String updateGroup(@RequestParam("eventno") int eventno, @RequestParam("gtitle") String title, @RequestParam("gdescription") String description, @RequestParam("gendtime") @DateTimeFormat(pattern = "yyyy-MM-dd") Date gEndTime,
			 @RequestParam("payment") String[] pay, @RequestParam("mintotalquantity") String mintotalquantity, @RequestParam("mintotalamount") String mintotalamount, @RequestParam("account") String account, 
			 @RequestParam("address") String address) {
		gService.updateGroup(eventno, title, description, gEndTime, pay, Integer.parseInt(mintotalquantity), Integer.parseInt(mintotalamount), account, address);
		return "redirect:/group/mygroups";
	}
	
}
