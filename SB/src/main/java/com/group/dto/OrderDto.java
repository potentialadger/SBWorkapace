package com.group.dto;

import java.util.List;

import lombok.Data;

@Data
public class OrderDto {

	private Integer userNo;
	private String userName;
	private Integer eventNo;
	private Integer paymentMethod;
	private List<OrderDetailsDto> orderDetail;
	
	public Integer getEventNo() {
		return eventNo;
	}
	public void setEventNo(Integer eventNo) {
		this.eventNo = eventNo;
	}
	public Integer getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(Integer paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public List<OrderDetailsDto> getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(List<OrderDetailsDto> orderDetail) {
		this.orderDetail = orderDetail;
	}

	

	
}
