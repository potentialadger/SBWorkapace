package com.forum.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.*;

@Entity
@Table(name = "posts")
@Component
public class PostsBean {

	public PostsBean() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "post_no")
	private Integer post_no;

	@Column(name = "user_no")
	private int user_no;

	@Column(name = "category_no")
	private int category_no;

	@Column(name = "title")
	private String title;

	@Column(name = "content")
	private String content;

	@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
	@Column(name = "creation_date")
	private Date creation_date;

	@Column(name = "view_count")
	private int view_count;

	@Column(name = "like_count")
	private int like_count;

	@Column(name = "status")
	private String status;

	public Integer getPost_no() {
		return post_no;
	}

	public void setPost_no(Integer post_no) {
		this.post_no = post_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	}