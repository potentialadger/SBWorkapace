package com.activity.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.activity.bean.EventBean;
import com.activity.bean.EventRegistrationsBean;
import com.activity.service.EventRegistrationsService;
import com.activity.service.EventService;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
//@Controller
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
    @PutMapping("/InsertRegistration")
    @ResponseBody
    public ModelAndView insertEvent(
			@RequestParam("participantname") String participantname,
			@RequestParam("contactinfo") String contactinfo,
			@RequestParam("registrationtime") String registrationtime,
			HttpServletRequest request
    		) {
        ModelAndView mav = new ModelAndView("redirect:AllEvents");//尚未修改
        try {
        	  String filename = mf.getOriginalFilename();
              String extension = filename.substring(filename.lastIndexOf('.'));
              String fileDir = "C:/temp/upload/";
              String newFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + new Random().nextInt(10000) + extension;
              File pathexist = new File(fileDir);
              if(!pathexist.exists()) {
                  pathexist.mkdirs();
              }
              File fileDirPath = new File(fileDir, newFileName);
              mf.transferTo(fileDirPath);
        	
        	EventBean event = new EventBean();
        	
        	HttpSession session = request.getSession();
//    		UserBean userbean = (UserBean)session.getAttribute("userData");
        	
        	event.setHostUserNo(1);
        	event.setTitle(title);
        	event.setDescription(description);						
        	event.setActivityTime(activityTime);
        	event.setSignupStartTime(signupStartTime);	       	        	        
			event.setSignupEndTime(signupEndTime);
			event.setLocation(location);
			event.setStatus(status);
			event.setImagePath(newFileName);
			eventService.insert(event);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
    
    // 删除事件
    @DeleteMapping("/DeleteEvent")
    public ModelAndView deleteEventByEventNo(@RequestParam("eventNo") int eventNo) {
        ModelAndView mav = new ModelAndView("redirect:/AllEvents");
        try {
            eventService.deleteEventByEventNo(eventNo);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
    
    // 查询欲更新得資料
    @GetMapping("/getEventDataForUpdate")
    public ModelAndView getEventDataForUpdate(@RequestParam("eventNo") int eventNo) {
        ModelAndView mav = new ModelAndView("activity/UpdateEvent.jsp");
        try {
        	EventBean event = eventService.findEventByEventNo(eventNo);

            mav.addObject("event", event);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
    
    // 更新事件
   
    @PutMapping("/UpdateEvent")
    public ModelAndView updateEvent(

    		@RequestParam("eventNo") int eventNo,
    		@RequestParam("hostUserNo") Integer hostUserNo, 
    		@RequestParam("title") String title,
    		@RequestParam("description") String description,
    		@RequestParam("activityTime") LocalDateTime activityTime,
    		@RequestParam("signupStartTime") LocalDateTime signupStartTime,
    		@RequestParam("signupEndTime") LocalDateTime signupEndTime,
    		@RequestParam("location") String location,
    		@RequestParam("status") String status,	
    		@RequestParam("imagePath") MultipartFile mf,
    		HttpServletRequest request
    		) {
        ModelAndView mav = new ModelAndView("redirect:/AllEvents");
        try {
        	EventBean event = eventService.findEventByEventNo(eventNo);
        	 String filename = mf.getOriginalFilename();
             String extension = filename.substring(filename.lastIndexOf('.'));
             String fileDir = "C:/temp/upload/";
             String newFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + new Random().nextInt(10000) + extension;
             File pathexist = new File(fileDir);
             if (!pathexist.exists()) {
                 pathexist.mkdirs();
             }
             File fileDirPath = new File(fileDir, newFileName);
             mf.transferTo(fileDirPath);
             
             
             HttpSession session = request.getSession();
             
        	event.setTitle(title);
        	event.setDescription(description);
        	event.setActivityTime(activityTime);
        	event.setSignupStartTime(signupStartTime);
        	event.setSignupEndTime(signupEndTime);
        	event.setLocation(location);
        	event.setStatus(status);
        	event.setImagePath(newFileName);
        	eventService.update(event);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

}
