package com.embelSoft.hibernate;

import java.util.Date;

public class ProductBillingHibernate 
{
	
	private Date insertDate;
	private Long getPkProductBillingId;
	private Long fkVendorId;
	private Date billingDate;
	//private Long srNO;
	private String description1;
	private String hsn;
	private Long quantity1;
	private Double unit1;
	private Double gridAmount;
	private Double gridDiscountPercent;
	private Double gridDiscountAmount;
	private Double gridSubTotal;
	private Double gridGstPercent;
	private Double gridGstPercentAmount;
	private Double amount1;
	private String vendorName;
	
	
	public Double getGridAmount() {
		return gridAmount;
	}
	public void setGridAmount(Double gridAmount) {
		this.gridAmount = gridAmount;
	}
	public Double getGridDiscountPercent() {
		return gridDiscountPercent;
	}
	public void setGridDiscountPercent(Double gridDiscountPercent) {
		this.gridDiscountPercent = gridDiscountPercent;
	}
	public Double getGridDiscountAmount() {
		return gridDiscountAmount;
	}
	public void setGridDiscountAmount(Double gridDiscountAmount) {
		this.gridDiscountAmount = gridDiscountAmount;
	}
	public Double getGridSubTotal() {
		return gridSubTotal;
	}
	public void setGridSubTotal(Double gridSubTotal) {
		this.gridSubTotal = gridSubTotal;
	}
	public Double getGridGstPercent() {
		return gridGstPercent;
	}
	public void setGridGstPercent(Double gridGstPercent) {
		this.gridGstPercent = gridGstPercent;
	}
	public Double getGridGstPercentAmount() {
		return gridGstPercentAmount;
	}
	public void setGridGstPercentAmount(Double gridGstPercentAmount) {
		this.gridGstPercentAmount = gridGstPercentAmount;
	}
	public String getHsn() {
		return hsn;
	}
	public void setHsn(String hsn) {
		this.hsn = hsn;
	}
	private Double subTotal1;
	private Double gst;
	public Double getGst() {
		return gst;
	}
	public void setGst(Double gst) {
		this.gst = gst;
	}
	private Double gst1;
	private Double vat1;
	private Double grossTotal2;
	
	private String billNo;
	
	

	
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	/*
	 * public ProductBillingHibernate(Date insertDate, Long getPkProductBillingId,
	 * Long fkVendorId, Date billingDate, Long srNO, String description1, Long
	 * quantity1, Double unit1, Double amount1, String vendorName, Double subTotal1,
	 * Double gst1, Double vat1, Double grossTotal2) { super(); this.insertDate =
	 * insertDate; this.getPkProductBillingId = getPkProductBillingId;
	 * this.fkVendorId = fkVendorId; this.billingDate = billingDate; //this.srNO =
	 * srNO; this.description1 = description1; this.quantity1 = quantity1;
	 * this.unit1 = unit1; this.amount1 = amount1; this.vendorName = vendorName;
	 * this.subTotal1 = subTotal1; this.gst1 = gst1; this.vat1 = vat1;
	 * this.grossTotal2 = grossTotal2; }
	 */
	public ProductBillingHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductBillingHibernate(Date insertDate, Long getPkProductBillingId, Long fkVendorId, Date billingDate,
			String description1, String hsn, Long quantity1, Double unit1,Double gridAmount,Double gridDiscountPercent,Double gridDiscountAmount,Double gridSubTotal,Double gridGstPercent,Double gridGstPercentAmount, Double amount1, String vendorName,
			Double subTotal1, Double gst, Double gst1, Double vat1, Double grossTotal2, String billNo) {
		super();
		this.insertDate = insertDate;
		this.getPkProductBillingId = getPkProductBillingId;
		this.fkVendorId = fkVendorId;
		this.billingDate = billingDate;
		this.description1 = description1;
		this.hsn = hsn;
		this.quantity1 = quantity1;
		this.unit1 = unit1;
		this.gridAmount = gridAmount;
		this.gridDiscountPercent = gridDiscountPercent;
		this.gridDiscountAmount = gridDiscountAmount;
		this.gridSubTotal = gridSubTotal;
		this.gridGstPercent = gridGstPercent;
		this.gridGstPercentAmount = gridGstPercentAmount;
		this.amount1 = amount1;
		this.vendorName = vendorName;
		this.subTotal1 = subTotal1;
		this.gst = gst;
		this.gst1 = gst1;
		this.vat1 = vat1;
		this.grossTotal2 = grossTotal2;
		this.billNo = billNo;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Long getGetPkProductBillingId() {
		return getPkProductBillingId;
	}
	public void setGetPkProductBillingId(Long getPkProductBillingId) {
		this.getPkProductBillingId = getPkProductBillingId;
	}
	public Long getFkVendorId() {
		return fkVendorId;
	}
	public void setFkVendorId(Long fkVendorId) {
		this.fkVendorId = fkVendorId;
	}
	public Date getBillingDate() {
		return billingDate;
	}
	public void setBillingDate(Date billingDate) {
		this.billingDate = billingDate;
	}
	/*public Long getSrNO() {
		return srNO;
	}
	public void setSrNO(Long srNO) {
		this.srNO = srNO;
	}*/
	public String getDescription1() {
		return description1;
	}
	public void setDescription1(String description1) {
		this.description1 = description1;
	}
	public Long getQuantity1() {
		return quantity1;
	}
	public void setQuantity1(Long quantity1) {
		this.quantity1 = quantity1;
	}
	public Double getUnit1() {
		return unit1;
	}
	public void setUnit1(Double unit1) {
		this.unit1 = unit1;
	}
	public Double getAmount1() {
		return amount1;
	}
	public void setAmount1(Double amount1) {
		this.amount1 = amount1;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public Double getSubTotal1() {
		return subTotal1;
	}
	public void setSubTotal1(Double subTotal1) {
		this.subTotal1 = subTotal1;
	}
	public Double getGst1() {
		return gst1;
	}
	public void setGst1(Double gst1) {
		this.gst1 = gst1;
	}
	public Double getVat1() {
		return vat1;
	}
	public void setVat1(Double vat1) {
		this.vat1 = vat1;
	}
	public Double getGrossTotal2() {
		return grossTotal2;
	}
	public void setGrossTotal2(Double grossTotal2) {
		this.grossTotal2 = grossTotal2;
	}
	
}
