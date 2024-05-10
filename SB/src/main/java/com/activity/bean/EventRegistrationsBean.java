package com.activity.bean;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "event_registrations")
public class EventRegistrationsBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer registrationID;

    private Integer eventNo;
    private Integer hostUserNo;
    private String participantName;
    private String contactInfo;
    private LocalDateTime registrationTime;

    @ManyToOne
    @JoinColumn(name = "eventNo", insertable = false, updatable = false)
    private EventBean event;

    // Getters and Setters

    public Integer getRegistrationID() {
        return registrationID;
    }

    public void setRegistrationID(Integer registrationID) {
        this.registrationID = registrationID;
    }

    public Integer getEventNo() {
        return eventNo;
    }

    public void setEventNo(Integer eventNo) {
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
        if (event != null) {
            this.eventNo = event.getEventNo();
        }
    }
}
