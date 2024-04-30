package com.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.model.Item;
import com.group.service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@GetMapping("/groupitems/{eventno}")
	@ResponseBody
	public List<Item> findItemsByEventNo(@PathVariable("eventno") int eventno){
		List<Item> items = itemService.findItemsByEventNo(eventno);
		return items;
	}
	
}
