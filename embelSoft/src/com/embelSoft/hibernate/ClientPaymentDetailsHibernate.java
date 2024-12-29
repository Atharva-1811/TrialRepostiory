package com.embelSoft.hibernate;

import java.util.Date;

public class ClientPaymentDetailsHibernate 
{
	private Long pkClientPaymentId;
	private Long fkClientId;
	private String clientName;
	private Double totalAmount;
	private Long billNo; 
	private Double billAmount;
	private Double balanceAmount;
	private Double paidAmount;
	
	private Date insertDate;
	
	
	
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public Long getPkClientPaymentId() {
		return pkClientPaymentId;
	}
	public void setPkClientPaymentId(Long pkClientPaymentId) {
		this.pkClientPaymentId = pkClientPaymentId;
	}
	public Long getFkClientId() {
		return fkClientId;
	}
	public void setFkClientId(Long fkClientId) {
		this.fkClientId = fkClientId;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Long getBillNo() {
		return billNo;
	}
	public void setBillNo(Long billNo) {
		this.billNo = billNo;
	}
	public Double getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(Double billAmount) {
		this.billAmount = billAmount;
	}
	public Double getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}
	
	
	
	
	
}
