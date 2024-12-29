package com.embelSoft.hibernate;

import java.util.Date;

public class BillOfMaterialHibernate {



	
	private Long pkCompBomId;
	private String componentType;
	private Long fkCompTypeId;
	private String componentName;
	private String ref_Designator;
	private String value;
	private String part_Number;
	private String manufactureName;
	private String description;
	
	private String packages;
	private String tolvRating;
	private Double boardCost;
	private Double unitPrice;
	private Double oneBoardQty;	
	private String remark;
	
	private String projectName;
	
	private String boardName;
	private String vendorName;
	
	private Date lastUpdateDate;
	
	
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public Long getPkCompBomId() {
		return pkCompBomId;
	}
	public void setPkCompBomId(Long pkCompBomId) {
		this.pkCompBomId = pkCompBomId;
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
	public String getRef_Designator() {
		return ref_Designator;
	}
	public void setRef_Designator(String ref_Designator) {
		this.ref_Designator = ref_Designator;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getPart_Number() {
		return part_Number;
	}
	public void setPart_Number(String part_Number) {
		this.part_Number = part_Number;
	}
	public String getmanufactureName() {
		return manufactureName;
	}
	public void setmanufactureName(String manufactureName) {
		this.manufactureName = manufactureName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getPackages() {
		return packages;
	}
	public void setPackages(String packages) {
		this.packages = packages;
	}
	public String getTolvRating() {
		return tolvRating;
	}
	public void setTolvRating(String tolvRating) {
		this.tolvRating = tolvRating;
	}
	public Double getBoardCost() {
		return boardCost;
	}
	public void setBoardCost(Double boardCost) {
		this.boardCost = boardCost;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Double getOneBoardQty() {
		return oneBoardQty;
	}
	public void setOneBoardQty(Double oneBoardQty) {
		this.oneBoardQty = oneBoardQty;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getManufactureName() {
		return manufactureName;
	}
	public void setManufactureName(String manufactureName) {
		this.manufactureName = manufactureName;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	
	
	public String getComponentName() {
		return componentName;
	}
	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}
	
	
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public BillOfMaterialHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
