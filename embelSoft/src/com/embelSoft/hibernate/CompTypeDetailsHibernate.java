package com.embelSoft.hibernate;

import java.util.Date;

public class CompTypeDetailsHibernate {
	
	private int srNo;
	private Long pkCompTypeId;
	private String componentType;
	private Date lastUpdateDate;
	
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public Long getPkCompTypeId() {
		return pkCompTypeId;
	}
	public void setPkCompTypeId(Long pkCompTypeId) {
		this.pkCompTypeId = pkCompTypeId;
	}
	public String getComponentType() {
		return componentType;
	}
	public void setComponentType(String componentType) {
		this.componentType = componentType;
	}
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	
}
