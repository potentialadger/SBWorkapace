package com.group.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.model.Group;
import com.group.service.GroupService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService gService;
	
//	全活躍活動
	@GetMapping("/groups")
	public String findAllGroup(Model m) {
		List<Group> groups = gService.findAllGroup();
		m.addAttribute("groups", groups);
		return "group/jsp/groups";
	}
	
//	個人開的活動
	@GetMapping("/mygroups")
	public String findGroupByUser(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
//		UserBean userbean = (UserBean)session.getAttribute("userData");
//		int userNo = userbean.getUserNo();
		int userNo = 1;
		
		List<Group> groups = gService.findGroupByUser(userNo);
		m.addAttribute("groups",groups);
		return "group/jsp/mygroups";
	}
	
//	全活躍活動依開團時間升序
	@GetMapping("/groupsbystimeasc")
	@ResponseBody
	public List<Group> findAllGroupByStartTimeAsc() {
		List<Group> groups = gService.findAllGroupsByStartTimeAsc();
		return groups;
	}
	
//	全活躍活動依開團時間降序
	@GetMapping("/groupsbystimedesc")
	@ResponseBody
	public List<Group> findAllGroupByStartTimeDesc(){
		List<Group> groups = gService.findAllGroupsByStartTimeDesc();
		return groups;
	}
	
//	全活躍活動依結團時間升序
	@GetMapping("/groupsbyetimeasc")
	@ResponseBody
	public List<Group> findAllGroupByEndTimeAsc(){
		List<Group> groups = gService.findALLGroupsByEndTimeAsc();
		return groups;
	}
	
//	全活躍活動依結團時間降序
	@GetMapping("/groupsbyetimedesc")
	@ResponseBody
	public List<Group> findAllGroupByEndTimeDesc(){
		List<Group> groups = gService.findALLGroupsByEndTimeDesc();
		return groups;
	}
	
//	依搜尋找活躍活動
	@GetMapping("/groupsbysearch")
	@ResponseBody
	public List<Group> findGroupBySearch(@RequestParam("search") String search){
		List<Group> groups = gService.findGroupBySearch(search);
		return groups;
	}
	
//	後臺全活躍活動
	@GetMapping("/backgroups")
	public String findAllGroupBack(Model m) {
		List<Group> groups = gService.findAllGroup();
		m.addAttribute("groups", groups);
		return "group/jsp/backallgroups";
	}
	
//	public String insertGroup(@RequestParam("gtitle") String title, @RequestParam("gdescription") String description, @RequestParam("gendtime") @DateTimeFormat(pattern = "yyyy-MM-dd") Date gEndTime, @RequestParam("payment") String[] pay, @RequestParam("MinTotalQuantity") int minQuantity,
//			@RequestParam("MinTotalAmount") int minAmount, HttpServletRequest request) {
		
//	}
	
}
