package com.group.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.dto.BackToFrontOrder;
import com.group.dto.OrderDetailsDto;
import com.group.dto.OrderDto;
import com.group.model.Group;
import com.group.model.Item;
import com.group.model.Order;
import com.group.model.OrderDetail;
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
	
//	查詢訂單依活動給後臺
	public List<BackToFrontOrder> findOrdersByEventNo(Integer eventNo) {
		List<Order> getOrders = orderRepository.findOrdersByEventNo(eventNo);
		List<BackToFrontOrder> orders = new ArrayList<>();
		
		for (Order order : getOrders) {
			String userName = order.getUserNo().getUserChineseName();
			Integer userNo = order.getUserNo().getUserNo();
			Integer payment = order.getPaymentMethod();
			Date setTime = order.getSetTime();
			System.out.println(setTime);
			
			BackToFrontOrder backToFrontOrder = new BackToFrontOrder();
			backToFrontOrder.setUserNo(userNo);
			backToFrontOrder.setUserName(userName);
			backToFrontOrder.setPayment(payment);
			backToFrontOrder.setSetTime(setTime);
			
			orders.add(backToFrontOrder);
		}
		
		return orders;
		
	}
	
	public List<OrderDto> findOrdersByEventNoFront(Integer eventNo){
		List<Order> getOrders = orderRepository.findOrdersByEventNo(eventNo);
		ArrayList<OrderDto> orders = new ArrayList<OrderDto>();
		
		for (Order getOrder : getOrders) {
			OrderDto orderDto = new OrderDto();

			UserBean user = getOrder.getUserNo();
			int userNo = user.getUserNo();
			String userName = user.getUserChineseName();
			Date setTime = getOrder.getSetTime();
			Integer paymentMethod = getOrder.getPaymentMethod();
			List<OrderDetail> orderDetails = getOrder.getOrderDetails();
			
			List<OrderDetailsDto> orderDetailsDto = new ArrayList<OrderDetailsDto>();
			for (OrderDetail orderDetail : orderDetails) {
				Integer itemNo = orderDetail.getItem().getItemNo();
				String itemName = orderDetail.getItem().getName();
				Integer itemQuantity = orderDetail.getItemQuantity();
				String specValue = orderDetail.getItemSpec().getSpecValue();
				
				OrderDetailsDto orderDetailDto = new OrderDetailsDto();
				
				orderDetailDto.setItemQuantity(itemQuantity);
				orderDetailDto.setSpecValue(specValue);
				orderDetailDto.setItemNo(itemQuantity);
				orderDetailDto.setItemName(itemName);
				orderDetailDto.setItemNo(itemNo);
				
				orderDetailsDto.add(orderDetailDto);
			}
			orderDto.setEventNo(eventNo);
			orderDto.setOrderDetail(orderDetailsDto);
			orderDto.setPaymentMethod(paymentMethod);
			orderDto.setUserName(userName);
			orderDto.setUserNo(userNo);
			
			orders.add(orderDto);
		}
		return orders;
	}
	
//	查詢訂單依訂購人
	public List<OrderDto> findOrdersByUserNo(Integer userNo){
		List<Order> getOrders = orderRepository.findOrdersByUserNo(userNo);
		ArrayList<OrderDto> orders = new ArrayList<OrderDto>();
		
		for (Order getOrder : getOrders) {
			OrderDto orderDto = new OrderDto();

			String groupTitle = getOrder.getGroup().getTitle();
			Integer eventNo = getOrder.getGroup().getEventNo();
			Date setTime = getOrder.getSetTime();
			Integer paymentMethod = getOrder.getPaymentMethod();
			List<OrderDetail> orderDetails = getOrder.getOrderDetails();
			
			List<OrderDetailsDto> orderDetailsDto = new ArrayList<OrderDetailsDto>();
			for (OrderDetail orderDetail : orderDetails) {
				Integer itemNo = orderDetail.getItem().getItemNo();
				String itemName = orderDetail.getItem().getName();
				Integer itemQuantity = orderDetail.getItemQuantity();
				String specValue = orderDetail.getItemSpec().getSpecValue();
				
				OrderDetailsDto orderDetailDto = new OrderDetailsDto();
				
				orderDetailDto.setItemQuantity(itemQuantity);
				orderDetailDto.setSpecValue(specValue);
				orderDetailDto.setItemNo(itemQuantity);
				orderDetailDto.setItemName(itemName);
				orderDetailDto.setItemNo(itemNo);
				
				orderDetailsDto.add(orderDetailDto);
			}
			orderDto.setEventNo(eventNo);
			orderDto.setOrderDetail(orderDetailsDto);
			orderDto.setPaymentMethod(paymentMethod);
			orderDto.setEventNo(eventNo);
			orderDto.setEventTitle(groupTitle);
			orderDto.setSetTime(setTime);
			
			orders.add(orderDto);
		}
		
		return orders;
	}
	
}
