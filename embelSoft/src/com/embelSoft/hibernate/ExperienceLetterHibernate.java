package com.embelSoft.hibernate;

public class ExperienceLetterHibernate 
{
	private Long pkExpLetterId;
	
	private Long fkEmpId;
	private String employeeName;
	private String designation;
	private String dateOfJoining;
	private String dateOfLeaving;
	public Long getPkExpLetterId() {
		return pkExpLetterId;
	}
	public void setPkExpLetterId(Long pkExpLetterId) {
		this.pkExpLetterId = pkExpLetterId;
	}
	public Long getFkEmpId() {
		return fkEmpId;
	}
	public void setFkEmpId(Long fkEmpId) {
		this.fkEmpId = fkEmpId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public String getDateOfLeaving() {
		return dateOfLeaving;
	}
	public void setDateOfLeaving(String dateOfLeaving) {
		this.dateOfLeaving = dateOfLeaving;
	}
	
	
	

}
