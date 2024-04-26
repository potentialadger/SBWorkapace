package com.group.model;

import java.math.BigDecimal;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "groupitem")
@Component
public class ItemsBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name = "groupitemno")
	private int id;
	
	@JoinColumn(name = "groupeventno")
	@OneToOne
	public GroupBean groupbean;
	
	@Column(name = "itemname")
	private String itemname;
	
	@Column(name = "price")
	private BigDecimal price;
	
	@Column(name = "itemdescription")
	private String itemdescription;
	
	@Column(name = "imgpath")
	private String imgpath;

	public ItemsBean() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public GroupBean getGroupbean() {
		return groupbean;
	}

	public void setGroupbean(GroupBean groupbean) {
		this.groupbean = groupbean;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getItemdescription() {
		return itemdescription;
	}

	public void setItemdescription(String itemdescription) {
		this.itemdescription = itemdescription;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	

}
