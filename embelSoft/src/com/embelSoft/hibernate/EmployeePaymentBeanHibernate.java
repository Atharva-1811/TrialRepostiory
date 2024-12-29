package com.embelSoft.hibernate;

import java.io.Serializable;
import java.util.Date;

public class EmployeePaymentBeanHibernate implements Serializable {

		private Date insertDate;
		private Long pkEmployeePaymentId;
		private String personName;
		private Double credit;
		private String employeeName;
		private String reason;
		private Long fkEmployeeid;
		private String chequeNum;
		private Long cardNum;
		private Long accNum;
		private String paymentMode;
		private String nameOnCheck;
		private String bankName;
		private String paymentType;
		private Double total;
		private Double balanceAmount;
		private Double grossTotal;
		private Double balanceAmounte;
		private Double totalAmounte;
		
		private String month;
		
		
		public Double getBalanceAmounte() {
			return balanceAmounte;
		}
		public void setBalanceAmounte(Double balanceAmounte) {
			this.balanceAmounte = balanceAmounte;
		}
		public Double getTotalAmounte() {
			return totalAmounte;
		}
		public void setTotalAmounte(Double totalAmounte) {
			this.totalAmounte = totalAmounte;
		}
		public Double getGrossTotal() {
			return grossTotal;
		}
		public void setGrossTotal(Double grossTotal) {
			this.grossTotal = grossTotal;
		}
		public Double getTotal() {
			return total;
		}
		public void setTotal(Double total) {
			this.total = total;
		}
		public Double getBalanceAmount() {
			return balanceAmount;
		}
		public void setBalanceAmount(Double balanceAmount) {
			this.balanceAmount = balanceAmount;
		}
		public EmployeePaymentBeanHibernate(Date insertDate, Long pkEmployeePaymentId, String personName, Double credit,
				String employeeName, String reason, Long fkEmployeeid, String chequeNum, Long cardNum, Long accNum,
				String paymentMode, String nameOnCheck, String bankName, String paymentType, Double total, Double balanceAmount, Double grossTotal, Double balanceAmounte, Double totalAmounte) {
			super();
			this.insertDate = insertDate;
			this.pkEmployeePaymentId = pkEmployeePaymentId;
			this.personName = personName;
			this.credit = credit;
			this.employeeName = employeeName;
			this.reason = reason;
			this.fkEmployeeid = fkEmployeeid;
			this.chequeNum = chequeNum;
			this.cardNum = cardNum;
			this.accNum = accNum;
			this.paymentMode = paymentMode;
			this.nameOnCheck = nameOnCheck;
			this.bankName = bankName;
			this.paymentType = paymentType;
			this.total = total;
			this.balanceAmount = balanceAmount;
			this.balanceAmounte = balanceAmounte;
			this.totalAmounte = totalAmounte;
			this.grossTotal = grossTotal;
		}
		public EmployeePaymentBeanHibernate() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		
		public String getMonth() {
			return month;
		}
		public void setMonth(String month) {
			this.month = month;
		}
		public Date getInsertDate() {
			return insertDate;
		}
		public void setInsertDate(Date insertDate) {
			this.insertDate = insertDate;
		}
		public Long getPkEmployeePaymentId() {
			return pkEmployeePaymentId;
		}
		public void setPkEmployeePaymentId(Long pkEmployeePaymentId) {
			this.pkEmployeePaymentId = pkEmployeePaymentId;
		}
		public String getPersonName() {
			return personName;
		}
		public void setPersonName(String personName) {
			this.personName = personName;
		}
		public Double getCredit() {
			return credit;
		}
		public void setCredit(Double credit) {
			this.credit = credit;
		}
		public String getEmployeeName() {
			return employeeName;
		}
		public void setEmployeeName(String employeeName) {
			this.employeeName = employeeName;
		}
		public String getReason() {
			return reason;
		}
		public void setReason(String reason) {
			this.reason = reason;
		}
		public Long getFkEmployeeid() {
			return fkEmployeeid;
		}
		public void setFkEmployeeid(Long fkEmployeeid) {
			this.fkEmployeeid = fkEmployeeid;
		}
		public String getChequeNum() {
			return chequeNum;
		}
		public void setChequeNum(String chequeNum) {
			this.chequeNum = chequeNum;
		}
		public Long getCardNum() {
			return cardNum;
		}
		public void setCardNum(Long cardNum) {
			this.cardNum = cardNum;
		}
		public Long getAccNum() {
			return accNum;
		}
		public void setAccNum(Long accNum) {
			this.accNum = accNum;
		}
		public String getPaymentMode() {
			return paymentMode;
		}
		public void setPaymentMode(String paymentMode) {
			this.paymentMode = paymentMode;
		}
		public String getNameOnCheck() {
			return nameOnCheck;
		}
		public void setNameOnCheck(String nameOnCheck) {
			this.nameOnCheck = nameOnCheck;
		}
		public String getBankName() {
			return bankName;
		}
		public void setBankName(String bankName) {
			this.bankName = bankName;
		}
		public String getPaymentType() {
			return paymentType;
		}
		public void setPaymentType(String paymentType) {
			this.paymentType = paymentType;
		}
		
}
