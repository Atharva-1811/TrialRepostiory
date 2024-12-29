package com.embelSoft.hibernate;

import java.util.Date;

public class PurchaseOrderHibernate {
	
	private Long pkPurchaseOrderId;
	private String customerName;
	private Date purchaseDate;
	private String regard;
	private Double cost;
	private String reference;
	private String detail;
	private String requirement;
	public PurchaseOrderHibernate(Long pkPurchaseOrderId, String customerName, Date purchaseDate, String regard,
			Double cost, String reference, String detail, String requirement) {
		super();
		this.pkPurchaseOrderId = pkPurchaseOrderId;
		this.customerName = customerName;
		this.purchaseDate = purchaseDate;
		this.regard = regard;
		this.cost = cost;
		this.reference = reference;
		this.detail = detail;
		this.requirement = requirement;
	}
	public PurchaseOrderHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getPkPurchaseOrderId() {
		return pkPurchaseOrderId;
	}
	public void setPkPurchaseOrderId(Long pkPurchaseOrderId) {
		this.pkPurchaseOrderId = pkPurchaseOrderId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getRegard() {
		return regard;
	}
	public void setRegard(String regard) {
		this.regard = regard;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	
	


}
