package com.embelSoft.hibernate;


public class CompoentCategoryDetailsHibernate {

private Long pkComponentCategoryDetailsId;
private String componentCategory;
private String componentName;
private String componentValue;
private String partNumber;
private String manufractureName;
private String description;
private String componentType;
private String packages;
private String tovRating;
private Double unit;
private Double unitPrice;
private Double taxPercentage;
private Double CGST;
private Double SGST;
private Long fkTaxTypeId;
private Long fkCompTypeId;
private String taxName;
private Double unitPriceWithCustomduty;
private String componentSubCategory;
private Long fksubCategory;

private Double duty;

public CompoentCategoryDetailsHibernate() {
	super();
	// TODO Auto-generated constructor stub
}



public CompoentCategoryDetailsHibernate(Long pkComponentCategoryDetailsId, String componentCategory,
		String componentName, String componentValue, String partNumber, String manufractureName, String description,
		String componentType, String packages, String tovRating, Double unit, Double unitPrice, Double taxPercentage,
		Double cGST, Double sGST, Long fkTaxTypeId, Long fkCompTypeId, String taxName, Double unitPriceWithCustomduty,
		String componentSubCategory, Long fksubCategory, Double duty) {
	super();
	this.pkComponentCategoryDetailsId = pkComponentCategoryDetailsId;
	this.componentCategory = componentCategory;
	this.componentName = componentName;
	this.componentValue = componentValue;
	this.partNumber = partNumber;
	this.manufractureName = manufractureName;
	this.description = description;
	this.componentType = componentType;
	this.packages = packages;
	this.tovRating = tovRating;
	this.unit = unit;
	this.unitPrice = unitPrice;
	this.taxPercentage = taxPercentage;
	CGST = cGST;
	SGST = sGST;
	this.fkTaxTypeId = fkTaxTypeId;
	this.fkCompTypeId = fkCompTypeId;
	this.taxName = taxName;
	this.unitPriceWithCustomduty = unitPriceWithCustomduty;
	this.componentSubCategory = componentSubCategory;
	this.fksubCategory = fksubCategory;
	this.duty = duty;
}



public Long getPkComponentCategoryDetailsId() {
	return pkComponentCategoryDetailsId;
}

public void setPkComponentCategoryDetailsId(Long pkComponentCategoryDetailsId) {
	this.pkComponentCategoryDetailsId = pkComponentCategoryDetailsId;
}

public String getComponentCategory() {
	return componentCategory;
}

public void setComponentCategory(String componentCategory) {
	this.componentCategory = componentCategory;
}

public String getComponentName() {
	return componentName;
}

public void setComponentName(String componentName) {
	this.componentName = componentName;
}

public String getComponentValue() {
	return componentValue;
}

public void setComponentValue(String componentValue) {
	this.componentValue = componentValue;
}

public String getPartNumber() {
	return partNumber;
}

public void setPartNumber(String partNumber) {
	this.partNumber = partNumber;
}

public String getManufractureName() {
	return manufractureName;
}

public void setManufractureName(String manufractureName) {
	this.manufractureName = manufractureName;
}

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public String getComponentType() {
	return componentType;
}

public void setComponentType(String componentType) {
	this.componentType = componentType;
}

public String getPackages() {
	return packages;
}

public void setPackages(String packages) {
	this.packages = packages;
}

public String getTovRating() {
	return tovRating;
}

public void setTovRating(String tovRating) {
	this.tovRating = tovRating;
}

public Double getUnit() {
	return unit;
}

public void setUnit(Double unit) {
	this.unit = unit;
}

public Double getUnitPrice() {
	return unitPrice;
}

public void setUnitPrice(Double unitPrice) {
	this.unitPrice = unitPrice;
}

public Double getTaxPercentage() {
	return taxPercentage;
}

public void setTaxPercentage(Double taxPercentage) {
	this.taxPercentage = taxPercentage;
}

public Double getCGST() {
	return CGST;
}

public void setCGST(Double cGST) {
	CGST = cGST;
}

public Double getSGST() {
	return SGST;
}

public void setSGST(Double sGST) {
	SGST = sGST;
}

public Long getFkTaxTypeId() {
	return fkTaxTypeId;
}

public void setFkTaxTypeId(Long fkTaxTypeId) {
	this.fkTaxTypeId = fkTaxTypeId;
}

public Long getFkCompTypeId() {
	return fkCompTypeId;
}

public void setFkCompTypeId(Long fkCompTypeId) {
	this.fkCompTypeId = fkCompTypeId;
}

public String getTaxName() {
	return taxName;
}

public void setTaxName(String taxName) {
	this.taxName = taxName;
}

public Double getUnitPriceWithCustomduty() {
	return unitPriceWithCustomduty;
}

public void setUnitPriceWithCustomduty(Double unitPriceWithCustomduty) {
	this.unitPriceWithCustomduty = unitPriceWithCustomduty;
}

public Double getDuty() {
	return duty;
}

public void setDuty(Double duty) {
	this.duty = duty;
}
public String getComponentSubCategory() {
	return componentSubCategory;
}

public void setComponentSubCategory(String componentSubCategory) {
	this.componentSubCategory = componentSubCategory;
}

public Long getFksubCategory() {
	return fksubCategory;
}

public void setFksubCategory(Long fksubCategory) {
	this.fksubCategory = fksubCategory;
}

@Override
public String toString() {
	return "CompoentCategoryDetailsHibernate [pkComponentCategoryDetailsId=" + pkComponentCategoryDetailsId
			+ ", componentCategory=" + componentCategory + ", componentName=" + componentName + ", componentValue="
			+ componentValue + ", partNumber=" + partNumber + ", manufractureName=" + manufractureName
			+ ", description=" + description + ", componentType=" + componentType + ", packages=" + packages
			+ ", tovRating=" + tovRating + ", unit=" + unit + ", unitPrice=" + unitPrice + ", taxPercentage="
			+ taxPercentage + ", CGST=" + CGST + ", SGST=" + SGST + ", fkTaxTypeId=" + fkTaxTypeId + ", fkCompTypeId="
			+ fkCompTypeId + ", taxName=" + taxName + ", unitPriceWithCustomduty=" + unitPriceWithCustomduty
			+ ", componentSubCategory=" + componentSubCategory + ", fksubCategory=" + fksubCategory + ", duty=" + duty
			+ "]";
}




}
