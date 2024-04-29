package com.group.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.model.Group;
import com.group.repository.GroupRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
@Transactional
public class GroupService {

	@Autowired
	private GroupRepository groupRepository;
	
//	查詢活躍活動
	public List<Group> findAllGroup(){
		return groupRepository.finaAllGroup();
	}
	
//	查詢活躍活動依照開活動時間升序
	public List<Group> findAllGroupsByStartTimeAsc(){
		return groupRepository.findAllGroupsByStartTimeAsc();
	}
	
//	查詢活躍活動依照開活動時間降序
	public List<Group> findAllGroupsByStartTimeDesc(){
		return groupRepository.findAllGroupsByStartTimeDesc();
	}
	
//	查詢活躍活動依照結束時間升序
	public List<Group> findALLGroupsByEndTimeAsc(){
		return groupRepository.findAllGroupByEndTimeAsc();
	}
	
//	查詢活躍活動依照結束時間降序
	public List<Group> findALLGroupsByEndTimeDesc(){
		return groupRepository.findAllGroupByEndTimeDesc();
	}
	
//	查詢活躍活動依照搜尋
	public List<Group> findGroupBySearch(String search){
		return groupRepository.findGroupBySearch(search);
	}
	
//	查詢活動依照開創人
	public List<Group> findGroupByUser(int user){
		return groupRepository.findGroupByUser(user);
	}
	
//	新增活動
	public Group insertGroup(int user, String title, String description, Date endtime,
							String[] pay, String minquantity, String minamount, String account, String address) {
		LocalDateTime startDateTime = LocalDateTime.now();
		Date startTime = Date.from(startDateTime.atZone(ZoneId.systemDefault()).toInstant());
	    
	    String paymentMethod;
		if(pay != null) {
			if(Arrays.asList(pay).containsAll(Arrays.asList("1","2"))) {
				paymentMethod = "12";
			}else if (Arrays.asList(pay).contains("1")) {
				paymentMethod = "1";
			}else if (Arrays.asList(pay).contains("2")) {
				paymentMethod = "2";
			}else {
				paymentMethod = "0";
			}
		} else {
			paymentMethod= "0";
		}
		
		int point = 0;
		
		Group group = new Group();
		group.setHostuserno(user);
		group.setTitle(title);
		group.setDescription(description);
		group.setStarttime(startTime);
		group.setEndtime(endtime);
		group.setMintotalamount(Integer.parseInt(minamount));
		group.setMintotalquantity(Integer.parseInt(minquantity));
		group.setStatus("active");
		group.setPaymentmethod(Integer.parseInt(paymentMethod));
		group.setAccount(account);
		group.setAddress(address);
		group.setPoint(point);
		
		return groupRepository.save(group);
	}
	
//	刪除活動
	public void deleteGroup(int eventno) {
		groupRepository.deleteById(eventno);
	}
	
//	更改活動
	public Group updateGroup(int eventno, String title, String description, Date endtime,
			int paymentmethod, int minquantity, int minamount, String account, String address) {
		Optional<Group> resultgroup = groupRepository.findById(eventno);
		if(resultgroup.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + eventno);
		}
		Group group = resultgroup.get();
		
		group.setTitle(title);
		group.setEndtime(endtime);
		group.setDescription(description);
		group.setMintotalamount(minamount);
		group.setMintotalquantity(minquantity);
		group.setPaymentmethod(paymentmethod);
		group.setAccount(account);
		group.setAddress(address);
		
		return groupRepository.save(group);
	}
	
}
