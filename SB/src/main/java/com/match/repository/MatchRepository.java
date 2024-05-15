package com.match.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.match.bean.MatchBean;
import com.match.bean.SocialPhotosBean;

public interface MatchRepository extends JpaRepository<MatchBean, Integer> {
	
	//Spring Data JPA 會自動生成相應的 JPQL 查詢,查找 user1No 和 user2No 都匹配的 MatchBean 實體
	MatchBean findByUser1NoAndUser2No(Integer user1No, Integer user2No);
	
	List<MatchBean> findByMatchStatus(Integer matchStatus);

}
