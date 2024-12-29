package com.embelSoft.hibernate;

import java.util.Date;

public class ProductBillingDtlForClientPaymentCashBookHibernate {
	
	private long pkPurchaseId;
	private Long fkClientId;
	private String clientName;
//	private String type;
	private String billNo;
	private Date date;
	private String productName;
	private String description;
	private String hsnSac;
	private Double unitPrice;
	private Long quantity;
	private Double amount;
	private Double discountPercent;
	private Double discountAmount;
	private Double subTotal;
	private Double CGST;
	private Double SGST;
	private Double IGST;
	private Double taxAmount;
	private Double total;
	private Double totalSubTotal;
	private Double totalTaxAmount;
	private Double grossTotal;
	private Double balanceStatus;
	private int srNo;
	
	
private String ShipAddress;
	
	public String getShipAddress() {
		return ShipAddress;
	}
	public void setShipAddress(String shipAddress) {
		ShipAddress = shipAddress;
	}
	public long getPkPurchaseId() {
		return pkPurchaseId;
	}
	public void setPkPurchaseId(long pkPurchaseId) {
		this.pkPurchaseId = pkPurchaseId;
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
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
