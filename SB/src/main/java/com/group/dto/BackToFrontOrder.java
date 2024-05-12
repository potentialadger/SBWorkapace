package com.group.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BackToFrontOrder {

	private Integer userNo;
	private String userName;
	private Integer payment;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date setTime;
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getPayment() {
		return payment;
	}
	public void setPayment(Integer payment) {
		this.payment = payment;
	}
	public Date getSetTime() {
		return setTime;
	}
	public void setSetTime(Date setTime) {
		this.setTime = setTime;
	}
	
}