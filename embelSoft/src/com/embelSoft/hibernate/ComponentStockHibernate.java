package com.embelSoft.hibernate;

import java.util.Date;

public class ComponentStockHibernate {
	
	private Long pkCompStockId;
	private String componentType;
	private Long fkCompTypeId;
	private String componentName;
	private String manufacturarName;
	private String type;
	private String compPackage;
	private String unit;
	private Long quantity;
	private Date compStockLastUpdateDate;
    private Long fkCompoentnameid;
	
	
	
	public Long getFkCompoentnameid() {
		return fkCompoentnameid;
	}
	public void setFkCompoentnameid(Long fkCompoentnameid) {
		this.fkCompoentnameid = fkCompoentnameid;
	}
	public Long getPkCompStockId() {
		return pkCompStockId;
	}
	public void setPkCompStockId(Long pkCompStockId) {
		this.pkCompStockId = pkCompStockId;
	}
	public String getComponentType() {
		return componentType;
	}
	public void setComponentType(String componentType) {
		this.componentType = componentType;
	}
	public Long getFkCompTypeId() {
		return fkCompTypeId;
	}
	public void setFkCompTypeId(Long fkCompTypeId) {
		this.fkCompTypeId = fkCompTypeId;
	}
	public String getComponentName() {
		return componentName;
	}
	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}
	public String getManufacturarName() {
		return manufacturarName;
	}
	public void setManufacturarName(String manufacturarName) {
		this.manufacturarName = manufacturarName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCompPackage() {
		return compPackage;
	}
	public void setCompPackage(String compPackage) {
		this.compPackage = compPackage;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Date getCompStockLastUpdateDate() {
		return compStockLastUpdateDate;
	}
	public void setCompStockLastUpdateDate(Date compStockLastUpdateDate) {
		this.compStockLastUpdateDate = compStockLastUpdateDate;
	}
}
