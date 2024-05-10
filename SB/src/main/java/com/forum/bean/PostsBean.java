package com.forum.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.user.bean.UserBean;

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
	
	@JoinColumn(name = "user_no")
	@ManyToOne
	private UserBean userBean;
	
	@JoinColumn(name = "category_no")
	@ManyToOne
	private CategoriesBean categoriesBean;

	@Column(name = "title")
	private String title;

	@Column(name = "content")
	private String content;
	
	@Column(name = "image_url")
	private String image_url;

	@Column(name = "update_date")
	private Date update_date;

	@Column(name = "view_count")
	private int view_count;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "postsBean", cascade = {CascadeType.PERSIST,CascadeType.ALL})
	private Set<RepliesBean> repliesBean =new HashSet<>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "postsBean", cascade = {CascadeType.PERSIST,CascadeType.ALL})
	private Set<ReportsBean> reportsBean =new HashSet<>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "postsBean", cascade = {CascadeType.PERSIST,CascadeType.ALL})
	private Set<LikesBean> likesBean =new HashSet<>();

	public Integer getPost_no() {
		return post_no;
	}

	public void setPost_no(Integer post_no) {
		this.post_no = post_no;
	}

	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public CategoriesBean getCategoriesBean() {
		return categoriesBean;
	}

	public void setCategoriesBean(CategoriesBean categoriesBean) {
		this.categoriesBean = categoriesBean;
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

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public Set<RepliesBean> getRepliesBean() {
		return repliesBean;
	}

	public void setRepliesBean(Set<RepliesBean> repliesBean) {
		this.repliesBean = repliesBean;
	}

	public Set<ReportsBean> getReportsBean() {
		return reportsBean;
	}

	public void setReportsBean(Set<ReportsBean> reportsBean) {
		this.reportsBean = reportsBean;
	}

	public Set<LikesBean> getLikesBean() {
		return likesBean;
	}

	public void setLikesBean(Set<LikesBean> likesBean) {
		this.likesBean = likesBean;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PostsBean [post_no=");
		builder.append(post_no);
		builder.append(", userBean=");
		builder.append(userBean);
		builder.append(", categoriesBean=");
		builder.append(categoriesBean);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", image_url=");
		builder.append(image_url);
		builder.append(", update_date=");
		builder.append(update_date);
		builder.append(", view_count=");
		builder.append(view_count);
		builder.append(", repliesBean=");
		builder.append(repliesBean);
		builder.append(", reportsBean=");
		builder.append(reportsBean);
		builder.append(", likesBean=");
		builder.append(likesBean);
		builder.append("]");
		return builder.toString();
	}	
}

	