package com.match.bean;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.user.bean.UserBean;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity                               //定義這個 Class 為一個實體(Entity)
@Table(name="individualizedtags")
@Component                            //標註一個類為Sping容器的類
public class TagsBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="tagno")
	private Integer tagNo;
	
	@Column(name="tagname")
	private String tagName;
	
	
	
	//多對多
	@ManyToMany(mappedBy = "tags")
	private Set<UserBean> users = new HashSet<>();   //getters and setters
	
	
	//Constructors from superclass
	public TagsBean() {
	}
	

	//getters and setters
	public Set<UserBean> getUsers() {
		return users;
	}


	public void setUsers(Set<UserBean> users) {
		this.users = users;
	}


	//Constructors using Fields  根據編號和名稱來初始化   => Controller
	public TagsBean(Integer tagNo, String tagName) {
		this.tagNo = tagNo;
		this.tagName = tagName;
	}
	
	
	//Constructors using Fields  根據名稱來初始化   => Controller
	public TagsBean(String tagName) {
		super();
		this.tagName = tagName;
	}



	//getters and setters
	public Integer getTagNo() {
		return tagNo;
	}


	public void setTagNo(Integer tagNo) {
		this.tagNo = tagNo;
	}


	public String getTagName() {
		return tagName;
	}


	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	

}
