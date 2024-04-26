package com.group.model;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="groupevent")
@Component
public class GroupBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name = "groupeventno")
	private int groupeventno;
	
	@Column(name = "hostuserno")
	private int hostuserno;
	
	@Column(name = "grouptitle")
	private String grouptitle;
	
	@Column(name = "groupdescription")
	private String groupdescription;
	
	@Column(name = "starttime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private	Date starttime;
	
	@Column(name = "endtime")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date endtime;
	
	@Column(name = "mintotalamount")
	private BigDecimal mintotalamount;
	
	@Column(name = "mintotalquantity")
	private int mintotalquantity;
	
	@Column(name = "groupstatus")
	private String groupstatus;
	
	@Column(name = "paymentmethod")
	private int paymentmethod;
	
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "groupbean", cascade = CascadeType.ALL)
	private ItemsBean items ;

	public GroupBean() {
	}

	public int getGroupeventno() {
		return groupeventno;
	}

	public void setGroupeventno(int groupeventno) {
		this.groupeventno = groupeventno;
	}

	public int getHostuserno() {
		return hostuserno;
	}

	public void setHostuserno(int hostuserno) {
		this.hostuserno = hostuserno;
	}

	public String getGrouptitle() {
		return grouptitle;
	}

	public void setGrouptitle(String grouptitle) {
		this.grouptitle = grouptitle;
	}

	public String getGroupdescription() {
		return groupdescription;
	}

	public void setGroupdescription(String groupdescription) {
		this.groupdescription = groupdescription;
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

	public BigDecimal getMintotalamount() {
		return mintotalamount;
	}

	public void setMintotalamount(BigDecimal mintotalamount) {
		this.mintotalamount = mintotalamount;
	}

	public int getMintotalquantity() {
		return mintotalquantity;
	}

	public void setMintotalquantity(int mintotalquantity) {
		this.mintotalquantity = mintotalquantity;
	}

	public String getGroupstatus() {
		return groupstatus;
	}

	public void setGroupstatus(String groupstatus) {
		this.groupstatus = groupstatus;
	}

	public int getPaymentmethod() {
		return paymentmethod;
	}

	public void setPaymentmethod(int paymentmethod) {
		this.paymentmethod = paymentmethod;
	}

	public ItemsBean getItems() {
		return items;
	}

	public void setItems(ItemsBean items) {
		this.items = items;
	}

	
}
