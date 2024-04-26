package com.group.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.group.model.GroupBean;
import com.group.service.GroupService;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class GroupController {

	@Autowired
	private GroupService groupService;
	
	@GetMapping(path = "/groups.controller")
	public String findAll(Model m) {
		List<GroupBean> groups = groupService.findAllGroup();
		m.addAttribute("groups",groups);
		return "group/jsp/group.jsp";
	}
	
	@GetMapping(path = "/findgroupbysearch")
	public String findGroupBySearch(Model m,@RequestParam("searchText") String search) {
		List<GroupBean> groups = groupService.findGroupBySearch(search);
		m.addAttribute("groups", groups);
		return "group/jsp/group.jsp";
	}
	
	@PostMapping(path = "/insertgroup")
	@ResponseBody
	public String insertGroup(@RequestParam("gtitle") String gTitle,@RequestParam("gdescription") String gDescription,
			@RequestParam("gendtime") @DateTimeFormat(pattern = "yyyy-MM-dd") Date gEndTime, @RequestParam("payment") String[] pay, @RequestParam("MinTotalQuantity") String minQuantity,
			@RequestParam("MinTotalAmount") String minAmount, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserBean userbean = (UserBean)session.getAttribute("userData");
		
		int userNo = userbean.getUserNo();
//		System.out.println("AAAAAA" + userbean.getUserNo());
//		int userNo = 1;
		
		
		GroupBean newGroup = groupService.insertGroup(userNo, gTitle, gDescription, gEndTime, pay, minQuantity, minAmount);
		int groupeventno = newGroup.getGroupeventno();
		session.setAttribute("GroupEventNo", groupeventno);
		System.out.println("----------" + groupeventno + "----------------");
		return "insert OK";
	}
	
	@GetMapping(path = "/mygroup")
	public String findGroupByUser(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		UserBean userbean = (UserBean)session.getAttribute("userData");
		int userNo = userbean.getUserNo();
//		int userNo = 1;
		
		List<GroupBean> groups = groupService.findGroupByUser(userNo);
		m.addAttribute("groups",groups);
		return "group/jsp/mygroup.jsp";
	}
	
	@PutMapping(path = "/UpdateGroup", consumes = "application/json", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> updateGroup(@RequestBody GroupBean request) {
	    groupService.updateGroup(request.getGroupeventno(), request.getGrouptitle(), request.getGroupdescription(),
	            request.getEndtime(), request.getPaymentmethod(), request.getMintotalquantity(),
	            request.getMintotalamount());
	    return ResponseEntity.ok("Update successful");
	}
	
	@DeleteMapping(path = "/DeleteGroup", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteGroup(@RequestParam("groupEventNo") int groupEventNo) {
		groupService.deleteGroup(groupEventNo);
		return "Delete OK";
	}
}