package com.embelSoft.hibernate;

import java.util.Date;

public class ResourceBillingHibernate {
	
	private Long pkResourceBillId;
	private String billNo;
	private Date billDate;
	private Long fkVendorId;
	private String vendorName;
	private Date billPeriodStartDate;
	private Date billPeriodEndDate;
	private String strStartDate;
	private String strEndDate;
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
	//private Double SGST;
	private Double IGST;
	private Double taxAmount;
	private Double total;
	private Double totalSubTotal;
	private Double totalTaxAmount;
	private Double grossTotal;
	private int srNO;
	private Double balanceAmount;
	
	
	public ResourceBillingHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ResourceBillingHibernate(Long pkResourceBillId, String billNo, Date billDate, Long fkVendorId,
			String vendorName, Date billPeriodStartDate, Date billPeriodEndDate, String strStartDate, String strEndDate,
			String productName, String description, String hsnSac, Double unitPrice, Long quantity, Double amount,
			Double discountPercent, Double discountAmount, Double subTotal, Double gST, Double iGST, Double taxAmount,
			Double total, Double totalSubTotal, Double totalTaxAmount, Double grossTotal, int srNO,
			Double balanceAmount) {
		super();
		this.pkResourceBillId = pkResourceBillId;
		this.billNo = billNo;
		this.billDate = billDate;
		this.fkVendorId = fkVendorId;
		this.vendorName = vendorName;
		this.billPeriodStartDate = billPeriodStartDate;
		this.billPeriodEndDate = billPeriodEndDate;
		this.strStartDate = strStartDate;
		this.strEndDate = strEndDate;
		this.productName = productName;
		this.description = description;
		this.hsnSac = hsnSac;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.amount = amount;
		this.discountPercent = discountPercent;
		this.discountAmount = discountAmount;
		this.subTotal = subTotal;
		GST = gST;
		IGST = iGST;
		this.taxAmount = taxAmount;
		this.total = total;
		this.totalSubTotal = totalSubTotal;
		this.totalTaxAmount = totalTaxAmount;
		this.grossTotal = grossTotal;
		this.srNO = srNO;
		this.balanceAmount = balanceAmount;
	}


	public Long getPkResourceBillId() {
		return pkResourceBillId;
	}


	public void setPkResourceBillId(Long pkResourceBillId) {
		this.pkResourceBillId = pkResourceBillId;
	}


	public String getBillNo() {
		return billNo;
	}


	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}


	public Date getBillDate() {
		return billDate;
	}


	public void setBillDate(Date billDate) {
		this.billDate = billDate;
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


	public Date getBillPeriodStartDate() {
		return billPeriodStartDate;
	}


	public void setBillPeriodStartDate(Date billPeriodStartDate) {
		this.billPeriodStartDate = billPeriodStartDate;
	}


	public Date getBillPeriodEndDate() {
		return billPeriodEndDate;
	}


	public void setBillPeriodEndDate(Date billPeriodEndDate) {
		this.billPeriodEndDate = billPeriodEndDate;
	}


	public String getStrStartDate() {
		return strStartDate;
	}


	public void setStrStartDate(String strStartDate) {
		this.strStartDate = strStartDate;
	}


	public String getStrEndDate() {
		return strEndDate;
	}


	public void setStrEndDate(String strEndDate) {
		this.strEndDate = strEndDate;
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


	public int getSrNO() {
		return srNO;
	}

	public void setSrNO(int srNO) {
		this.srNO = srNO;
	}
	
	public Double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}


	@Override
	public String toString() {
		return "ResourceBillingHibernate [pkResourceBillId=" + pkResourceBillId + ", billNo=" + billNo + ", billDate="
				+ billDate + ", fkVendorId=" + fkVendorId + ", vendorName=" + vendorName + ", billPeriodStartDate="
				+ billPeriodStartDate + ", billPeriodEndDate=" + billPeriodEndDate + ", strStartDate=" + strStartDate
				+ ", strEndDate=" + strEndDate + ", productName=" + productName + ", description=" + description
				+ ", hsnSac=" + hsnSac + ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", amount=" + amount
				+ ", discountPercent=" + discountPercent + ", discountAmount=" + discountAmount + ", subTotal="
				+ subTotal + ", GST=" + GST + ", IGST=" + IGST + ", taxAmount=" + taxAmount + ", total=" + total
				+ ", totalSubTotal=" + totalSubTotal + ", totalTaxAmount=" + totalTaxAmount + ", grossTotal="
				+ grossTotal + ", srNO=" + srNO + ", balanceAmount=" + balanceAmount + "]";
	}


}
