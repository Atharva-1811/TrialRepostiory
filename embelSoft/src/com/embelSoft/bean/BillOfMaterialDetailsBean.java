package com.embelSoft.bean;

import java.util.Date;

public class BillOfMaterialDetailsBean {

	
	private Long pkCompTypeId;
	private String componentType;
	private Double BoardCost;
	private Double unitPrice;
	private Double OneBoardQty;
	private String ComponentName;
	private String TolvRating; 
	
	private int srNo;

	public BillOfMaterialDetailsBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BillOfMaterialDetailsBean(Long pkCompTypeId, String componentType, Double boardCost, Double unitPrice,
			Double oneBoardQty, String componentName, String tolvRating, int srNo) {
		super();
		this.pkCompTypeId = pkCompTypeId;
		this.componentType = componentType;
		BoardCost = boardCost;
		this.unitPrice = unitPrice;
		OneBoardQty = oneBoardQty;
		ComponentName = componentName;
		TolvRating = tolvRating;
		this.srNo = srNo;
	}

	public Long getPkCompTypeId() {
		return pkCompTypeId;
	}

	public void setPkCompTypeId(Long pkCompTypeId) {
		this.pkCompTypeId = pkCompTypeId;
	}

	public String getComponentType() {
		return componentType;
	}

	public void setComponentType(String componentType) {
		this.componentType = componentType;
	}

	public Double getBoardCost() {
		return BoardCost;
	}

	public void setBoardCost(Double boardCost) {
		BoardCost = boardCost;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Double getOneBoardQty() {
		return OneBoardQty;
	}

	public void setOneBoardQty(Double oneBoardQty) {
		OneBoardQty = oneBoardQty;
	}

	public String getComponentName() {
		return ComponentName;
	}

	public void setComponentName(String componentName) {
		ComponentName = componentName;
	}

	public String getTolvRating() {
		return TolvRating;
	}

	public void setTolvRating(String tolvRating) {
		TolvRating = tolvRating;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	
	
	
	
	
	
	
	
	
	
	
}
