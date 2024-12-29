package com.embelSoft.bean;

import java.util.Date;

public class ExpenditureDetailsBean {
	
	private static final long serialVersionUID = 1L;
	private Long pkExpenseId;
	private String expenseName;
	private Date lastUpdateDate;
	private int srNo;
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
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ExpenditureDetailsBean(Long pkExpenseId, String expenseName, Date lastUpdateDate) {
		super();
		this.pkExpenseId = pkExpenseId;
		this.expenseName = expenseName;
		this.lastUpdateDate = lastUpdateDate;
	}
	public ExpenditureDetailsBean() {
		super();
		// TODO Auto-generated constructor stub
	}

}
