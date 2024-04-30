package com.group.model;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.user.bean.UserBean;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="groupevent")
@Component
public class Group {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name = "eventno")
	private Integer eventno;
	
	@JoinColumn(name = "hostuserno")
	@ManyToOne
	private UserBean hostuserno;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "starttime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date starttime;
	
	@Column(name = "endtime")
	@JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8")
	private Date endtime;
	
	@Column(name = "mintotalamount")
	private Integer mintotalamount;
	
	@Column(name = "mintotalquantity")
	private Integer mintotalquantity;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "paymentmethod")
	private Integer paymentmethod;
	
	@Column(name = "account")
	private String account;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "point")
	private Integer point;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "group", cascade = CascadeType.ALL)
	@JsonManagedReference
	private List<Item> items ;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "group", cascade = CascadeType.ALL)
	private List<Order> orders;

	public Integer getEventno() {
		return eventno;
	}

	public void setEventno(Integer eventno) {
		this.eventno = eventno;
	}

	

	public UserBean getHostuserno() {
		return hostuserno;
	}

	public void setHostuserno(UserBean hostuserno) {
		this.hostuserno = hostuserno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public Integer getMintotalamount() {
		return mintotalamount;
	}

	public void setMintotalamount(Integer mintotalamount) {
		this.mintotalamount = mintotalamount;
	}

	public Integer getMintotalquantity() {
		return mintotalquantity;
	}

	public void setMintotalquantity(Integer mintotalquantity) {
		this.mintotalquantity = mintotalquantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getPaymentmethod() {
		return paymentmethod;
	}

	public void setPaymentmethod(Integer paymentmethod) {
		this.paymentmethod = paymentmethod;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

}
