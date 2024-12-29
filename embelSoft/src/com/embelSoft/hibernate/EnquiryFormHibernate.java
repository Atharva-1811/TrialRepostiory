package com.embelSoft.hibernate;

import java.util.Date;

public class EnquiryFormHibernate {

	private Long pkEnquiryFormId;
	private String prsnName;
	private Date enquiryDate;
	private Date updatedDate;
	private Long contactNo;
	private Long alternativeContactNo;
	private String businessName;
	private String businessAddress;
	private String emailId;
	private String enqrdFor;
	private String description;
	
	private String strEnquiryDate;
	
	private int srNo;
	
	
	public EnquiryFormHibernate() {
		super();
	}


	public EnquiryFormHibernate(Long pkEnquiryFormId, String prsnName, Date enquiryDate, Date updatedDate,
			Long contactNo, Long alternativeContactNo, String businessName, String businessAddress, String emailId,
			String enqrdFor, String description, String strEnquiryDate, int srNo) {
		super();
		this.pkEnquiryFormId = pkEnquiryFormId;
		this.prsnName = prsnName;
		this.enquiryDate = enquiryDate;
		this.updatedDate = updatedDate;
		this.contactNo = contactNo;
		this.alternativeContactNo = alternativeContactNo;
		this.businessName = businessName;
		this.businessAddress = businessAddress;
		this.emailId = emailId;
		this.enqrdFor = enqrdFor;
		this.description = description;
		this.strEnquiryDate = strEnquiryDate;
		this.srNo = srNo;
	}


	public Long getPkEnquiryFormId() {
		return pkEnquiryFormId;
	}


	public void setPkEnquiryFormId(Long pkEnquiryFormId) {
		this.pkEnquiryFormId = pkEnquiryFormId;
	}


	public String getPrsnName() {
		return prsnName;
	}


	public void setPrsnName(String prsnName) {
		this.prsnName = prsnName;
	}


	public Date getEnquiryDate() {
		return enquiryDate;
	}


	public void setEnquiryDate(Date enquiryDate) {
		this.enquiryDate = enquiryDate;
	}


	public Date getUpdatedDate() {
		return updatedDate;
	}


	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}


	public Long getContactNo() {
		return contactNo;
	}


	public void setContactNo(Long contactNo) {
		this.contactNo = contactNo;
	}


	public Long getAlternativeContactNo() {
		return alternativeContactNo;
	}


	public void setAlternativeContactNo(Long alternativeContactNo) {
		this.alternativeContactNo = alternativeContactNo;
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


	public String getEmailId() {
		return emailId;
	}


	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}


	public String getEnqrdFor() {
		return enqrdFor;
	}


	public void setEnqrdFor(String enqrdFor) {
		this.enqrdFor = enqrdFor;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getStrEnquiryDate() {
		return strEnquiryDate;
	}


	public void setStrEnquiryDate(String strEnquiryDate) {
		this.strEnquiryDate = strEnquiryDate;
	}


	public int getSrNo() {
		return srNo;
	}


	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}


	

	
	
	
}
