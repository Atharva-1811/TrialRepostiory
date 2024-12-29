package com.embelSoft.hibernate;

import java.util.Date;

public class PurchaseOrderReceivedHibernate {
	
//	private long purchaseId;
//	private long fkvendorId;
//	private String name;
//	private String type;
//	private long billNo;
//	private Date PurchaseDate;
//	private Date expectPaymentDate;
//	private String productName;
//	private Double buyPrice;
//	private int quantity;
//	private Double total;
//	
//	private Double subTotal;
//	private Double gst;
//	private Double gstAmount;
//	private Double grossTotal;
//	
//
//	private Double balanceStatus;
//	
//	private Double gridAmount;
//	private Double gridDiscountPercent;
//	private Double gridDiscountAmount;
//	private Double gridSubTotal;
//	private Double gridGstPercent;
//	private Double gridGstAmount;
	
	
	private long pkReceiedPOId;
	private Long fkVendorId;
	private String vendorName;
	private String billNo;
	private Date PurchaseOrderDate;
	private Date expectPaymentDate;
	private String productName;
	private String description;
	private String hsnSac;
	private Double unitPrice;
	private Long quantity;
	private Double amount;
	private Double discountPercent;
	private Double discountAmount;
	private Double subTotal;
	private Double GST;
//	private Double SGST;
	private Double IGST;
	private Double taxAmount;
	private Double total;
	private Double totalSubTotal;
	private Double totalTaxAmount;
	private Double grossTotal;
	private Double balanceStatus;
	private int srNo;
	public long getPkReceiedPOId() {
		return pkReceiedPOId;
	}
	public void setPkReceiedPOId(long pkReceiedPOId) {
		this.pkReceiedPOId = pkReceiedPOId;
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
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public Date getPurchaseOrderDate() {
		return PurchaseOrderDate;
	}
	public void setPurchaseOrderDate(Date purchaseOrderDate) {
		PurchaseOrderDate = purchaseOrderDate;
	}
	public Date getExpectPaymentDate() {
		return expectPaymentDate;
	}
	public void setExpectPaymentDate(Date expectPaymentDate) {
		this.expectPaymentDate = expectPaymentDate;
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
	public String getHsnSac() {
		return hsnSac;
	}
	public void setHsnSac(String hsnSac) {
		this.hsnSac = hsnSac;
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
	public Double getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(Double discountPercent) {
		this.discountPercent = discountPercent;
	}
	public Double getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(Double discountAmount) {
		this.discountAmount = discountAmount;
	}
	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}
	public Double getGST() {
		return GST;
	}
	public void setGST(Double gST) {
		GST = gST;
	}
	public Double getIGST() {
		return IGST;
	}
	public void setIGST(Double iGST) {
		IGST = iGST;
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
	public Double getTotalSubTotal() {
		return totalSubTotal;
	}
	public void setTotalSubTotal(Double totalSubTotal) {
		this.totalSubTotal = totalSubTotal;
	}
	public Double getTotalTaxAmount() {
		return totalTaxAmount;
	}
	public void setTotalTaxAmount(Double totalTaxAmount) {
		this.totalTaxAmount = totalTaxAmount;
	}
	public Double getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}
	public Double getBalanceStatus() {
		return balanceStatus;
	}
	public void setBalanceStatus(Double balanceStatus) {
		this.balanceStatus = balanceStatus;
	}
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

}
