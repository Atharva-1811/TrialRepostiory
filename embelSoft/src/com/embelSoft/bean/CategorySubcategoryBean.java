package com.embelSoft.bean;

import java.util.Date;

public class CategorySubcategoryBean {
	
	private int srNo;
	private Long pkCompTypeId;
	private String componentType;
	private Date lastUpdateDate;
	private Long pksubCategoryId;
	private Long fkCategoryId;
	private String componentSubCategory;
	private String status;
	
	
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
	public Long getPksubCategoryId() {
		return pksubCategoryId;
	}
	public void setPksubCategoryId(Long pksubCategoryId) {
		this.pksubCategoryId = pksubCategoryId;
	}
	public Long getFkCategoryId() {
		return fkCategoryId;
	}
	public void setFkCategoryId(Long fkCategoryId) {
		this.fkCategoryId = fkCategoryId;
	}
	public String getComponentSubCategory() {
		return componentSubCategory;
	}
	public void setComponentSubCategory(String componentSubCategory) {
		this.componentSubCategory = componentSubCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public CategorySubcategoryBean(int srNo, Long pkCompTypeId, String componentType, Date lastUpdateDate,
			Long pksubCategoryId, Long fkCategoryId, String componentSubCategory, String status) {
		super();
		this.srNo = srNo;
		this.pkCompTypeId = pkCompTypeId;
		this.componentType = componentType;
		this.lastUpdateDate = lastUpdateDate;
		this.pksubCategoryId = pksubCategoryId;
		this.fkCategoryId = fkCategoryId;
		this.componentSubCategory = componentSubCategory;
		this.status = status;
	}
	public CategorySubcategoryBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
