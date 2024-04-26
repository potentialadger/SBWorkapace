package com.group.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group.model.ItemsBean;

public interface ItemRepository extends JpaRepository<ItemsBean, Integer> {
	
	@Query("SELECT i FROM ItemsBean i WHERE i.groupbean.groupeventno = :groupeventno")
	public ItemsBean findItemByGroupEventNo(int groupeventno);
}
