package com.group.model;

import java.util.List;

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
	
	@Column(name = "specvalue")
	private String specvalue;

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

	public String getSpecvalue() {
		return specvalue;
	}

	public void setSpecvalue(String specvalue) {
		this.specvalue = specvalue;
	}

	
}
