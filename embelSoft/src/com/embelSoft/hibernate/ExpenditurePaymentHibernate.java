package com.embelSoft.hibernate;

import java.util.Date;

public class ExpenditurePaymentHibernate {
	
	private Long pkExpPaymentId;
	private String expenseName;
	private Long fkExpDetailId;
	private String serviceProvider;
	private Long contactNumber;
	private String accountantName;
	private Double expCredit;
	private Double expDebit;
	private Double totalAmount;
	private Date insertDate;
	// For Mapping
	private ExpenditurePaymentHibernate expenditurePaymentHibernate;
	public Long getPkExpPaymentId() {
		return pkExpPaymentId;
	}
	public void setPkExpPaymentId(Long pkExpPaymentId) {
		this.pkExpPaymentId = pkExpPaymentId;
	}
	public String getExpenseName() {
		return expenseName;
	}
	public void setExpenseName(String expenseName) {
		this.expenseName = expenseName;
	}
	public Long getFkExpDetailId() {
		return fkExpDetailId;
	}
	public void setFkExpDetailId(Long fkExpDetailId) {
		this.fkExpDetailId = fkExpDetailId;
	}
	public String getServiceProvider() {
		return serviceProvider;
	}
	public void setServiceProvider(String serviceProvider) {
		this.serviceProvider = serviceProvider;
	}
	public Long getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(Long contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getAccountantName() {
		return accountantName;
	}
	public void setAccountantName(String accountantName) {
		this.accountantName = accountantName;
	}
	public Double getExpCredit() {
		return expCredit;
	}
	public void setExpCredit(Double expCredit) {
		this.expCredit = expCredit;
	}
	public Double getExpDebit() {
		return expDebit;
	}
	public void setExpDebit(Double expDebit) {
		this.expDebit = expDebit;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public ExpenditurePaymentHibernate getExpenditurePaymentHibernate() {
		return expenditurePaymentHibernate;
	}
	public void setExpenditurePaymentHibernate(ExpenditurePaymentHibernate expenditurePaymentHibernate) {
		this.expenditurePaymentHibernate = expenditurePaymentHibernate;
	}
}