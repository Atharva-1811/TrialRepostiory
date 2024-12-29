package com.embelSoft.bean;

public class CompoentCategoryDetailBean {

	
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
	private String unit;
	private Double unitPrice;
	private Double taxPercentage;
	private Double CGST;
	private Double SGST;
	private Long fkTaxTypeId;
	private Long fkCompTypeId;
	private String taxName;
	private Double IGST;
	private Double GST;
	private Double quantity;
	
	private Double subTotal;
	private Double taxAmount;
	private Double total;
	private Double unitPriceWithCustomduty;
	
	private Double duty;
	
	public Double getDuty() {
		return duty;
	}
	public void setDuty(Double duty) {
		this.duty = duty;
	}
	public Double getUnitPriceWithCustomduty() {
		return unitPriceWithCustomduty;
	}
	public void setUnitPriceWithCustomduty(Double unitPriceWithCustomduty) {
		this.unitPriceWithCustomduty = unitPriceWithCustomduty;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}
	public Double getTaxAmount() {
		return taxAmount;
	}
	public void setTaxAmount(Double taxAmount) {
		this.taxAmount = taxAmount;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Double getGST() {
		return GST;
	}
	public void setGST(Double gST) {
		GST = gST;
	}
	private int SrNo;
	
	
	
	public Double getIGST() {
		return IGST;
	}
	public void setIGST(Double iGST) {
		IGST = iGST;
	}
	public int getSrNo() {
		return SrNo;
	}
	public void setSrNo(int srNo) {
		SrNo = srNo;
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
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
	public CompoentCategoryDetailBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
