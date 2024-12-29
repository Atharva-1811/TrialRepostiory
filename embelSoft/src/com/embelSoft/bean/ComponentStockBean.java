package com.embelSoft.bean;

import java.util.Date;

public class ComponentStockBean {
	
	
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
	private int srNo;
	private Long fkCompoentnameid;
	private Double boardCost;
	private Double oneBoardQty;
	private Double unitPrice;
	private String TolvRating; 
	private String Part_Number;
	private String description;
	
	public Long getFkCompoentnameid() {
		return fkCompoentnameid;
	}
	public void setFkCompoentnameid(Long fkCompoentnameid) {
		this.fkCompoentnameid = fkCompoentnameid;
	}
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
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
	public Double getBoardCost() {
		return boardCost;
	}
	public void setBoardCost(Double boardCost) {
		this.boardCost = boardCost;
	}
	public Double getOneBoardQty() {
		return oneBoardQty;
	}
	public void setOneBoardQty(Double oneBoardQty) {
		this.oneBoardQty = oneBoardQty;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getTolvRating() {
		return TolvRating;
	}
	public void setTolvRating(String tolvRating) {
		TolvRating = tolvRating;
	}
	public String getPart_Number() {
		return Part_Number;
	}
	public void setPart_Number(String part_Number) {
		Part_Number = part_Number;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	

}
