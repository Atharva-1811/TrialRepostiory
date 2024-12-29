package com.embelSoft.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.embelSoft.dao.EmployeePaymentDao;
import com.embelSoft.dao.PurchaseOrderDao;
import com.embelSoft.hibernate.EmployeePaymentBeanHibernate;
import com.embelSoft.bean.EmployeePaymentDetailBean;
import com.embelSoft.bean.GetEmployeeForCashbook;
import com.embelSoft.bean.PurchaseOrderBean;

import java.util.Date;

public class EmployeePaymentHelper {
	public void regEmployeePayment(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN helper");

		String employeeName = request.getParameter("employeeName");		
		
		String fk_employee_id = request.getParameter("fk_employee_id");
		System.out.println("hi tjis is sonal ++++"+fk_employee_id);
		
		String empPay = request.getParameter("empPay");
		String personName = request.getParameter("personName");
		String reason = request.getParameter("reason");
		String paymentMode = request.getParameter("paymentMode");
		String chequeNum = request.getParameter("chequeNum");
		String cardNum = request.getParameter("cardNum");
		String accNum = request.getParameter("accNum");
		String bankName = request.getParameter("bankName");
		String nameOnCheck = request.getParameter("nameOnCheck");
		String paymentType = request.getParameter("paymentType");
		String TotalAmount = request.getParameter("totalAmounte");
		String BalancePayment = request.getParameter("balanceAmounte");
		
		String month = request.getParameter("month");

		
		
		EmployeePaymentBeanHibernate bean = new EmployeePaymentBeanHibernate();
		
		Double Finalpayment = Double.parseDouble(BalancePayment) - Double.parseDouble(empPay);
		
		System.out.println("Finalpayment == "+Finalpayment);
		
		bean.setTotalAmounte(Double.parseDouble(TotalAmount));
		bean.setBalanceAmounte((Finalpayment));

try {
	
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));

		bean.setInsertDate(dateobj);
		
		if(!"".equals(month)){
			bean.setMonth(month);
		}else{
			bean.setMonth("NA");
		}
		
		if(!"".equals(paymentMode)){
			bean.setPaymentMode(paymentMode);
		}else{
			bean.setPaymentMode("NA");
		}
		
		
		if(!"".equals(employeeName)){
			bean.setEmployeeName(employeeName);
		}else{
			bean.setEmployeeName("NA");
		}
			
		if(!"".equals(fk_employee_id)){
			bean.setFkEmployeeid(Long.parseLong(fk_employee_id));
		}else{
			bean.setFkEmployeeid(Long.parseLong("00"));
		}
		
		if(!"".equals(paymentType)){
			bean.setPaymentType(paymentType);
		}
			
		if(!"".equals(empPay)){
			bean.setCredit(Double.parseDouble(empPay));
		}else{
			bean.setCredit(Double.parseDouble("00"));
		}
		
		if(!"".equals(reason)){
			bean.setReason(reason);
		}else{
			bean.setReason("NA");
		}
			
		if (!"".equals(personName)) {
			bean.setPersonName(personName);
		} else {
			bean.setPersonName("N/A");
		}

		
		if(!"".equals(chequeNum)){
			bean.setChequeNum(chequeNum);
		}else{
			bean.setChequeNum("00");
		}
		
		if(!"".equals(cardNum)){
			bean.setCardNum(Long.parseLong(cardNum));
		}else{
			bean.setCardNum(Long.parseLong("00"));
		}
		
		if(!"".equals(accNum)){
			bean.setAccNum(Long.parseLong(accNum));
		}else{
			bean.setAccNum(Long.parseLong("00"));
		}
		
		if(!"".equals(bankName)){
			bean.setBankName(bankName);
		}else{
			bean.setBankName("NA");
		}
		
		
		if(!"".equals(nameOnCheck)){
		
			bean.setNameOnCheck(nameOnCheck);
		}else{
		
			bean.setNameOnCheck("NA");
		}
		
		
		
		
		
		
		
		
/*		// payment details
		if (paymentMode == null) {
			bean.setPaymentMode("N/A");
		} else {
			bean.setPaymentMode(paymentMode);
		}

		if (paymentMode.equals("cheque")) {

			if (chequeNum == null) {
				bean.setChequeNum("N/A");
			} else {
				bean.setChequeNum(chequeNum);
			}

			if (nameOnCheck == null) {
				bean.setNameOnCheck("N/A");
			} else {
				bean.setNameOnCheck(nameOnCheck);
			}
		} else if (paymentMode.equals("card")) {

			int cardNumLength = cardNum.length();
			if (cardNumLength > 0) {

				bean.setCardNum(Long.parseLong(cardNum));
			} else {
				bean.setCardNum(null);
			}
		}

		else if (paymentMode.equals("neft")) {
			if (bankName == null) {
				bean.setBankName("N/A");
			} else {
				bean.setBankName(bankName);
			}

			int accNumLength = accNum.length();
			if (accNumLength > 0) {
				bean.setAccNum(Long.parseLong(accNum));

			} else {
				bean.setAccNum(null);
			}
		}
*/
		EmployeePaymentDao dao = new EmployeePaymentDao();
		dao.regTeacherPayment(bean);

		
} catch (Exception e) {
	// TODO: handle exception
}

	}

	
