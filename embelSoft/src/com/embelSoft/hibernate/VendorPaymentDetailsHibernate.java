package com.embelSoft.hibernate;

import java.util.Date;

public class VendorPaymentDetailsHibernate 
{
	private Long pkVendorPaymentId;
	private Long fkVendorId;
	private String vendorName;
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
	public Long getPkVendorPaymentId() {
		return pkVendorPaymentId;
	}
	public void setPkVendorPaymentId(Long pkVendorPaymentId) {
		this.pkVendorPaymentId = pkVendorPaymentId;
	}
	public Long getFkVendorId() {
		return fkVendorId;
	}
	public void setFkVendorId(Long fkVendorId) {
		this.fkVendorId = fkVendorId;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
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
	public Double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public Double getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}
	
	
	
	

}
