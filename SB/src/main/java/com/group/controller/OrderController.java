package com.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.group.model.Group;
import com.group.model.Item;
import com.group.model.ItemSpecification;
import com.group.model.Order;
import com.group.model.OrderDetail;
import com.group.service.GroupService;
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
	private GroupService groupService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderDetailService orderDetailService;

	@PostMapping("/insertorder")
	public String insertOrder(HttpServletRequest request,@RequestBody Order submitOrder) {
		HttpSession session = request.getSession();
		Group group = (Group)session.getAttribute("group");
//		UserBean userBean = (UserBean)session.getAttribute("userData");
		UserBean userBean = userService.getUserData(1);
		Integer eventNo = group.getEventNo();
		
		Integer paymentMethod = submitOrder.getPaymentMethod();
		Order order = orderService.insertOrder(group, userBean, paymentMethod);

		List<OrderDetail> orderDetails = submitOrder.getOrderDetails();
		for (OrderDetail orderDetail : orderDetails) {
			Item item = orderDetail.getItem();
			Integer itemQuantity = orderDetail.getItemQuantity();
			ItemSpecification itemSpec = orderDetail.getItemSpec();
			orderDetailService.insertOrderDetail(order, item, itemQuantity, itemSpec);
		}
		
		return "redirect:/group/eachgroup/" + group.getEventNo();
	}
}
