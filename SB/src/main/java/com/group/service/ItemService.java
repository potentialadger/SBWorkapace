package com.group.service;

import java.math.BigDecimal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.model.GroupBean;
import com.group.model.ItemsBean;
import com.group.repository.GroupRepository;
import com.group.repository.ItemRepository;

@Service
@Transactional
public class ItemService {

	@Autowired
	private ItemRepository itemRepository;
	
	@Autowired
	private GroupRepository groupRepository;
	
	public ItemsBean insertItem(int groupeventno, String name, BigDecimal price, String description, String filename) {
		Optional<GroupBean> groupOptional = groupRepository.findById(groupeventno);
		GroupBean group = null;
		
		if(!groupOptional.isEmpty()) {
			group = groupOptional.get();
		}
		
		ItemsBean item = new ItemsBean();
		item.setGroupbean(group);
		item.setItemname(name);
		item.setPrice(price);
		item.setItemdescription(description);
		item.setImgpath(filename);
		
		return itemRepository.save(item);
	}
	
	public ItemsBean findItemByGroupEventNo(int groupEventNo) {
		ItemsBean result = itemRepository.findItemByGroupEventNo(groupEventNo);
		return result;
	}
	
}
