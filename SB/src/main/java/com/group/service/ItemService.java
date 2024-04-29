package com.group.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.model.Group;
import com.group.model.Item;
import com.group.repository.GroupRepository;
import com.group.repository.ItemRepository;

import jakarta.persistence.EntityNotFoundException;



@Service
@Transactional
public class ItemService {

	@Autowired
	private ItemRepository iRepository;
	
	@Autowired
	private GroupRepository gRepository;
	
	public List<Item> findItemsByEventNo(int eventno){
		return iRepository.findItemByEventNo(eventno);
	}
	
	public Item insertItem(int eventno, String name, int price, String description, String filename) {
		Optional<Group> groupOptional = gRepository.findById(eventno);
		
		if(groupOptional.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + eventno);
		}
		Group group = groupOptional.get();
		
		Item item = new Item();
		item.setGroup(group);
		item.setName(name);
		item.setPrice(price);
		item.setDescription(description);
		item.setImgpath(filename);
		
		return iRepository.save(item);
	}
}
