package com.embelSoft.hibernate;

import java.util.Date;

public class ClientResponseHibernate {
	
	private Long pkClientResponseId;
	private Long fkClientId;
	
	private String clientName;
	private String taskInText;
	
	private Date clientFollowUpDate;
	private String businessName;
	private String contactPersonName;
	private String productName;
	private String clientResponse;
	public Long getPkClientResponseId() {
		return pkClientResponseId;
	}
	public void setPkClientResponseId(Long pkClientResponseId) {
		this.pkClientResponseId = pkClientResponseId;
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
	public String getTaskInText() {
		return taskInText;
	}
	public void setTaskInText(String taskInText) {
		this.taskInText = taskInText;
	}
	public Date getClientFollowUpDate() {
		return clientFollowUpDate;
	}
	public void setClientFollowUpDate(Date clientFollowUpDate) {
		this.clientFollowUpDate = clientFollowUpDate;
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
	
	
	


	
}
