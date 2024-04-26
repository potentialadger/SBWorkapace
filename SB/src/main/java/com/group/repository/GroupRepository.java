package com.group.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group.model.GroupBean;

public interface GroupRepository extends JpaRepository<GroupBean, Integer> {
	
	@Query("SELECT g FROM GroupBean g LEFT JOIN FETCH g.items")
	public List<GroupBean> finaAllGroup();
	
	@Query(value = "SELECT g FROM GroupBean g where g.grouptitle like concat('%',?1,'%')")
	public List<GroupBean> findGroupBySearch(String title);
	
	@Query(value = "SELECT g FROM GroupBean g WHERE g.hostuserno = :user")
	public List<GroupBean> findGroupByUser(int user) ;
	
}
