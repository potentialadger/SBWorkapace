package com.user.bean;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.match.bean.TagsBean;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
@Component
public class UserBean implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userno")
	private Integer userNo; //not null
	
	@Column(name = "account")
	private String userAccount; //not null
	
	@Column(name = "userpassword")
	private String userPassword; //not null
	
	@Column(name = "ucname")
	private String userChineseName;

	@Column(name = "uename")
	private String userEnglishName;
	
	@Column(name = "nickname")
	private String nickName;
	
	@Column(name = "avatar")
	private String avatar;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "birthday")
	private LocalDateTime birthday;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "useraddress")
	private String userAddress;
	
	@Column(name = "creationdatetime")
	private LocalDateTime creationDatetime;
	
	@Column(name = "lastlogindatetime")
	private LocalDateTime lastLoginDatetime;
	
	@Column(name = "gender")
	private Integer gender; //0：生理女 1：生理男 not null
	
	@Column(name = "goalno")
	private Integer goalNo;
	
	@Column(name = "bloodtype")
	private String bloodType;
	
	@Column(name = "mbti")
	private String MBTI;
	
	@Column(name = "suspension")
	private Integer suspension; //0：未停權 1：已停權 Not Null
	
	@Column(name = "verify")
	private Integer verify; //0：未驗證 1：已驗證 Not Null
	
	@Column(name = "isdelete")
	private Integer isDelete; //0：未刪除 1：已刪除 Not Null
	
	@Column(name = "ismanager")
	private Integer isManager; //0：普通使用者 1：管理者
	
	
	//多對多  // 有 join table 這邊為主要控制方，操作兩方關係盡量由這邊(User)操作
	@ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name="usertags",
	joinColumns = {@JoinColumn(name="fkuserno", referencedColumnName = "userno")},
	inverseJoinColumns = {@JoinColumn(name="fktagno", referencedColumnName = "tagno")})
	private Set<TagsBean> tags = new HashSet<>();  //屬性
	
	
	
	public int getUserNo() {return userNo;}
	public String getUserAccount() {return userAccount;}
	public String getUserPassword() {return userPassword;}
	public String getUserChineseName() {return userChineseName;}
	public String getUserEnglishName() {return userEnglishName;}
	public String getNickName() {return nickName;}
	public String getAvatar() {return avatar;}
	public String getEmail() {return email;}
	public LocalDateTime getBirthday() {return birthday;}
	public String getPhone() {return phone;}
	public String getUserAddress() {return userAddress;}
	public LocalDateTime getCreationDatetime() {return creationDatetime;}
	public LocalDateTime getLastLoginDatetime() {return lastLoginDatetime;}
	public int getGender() {return gender;}
	public Integer getGoalNo() {return goalNo;}
	public String getBloodType() {return bloodType;}
	public String getMBTI() {return MBTI;}
	public int getSuspension() {return suspension;}
	public int getVerify() {return verify;}
	public int getIsDelete() {return isDelete;}
	public int getIsManager() {return isManager;}
	public Set<TagsBean> getTags() {return tags;}
	
	public void setUserNo(int userNo) {this.userNo = userNo;}
	public void setUserAccount(String userAccount) {this.userAccount = userAccount;}
	public void setUserPassword(String userPassword) {this.userPassword = userPassword;}
	public void setUserChineseName(String userChineseName) {this.userChineseName = userChineseName;}
	public void setUserEnglishName(String userEnglishName) {this.userEnglishName = userEnglishName;}
	public void setNickName(String nickName) {this.nickName = nickName;}
	public void setAvatar(String avatar) {this.avatar = avatar;}
	public void setEmail(String email) {this.email = email;}
	public void setBirthday(LocalDateTime birthday) {this.birthday = birthday;}
	public void setPhone(String phone) {this.phone = phone;}
	public void setUserAddress(String userAddress) {this.userAddress = userAddress;}
	public void setCreationDatetime(LocalDateTime creationDatetime) {this.creationDatetime = creationDatetime;}
	public void setLastLoginDatetime(LocalDateTime lastLoginDatetime) {this.lastLoginDatetime = lastLoginDatetime;}
	public void setGender(int gender) {this.gender = gender;}
	public void setGoalNo(Integer goalNo) {this.goalNo = goalNo;}
	public void setBloodType(String bloodType) {this.bloodType = bloodType;}
	public void setMBTI(String mBTI) {MBTI = mBTI;}
	public void setSuspension(int suspension) {this.suspension = suspension;}
	public void setVerify(int verify) {this.verify = verify;}
	public void setIsDelete(int isDelete) {this.isDelete = isDelete;}
	public void setIsManager(int isManager) {this.isManager = isManager;}
	public void setTags(Set<TagsBean> tags) {this.tags = tags;}
	
	@Override
	public String toString() {
		return "UserBean [userNo=" + userNo + ", userAccount=" + userAccount + ", userPassword=" + userPassword
				+ ", userChineseName=" + userChineseName + ", userEnglishName=" + userEnglishName + ", nickName="
				+ nickName + ", avatar=" + avatar + ", email=" + email + ", birthday=" + birthday + ", phone=" + phone
				+ ", userAddress=" + userAddress + ", creationDatetime=" + creationDatetime + ", lastLoginDatetime="
				+ lastLoginDatetime + ", gender=" + gender + ", goalNo=" + goalNo + ", bloodType=" + bloodType
				+ ", MBTI=" + MBTI + ", suspension=" + suspension + ", verify=" + verify + ", isDelete=" + isDelete
				+ ", isManager=" + isManager + "]";
	}
	
	
	
	
}
