package com.group.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.group.model.Item;
import com.group.service.ItemService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@GetMapping(value = "/groupitems/{eventno}")
	@ResponseBody
	public List<Item> findItemsByEventNo(@PathVariable("eventno") int eventno){
		List<Item> items = itemService.findItemsByEventNo(eventno);
		return items;
	}
	
	@PostMapping(value = "/insertitem")
	@ResponseBody
	public Item insertItem(@RequestParam("iname") String name, @RequestParam("iprice") Integer price, @RequestParam("idescription") String description,
			@RequestParam("ipicture") MultipartFile mf, HttpServletRequest request) throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		Integer eventno = (Integer)session.getAttribute("eventno");
		
		String filename = mf.getOriginalFilename();
		String extension = "";
		
		int i = filename.lastIndexOf('.');
		if(i >= 0) {
			extension = filename.substring(i);
		}
		
		Random random = new Random();
		int raNumber = random.nextInt(10000);
		
		filename = "item" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_"
				+ raNumber + extension;
		
		String fileDir = "C:/temp/upload/";
		File pathexist = new File(fileDir);
		if(!pathexist.exists()) {
			pathexist.mkdirs();
		}
		
		File fileDirPath = new File(fileDir, filename);
		mf.transferTo(fileDirPath);
		Item item = itemService.insertItem(eventno, name, price, description, filename);
		
		Integer itemno = item.getItemNo();
		session.setAttribute("itemno", itemno);
		
		return item;
	}
	
	@PostMapping(value = "/updateitem", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public Item updateItem(@RequestParam("iuname") String name, @RequestParam("/iuprice") Integer price, @RequestParam("iudescription") String description,
			@RequestParam("iupicture") MultipartFile mf, HttpServletRequest request) throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		Integer itemno = (Integer)session.getAttribute("itemno");
		
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
		
		Item item = itemService.updateItem(itemno, name, price, description,filename);
		
		return item;
	}
	
}
