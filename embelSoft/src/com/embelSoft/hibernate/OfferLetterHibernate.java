package com.embelSoft.hibernate;

import java.util.Date;

public class OfferLetterHibernate {
	private Long pkOfferLetterId;
	private Long fk_employee_id;
	private String employeeName;
	private String idNumber;
	private String designation;
	private Double salary;
	private Date dateOfJoining;
	private Long contactNo;
	private Long altContactNo;
	private String place;
	private String emailId;
	private String description1;
	private String description2;
	

	
	
	public OfferLetterHibernate() {
		super();
	}
	public OfferLetterHibernate(Long pkOfferLetterId, Long fk_employee_id, String employeeName, String idNumber,
			String designation, Double salary, Date dateOfJoining, Long contactNo, Long altContactNo, String place,
			String emailId, String description1, String description2) {
		super();
		this.pkOfferLetterId = pkOfferLetterId;
		this.fk_employee_id = fk_employee_id;
		this.employeeName = employeeName;
		this.idNumber = idNumber;
		this.designation = designation;
		this.salary = salary;
		this.dateOfJoining = dateOfJoining;
		this.contactNo = contactNo;
		this.altContactNo = altContactNo;
		this.place = place;
		this.emailId = emailId;
		this.description1 = description1;
		this.description2 = description2;
	}
	public String getDescription1() {
		return description1;
	}
	public void setDescription1(String description1) {
		this.description1 = description1;
	}
	public String getDescription2() {
		return description2;
	}
	public void setDescription2(String description2) {
		this.description2 = description2;
	}
	public Long getPkOfferLetterId() {
		return pkOfferLetterId;
	}
	public void setPkOfferLetterId(Long pkOfferLetterId) {
		this.pkOfferLetterId = pkOfferLetterId;
	}
	public Long getFk_employee_id() {
		return fk_employee_id;
	}
	public void setFk_employee_id(Long fk_employee_id) {
		this.fk_employee_id = fk_employee_id;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
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
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public Date getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(Date dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public Long getContactNo() {
		return contactNo;
	}
	public void setContactNo(Long contactNo) {
		this.contactNo = contactNo;
	}
	public Long getAltContactNo() {
		return altContactNo;
	}
	public void setAltContactNo(Long altContactNo) {
		this.altContactNo = altContactNo;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
	

}
