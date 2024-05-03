package com.group.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group.model.Group;

public interface GroupRepository extends JpaRepository<Group, Integer> {

	@Query("SELECT g FROM Group g LEFT JOIN FETCH g.items WHERE g.status = 'active' AND g.endtime > CURRENT_TIMESTAMP")
	public List<Group> finaAllGroup();
	
	@Query("SELECT g FROM Group g LEFT JOIN FETCH g.items WHERE g.status = 'active' ORDER BY g.starttime DESC")
	public List<Group> findAllGroupsByStartTimeDesc();
	
	@Query("SELECT g FROM Group g LEFT JOIN FETCH g.items WHERE g.status = 'active' ORDER BY g.starttime ASC")
	public List<Group> findAllGroupsByStartTimeAsc();

	@Query("SELECT g FROM Group g where g.title like concat('%',?1,'%')")
	public List<Group> findGroupBySearch(String title);
	
	@Query("SELECT g FROM Group g WHERE g.user.userNo = :user")
	public List<Group> findGroupByUser(int user) ;
	
	@Query("SELECT g FROM Group g LEFT JOIN FETCH g.items WHERE g.status = 'active' ORDER BY g.endtime DESC")
	public List<Group> findAllGroupByEndTimeDesc();
	
	@Query("SELECT g FROM Group g LEFT JOIN FETCH g.items WHERE g.status = 'active' ORDER BY g.endtime ASC")
	public List<Group> findAllGroupByEndTimeAsc();
	
}
