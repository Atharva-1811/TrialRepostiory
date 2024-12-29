package com.embelSoft.bean;

public class PurchaseOrderCreateBean 
{
	private Long pkVendorId;
	
	private String VendorName;
	private String vendorCompanyName;
	private String vendorCompanyAddress;
	private String contactNumber;
	private String streetAddress;
	private String city;
	private String zipCode;
	private String phone;
	private String fax;
	private Double subTotal;
	private String gstInNumber;
	private String panNumber;
	private String cimNumber;
	
	private int gst;

	private Double vat;
	private Double grossTotal;
	
	private String productDescription;
	private int quantity;
	private Double unitPrice;
	private Double total;
	
	private String billNo;
	
	private int srNo;
	
	
	
	
	
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
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
	
	public String getGstInNumber() {
		return gstInNumber;
	}
	public void setGstInNumber(String gstInNumber) {
		this.gstInNumber = gstInNumber;
	}
	public String getPanNumber() {
		return panNumber;
	}
	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}
	public String getCimNumber() {
		return cimNumber;
	}
	public void setCimNumber(String cimNumber) {
		this.cimNumber = cimNumber;
	}
	public String getVendorCompanyAddress() {
		return vendorCompanyAddress;
	}
	public void setVendorCompanyAddress(String vendorCompanyAddress) {
		this.vendorCompanyAddress = vendorCompanyAddress;
	}
	public Long getPkVendorId() {
		return pkVendorId;
	}
	public void setPkVendorId(Long pkVendorId) {
		this.pkVendorId = pkVendorId;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public String getVendorName() {
		return VendorName;
	}
	public void setVendorName(String vendorName) {
		VendorName = vendorName;
	}
	public String getVendorCompanyName() {
		return vendorCompanyName;
	}
	public void setVendorCompanyName(String vendorCompanyName) {
		this.vendorCompanyName = vendorCompanyName;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
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

	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}

	public int getGst() {
		return gst;
	}
	public void setGst(int gst) {
		this.gst = gst;
	}
	public Double getVat() {
		return vat;
	}
	public void setVat(Double vat) {
		this.vat = vat;
	}
	public Double getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}
	
	
	
	
	
	

}
