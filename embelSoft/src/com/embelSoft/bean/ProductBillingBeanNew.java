package com.embelSoft.bean;

import java.util.Date;

public class ProductBillingBeanNew  {


	private Double productCost;

	private String features;
	private Long fkTaxTypeId;
	private String taxType;
	private Double taxPercentage;

	private Long pkProductBillId;
	private String billNo;
	private Date billDate;
	private String strBillDate;
	private Long fkClientId;
	private String clientName;
	private Long fkProductId;
	private String productName;
	private String description;
	private String hsnSac;
	private Double unitPrice;
	private Long quantity;
	private Double amount;
	private Double discountPercent;
	private Double discountAmount;
	private Double subTotal;
	private Double CGST;
	private Double SGST;
	private Double IGST;
	private Double taxAmount;
	private Double total;
	private Double totalSubTotal;
	private Double totalTaxAmount;
	private Double grossTotal;
	private int srNo;
	private String GSTNo;
	private String shipAdreess;
	private String curiorName;
	private String TrackingNumber;
    private String address;
    private String curiorNo;
	
	public ProductBillingBeanNew() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductBillingBeanNew(Double productCost, String features, Long fkTaxTypeId, String taxType,
			Double taxPercentage, Long pkProductBillId, String billNo, Date billDate, String strBillDate,
			Long fkClientId, String clientName, Long fkProductId, String productName, String description, String hsnSac,
			Double unitPrice, Long quantity, Double amount, Double discountPercent, Double discountAmount,
			Double subTotal, Double cGST, Double sGST, Double iGST, Double taxAmount, Double total,
			Double totalSubTotal, Double totalTaxAmount, Double grossTotal, int srNo, String gSTNo, String shipAdreess,
			String curiorName, String trackingNumber) {
		super();
		this.productCost = productCost;
		this.features = features;
		this.fkTaxTypeId = fkTaxTypeId;
		this.taxType = taxType;
		this.taxPercentage = taxPercentage;
		this.pkProductBillId = pkProductBillId;
		this.billNo = billNo;
		this.billDate = billDate;
		this.strBillDate = strBillDate;
		this.fkClientId = fkClientId;
		this.clientName = clientName;
		this.fkProductId = fkProductId;
		this.productName = productName;
		this.description = description;
		this.hsnSac = hsnSac;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.amount = amount;
		this.discountPercent = discountPercent;
		this.discountAmount = discountAmount;
		this.subTotal = subTotal;
		CGST = cGST;
		SGST = sGST;
		IGST = iGST;
		this.taxAmount = taxAmount;
		this.total = total;
		this.totalSubTotal = totalSubTotal;
		this.totalTaxAmount = totalTaxAmount;
		this.grossTotal = grossTotal;
		this.srNo = srNo;
		GSTNo = gSTNo;
		this.shipAdreess = shipAdreess;
		this.curiorName = curiorName;
		TrackingNumber = trackingNumber;
	}

	public Double getProductCost() {
		return productCost;
	}

	public void setProductCost(Double productCost) {
		this.productCost = productCost;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

	public Long getFkTaxTypeId() {
		return fkTaxTypeId;
	}

	public void setFkTaxTypeId(Long fkTaxTypeId) {
		this.fkTaxTypeId = fkTaxTypeId;
	}

	public String getTaxType() {
		return taxType;
	}

	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}

	public Double getTaxPercentage() {
		return taxPercentage;
	}

	public void setTaxPercentage(Double taxPercentage) {
		this.taxPercentage = taxPercentage;
	}

	public Long getPkProductBillId() {
		return pkProductBillId;
	}

	public void setPkProductBillId(Long pkProductBillId) {
		this.pkProductBillId = pkProductBillId;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public Date getBillDate() {
		return billDate;
	}

	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}

	public String getStrBillDate() {
		return strBillDate;
	}

	public void setStrBillDate(String strBillDate) {
		this.strBillDate = strBillDate;
	}

	public Long getFkClientId() {
		return fkClientId;
	}

	public void setFkClientId(Long fkClientId) {
		this.fkClientId = fkClientId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public Long getFkProductId() {
		return fkProductId;
	}

	public void setFkProductId(Long fkProductId) {
		this.fkProductId = fkProductId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getHsnSac() {
		return hsnSac;
	}

	public void setHsnSac(String hsnSac) {
		this.hsnSac = hsnSac;
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

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Double getDiscountPercent() {
		return discountPercent;
	}

	public void setDiscountPercent(Double discountPercent) {
		this.discountPercent = discountPercent;
	}

	public Double getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(Double discountAmount) {
		this.discountAmount = discountAmount;
	}

	public Double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
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

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public String getGSTNo() {
		return GSTNo;
	}

	public void setGSTNo(String gSTNo) {
		GSTNo = gSTNo;
	}

	public String getShipAdreess() {
		return shipAdreess;
	}

	public void setShipAdreess(String shipAdreess) {
		this.shipAdreess = shipAdreess;
	}

	public String getCuriorName() {
		return curiorName;
	}

	public void setCuriorName(String curiorName) {
		this.curiorName = curiorName;
	}

	public String getTrackingNumber() {
		return TrackingNumber;
	}

	public void setTrackingNumber(String trackingNumber) {
		TrackingNumber = trackingNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCuriorNo() {
		return curiorNo;
	}
	public void setCuriorNo(String curiorNo) {
		this.curiorNo = curiorNo;
	}
	

	@Override
	public String toString() {
		return "ProductBillingBeanNew [productCost=" + productCost + ", features=" + features + ", fkTaxTypeId="
				+ fkTaxTypeId + ", taxType=" + taxType + ", taxPercentage=" + taxPercentage + ", pkProductBillId="
				+ pkProductBillId + ", billNo=" + billNo + ", billDate=" + billDate + ", strBillDate=" + strBillDate
				+ ", fkClientId=" + fkClientId + ", clientName=" + clientName + ", fkProductId=" + fkProductId
				+ ", productName=" + productName + ", description=" + description + ", hsnSac=" + hsnSac
				+ ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", amount=" + amount + ", discountPercent="
				+ discountPercent + ", discountAmount=" + discountAmount + ", subTotal=" + subTotal + ", CGST=" + CGST
				+ ", SGST=" + SGST + ", IGST=" + IGST + ", taxAmount=" + taxAmount + ", total=" + total
				+ ", totalSubTotal=" + totalSubTotal + ", totalTaxAmount=" + totalTaxAmount + ", grossTotal="
				+ grossTotal + ", srNo=" + srNo + ", GSTNo=" + GSTNo + ", shipAdreess=" + shipAdreess + ", curiorName="
				+ curiorName + ", TrackingNumber=" + TrackingNumber + "]";
	}




}
