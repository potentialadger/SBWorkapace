package com.activity.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
        ModelAndView mav = new ModelAndView("activity/DisplayAllRegistrations.jsp");
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
            // 將 EventBean 信息添加到每個 EventRegistrationsBean 中
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
            @RequestParam("registrationTime") LocalDateTime registrationTime) {
        ModelAndView mav = new ModelAndView("redirect:AllRegistrations");
        try {
            EventRegistrationsBean registration = new EventRegistrationsBean();
            registration.setEventNo(eventNo);
            registration.setHostUserNo(userNo);
            registration.setParticipantName(participantName);
            registration.setContactInfo(contactInfo);
            registration.setRegistrationTime(registrationTime);

            eventRegistrationsService.insert(registration);
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
            @RequestParam("registrationTime") String registrationTime) {

        ModelAndView mav = new ModelAndView("redirect:/AllRegistrations");
        try {
            EventRegistrationsBean registrations = eventRegistrationsService.findByRegistration(registrationID);
            
            // 更新參與者姓名和聯絡信息
            registrations.setParticipantName(participantName);
            registrations.setContactInfo(contactInfo);
            
            // 將 String 格式的 registrationTime 轉換為 LocalDateTime
            registrations.setRegistrationTime(LocalDateTime.parse(registrationTime));
            
            // 保存更新後的註冊信息
            eventRegistrationsService.update(registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

}
