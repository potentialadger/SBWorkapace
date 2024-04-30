package com.group.model;


import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "orderdetail")
@Component
public class OrderDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name = "detailno")
	private Integer id;

	@JoinColumn(name = "orderno")
	@ManyToOne
	private Order order;
	
	@JoinColumn(name = "itemno")
	@ManyToOne
	private Item item;
	
	@Column(name = "itemquantity")
	private Integer itemquantity;
	
	@JoinColumn(name = "itemspec")
	@OneToOne
	private ItemSpecification itemspec;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Integer getItemquantity() {
		return itemquantity;
	}

	public void setItemquantity(Integer itemquantity) {
		this.itemquantity = itemquantity;
	}

	public ItemSpecification getItemspec() {
		return itemspec;
	}

	public void setItemspec(ItemSpecification itemspec) {
		this.itemspec = itemspec;
	}

}
