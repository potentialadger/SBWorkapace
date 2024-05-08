package com.group.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.model.Group;
import com.group.repository.GroupRepository;
import com.user.bean.UserBean;
import com.user.repository.UserRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
@Transactional
public class GroupService {

	@Autowired
	private GroupRepository groupRepository;
	
	@Autowired
	private UserRepository userRepository;
	
//	查詢單筆活動
	public Group findGroupByEventNo(Integer eventno) {
		Optional<Group> groupoptional = groupRepository.findById(eventno);
		
		if(groupoptional.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + eventno);
		}
		
		Group group = groupoptional.get();
	
		return group;
	}
	
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
	public Group insertGroup(Integer user, String title, String description, Date endtime,
							String[] pay, String minquantity, String minamount, String account, String address) {
		LocalDateTime startDateTime = LocalDateTime.now();
		Date startTime = Date.from(startDateTime.atZone(ZoneId.systemDefault()).toInstant());
	    
	    String paymentMethod = null;
		if(pay != null) {
			if(Arrays.asList(pay).containsAll(Arrays.asList("1","2","3"))) {
				paymentMethod = "123";
			}else if (Arrays.asList(pay).contains("1")) {
				paymentMethod = "1";
			}else if (Arrays.asList(pay).contains("2")) {
				paymentMethod = "2";
			}else if (Arrays.asList(pay).contains("3")) {
				paymentMethod = "3";
			}else if (Arrays.asList(pay).containsAll(Arrays.asList("1","2"))) {
				paymentMethod = "12";
			}else if (Arrays.asList(pay).containsAll(Arrays.asList("1","3"))) {
				paymentMethod = "13";
			}else if (Arrays.asList(pay).containsAll(Arrays.asList("2","3"))) {
				paymentMethod = "23";
			}
		}else {
			paymentMethod = "0";
		}
		
		Optional<UserBean> useroptional = userRepository.findById(user);
		if(useroptional.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + user);
		}
		
		UserBean userBean = useroptional.get();
		
		int point = 0;
		
	
		Group group = new Group();
		group.setUser(userBean);
		group.setTitle(title);
		group.setDescription(description);
		group.setStartTime(startTime);
		group.setEndTime(endtime);
		group.setMinTotalAmount(Integer.parseInt(minamount));
		group.setMinTotalQuantity(Integer.parseInt(minquantity));
		group.setStatus("active");
		group.setPaymentMethod(Integer.parseInt(paymentMethod));
		group.setAccount(account);
		group.setAddress(address);
		group.setPoint(point);
		
		return groupRepository.save(group);
	}
	
//	刪除活動
	public Group deleteGroup(int eventno) {
		Optional<Group> groupOptonal = groupRepository.findById(eventno);
		if(groupOptonal.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + eventno);
		}
		Group group = groupOptonal.get();
		
		group.setStatus("banned");
		
		return groupRepository.save(group);
	}
	
//	更改活動
	public Group updateGroup(int eventno, String grouptitle, String groupdescription, Date endtime,
			String[] pay, int mintotalquantity, int mintotalamount, String account, String address) {
		Optional<Group> resultgroup = groupRepository.findById(eventno);
		
		  Integer paymentMethod = null;
			if(pay != null) {
				if(Arrays.asList(pay).containsAll(Arrays.asList("1","2","3"))) {
					paymentMethod = 123;
				}else if (Arrays.asList(pay).contains("1")) {
					paymentMethod = 1;
				}else if (Arrays.asList(pay).contains("2")) {
					paymentMethod = 2;
				}else if (Arrays.asList(pay).contains("3")) {
					paymentMethod = 3;
				}else if (Arrays.asList(pay).containsAll(Arrays.asList("1","2"))) {
					paymentMethod = 12;
				}else if (Arrays.asList(pay).containsAll(Arrays.asList("1","3"))) {
					paymentMethod = 13;
				}else if (Arrays.asList(pay).containsAll(Arrays.asList("2","3"))) {
					paymentMethod = 23;
				}
			}else {
				paymentMethod = 0;
			}
		
		if(resultgroup.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + eventno);
		}
		Group group = resultgroup.get();
		
		group.setTitle(grouptitle);
		group.setDescription(groupdescription);
		group.setEndTime(endtime);
		group.setPaymentMethod(paymentMethod);
		group.setMinTotalAmount(mintotalamount);
		group.setMinTotalQuantity(mintotalquantity);
		group.setAccount(account);
		group.setAddress(address);
		
		return groupRepository.save(group);
	}
	
}
