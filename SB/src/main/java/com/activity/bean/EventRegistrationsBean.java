package com.activity.bean;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Component
@Entity
@Table(name = "eventregistrations")
public class EventRegistrationsBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "registrationid")
	private int registrationID;
	
	@Column(name = "eventno")
	private int eventNo;
	
	@Column(name = "hostuserno")
	private Integer hostUserNo;
	
	@Column(name = "participantname")
	private String ParticipantName;
	

	@Column(name = "contactinfo")
	private String ContactInfo;
	
	@Column(name = "registrationtime")
	private String RegistrationTime;

	public EventRegistrationsBean(int eventNo, Integer hostUserNo, String participantName, String contactInfo,
			String registrationTime) {
		this.eventNo = eventNo;
		this.hostUserNo = hostUserNo;
		ParticipantName = participantName;
		ContactInfo = contactInfo;
		RegistrationTime = registrationTime;
	}

	public EventRegistrationsBean(int registrationID, int eventNo, Integer hostUserNo, String participantName,
			String contactInfo, String registrationTime) {
		this.registrationID = registrationID;
		this.eventNo = eventNo;
		this.hostUserNo = hostUserNo;
		ParticipantName = participantName;
		ContactInfo = contactInfo;
		RegistrationTime = registrationTime;
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
		return ParticipantName;
	}

	public void setParticipantName(String participantName) {
		ParticipantName = participantName;
	}

	public String getContactInfo() {
		return ContactInfo;
	}

	public void setContactInfo(String contactInfo) {
		ContactInfo = contactInfo;
	}

	public String getRegistrationTime() {
		return RegistrationTime;
	}

	public void setRegistrationTime(String registrationTime) {
		RegistrationTime = registrationTime;
	}
	
	
	
}
