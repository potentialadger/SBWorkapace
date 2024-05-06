package com.group.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.model.Group;
import com.group.model.Order;
import com.group.repository.OrderRepository;
import com.user.bean.UserBean;

@Service
@Transactional
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	public Order insertOrder(Group eventNo, UserBean userNo, Integer paymentMethod) {
		LocalDateTime setDateTime = LocalDateTime.now();
		Date setTime = Date.from(setDateTime.atZone(ZoneId.systemDefault()).toInstant());
		
		Order order = new Order();
		order.setGroup(eventNo);
		order.setUserNo(userNo);
		order.setPaymentMethod(paymentMethod);
		order.setSetTime(setTime);
		
		return orderRepository.save(order);
	}
	
//	查詢訂單依活動
	public List<Order> findOrdersByEventNo(Integer eventNo) {
		List<Order> Orders = orderRepository.findOrdersByEventNo(eventNo);
		return Orders;
	}
	
//	查詢訂單依訂購人
	public List<Order> findOrdersByUserNo(Integer userNo){
		List<Order> orders = orderRepository.findOrdersByUserNo(userNo);
		return orders;
	}
}
