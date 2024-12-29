package com.embelSoft.hibernate;

import java.util.Date;

public class ComponentDetailsHibernate {
	
	private Long pkCompDtlId;
	private String componentType;
	private String componentName;
	private Date addingDate;
	private String description;
	private String features;
	//private String addingDate;
	
	public Long getPkCompDtlId() {
		return pkCompDtlId;
	}
	public void setPkCompDtlId(Long pkCompDtlId) {
		this.pkCompDtlId = pkCompDtlId;
	}
	public String getComponentName() {
		return componentName;
	}
	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}
	public Date getAddingDate() {
		return addingDate;
	}
	public void setAddingDate(Date addingDate) {
		this.addingDate = addingDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFeatures() {
		return features;
	}
	public void setFeatures(String features) {
		this.features = features;
	}
}
