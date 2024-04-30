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
@Table(name = "EventRegistrations")
public class EventRegistrationsBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "registrationID")
	private int RegistrationID;
	
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
		RegistrationID = registrationID;
		this.eventNo = eventNo;
		this.hostUserNo = hostUserNo;
		ParticipantName = participantName;
		ContactInfo = contactInfo;
		RegistrationTime = registrationTime;
	}

	public int getRegistrationID() {
		return RegistrationID;
	}

	public void setRegistrationID(int registrationID) {
		RegistrationID = registrationID;
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
