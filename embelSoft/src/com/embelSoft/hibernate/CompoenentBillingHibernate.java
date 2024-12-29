package com.embelSoft.hibernate;

import java.util.Date;

public class CompoenentBillingHibernate {

	private Long pkCompoenentBillId;

	private String billNo;
	private Date billingDate;

	private Long fkClientId;
	private String clientName;

	private Long fkComptypeId;
	private String CompoenentName;
	private String compoenentCategory;

	private String ProjectName;
	private String BoardName;

	private String hsn;

	private Double unitPrice;
	private Long quantity;
	private Double amount;

	private Double discountAmount;
	private Double discountPercentage;

	private Double subtotal;
	private Double gst;
	private Double igst;

	private Double taxAmount;
	private Double total;

	private Long fkCompoentnameid;

	private String packages;
	private String partNumber;
	private String values1;
	private String mfgName;
	private String description;

	public String getValues1() {
		return values1;
	}

	public void setValues1(String values1) {
		this.values1 = values1;
	}

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

	public String getMfgName() {
		return mfgName;
	}

	public void setMfgName(String mfgName) {
		this.mfgName = mfgName;
	}

	public Long getFkCompoentnameid() {
		return fkCompoentnameid;
	}

	public void setFkCompoentnameid(Long fkCompoentnameid) {
		this.fkCompoentnameid = fkCompoentnameid;
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
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	public Double getGst() {
		return gst;
	}

	public void setGst(Double gst) {
		this.gst = gst;
	}

	public Double getIgst() {
		return igst;
	}

	public void setIgst(Double igst) {
		this.igst = igst;
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

	public String getProjectName() {
		return ProjectName;
	}

	public void setProjectName(String projectName) {
		ProjectName = projectName;
	}

	public String getBoardName() {
		return BoardName;
	}

	public void setBoardName(String boardName) {
		BoardName = boardName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public CompoenentBillingHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}

}
