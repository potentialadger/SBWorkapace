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
@Table(name="itemspecification")
@Component
public class ItemSpecification {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name = "specno")
	private int specno;

	@JoinColumn(name = "itemno")
	@ManyToOne
	public Item item;
	
	@Column(name = "spectype")
	private String spectype;
	
	@Column(name = "specvalue")
	private String specvalue;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "itemspec", cascade = CascadeType.ALL)
	private List<OrderSpecification> orderspec;

	public int getSpecno() {
		return specno;
	}

	public void setSpecno(int specno) {
		this.specno = specno;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public String getSpectype() {
		return spectype;
	}

	public void setSpectype(String spectype) {
		this.spectype = spectype;
	}

	public String getSpecvalue() {
		return specvalue;
	}

	public void setSpecvalue(String specvalue) {
		this.specvalue = specvalue;
	}

	public List<OrderSpecification> getOrderspec() {
		return orderspec;
	}

	public void setOrderspec(List<OrderSpecification> orderspec) {
		this.orderspec = orderspec;
	}
	
}
