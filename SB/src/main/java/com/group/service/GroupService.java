package com.group.service;

import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.group.model.GroupBean;
import com.group.repository.GroupRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
@Transactional
public class GroupService {
	@Autowired
	private GroupRepository groupRepository;
	
//	查詢全部活動
	public List<GroupBean> findAllGroup() {
		return groupRepository.finaAllGroup();
	}
	
//	查詢搜尋活動
	public List<GroupBean> findGroupBySearch(String title) {
		return groupRepository.findGroupBySearch(title);
	}
	
//	新增活動
	public GroupBean insertGroup(int userNo, String gTitle, String gDescription, Date gEndTime, String[] pay,
			String minQuantity, String minAmount) {
		LocalDateTime startDateTime = LocalDateTime.now();
		Date startTime = Date.from(startDateTime.atZone(ZoneId.systemDefault()).toInstant());
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(gEndTime);
	    calendar.set(Calendar.HOUR_OF_DAY, 23);
	    calendar.set(Calendar.MINUTE, 59);
	    calendar.set(Calendar.SECOND, 59);
	    Date endtime = calendar.getTime();
		
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
		
		GroupBean group = new GroupBean();
		group.setHostuserno(userNo);
		group.setGrouptitle(gTitle);
		group.setGroupdescription(gDescription);
		group.setStarttime(startTime);
		group.setEndtime(endtime);
		group.setMintotalamount(new BigDecimal(minAmount));
		group.setMintotalquantity(Integer.parseInt(minQuantity));
		group.setPaymentmethod(Integer.parseInt(paymentMethod));
		group.setGroupstatus("active");
		
		return groupRepository.save(group);	
	}
	
//	查詢會員活動
	public List<GroupBean> findGroupByUser(int user) {
		List<GroupBean> groups = groupRepository.findGroupByUser(user);
		return groups;
	}
//	更改活動
	public GroupBean updateGroup(int groupeventno, String grouptitle, String groupdescription, Date endtime,
			int paymentmethod, int mintotalquantity, BigDecimal mintotalamount) {
		Optional<GroupBean> result = groupRepository.findById(groupeventno);
		 if (!result.isPresent()) {
		        throw new EntityNotFoundException("Group not found with id: " + groupeventno);
		    }
		GroupBean group = result.get();
		
		group.setGrouptitle(grouptitle);
		group.setGroupdescription(groupdescription);	
		group.setEndtime(endtime);
		group.setPaymentmethod(paymentmethod);
		group.setMintotalquantity(mintotalquantity);
		group.setMintotalamount(mintotalamount);
		
		return groupRepository.save(group);
	}
//	public GroupBean updateGroup(String groupEventNo, String gtitle, String gDescription, Date gEndTime, String[] pay,
//			String minQuantity, String minAmount) {
//		GroupBean group = null;
//		
//		
//	    String paymentMethod;
//		if(pay != null) {
//			if(Arrays.asList(pay).containsAll(Arrays.asList("1","2"))) {
//				paymentMethod = "12";
//			}else if (Arrays.asList(pay).contains("1")) {
//				paymentMethod = "1";
//			}else if (Arrays.asList(pay).contains("2")) {
//				paymentMethod = "2";
//			}else {
//				paymentMethod = "0";
//			}
//		} else {
//			paymentMethod= "0";
//		}
//		
//		Optional<GroupBean> result = groupRepository.findById(Integer.parseInt(groupEventNo));
//		if(!result.isEmpty()) {
//			group = result.get();
//		}
//		
//		group.setGrouptitle(gtitle);
//		group.setGroupdescription(gDescription);	
//		group.setEndtime(endtime);
//		group.setPaymentmethod(Integer.parseInt(paymentMethod));
//		group.setMintotalquantity(Integer.parseInt(minQuantity));
//		group.setMintotalamount(new BigDecimal(minAmount));
//
//		
//		return groupRepository.save(group);
//	}
	
//	刪除活動
	public void deleteGroup(int groupEventNo) {
		groupRepository.deleteById(groupEventNo);
	}

}