// Name and Two Dates
	public List getTeacherPaymentByTwoDateWithName(HttpServletRequest request, HttpServletResponse response) {

		String fDate = request.getParameter("fisDate");
		String tDate = request.getParameter("endDate");
		String employeeName = request.getParameter("employeeName");

		Map<Long, EmployeePaymentDetailBean> map = new HashMap<Long, EmployeePaymentDetailBean>();

		EmployeePaymentDao dao = new EmployeePaymentDao();
		List<EmployeePaymentDetailBean> emp1List = dao.getTeacherPaymentDetailsDateWiseWithName(fDate, tDate, employeeName);

		return emp1List;

	}
	
	
	
	// Get payment all By Employee Details
			public Map getTotalAmtByBillNoEmployee(String fk_teacher_id) 
			{

				EmployeePaymentDao dao = new EmployeePaymentDao();
				List list = dao.getTotalAmtByBillNoEmployee(fk_teacher_id);
				Map map = new HashMap();

				for (int i = 0; i < list.size(); i++) 
				{
					Object[] o = (Object[]) list.get(i);
				
					EmployeePaymentBeanHibernate bean = new EmployeePaymentBeanHibernate();
					
					String newTotal = (o[1].toString());
					Double newTotal1 = Double.valueOf(newTotal);
					
					bean.setBalanceAmount(Double.parseDouble(o[1].toString()));
					bean.setTotal(Double.parseDouble(o[1].toString()));
					
					map.put(bean.getGrossTotal(), bean);
				}
				return map;
			}
			
			
			
			
			//get all Employee Details 
			public Map getRemainingAllBillsforemployee(String supplierId) {

				//System.out.println("bill no = " + billNo);
				System.out.println("supplier = " + supplierId);

				EmployeePaymentDao dao = new EmployeePaymentDao();
				List list = dao.getbalanceAmtByEmployee(supplierId);
				Map map = new HashMap();
				// System.out.println(list.size()+"LIST SIZE");
				int sic = list.size();
				if (sic == 0) {
					/*
					 * GetSupplierDetails bean = new GetSupplierDetails(); Double
					 * totalAmt = dao.getTotalAmt(billNo); bean.setBalance(totalAmt);
					 * map.put(bean.getBalance(),bean);
					 */

					EmployeePaymentDetailBean bean = new EmployeePaymentDetailBean();
					Double totalAmt = dao.getTotalAmtEmployee(supplierId);
					bean.setBalanceamount(totalAmt);
					map.put(bean.getBalanceamount(), bean);
				} else {
					for (int i = 0; i < list.size(); i++) {
						System.out.println("in firsrt for");
						System.out.println("this is i value   " + i + "and list size " + list.size());
						Object[] o = (Object[]) list.get(i);
						GetEmployeeForCashbook bean = new GetEmployeeForCashbook();
						//String str = list.get(i).toString();
						//Double newBal = Double.valueOf(str);
						//System.out.println("new Bal in helper====="+newBal);
						Double balamt  = (Double.parseDouble(o[0].toString()));
						System.out.println("hi thius is ===="+(o[0].toString()));
						Double totalamount = (Double.parseDouble(o[1].toString()));
						System.out.println("hi thius is ===="+(o[1].toString()));

						/*
						 * if (supplier.equals(supplier)) {
						 * System.out.println("hi this is kishor in if "); total =
						 * newBal + totalamount;
						 * 
						 * bean.setBalance(total);
						 * 
						 * 
						 * 
						 * 
						 * } else {
						 */
						System.out.println("hi this is kishor in else   ");

						bean.setBalanceamount(balamt);

						/* } */
					//	System.out.println("***************" + o[0]);
						map.put(bean.getBalanceamount(), bean);
					}
				}

				return map;
			}
	
	
	// Only dates
	
	public List getPaymentByDates(HttpServletRequest request, HttpServletResponse response) {

		String fDate = request.getParameter("fisDate");
		String tDate = request.getParameter("endDate");
	

		Map<Long, EmployeePaymentDetailBean> map = new HashMap<Long, EmployeePaymentDetailBean>();

		EmployeePaymentDao dao = new EmployeePaymentDao();
		List<EmployeePaymentDetailBean> emp1List = dao.getPaymentDetailsDateWise(fDate, tDate);

		return emp1List;

	}
	
	// Get List For Emplpoyee Payment List
	public List getEmployeePaymentList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, EmployeePaymentDetailBean> map = new HashMap<Long, EmployeePaymentDetailBean>();
		EmployeePaymentDao dao = new EmployeePaymentDao();
		List<EmployeePaymentDetailBean> exp1List = dao.getEmployeePaymentList();
		
		return exp1List;
	}
	
	
	

}



