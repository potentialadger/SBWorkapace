package com.group.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class GroupDto {

	private String gTitle;
	private String gDescription;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date gEndTime;
	private String[] payment;
	private String gMinTotalAmount;
	private String gMinTotalQuantity;
	private String address;
	private String account;
	private String userName;
	private Integer userNo;
	private Integer eventNo;
	public String getgTitle() {
		return gTitle;
	}
	public void setgTitle(String gTitle) {
		this.gTitle = gTitle;
	}
	public String getgDescription() {
		return gDescription;
	}
	public void setgDescription(String gDescription) {
		this.gDescription = gDescription;
	}
	public Date getgEndTime() {
		return gEndTime;
	}
	public void setgEndTime(Date gEndTime) {
		this.gEndTime = gEndTime;
	}
	public String[] getPayment() {
		return payment;
	}
	public void setPayment(String[] payment) {
		this.payment = payment;
	}
	
	public String getgMinTotalAmount() {
		return gMinTotalAmount;
	}
	public void setgMinTotalAmount(String gMinTotalAmount) {
		this.gMinTotalAmount = gMinTotalAmount;
	}
	public String getgMinTotalQuantity() {
		return gMinTotalQuantity;
	}
	public void setgMinTotalQuantity(String gMinTotalQuantity) {
		this.gMinTotalQuantity = gMinTotalQuantity;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public Integer getEventNo() {
		return eventNo;
	}
	public void setEventNo(Integer eventNo) {
		this.eventNo = eventNo;
	}
	
	
	
}
