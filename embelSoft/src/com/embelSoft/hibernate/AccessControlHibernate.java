package com.embelSoft.hibernate;


/** @author Hibernate CodeGenerator */
public class AccessControlHibernate {
	
	//UserDetailasNewHibernate.hbm.xml
	/** identifier field */
	private Long pkACUserId;	//pkACUserId
	private String name;
	private String userName;
	private String password;
	private String userType;
	
	public Long getPkACUserId() {
		return pkACUserId;
	}
	public void setPkACUserId(Long pkACUserId) {
		this.pkACUserId = pkACUserId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	

}