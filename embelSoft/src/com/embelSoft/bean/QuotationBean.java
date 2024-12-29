package com.embelSoft.bean;

public class QuotationBean
{
//	private String description;
	private String unit;
//	private Double unitPrice;
//	private Long quantity;
//	private Double total;
	
//	private Double subTotal;
	private Double gst;
	private Double gstAmount;
	private Double totalWithGst;
	private Double discount;
//	private Double discountAmount;
//	private Double grossTotal;
	
	private Long getPkQuotationId;
	private Long fkProductId;
	private String vendorName;
	private String type;
	private String dateOfQuotation;
	private String companyName;
	private String companyAddress;
	private String city;
	private String state;
	private String zip;
	private String phoneNo;
	
	private String quotationNo;
//	private String productName;
	private String features;
	
	private String productName;
	private String description;
	private String hsnSac;
	private Double unitPrice;
	private Long quantity;
	private Double amount;
	private Double discountPercent;
	private Double discountAmount;
	private Double subTotal;
	private Double GST;
	
	private Double CGST;
	private Double SGST;
	
	private Double IGST;
	private Double taxAmount;
	private Double total;
	private Double totalSubTotal;
	private Double totalTaxAmount;
	private Double grossTotal;
	private int srNo;
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Double getGst() {
		return gst;
	}
	public void setGst(Double gst) {
		this.gst = gst;
	}
	public Double getGstAmount() {
		return gstAmount;
	}
	public void setGstAmount(Double gstAmount) {
		this.gstAmount = gstAmount;
	}
	public Double getTotalWithGst() {
		return totalWithGst;
	}
	public void setTotalWithGst(Double totalWithGst) {
		this.totalWithGst = totalWithGst;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Long getGetPkQuotationId() {
		return getPkQuotationId;
	}
	public void setGetPkQuotationId(Long getPkQuotationId) {
		this.getPkQuotationId = getPkQuotationId;
	}
	public Long getFkProductId() {
		return fkProductId;
	}
	public void setFkProductId(Long fkProductId) {
		this.fkProductId = fkProductId;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDateOfQuotation() {
		return dateOfQuotation;
	}
	public void setDateOfQuotation(String dateOfQuotation) {
		this.dateOfQuotation = dateOfQuotation;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getQuotationNo() {
		return quotationNo;
	}
	public void setQuotationNo(String quotationNo) {
		this.quotationNo = quotationNo;
	}
	public String getFeatures() {
		return features;
	}
	public void setFeatures(String features) {
		this.features = features;
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
	public Double getGST() {
		return GST;
	}
	public void setGST(Double gST) {
		GST = gST;
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
}
