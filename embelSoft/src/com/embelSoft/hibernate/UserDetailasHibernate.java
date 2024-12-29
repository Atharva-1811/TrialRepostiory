package com.embelSoft.hibernate;

import java.io.Serializable;

/** @author Hibernate CodeGenerator */
public class UserDetailasHibernate{

	/** identifier field */
	private Long pkUserId;

	/** nullable persistent field */
	private String Name;
	
	/** nullable persistent field */
	private String userName;

	/** nullable persistent field */
	private String password;


	/** nullable persistent field */
	private String confirmPassword;

	
	public Long getPkUserId() {
		return pkUserId;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public void setPkUserId(Long pkUserId) {
		this.pkUserId = pkUserId;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
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

}
