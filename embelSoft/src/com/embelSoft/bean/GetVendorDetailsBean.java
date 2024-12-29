package com.embelSoft.bean;

import java.util.Date;

public class GetVendorDetailsBean {
	
	private Long pkVendorDetailsId;
	
	private String insertDate;
	private String vendorName;
	private String enquiryDate;
	private String address;
	private Long contactNo;
	private String emailId;
	private String zipCode;
	private String country;
	private String state;
	private String PANNum;
	private String CIMNo;
	private String gstInNo;
	
	private String companyName;
	private String companyAddress;
	private String alternateContactNo;
	private String emergencyContactNo;
	
	private String contactPersonName;
	private Long companyNumber;
	private String permanentAddress;
	
	private int srNo;
	
	private Date billPeriodStartDate;
	private Date billPeriodEndDate;
	
	
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
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public String getContactPersonName() {
		return contactPersonName;
	}
	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}
	public String getAlternateContactNo() {
		return alternateContactNo;
	}
	public void setAlternateContactNo(String alternateContactNo) {
		this.alternateContactNo = alternateContactNo;
	}
	public String getEmergencyContactNo() {
		return emergencyContactNo;
	}
	public void setEmergencyContactNo(String emergencyContactNo) {
		this.emergencyContactNo = emergencyContactNo;
	}
	public String getPermanentAddress() {
		return permanentAddress;
	}
	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}
	public Long getCompanyNumber() {
		return companyNumber;
	}
	public void setCompanyNumber(Long companyNumber) {
		this.companyNumber = companyNumber;
	}
	
	
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public Long getPkVendorDetailsId() {
		return pkVendorDetailsId;
	}
	public void setPkVendorDetailsId(Long pkVendorDetailsId) {
		this.pkVendorDetailsId = pkVendorDetailsId;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
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
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPANNum() {
		return PANNum;
	}
	public void setPANNum(String pANNum) {
		PANNum = pANNum;
	}
	public String getCIMNo() {
		return CIMNo;
	}
	public void setCIMNo(String cIMNo) {
		CIMNo = cIMNo;
	}
	public String getGstInNo() {
		return gstInNo;
	}
	public void setGstInNo(String gstInNo) {
		this.gstInNo = gstInNo;
	}

}
