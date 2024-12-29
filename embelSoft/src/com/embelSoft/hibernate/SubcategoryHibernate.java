package com.embelSoft.hibernate;

import java.util.Date;

public class SubcategoryHibernate {

	private Long pksubCategoryId;
	private Long fkCategoryId;
	private String componentSubCategory;
	private String status;
	private Date lastUpdateDate;
	
	
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
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public SubcategoryHibernate(Long pksubCategoryId, Long fkCategoryId, String componentSubCategory, String status,
			Date lastUpdateDate) {
		super();
		this.pksubCategoryId = pksubCategoryId;
		this.fkCategoryId = fkCategoryId;
		this.componentSubCategory = componentSubCategory;
		this.status = status;
		this.lastUpdateDate = lastUpdateDate;
	}
	public SubcategoryHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
