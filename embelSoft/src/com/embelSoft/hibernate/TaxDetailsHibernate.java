package com.embelSoft.hibernate;

import java.util.Date;

public class TaxDetailsHibernate {
	 
	private Long pkTaxDetailsId;
	private String taxType;
	private Double taxPercentage;
	private Double CGST;
	private Double SGST;
	private Date lastUpdateDate;
	
	public Long getPkTaxDetailsId() {
		return pkTaxDetailsId;
	}
	public void setPkTaxDetailsId(Long pkTaxDetailsId) {
		this.pkTaxDetailsId = pkTaxDetailsId;
	}
	public String getTaxType() {
		return taxType;
	}
	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}
	public Double getTaxPercentage() {
		return taxPercentage;
	}
	public void setTaxPercentage(Double taxPercentage) {
		this.taxPercentage = taxPercentage;
	}
	public Double getCGST() {
		return CGST;
	}
	public void setCGST(Double cGST) {
		CGST = cGST;
	}
	public Double getSGST() {
		return SGST;
	}
	public void setSGST(Double sGST) {
		SGST = sGST;
	}
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

}
