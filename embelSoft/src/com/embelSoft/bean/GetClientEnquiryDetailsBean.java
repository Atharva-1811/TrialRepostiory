package com.embelSoft.bean;

import java.util.Date;

public class GetClientEnquiryDetailsBean {
	private Long pkClientEnquiryId;
	
	private String firstName;
	private String middleName;
	private String lastName;
	private String enquiryDate;
	private String address;
	private Long contactNo;
	private String emailId;
	private String comment;
	private String referenceBy;
	private byte[] taskPic;
	
	
	private String businessName;
	private String businessAddress;
	private String city;
	private String state;
	private String zipCode;
	private String country;
	private String alternateContactNo;
	private String productName;
	
	private String ShipAddress;
	
	
	
	private String CourierName;
	private String CourierNumber;
	
	private String GstNo;
	
	
	public String getGstNo() {
		return GstNo;
	}
	public void setGstNo(String gstNo) {
		GstNo = gstNo;
	}
	public String getCourierName() {
		return CourierName;
	}
	public void setCourierName(String courierName) {
		CourierName = courierName;
	}
	public String getCourierNumber() {
		return CourierNumber;
	}
	public void setCourierNumber(String courierNumber) {
		CourierNumber = courierNumber;
	}
	
	
	public String getShipAddress() {
		return ShipAddress;
	}
	public void setShipAddress(String shipAddress) {
		ShipAddress = shipAddress;
	}
	private int srNo;
	
	
	
	
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
	public String getAlternateContactNo() {
		return alternateContactNo;
	}
	public void setAlternateContactNo(String alternateContactNo) {
		this.alternateContactNo = alternateContactNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBusinessAddress() {
		return businessAddress;
	}
	public void setBusinessAddress(String businessAddress) {
		this.businessAddress = businessAddress;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}

	public Long getPkClientEnquiryId() {
		return pkClientEnquiryId;
	}
	public void setPkClientEnquiryId(Long pkClientEnquiryId) {
		this.pkClientEnquiryId = pkClientEnquiryId;
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
	public String getEnquiryDate() {
		return enquiryDate;
	}
	public void setEnquiryDate(String enquiryDate) {
		this.enquiryDate = enquiryDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getContactNo() {
		return contactNo;
	}
	public void setContactNo(Long contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getReferenceBy() {
		return referenceBy;
	}
	public void setReferenceBy(String referenceBy) {
		this.referenceBy = referenceBy;
	}
	public byte[] getTaskPic() {
		return taskPic;
	}
	public void setTaskPic(byte[] taskPic) {
		this.taskPic = taskPic;
	}
	

}
