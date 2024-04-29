package com.group.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="orderspecification")
@Component
public class OrderSpecification {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name = "orderspecno")
	private int orderspecno;

	@JoinColumn(name = "orderno")
	@ManyToOne
	public Order order;
	
	@JoinColumn(name = "specno")
	@ManyToOne
	public ItemSpecification itemspec;

	public int getOrderspecno() {
		return orderspecno;
	}

	public void setOrderspecno(int orderspecno) {
		this.orderspecno = orderspecno;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public ItemSpecification getItemspec() {
		return itemspec;
	}

	public void setItemspec(ItemSpecification itemspec) {
		this.itemspec = itemspec;
	}
	
}
