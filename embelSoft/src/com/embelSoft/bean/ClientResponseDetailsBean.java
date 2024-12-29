package com.embelSoft.bean;

public class ClientResponseDetailsBean {
	
	private Long pk_client_response_id; 
	private String clientName; 
	private String businessName;
	private String contactPersonName;
	private String productName;
	private String clientResponse;
	private String clientFollowUpDate; 
	private String ResponseDetailas;
	
	private int srNo;

	public ClientResponseDetailsBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getPk_client_response_id() {
		return pk_client_response_id;
	}

	public void setPk_client_response_id(Long pk_client_response_id) {
		this.pk_client_response_id = pk_client_response_id;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getContactPersonName() {
		return contactPersonName;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getClientResponse() {
		return clientResponse;
	}

	public void setClientResponse(String clientResponse) {
		this.clientResponse = clientResponse;
	}

	public String getClientFollowUpDate() {
		return clientFollowUpDate;
	}

	public void setClientFollowUpDate(String clientFollowUpDate) {
		this.clientFollowUpDate = clientFollowUpDate;
	}

	public String getResponseDetailas() {
		return ResponseDetailas;
	}

	public void setResponseDetailas(String responseDetailas) {
		ResponseDetailas = responseDetailas;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	
	
	
	
	
	
	
}
