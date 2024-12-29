package com.embelSoft.bean;

public class ProductBillingBean {

	private Long fkVendorPaymentId;
	public Long getFkVendorPaymentId() {
		return fkVendorPaymentId;
	}
	public void setFkVendorPaymentId(Long fkVendorPaymentId) {
		this.fkVendorPaymentId = fkVendorPaymentId;
	}
	private String description;
	private Long quantity;
	private Double buyPrice;
	private Double gridAmount;
	private Double gridDiscountPercent;
	private Double gridDiscountAmount;
	private Double gridSubTotal;
	private Double gridGstPercent;
	private Double gridGstPercentAmount;
	private Double total;
	private String clientName;
	private String dateOfBilling;
	private Double subTotal;
	private Double gst;
	private Double vat1;
	public Double getVat1() {
		return vat1;
	}
	public void setVat1(Double vat1) {
		this.vat1 = vat1;
	}
	private Double gstAmount;
	private Double grossTotal;	
	private String billNo;
	private int srNo;
	private String date;
	private String hsn;
	
	
	public Double getGridAmount() {
		return gridAmount;
	}
	public void setGridAmount(Double gridAmount) {
		this.gridAmount = gridAmount;
	}
	public Double getGridDiscountPercent() {
		return gridDiscountPercent;
	}
	public void setGridDiscountPercent(Double gridDiscountPercent) {
		this.gridDiscountPercent = gridDiscountPercent;
	}
	public Double getGridDiscountAmount() {
		return gridDiscountAmount;
	}
	public void setGridDiscountAmount(Double gridDiscountAmount) {
		this.gridDiscountAmount = gridDiscountAmount;
	}
	public Double getGridSubTotal() {
		return gridSubTotal;
	}
	public void setGridSubTotal(Double gridSubTotal) {
		this.gridSubTotal = gridSubTotal;
	}
	public Double getGridGstPercent() {
		return gridGstPercent;
	}
	public void setGridGstPercent(Double gridGstPercent) {
		this.gridGstPercent = gridGstPercent;
	}
	public Double getGridGstPercentAmount() {
		return gridGstPercentAmount;
	}
	public void setGridGstPercentAmount(Double gridGstPercentAmount) {
		this.gridGstPercentAmount = gridGstPercentAmount;
	}
	public String getHsn() {
		return hsn;
	}
	public void setHsn(String hsn) {
		this.hsn = hsn;
	}
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getDateOfBilling() {
		return dateOfBilling;
	}
	public void setDateOfBilling(String dateOfBilling) {
		this.dateOfBilling = dateOfBilling;
	}
	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
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
	public Double getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}
	
}
