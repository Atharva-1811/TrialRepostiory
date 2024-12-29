package com.embelSoft.hibernate;

import java.util.Date;

public class VendorDetailsHibernate {
	
	private Long pkVendorDetailsId;
	private Date insertDate;
	private String vendorName;
	private Date enquiryDate;
	private String address;
	private Long contactNo;
	private String emailId;
	private String zipCode;
	private String country;
	private String state;
	private String PANNum;
	private String CIMNo;
	private String gstInNo;
	
	private String alternateContactNo;
	
	private String companyName;
	private String emengencyContactNo;
	private String companyAddress;
	//private String permanentAddress;
	
	private Long companyNumber; 
	
	private String contactPersonName;



	public VendorDetailsHibernate(Long pkVendorDetailsId, Date insertDate, String vendorName, Date enquiryDate,
			String address, Long contactNo, String emailId, String zipCode, String country, String state, String pANNum,
			String cIMNo, String gstInNo, String alternateContactNo, Long contactPersonNumber, String companyName,
			String emengencyContactNo, String companyAddress, String permanentAddress, Long companyNumber) {
		super();
		this.pkVendorDetailsId = pkVendorDetailsId;
		this.insertDate = insertDate;
		this.vendorName = vendorName;
		this.enquiryDate = enquiryDate;
		this.address = address;
		this.contactNo = contactNo;
		this.emailId = emailId;
		this.zipCode = zipCode;
		this.country = country;
		this.state = state;
		PANNum = pANNum;
		CIMNo = cIMNo;
		this.gstInNo = gstInNo;
		this.alternateContactNo = alternateContactNo;
		
		this.companyName = companyName;
		this.emengencyContactNo = emengencyContactNo;
		this.companyAddress = companyAddress;
		//this.permanentAddress = permanentAddress;
		this.companyNumber = companyNumber;
	}





	public VendorDetailsHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public String getContactPersonName() {
		return contactPersonName;
	}
	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
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
	public String getEmengencyContactNo() {
		return emengencyContactNo;
	}
	public void setEmengencyContactNo(String emengencyContactNo) {
		this.emengencyContactNo = emengencyContactNo;
	}
	
	
	public Long getCompanyNumber() {
		return companyNumber;
	}
	public void setCompanyNumber(Long companyNumber) {
		this.companyNumber = companyNumber;
	}
	public Long getPkVendorDetailsId() {
		return pkVendorDetailsId;
	}
	public void setPkVendorDetailsId(Long pkVendorDetailsId) {
		this.pkVendorDetailsId = pkVendorDetailsId;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public Date getEnquiryDate() {
		return enquiryDate;
	}
	public void setEnquiryDate(Date enquiryDate) {
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
/*	public String getPermanentAddress() {
		return permanentAddress;
	}
	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}
	*/
	
	

}
