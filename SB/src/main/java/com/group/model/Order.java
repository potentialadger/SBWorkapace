package com.group.model;

import java.util.List;

import org.springframework.stereotype.Component;

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
@Table(name = "grouporder")
@Component
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name = "orderno")
	private int orderno;

	@JoinColumn(name = "eventno")
	@ManyToOne
	public Group group;
	
	@Column(name = "userno")
	private int userno;
	
	@JoinColumn(name = "itemno")
	@ManyToOne
	public Item item;
	
	@Column(name = "itemquantity")
	private int itemquantity;
	
	@Column(name = "totalprice")
	private int totalprice;
	
	@Column(name = "paymentmethod")
	private int paymentmethod;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "order", cascade = CascadeType.ALL)
	private List<OrderSpecification> orderspec;

	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public int getItemquantity() {
		return itemquantity;
	}

	public void setItemquantity(int itemquantity) {
		this.itemquantity = itemquantity;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public int getPaymentmethod() {
		return paymentmethod;
	}

	public void setPaymentmethod(int paymentmethod) {
		this.paymentmethod = paymentmethod;
	}

	public List<OrderSpecification> getOrderspec() {
		return orderspec;
	}

	public void setOrderspec(List<OrderSpecification> orderspec) {
		this.orderspec = orderspec;
	}
	
}
