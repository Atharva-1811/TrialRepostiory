package com.embelSoft.hibernate;

import java.util.Date;

public class HRBillingHibernate {
	
	private Date insertDate;
	private Long getPkHRBillingId;
	private Long fkVendorId;
	private String firstName;
	private String middleName;
	private String lastName;
	private Date billingDate;
	private Date billingPeriodFrom;
	private Date billingPeriodTo;
	//private int srNO;
	private String description;
	private Long quantity;
	private Double unit;
	
	private Double gridAmount;
	private Double gridDiscountPercent;
	private Double gridDiscountAmount;
	private Double gridSubTotal;
	private Double gridGstPercent;
	private Double gridGstPercentAmount;
	
	private Double amount;
	private String vendorName;
	private Double subTotal;
	private Double gst;
	private Double vat;
	private Double grossTotal1;
	
	private String billNo;
	private String hsn;
	

	
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
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public HRBillingHibernate(Date insertDate, Long getPkHRBillingId, Long fkVendorId, String firstName,
			String middleName, String lastName, Date billingDate, Date billingPeriodFrom, Date billingPeriodTo,
			String description, Long quantity, Double unit, Double amount, String vendorName, Double subTotal,
			Double gst, Double vat, Double grossTotal1, String billNo, String hsn) {
		super();
		this.insertDate = insertDate;
		this.getPkHRBillingId = getPkHRBillingId;
		this.fkVendorId = fkVendorId;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.billingDate = billingDate;
		this.billingPeriodFrom = billingPeriodFrom;
		this.billingPeriodTo = billingPeriodTo;
		this.description = description;
		this.quantity = quantity;
		this.unit = unit;
		this.amount = amount;
		this.vendorName = vendorName;
		this.subTotal = subTotal;
		this.gst = gst;
		this.vat = vat;
		this.grossTotal1 = grossTotal1;
		this.billNo = billNo;
		this.hsn = hsn;
	}
	public HRBillingHibernate(Date insertDate, Long getPkHRBillingId, Long fkVendorId, String firstName,
			String middleName, String lastName, Date billingDate, Date billingPeriodFrom, Date billingPeriodTo,
			int srNO, String description, Long quantity, Double unit, Double amount, String vendorName,
			Double subTotal, Double gst, Double vat, Double grossTotal1) {
		super();
		this.insertDate = insertDate;
		this.getPkHRBillingId = getPkHRBillingId;
		this.fkVendorId = fkVendorId;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.billingDate = billingDate;
		this.billingPeriodFrom = billingPeriodFrom;
		this.billingPeriodTo = billingPeriodTo;
		//this.srNO = srNO;
		this.description = description;
		this.quantity = quantity;
		this.unit = unit;
		this.amount = amount;
		this.vendorName = vendorName;
		this.subTotal = subTotal;
		this.gst = gst;
		this.vat = vat;
		this.grossTotal1 = grossTotal1;
	}
	public HRBillingHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Long getGetPkHRBillingId() {
		return getPkHRBillingId;
	}
	public void setGetPkHRBillingId(Long getPkHRBillingId) {
		this.getPkHRBillingId = getPkHRBillingId;
	}
	public Long getFkVendorId() {
		return fkVendorId;
	}
	public void setFkVendorId(Long fkVendorId) {
		this.fkVendorId = fkVendorId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getBillingDate() {
		return billingDate;
	}
	public void setBillingDate(Date billingDate) {
		this.billingDate = billingDate;
	}
	public Date getBillingPeriodFrom() {
		return billingPeriodFrom;
	}
	public void setBillingPeriodFrom(Date billingPeriodFrom) {
		this.billingPeriodFrom = billingPeriodFrom;
	}
	public Date getBillingPeriodTo() {
		return billingPeriodTo;
	}
	public void setBillingPeriodTo(Date billingPeriodTo) {
		this.billingPeriodTo = billingPeriodTo;
	}
	
	
	/*public int getSrNO() {
		return srNO;
	}
	
	public void setSrNO(int	 srNO) {
		this.srNO = srNO;
	}
	*/
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Double getUnit() {
		return unit;
	}
	public void setUnit(Double unit) {
		this.unit = unit;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}
	public Double getGst() {
		return gst;
	}
	public void setGst(Double gst) {
		this.gst = gst;
	}
	public Double getVat() {
		return vat;
	}
	public void setVat(Double vat) {
		this.vat = vat;
	}
	public Double getGrossTotal1() {
		return grossTotal1;
	}
	public void setGrossTotal1(Double grossTotal1) {
		this.grossTotal1 = grossTotal1;
	}
	
	

}
