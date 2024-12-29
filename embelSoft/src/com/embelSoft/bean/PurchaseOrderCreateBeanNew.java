package com.embelSoft.bean;

import java.util.Date;

public class PurchaseOrderCreateBeanNew {
	
//	private Long pkPurchaseOrderId;
//	private String billNo;
//	private Date billDate;
//	private Long fkVendorId;
//	private String vendorName;
	
	private String billNo;
	private Long pkVendorId;
	private String vendorName;
	private String vendorCompanyName;
	private String contactNo;
	private String streetAddress;
	private String city;
	private String zipCode;
	private String phone;
	private String fax;	
	private String companyAddress;
	private String gstinNumber;
	private String panNumber;
	private String cinNumber;	
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
	
	private String poDate;

	public PurchaseOrderCreateBeanNew() {
		super();
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public Long getPkVendorId() {
		return pkVendorId;
	}

	public void setPkVendorId(Long pkVendorId) {
		this.pkVendorId = pkVendorId;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getVendorCompanyName() {
		return vendorCompanyName;
	}

	public void setVendorCompanyName(String vendorCompanyName) {
		this.vendorCompanyName = vendorCompanyName;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getGstinNumber() {
		return gstinNumber;
	}

	public void setGstinNumber(String gstinNumber) {
		this.gstinNumber = gstinNumber;
	}

	public String getPanNumber() {
		return panNumber;
	}

	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}

	public String getCinNumber() {
		return cinNumber;
	}

	public void setCinNumber(String cinNumber) {
		this.cinNumber = cinNumber;
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

	public String getPoDate() {
		return poDate;
	}

	public void setPoDate(String poDate) {
		this.poDate = poDate;
	}

	@Override
	public String toString() {
		return "PurchaseOrderCreateBeanNew [billNo=" + billNo + ", pkVendorId=" + pkVendorId + ", vendorName="
				+ vendorName + ", vendorCompanyName=" + vendorCompanyName + ", contactNo=" + contactNo
				+ ", streetAddress=" + streetAddress + ", city=" + city + ", zipCode=" + zipCode + ", phone=" + phone
				+ ", fax=" + fax + ", companyAddress=" + companyAddress + ", gstinNumber=" + gstinNumber
				+ ", panNumber=" + panNumber + ", cinNumber=" + cinNumber + ", productName=" + productName
				+ ", description=" + description + ", hsnSac=" + hsnSac + ", unitPrice=" + unitPrice + ", quantity="
				+ quantity + ", amount=" + amount + ", discountPercent=" + discountPercent + ", discountAmount="
				+ discountAmount + ", subTotal=" + subTotal + ", GST=" + GST + ", IGST=" + IGST + ", taxAmount="
				+ taxAmount + ", total=" + total + ", totalSubTotal=" + totalSubTotal + ", totalTaxAmount="
				+ totalTaxAmount + ", grossTotal=" + grossTotal + ", srNO=" + srNO + ", poDate=" + poDate + "]";
	}
	
	
	
}
