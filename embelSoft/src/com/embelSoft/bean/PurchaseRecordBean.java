package com.embelSoft.bean;

import java.util.Date;

public class PurchaseRecordBean {
	
	private int pkPurchaseId;
	private int billNo;
	private String vendorName;
	private Date invoiceDate;
	private String productName;
	private String description;
	private int hsnsac;
	private int unitPrice;
	private int quantity;
	private double amount;
	private double subtotal;
	private double gstPercent;
	private double igstPercent;
	private double taxAmount;
	private double grossTotal;
	
	
	public PurchaseRecordBean(int pkPurchaseId, int billNo, String vendorName, Date invoiceDate, String productName,
			String description, int hsnsac, int unitPrice, int quantity, double amount, double subtotal,
			double gstPercent, double igstPercent, double taxAmount, double grossTotal) {
		super();
		this.pkPurchaseId = pkPurchaseId;
		this.billNo = billNo;
		this.vendorName = vendorName;
		this.invoiceDate = invoiceDate;
		this.productName = productName;
		this.description = description;
		this.hsnsac = hsnsac;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.amount = amount;
		this.subtotal = subtotal;
		this.gstPercent = gstPercent;
		this.igstPercent = igstPercent;
		this.taxAmount = taxAmount;
		this.grossTotal = grossTotal;
	}


	public PurchaseRecordBean() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getPkPurchaseId() {
		return pkPurchaseId;
	}


	public void setPkPurchaseId(int pkPurchaseId) {
		this.pkPurchaseId = pkPurchaseId;
	}


	public int getBillNo() {
		return billNo;
	}


	public void setBillNo(int billNo) {
		this.billNo = billNo;
	}


	public String getVendorName() {
		return vendorName;
	}


	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}


	public Date getInvoiceDate() {
		return invoiceDate;
	}


	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getHsnsac() {
		return hsnsac;
	}


	public void setHsnsac(int hsnsac) {
		this.hsnsac = hsnsac;
	}


	public int getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public double getAmount() {
		return amount;
	}


	public void setAmount(double amount) {
		this.amount = amount;
	}


	public double getSubtotal() {
		return subtotal;
	}


	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}


	public double getGstPercent() {
		return gstPercent;
	}


	public void setGstPercent(double gstPercent) {
		this.gstPercent = gstPercent;
	}


	public double getIgstPercent() {
		return igstPercent;
	}


	public void setIgstPercent(double igstPercent) {
		this.igstPercent = igstPercent;
	}


	public double getTaxAmount() {
		return taxAmount;
	}


	public void setTaxAmount(double taxAmount) {
		this.taxAmount = taxAmount;
	}


	public double getGrossTotal() {
		return grossTotal;
	}


	public void setGrossTotal(double grossTotal) {
		this.grossTotal = grossTotal;
	}


	@Override
	public String toString() {
		return "PurchaseRecordBean [pkPurchaseId=" + pkPurchaseId + ", billNo=" + billNo + ", vendorName=" + vendorName
				+ ", invoiceDate=" + invoiceDate + ", productName=" + productName + ", description=" + description
				+ ", hsnsac=" + hsnsac + ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", amount=" + amount
				+ ", subtotal=" + subtotal + ", gstPercent=" + gstPercent + ", igstPercent=" + igstPercent
				+ ", taxAmount=" + taxAmount + ", grossTotal=" + grossTotal + "]";
	}
	
	
	

}
