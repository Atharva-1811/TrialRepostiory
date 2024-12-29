package com.embelSoft.hibernate;

import java.util.Date;

public class ClientEnquiryHibernate 
{
	
	private Long pkClientEnquiryId;
	private Date insertDate;
	private String firstName;
	private String middleName;
	private String lastName;
	private Date enquiryDate;
	private String address;
	private Long contactNo;
	private String emailId;
	private String comment;
	private String referenceBy;
	private byte[] taskPic;
	
	private String businessName;
	private String businessAddress;
	private String alternativeContactNo;
	private String productName;
	
	
	private String city;
	private String state;
	private String zipCode;
	private String Country;
	
	private String GstNo;
	
	
	
	public ClientEnquiryHibernate(Long pkClientEnquiryId, Date insertDate, String firstName, String middleName,
			String lastName, Date enquiryDate, String address, Long contactNo, String emailId, String comment,
			String referenceBy, byte[] taskPic) {
		super();
		this.pkClientEnquiryId = pkClientEnquiryId;
		this.insertDate = insertDate;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.enquiryDate = enquiryDate;
		this.address = address;
		this.contactNo = contactNo;
		this.emailId = emailId;
		this.comment = comment;
		this.referenceBy = referenceBy;
		this.taskPic = taskPic;
	}

	public ClientEnquiryHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	public String getGstNo() {
		return GstNo;
	}

	public void setGstNo(String gstNo) {
		GstNo = gstNo;
	}

	public String getAlternativeContactNo() {
		return alternativeContactNo;
	}

	public void setAlternativeContactNo(String alternativeContactNo) {
		this.alternativeContactNo = alternativeContactNo;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
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
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
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



	
	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public Long getPkClientEnquiryId() {
		return pkClientEnquiryId;
	}
	public void setPkClientEnquiryId(Long pkClientEnquiryId) {
		this.pkClientEnquiryId = pkClientEnquiryId;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
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
