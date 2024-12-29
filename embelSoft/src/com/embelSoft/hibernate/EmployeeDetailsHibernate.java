package com.embelSoft.hibernate;

import java.util.Date;

public class EmployeeDetailsHibernate {
	
	private Long pkEmpId;
	
	private String firstName;
	private String middleName;
	private String lastName;
	private Date dob;
	private String idNumber;
	
	private String designation;
	private Long contactNo;
	private String altContactNo;
	private String emailId;
	private String address;
	
	private String education;
	private String technology;
	private String previousExperience;
	private Double salary;
	private String referenceBy;

	private String interviewedBy;
	private Date dateOfJoining;
	private String prevCompanyName;
	private Long zipCode;
	private String confirmEmail;
	private String placeOfPosting;
	
	private String comment;
	private String employeeCondition;
	private Long adharNumber;
	private String panNumber; 
	private String department;
	
	private String status;
	private String university;
	
	private String currentAddress;
	private String permanentAddress;
	
	
	
	
	
	

	public String getCurrentAddress() {
		return currentAddress;
	}

	public void setCurrentAddress(String currentAddress) {
		this.currentAddress = currentAddress;
	}
	public String getPermanentAddress() {
		return permanentAddress;
	}

	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}

	public EmployeeDetailsHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public String getUniversity() {
		return university;
	}




	public void setUniversity(String university) {
		this.university = university;
	}




	public String getAltContactNo() {
		return altContactNo;
	}



	public void setAltContactNo(String altContactNo) {
		this.altContactNo = altContactNo;
	}



	public EmployeeDetailsHibernate(Long pkEmpId, String firstName, String middleName, String lastName, Date dob,
			String idNumber, String designation, Long contactNo, String altContactNo, String emailId, String address,
			String education, String technology, String previousExperience, Double salary, String referenceBy,
			String interviewedBy, Date dateOfJoining, String prevCompanyName, Long zipCode, String confirmEmail,
			String placeOfPosting, String comment, String employeeCondition, Long adharNumber, String panNumber,
			String department, String permanentAddress, String status) {
		super();
		this.pkEmpId = pkEmpId;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.dob = dob;
		this.idNumber = idNumber;
		this.designation = designation;
		this.contactNo = contactNo;
		this.altContactNo = altContactNo;
		this.emailId = emailId;
		this.address = address;
		this.education = education;
		this.technology = technology;
		this.previousExperience = previousExperience;
		this.salary = salary;
		this.referenceBy = referenceBy;
		this.interviewedBy = interviewedBy;
		this.dateOfJoining = dateOfJoining;
		this.prevCompanyName = prevCompanyName;
		this.zipCode = zipCode;
		this.confirmEmail = confirmEmail;
		this.placeOfPosting = placeOfPosting;
		this.comment = comment;
		this.employeeCondition = employeeCondition;
		this.adharNumber = adharNumber;
		this.panNumber = panNumber;
		this.department = department;
		this.permanentAddress = permanentAddress;
		this.status = status;
	}




	public String getPanNumber() {
		return panNumber;
	}



	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}



	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getAdharNumber() {
		return adharNumber;
	}
	public void setAdharNumber(Long adharNumber) {
		this.adharNumber = adharNumber;
	}
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public Long getPkEmpId() {
		return pkEmpId;
	}
	public void setPkEmpId(Long pkEmpId) {
		this.pkEmpId = pkEmpId;
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
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getTechnology() {
		return technology;
	}
	public void setTechnology(String technology) {
		this.technology = technology;
	}
	public String getPreviousExperience() {
		return previousExperience;
	}
	public void setPreviousExperience(String previousExperience) {
		this.previousExperience = previousExperience;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public String getReferenceBy() {
		return referenceBy;
	}
	public void setReferenceBy(String referenceBy) {
		this.referenceBy = referenceBy;
	}
	public String getInterviewedBy() {
		return interviewedBy;
	}
	public void setInterviewedBy(String interviewedBy) {
		this.interviewedBy = interviewedBy;
	}
	public Date getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(Date dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public String getPrevCompanyName() {
		return prevCompanyName;
	}
	public void setPrevCompanyName(String prevCompanyName) {
		this.prevCompanyName = prevCompanyName;
	}
	public Long getZipCode() {
		return zipCode;
	}
	public void setZipCode(Long zipCode) {
		this.zipCode = zipCode;
	}
	public String getConfirmEmail() {
		return confirmEmail;
	}
	public void setConfirmEmail(String confirmEmail) {
		this.confirmEmail = confirmEmail;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getEmployeeCondition() {
		return employeeCondition;
	}
	public void setEmployeeCondition(String employeeCondition) {
		this.employeeCondition = employeeCondition;
	}

	public String getPlaceOfPosting() {
		return placeOfPosting;
	}

	public void setPlaceOfPosting(String placeOfPosting) {
		this.placeOfPosting = placeOfPosting;
	}
	
	
	

	
}
