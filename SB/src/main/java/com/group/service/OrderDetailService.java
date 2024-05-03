package com.group.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.model.Item;
import com.group.model.ItemSpecification;
import com.group.model.Order;
import com.group.model.OrderDetail;
import com.group.repository.OrderDetailReopsitory;

@Service
@Transactional
public class OrderDetailService {

	@Autowired
	private OrderDetailReopsitory orderDetailReopsitory;
	
	public OrderDetail insertOrderDetail(Order order, Item item, Integer itemQuantity, ItemSpecification itemSpec) {
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setOrder(order);
		orderDetail.setItem(item);
		orderDetail.setItemQuantity(itemQuantity);
		orderDetail.setItemSpec(itemSpec);
		
		return orderDetailReopsitory.save(orderDetail);
	}
}
