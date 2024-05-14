package com.activity.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.activity.bean.EventRegistrationsBean;
import com.activity.service.EventRegistrationsService;
import com.activity.service.EventService;

@RestController
public class EventRegistrationsController {

    @Autowired
    private EventRegistrationsService eventRegistrationsService;

    @Autowired
    private EventService eventService;

    // 查詢單筆註冊
    @GetMapping("/OneRegistration")
    public ModelAndView findByRegistrationID(@RequestParam("registrationID") int registrationID) {
        ModelAndView mav = new ModelAndView("activity/EventDetail.jsp");
        try {
            EventRegistrationsBean registration = eventRegistrationsService.findByRegistration(registrationID);
            List<EventRegistrationsBean> registrations = new ArrayList<>();
            registrations.add(registration);
            mav.addObject("registrations", registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 查詢所有註冊
    @GetMapping("/AllRegistrations")
    public ModelAndView findRegistrations() {
        ModelAndView mav = new ModelAndView("activity/DisplayAllRegistrations.jsp");
        try {
            List<EventRegistrationsBean> registrations = eventRegistrationsService.findAllRegistrations();
            for (EventRegistrationsBean registration : registrations) {
                registration.setEvent(eventService.findEventByEventNo(registration.getEventNo()));
            }
            mav.addObject("registrations", registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 新增註冊
    @PostMapping("/InsertRegistrations")
    @ResponseBody
    public ModelAndView insert(
            @RequestParam("eventNo") int eventNo,
            @RequestParam("userNo") int userNo,
            @RequestParam("participantName") String participantName,
            @RequestParam("contactInfo") String contactInfo,
            @RequestParam("registrationTime") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime registrationTime) {
        ModelAndView mav = new ModelAndView();
        try {
            // 檢查是否已註冊
            List<EventRegistrationsBean> existingRegistrations = eventRegistrationsService.findByEventNoAndUserNo(eventNo, userNo);
            if (existingRegistrations != null && !existingRegistrations.isEmpty()) {
                mav.setViewName("activity/DisplayAllRegistrations.jsp");
                mav.addObject("errorMessage", "您已經報名過此活動。");
            } else {
                EventRegistrationsBean registration = new EventRegistrationsBean();
                registration.setEventNo(eventNo);
                registration.setUserNo(userNo);
                registration.setParticipantName(participantName);
                registration.setContactInfo(contactInfo);
                registration.setRegistrationTime(registrationTime);
                eventRegistrationsService.insert(registration);
                mav.setViewName("redirect:AllRegistrations");
            }
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 刪除註冊
    @DeleteMapping("/DeleteRegistrations")
    public ModelAndView deleteRegistrationByRegistrationID(@RequestParam("registrationID") int registrationID) {
        ModelAndView mav = new ModelAndView("redirect:/AllRegistrations");
        try {
            eventRegistrationsService.deleteEventByEventNo(registrationID);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 查詢欲更新的資料
    @GetMapping("/getRegistrationsDataForUpdate")
    public ModelAndView getRegistrationDataForUpdate(@RequestParam("registrationID") int registrationID) {
        ModelAndView mav = new ModelAndView("activity/UpdateRegistration.jsp");
        try {
            EventRegistrationsBean registration = eventRegistrationsService.findByRegistration(registrationID);
            mav.addObject("registration", registration);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 更新註冊
    @PutMapping("/UpdateRegistrations")
    public ModelAndView updateRegistrations(
            @RequestParam("registrationID") int registrationID,
            @RequestParam("participantName") String participantName,
            @RequestParam("contactInfo") String contactInfo,
            @RequestParam("registrationTime") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime registrationTime) {

        ModelAndView mav = new ModelAndView("redirect:/AllRegistrations");
        try {
            EventRegistrationsBean registrations = eventRegistrationsService.findByRegistration(registrationID);
            registrations.setParticipantName(participantName);
            registrations.setContactInfo(contactInfo);
            registrations.setRegistrationTime(registrationTime);
            eventRegistrationsService.update(registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
}
