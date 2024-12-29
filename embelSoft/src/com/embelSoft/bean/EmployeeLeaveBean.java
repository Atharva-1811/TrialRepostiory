package com.embelSoft.bean;

public class EmployeeLeaveBean 
{
	private String employeeName;
	private String leaveDateFrom;
	private String leaveDateTo;
	private String description;
	private String Type;
	private String approvedBy;
	
	
	
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getLeaveDateFrom() {
		return leaveDateFrom;
	}
	public void setLeaveDateFrom(String leaveDateFrom) {
		this.leaveDateFrom = leaveDateFrom;
	}
	public String getLeaveDateTo() {
		return leaveDateTo;
	}
	public void setLeaveDateTo(String leaveDateTo) {
		this.leaveDateTo = leaveDateTo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getApprovedBy() {
		return approvedBy;
	}
	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	
	
	
}
