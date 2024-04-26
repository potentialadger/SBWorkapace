package com.group.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.group.model.ItemsBean;
import com.group.service.ItemService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@PostMapping(path = "/insertitem", produces = "text/plain;charset=UTF-8")
	public String insertItem(@RequestParam("iname") String name, @RequestParam("iprice") String price, @RequestParam("idescription") String description, @RequestParam("ipicture") MultipartFile mf, HttpServletRequest request) throws IllegalStateException, IOException {
		String filename = mf.getOriginalFilename();
		String extension = "";
		
		int i = filename.lastIndexOf('.');
		if(i >= 0) {
			extension = filename.substring(i);
		}
		
		Random random = new Random();
		int raNumber = random.nextInt(10000);
		
		filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_"
				+ raNumber + extension;
		
		String fileDir = "C:/temp/upload/";
		File pathexist = new File(fileDir);
		if(!pathexist.exists()) {
			pathexist.mkdirs();
		}
		
		File fileDirPath = new File(fileDir, filename);
		
		mf.transferTo(fileDirPath);
		
		HttpSession session = request.getSession();
		int groupeventno = (int)session.getAttribute("GroupEventNo");
		
		itemService.insertItem(groupeventno, name, new BigDecimal(price), description, filename);
		return "redirect:/groups.controller";
	}
	
	@GetMapping(path = "/eachitem")
	public String findItemByGroupEventNo(@RequestParam("groupNo") String groupEventNo, Model m) {
		System.out.println(groupEventNo);
		ItemsBean item = itemService.findItemByGroupEventNo(Integer.parseInt(groupEventNo));
		m.addAttribute("item",item);
		return "group/jsp/eachitem.jsp";
	}
}
