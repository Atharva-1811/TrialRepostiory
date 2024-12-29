package com.embelSoft.hibernate;

import java.util.Date;

public class EmployeeLeaveHibernate 
{
	
	private Long empLeavePkId;
	
	private Long empFkId;
	private String empName;
	private Date leaveDateFrom;
	private Date leaveDateTo;
	private String type;
	private String description;
	private String approvedBy;
	
	

	public Long getEmpLeavePkId() {
		return empLeavePkId;
	}
	public void setEmpLeavePkId(Long empLeavePkId) {
		this.empLeavePkId = empLeavePkId;
	}
	public Long getEmpFkId() {
		return empFkId;
	}
	public void setEmpFkId(Long empFkId) {
		this.empFkId = empFkId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public Date getLeaveDateFrom() {
		return leaveDateFrom;
	}
	public void setLeaveDateFrom(Date leaveDateFrom) {
		this.leaveDateFrom = leaveDateFrom;
	}
	public Date getLeaveDateTo() {
		return leaveDateTo;
	}
	public void setLeaveDateTo(Date leaveDateTo) {
		this.leaveDateTo = leaveDateTo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getApprovedBy() {
		return approvedBy;
	}
	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

}
