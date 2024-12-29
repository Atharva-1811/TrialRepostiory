package com.embelSoft.bean;

import java.util.Date;

public class CompoenentBillingBean {

	private Long pkCompoenentBillId;
	private String billNo;
	private Date billingDate;
	private Long fkClientId;
	private String clientName;
	private Long fkComptypeId;
	private String CompoenentName;
	private String compoenentCategory;
	private String hsn;
	private Double unitPrice;
	private Long quantity;
	private Double amount;
	private Double discountAmount;
	private Double discountPercentage;
	private Double subTotal;
	private Double gst;
	private Double IGST;
	private Double taxAmount;
	private Double total;
	private int srNo;
	private Long quantity1;
private Long fkCompoentnameid;
	
	private String packages;
	private String partNumber;
	private String values;
	private String mfgName;
	
	
	
	
	public String getPackages() {
		return packages;
	}
	public void setPackages(String packages) {
		this.packages = packages;
	}
	public String getPartNumber() {
		return partNumber;
	}
	public void setPartNumber(String partNumber) {
		this.partNumber = partNumber;
	}
	public String getValues() {
		return values;
	}
	public void setValues(String values) {
		this.values = values;
	}
	public String getMfgName() {
		return mfgName;
	}
	public void setMfgName(String mfgName) {
		this.mfgName = mfgName;
	}
	public Long getQuantity1() {
	return quantity1;
}
public void setQuantity1(Long quantity1) {
	this.quantity1 = quantity1;
}
	public Long getFkCompoentnameid() {
		return fkCompoentnameid;
	}
	public void setFkCompoentnameid(Long fkCompoentnameid) {
		this.fkCompoentnameid = fkCompoentnameid;
	}
	
	
	
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public Long getPkCompoenentBillId() {
		return pkCompoenentBillId;
	}
	public void setPkCompoenentBillId(Long pkCompoenentBillId) {
		this.pkCompoenentBillId = pkCompoenentBillId;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public Date getBillingDate() {
		return billingDate;
	}
	public void setBillingDate(Date billingDate) {
		this.billingDate = billingDate;
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
	
	public Long getFkComptypeId() {
		return fkComptypeId;
	}
	public void setFkComptypeId(Long fkComptypeId) {
		this.fkComptypeId = fkComptypeId;
	}
	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}
	public Double getIGST() {
		return IGST;
	}
	public void setIGST(Double iGST) {
		IGST = iGST;
	}
	public String getCompoenentName() {
		return CompoenentName;
	}
	public void setCompoenentName(String compoenentName) {
		CompoenentName = compoenentName;
	}
	public String getCompoenentCategory() {
		return compoenentCategory;
	}
	public void setCompoenentCategory(String compoenentCategory) {
		this.compoenentCategory = compoenentCategory;
	}
	public String getHsn() {
		return hsn;
	}
	public void setHsn(String hsn) {
		this.hsn = hsn;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Double getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(Double discountAmount) {
		this.discountAmount = discountAmount;
	}
	public Double getDiscountPercentage() {
		return discountPercentage;
	}
	public void setDiscountPercentage(Double discountPercentage) {
		this.discountPercentage = discountPercentage;
	}
	public Double getSubtotal() {
		return subTotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subTotal = subtotal;
	}
	public Double getGst() {
		return gst;
	}
	public void setGst(Double gst) {
		this.gst = gst;
	}
	public Double getIgst() {
		return IGST;
	}
	public void setIgst(Double igst) {
		this.IGST = igst;
	}
	public Double getTaxAmount() {
		return taxAmount;
	}
	public void setTaxAmount(Double taxAmount) {
		this.taxAmount = taxAmount;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public CompoenentBillingBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
