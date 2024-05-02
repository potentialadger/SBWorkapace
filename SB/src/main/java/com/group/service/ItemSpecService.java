package com.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.model.ItemSpecification;
import com.group.repository.ItemSpecificationRepository;

@Service
@Transactional
public class ItemSpecService {

	@Autowired
	private ItemSpecificationRepository itemSpecificationRepository;
	
//	查詢規格依照商品編號
	public List<ItemSpecification> findItemSpecByItemNo(Integer itemno){
		List<ItemSpecification> itemspecs = itemSpecificationRepository.findItemSpecByItemNo(itemno);
		return itemspecs;
	}


	
}
