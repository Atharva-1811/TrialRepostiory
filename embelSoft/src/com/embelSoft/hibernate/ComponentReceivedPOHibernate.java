package com.embelSoft.hibernate;

import java.util.Date;

public class ComponentReceivedPOHibernate {
	
	private Long pkCompRPOId;
	private String vendorName;
	private Long fkvendorId;
	private String billChallanNo;
	private Date purchaseOrderDate;
	private Date expectPaymentDate;
	private String componentType;
	private Long fkCompTypeId;
	private String componentName;
	private String compValue;
	private String partName;
	private String manufacturarName;
	private String description;
	private String type;
	private String compPackage;
	private String tolerance;
	private String unit;
	private Double unitPrice;
	private Long quantity;	
	private Double subTotal;
	private Double GST;
	private Double IGST;
	private Double taxAmount;
	private Double total;
	private Double totalSubTotal;
	private Double totalTaxAmount;
	private Double grossTotal;
	
	private Long fkCompoentnameid;

	public ComponentReceivedPOHibernate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ComponentReceivedPOHibernate(Long pkCompRPOId, String vendorName, Long fkvendorId, String billChallanNo,
			Date purchaseOrderDate, Date expectPaymentDate, String componentType, Long fkCompTypeId,
			String componentName, String compValue, String partName, String manufacturarName, String description,
			String type, String compPackage, String tolerance, String unit, Double unitPrice, Long quantity,
			Double subTotal, Double gST, Double iGST, Double taxAmount, Double total, Double totalSubTotal,
			Double totalTaxAmount, Double grossTotal, Long fkCompoentnameid) {
		super();
		this.pkCompRPOId = pkCompRPOId;
		this.vendorName = vendorName;
		this.fkvendorId = fkvendorId;
		this.billChallanNo = billChallanNo;
		this.purchaseOrderDate = purchaseOrderDate;
		this.expectPaymentDate = expectPaymentDate;
		this.componentType = componentType;
		this.fkCompTypeId = fkCompTypeId;
		this.componentName = componentName;
		this.compValue = compValue;
		this.partName = partName;
		this.manufacturarName = manufacturarName;
		this.description = description;
		this.type = type;
		this.compPackage = compPackage;
		this.tolerance = tolerance;
		this.unit = unit;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.subTotal = subTotal;
		GST = gST;
		IGST = iGST;
		this.taxAmount = taxAmount;
		this.total = total;
		this.totalSubTotal = totalSubTotal;
		this.totalTaxAmount = totalTaxAmount;
		this.grossTotal = grossTotal;
		this.fkCompoentnameid = fkCompoentnameid;
	}

	public Long getPkCompRPOId() {
		return pkCompRPOId;
	}

	public void setPkCompRPOId(Long pkCompRPOId) {
		this.pkCompRPOId = pkCompRPOId;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public Long getFkvendorId() {
		return fkvendorId;
	}

	public void setFkvendorId(Long fkvendorId) {
		this.fkvendorId = fkvendorId;
	}

	public String getBillChallanNo() {
		return billChallanNo;
	}

	public void setBillChallanNo(String billChallanNo) {
		this.billChallanNo = billChallanNo;
	}

	public Date getPurchaseOrderDate() {
		return purchaseOrderDate;
	}

	public void setPurchaseOrderDate(Date purchaseOrderDate) {
		this.purchaseOrderDate = purchaseOrderDate;
	}

	public Date getExpectPaymentDate() {
		return expectPaymentDate;
	}

	public void setExpectPaymentDate(Date expectPaymentDate) {
		this.expectPaymentDate = expectPaymentDate;
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

	public String getCompValue() {
		return compValue;
	}

	public void setCompValue(String compValue) {
		this.compValue = compValue;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getManufacturarName() {
		return manufacturarName;
	}

	public void setManufacturarName(String manufacturarName) {
		this.manufacturarName = manufacturarName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getTolerance() {
		return tolerance;
	}

	public void setTolerance(String tolerance) {
		this.tolerance = tolerance;
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

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public Double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}

	public Double getGST() {
		return GST;
	}

	public void setGST(Double gST) {
		GST = gST;
	}

	public Double getIGST() {
		return IGST;
	}

	public void setIGST(Double iGST) {
		IGST = iGST;
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

	public Double getTotalSubTotal() {
		return totalSubTotal;
	}

	public void setTotalSubTotal(Double totalSubTotal) {
		this.totalSubTotal = totalSubTotal;
	}

	public Double getTotalTaxAmount() {
		return totalTaxAmount;
	}

	public void setTotalTaxAmount(Double totalTaxAmount) {
		this.totalTaxAmount = totalTaxAmount;
	}

	public Double getGrossTotal() {
		return grossTotal;
	}

	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}

	public Long getFkCompoentnameid() {
		return fkCompoentnameid;
	}

	public void setFkCompoentnameid(Long fkCompoentnameid) {
		this.fkCompoentnameid = fkCompoentnameid;
	}

	@Override
	public String toString() {
		return "ComponentReceivedPOHibernate [pkCompRPOId=" + pkCompRPOId + ", vendorName=" + vendorName
				+ ", fkvendorId=" + fkvendorId + ", billChallanNo=" + billChallanNo + ", purchaseOrderDate="
				+ purchaseOrderDate + ", expectPaymentDate=" + expectPaymentDate + ", componentType=" + componentType
				+ ", fkCompTypeId=" + fkCompTypeId + ", componentName=" + componentName + ", compValue=" + compValue
				+ ", partName=" + partName + ", manufacturarName=" + manufacturarName + ", description=" + description
				+ ", type=" + type + ", compPackage=" + compPackage + ", tolerance=" + tolerance + ", unit=" + unit
				+ ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", subTotal=" + subTotal + ", GST=" + GST
				+ ", IGST=" + IGST + ", taxAmount=" + taxAmount + ", total=" + total + ", totalSubTotal="
				+ totalSubTotal + ", totalTaxAmount=" + totalTaxAmount + ", grossTotal=" + grossTotal
				+ ", fkCompoentnameid=" + fkCompoentnameid + "]";
	}
	
	
	
	
}
