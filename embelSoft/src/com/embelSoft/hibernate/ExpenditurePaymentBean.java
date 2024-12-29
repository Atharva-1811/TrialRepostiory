package com.embelSoft.hibernate;

import java.util.Date;

import com.embelSoft.bean.ExpenditureDetailsBean;

public class ExpenditurePaymentBean {
	
	private Long pkExpPaymentId;
	private String expenseName;
	private Long fkExpDetailId;
	private String serviceProvider;
	private Long contactNumber;
	private String accountantName;
	private Double expcredit;
	private Double expDebit;
	private Double totalAmount;
	private Date insertDate;
	// For Mapping
	private ExpenditureDetailsBean expenditureDetailsBean;
	
	public ExpenditurePaymentBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ExpenditurePaymentBean(Long pkExpPaymentId, Long fkExpDetailId, String serviceProvider, Long contactNumber, String accountantName, Double expcredit, Double expDebit, Double totalAmount, Date insertDate, ExpenditureDetailsBean expenditureDetailsBean) {
		super();
		this.pkExpPaymentId = pkExpPaymentId;
		this.fkExpDetailId = fkExpDetailId;
		this.serviceProvider = serviceProvider;
		this.contactNumber = contactNumber;
		this.accountantName = accountantName;
		this.expcredit = expcredit;
		this.expDebit = expDebit;
		this.totalAmount = totalAmount;
		this.insertDate = insertDate;
		this.expenditureDetailsBean = expenditureDetailsBean;
	}

}
