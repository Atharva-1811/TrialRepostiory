package com.embelSoft.hibernate;

import java.util.Date;

public class ProductRecordHibernate {

	private long pkPurchaseId;
	private String billNo;
	private String vendorName;
	private Date invoiceDate;
	private String productName;
	private String description;
	private String hsnsac;
	private double unitPrice;
	private double quantity;
	private double amount;
	private double subtotal;
	private double gstPercent;
	private double igstPercent;
	private double taxAmount;
	private double grossTotal;
	private double totalSubTotal;
	private double totalTaxAmount;
	private double total;
	private double discountPercent;
	private double discountAmount;
	//private double GST;
	//private double IGST;
	private int fkVendoId;
	public ProductRecordHibernate(long pkPurchaseId, String billNo, String vendorName, Date invoiceDate,
			String productName, String description, String hsnsac, double unitPrice, double quantity, double amount,
			double subtotal, double gstPercent, double igstPercent, double taxAmount, double grossTotal,
			double totalSubTotal, double totalTaxAmount, double total, double discountPercent, double discountAmount,
			int fkVendoId) {
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
		this.totalSubTotal = totalSubTotal;
		this.totalTaxAmount = totalTaxAmount;
		this.total = total;
		this.discountPercent = discountPercent;
		this.discountAmount = discountAmount;
		this.fkVendoId = fkVendoId;
	}
	public ProductRecordHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public long getPkPurchaseId() {
		return pkPurchaseId;
	}
	public void setPkPurchaseId(long pkPurchaseId) {
		this.pkPurchaseId = pkPurchaseId;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
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
	public String getHsnsac() {
		return hsnsac;
	}
	public void setHsnsac(String hsnsac) {
		this.hsnsac = hsnsac;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
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
	public double getTotalSubTotal() {
		return totalSubTotal;
	}
	public void setTotalSubTotal(double totalSubTotal) {
		this.totalSubTotal = totalSubTotal;
	}
	public double getTotalTaxAmount() {
		return totalTaxAmount;
	}
	public void setTotalTaxAmount(double totalTaxAmount) {
		this.totalTaxAmount = totalTaxAmount;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public double getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(double discountPercent) {
		this.discountPercent = discountPercent;
	}
	public double getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(double discountAmount) {
		this.discountAmount = discountAmount;
	}
	public int getFkVendoId() {
		return fkVendoId;
	}
	public void setFkVendoId(int fkVendoId) {
		this.fkVendoId = fkVendoId;
	}
	@Override
	public String toString() {
		return "ProductRecordHibernate [pkPurchaseId=" + pkPurchaseId + ", billNo=" + billNo + ", vendorName="
				+ vendorName + ", invoiceDate=" + invoiceDate + ", productName=" + productName + ", description="
				+ description + ", hsnsac=" + hsnsac + ", unitPrice=" + unitPrice + ", quantity=" + quantity
				+ ", amount=" + amount + ", subtotal=" + subtotal + ", gstPercent=" + gstPercent + ", igstPercent="
				+ igstPercent + ", taxAmount=" + taxAmount + ", grossTotal=" + grossTotal + ", totalSubTotal="
				+ totalSubTotal + ", totalTaxAmount=" + totalTaxAmount + ", total=" + total + ", discountPercent="
				+ discountPercent + ", discountAmount=" + discountAmount + ", fkVendoId=" + fkVendoId + "]";
	}
	
	

}
