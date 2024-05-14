package com.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.dto.BackToFrontOrder;
import com.group.dto.OrderDetailsDto;
import com.group.dto.OrderDto;
import com.group.model.Group;
import com.group.model.Item;
import com.group.model.ItemSpecification;
import com.group.model.Order;
import com.group.model.OrderDetail;
import com.group.service.GroupService;
import com.group.service.ItemService;
import com.group.service.ItemSpecService;
import com.group.service.OrderDetailService;
import com.group.service.OrderService;
import com.user.bean.UserBean;
import com.user.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ItemSpecService itemSpecService;
	
	@Autowired
	private OrderDetailService orderDetailService;

	@PostMapping("/insertorder")
	public String insertOrder(HttpServletRequest request,@RequestBody OrderDto submitOrder) {
		HttpSession session = request.getSession();
//		UserBean userBean = (UserBean)session.getAttribute("userData");
		UserBean userBean = userService.getUserData(1);
		
		Integer eventNo = submitOrder.getEventNo();
		Group group = groupService.findGroupByEventNo(eventNo);
		Integer paymentMethod = submitOrder.getPaymentMethod();
		List<OrderDetailsDto> orderDetailsDto = submitOrder.getOrderDetail();
		
		Order insertOrder = orderService.insertOrder(group, userBean, paymentMethod);
		
		for (OrderDetailsDto orderDetailDto : orderDetailsDto) {
			Integer itemNo = orderDetailDto.getItemNo();
			Integer itemQuantity = orderDetailDto.getItemQuantity();
			Integer itemSpecNo = orderDetailDto.getItemSpec();
			System.out.println("-------------" + itemNo);
			System.out.println("-------------" + itemQuantity);
			System.out.println("-------------" + itemSpecNo);
			
			Item item = itemService.findItemById(itemNo);
			ItemSpecification itemSpec = itemSpecService.findItemSpecById(itemSpecNo);
			
			orderDetailService.insertOrderDetail(insertOrder, item, itemQuantity, itemSpec);
		}
		return "redirect:/group/eachgroup/" + group.getEventNo();
	}
	
	@GetMapping("/grouporders/{eventno}")
	@ResponseBody
	public List<BackToFrontOrder> findOrdersByEventNoBack(@PathVariable("eventno") Integer eventNo) {
		List<BackToFrontOrder> orders = orderService.findOrdersByEventNo(eventNo);
		return orders;
	}
	
	public List<BackToFrontOrder> 
}
