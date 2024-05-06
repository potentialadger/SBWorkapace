package com.activity.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.activity.bean.EventRegistrationsBean;
import com.activity.service.EventRegistrationsService;


@RestController
public class EventRegistrationsController {

    @Autowired
    private EventRegistrationsService eventregistrationsService;

    // 查询單筆事件
    @GetMapping("/OneRegistration")
    public ModelAndView findByRegistrationID(@RequestParam("registrationID") int registrationID) {
        ModelAndView mav = new ModelAndView("activity/DisplayAllEvent.jsp");//尚未更改
        try {
        	EventRegistrationsBean registration = eventregistrationsService.findByRegistration(registrationID);
            List<EventRegistrationsBean> registrations = new ArrayList<>();
            registrations.add(registration);
            mav.addObject("registrations", registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    
    // 查询所有事件
    @GetMapping("/AllRegistrations")
    public ModelAndView findRegistrations() {
        ModelAndView mav = new ModelAndView("activity/DisplayAllEvent.jsp");//尚未更改
        try {
            List<EventRegistrationsBean> registrations = eventregistrationsService.findAllRegistrations();
            mav.addObject("registrations", registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 新增事件
    @PostMapping("/InsertRegistrations")
    @ResponseBody
    public ModelAndView insert(
			@RequestParam("participantname") String participantname,
			@RequestParam("contactinfo") String contactinfo,
			@RequestParam("registrationtime") String registrationtime
			
    		
    		) {
        ModelAndView mav = new ModelAndView("redirect:AllRegistrations");
        try {
        	EventRegistrationsBean registrations = new EventRegistrationsBean();

        	registrations.setHostUserNo(1);
        	registrations.setParticipantName(participantname);
        	registrations.setContactInfo(contactinfo);						
        	registrations.setRegistrationTime(registrationtime);
        	

			eventregistrationsService.insert(registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
    // 删除事件
    @DeleteMapping("/DeleteRegistrations")
    public ModelAndView deleteEventByEventNo(@RequestParam("registrationID") int registrationID) {
        ModelAndView mav = new ModelAndView("redirect:/AllEvents");
        try {
        	eventregistrationsService.deleteEventByEventNo(registrationID);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
    
    // 查询欲更新得資料
    @GetMapping("/getRegistrationsDataForUpdate")
    public ModelAndView getEventDataForUpdate(@RequestParam("registrationID") int registrationID) {
        ModelAndView mav = new ModelAndView("activity/UpdateEvent.jsp");//尚未更改
        try {
        	EventRegistrationsBean registrations = eventregistrationsService.findByRegistration(registrationID);

            mav.addObject("registrations", registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
    
    // 更新事件
   
    @PutMapping("/UpdateRegistrations")
    public ModelAndView updateRegistrations(

    		@RequestParam("eventNo") int eventNo,
    		@RequestParam("hostUserNo") Integer hostUserNo, 
    		@RequestParam("ParticipantName") String participantName,
    		@RequestParam("ContactInfo") String contactInfo,
    		@RequestParam("RegistrationTime") String registrationTime
    		    		
    		) {
        ModelAndView mav = new ModelAndView("redirect:/AllRegistrations");
        try {
        	EventRegistrationsBean registrations = eventregistrationsService.findByRegistration(eventNo);
        	registrations.setParticipantName(participantName);
        	registrations.setContactInfo(contactInfo);
        	registrations.setRegistrationTime(registrationTime);
        	eventregistrationsService.update(registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

}