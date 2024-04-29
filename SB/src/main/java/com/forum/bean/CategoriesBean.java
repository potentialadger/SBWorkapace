package com.forum.bean;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "categories")
@Component
public class CategoriesBean {

	public CategoriesBean() {
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_no")
	private Integer category_no;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "CategoriesBean", cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.ALL})
	private Set<PostsBean> PostsBean =new HashSet<>();

	public Integer getCategory_no() {
		return category_no;
	}

	public void setCategory_no(Integer category_no) {
		this.category_no = category_no;
	}

	public Set<PostsBean> getPostsBean() {
		return PostsBean;
	}

	public void setPostsBean(Set<PostsBean> postsBean) {
		PostsBean = postsBean;
	}
			
}
