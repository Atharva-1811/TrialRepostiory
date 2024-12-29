package com.embelSoft.hibernate;

import java.util.Date;

public class ExpenditureDetailsHibernate {
	
	private static final long serialVersionUID = 1L;
	private Long pkExpenseId;
	private String expenseName;
	private Date lastUpdateDate;
	
	
	
	public Long getPkExpenseId() {
		return pkExpenseId;
	}
	public void setPkExpenseId(Long pkExpenseId) {
		this.pkExpenseId = pkExpenseId;
	}
	public String getExpenseName() {
		return expenseName;
	}
	public void setExpenseName(String expenseName) {
		this.expenseName = expenseName;
	}
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ExpenditureDetailsHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExpenditureDetailsHibernate(Long pkExpenseId, String expenseName, Date lastUpdateDate) {
		super();
		// TODO Auto-generated constructor stub
		this.pkExpenseId = pkExpenseId;
		this.expenseName = expenseName;
		this.lastUpdateDate = lastUpdateDate;
	}
}
