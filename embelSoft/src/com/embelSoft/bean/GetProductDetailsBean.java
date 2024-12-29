package com.embelSoft.bean;

import java.util.Date;

public class GetProductDetailsBean {
	
	private Long pkProductDetailsId;
	private String productName;
	private Double productCost;
	private String description;
	private String features;
	private Long fkTaxTypeId;
	private String taxType;
	private Double taxPercentage;
	private Double CGST;
	private Double SGST;	
	private Date lastUpdateDate;
	private int srNo;
	private String hsnsac;
	
	private String EnquiryDate;
	private Long cost;
	public Long getPkProductDetailsId() {
		return pkProductDetailsId;
	}
	public void setPkProductDetailsId(Long pkProductDetailsId) {
		this.pkProductDetailsId = pkProductDetailsId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getProductCost() {
		return productCost;
	}
	public void setProductCost(Double productCost) {
		this.productCost = productCost;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFeatures() {
		return features;
	}
	public void setFeatures(String features) {
		this.features = features;
	}
	public Long getFkTaxTypeId() {
		return fkTaxTypeId;
	}
	public void setFkTaxTypeId(Long fkTaxTypeId) {
		this.fkTaxTypeId = fkTaxTypeId;
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
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public String getHsnsac() {
		return hsnsac;
	}
	public void setHsnsac(String hsnsac) {
		this.hsnsac = hsnsac;
	}
	public String getEnquiryDate() {
		return EnquiryDate;
	}
	public void setEnquiryDate(String enquiryDate) {
		EnquiryDate = enquiryDate;
	}
	public Long getCost() {
		return cost;
	}
	public void setCost(Long cost) {
		this.cost = cost;
	}
	
	
}
