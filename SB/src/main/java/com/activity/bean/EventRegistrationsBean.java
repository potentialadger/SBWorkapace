package com.activity.bean;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Component
@Entity
@Table(name = "eventregistrations")
public class EventRegistrationsBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "registrationid")
	private int registrationID;
	
	@Column(name = "eventno", nullable = false)
	private int eventNo;
	
	@Column(name = "userno", nullable = false)
	private Integer hostUserNo;
	
	@Column(name = "participantname", nullable = false, length = 255)
	private String participantName;
	
	@Column(name = "contactinfo", nullable = false, length = 255)
	private String contactInfo;
	
	@Column(name = "registrationtime", nullable = false)
	private LocalDateTime registrationTime;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "eventno", insertable = false, updatable = false)
	private EventBean event;

	public EventRegistrationsBean(int eventNo, Integer hostUserNo, String participantName, String contactInfo,
			LocalDateTime registrationTime) {
		this.eventNo = eventNo;
		this.hostUserNo = hostUserNo;
		this.participantName = participantName;
		this.contactInfo = contactInfo;
		this.registrationTime = registrationTime;
	}

	public EventRegistrationsBean(int registrationID, int eventNo, Integer hostUserNo, String participantName,
			String contactInfo, LocalDateTime registrationTime) {
		this.registrationID = registrationID;
		this.eventNo = eventNo;
		this.hostUserNo = hostUserNo;
		this.participantName = participantName;
		this.contactInfo = contactInfo;
		this.registrationTime = registrationTime;
	}

	public EventRegistrationsBean() {
	}

	public int getRegistrationID() {
		return registrationID;
	}

	public void setRegistrationID(int registrationID) {
		this.registrationID = registrationID;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public Integer getHostUserNo() {
		return hostUserNo;
	}

	public void setHostUserNo(Integer hostUserNo) {
		this.hostUserNo = hostUserNo;
	}

	public String getParticipantName() {
		return participantName;
	}

	public void setParticipantName(String participantName) {
		this.participantName = participantName;
	}

	public String getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}

	public LocalDateTime getRegistrationTime() {
		return registrationTime;
	}

	public void setRegistrationTime(LocalDateTime registrationTime) {
		this.registrationTime = registrationTime;
	}

	public EventBean getEvent() {
		return event;
	}

	public void setEvent(EventBean event) {
		this.event = event;
	}
}
