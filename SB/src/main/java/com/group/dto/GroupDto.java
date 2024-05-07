package com.group.dto;

import java.util.Date;

public class GroupDto {

	private String gTitle;
	private String gDescription;
	private Date gEndTime;
	private String[] payment;
	private Integer gMinTotalAmount;
	private Integer gMinTotalQuantity;
	private String address;
	private String account;
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
	public Integer getgMinTotalAmount() {
		return gMinTotalAmount;
	}
	public void setgMinTotalAmount(Integer gMinTotalAmount) {
		this.gMinTotalAmount = gMinTotalAmount;
	}
	public Integer getgMinTotalQuantity() {
		return gMinTotalQuantity;
	}
	public void setgMinTotalQuantity(Integer gMinTotalQuantity) {
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
	
	
}
