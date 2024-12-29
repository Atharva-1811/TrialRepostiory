package com.embelSoft.helper;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.AccessControlBean;
import com.embelSoft.bean.EmployeeLeaveBean;
import com.embelSoft.bean.ExpenditureDetailsBean;
import com.embelSoft.bean.UserDetailsBean;
import com.embelSoft.dao.EmployeeDetailsDao;
import com.embelSoft.dao.ExpenditureDetailsDao;
import com.embelSoft.hibernate.EmployeeDetailsHibernate;
import com.embelSoft.hibernate.ExpenditureDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ExpenditureDetailsHelper {

	public void saveExpenseDetails(HttpServletRequest request, HttpServletResponse response)
	{
		String expenseName = request.getParameter("expenseName");
		//System.out.println("Expense Name :- "+expenseName);
		
		ExpenditureDetailsHibernate hibernate = new ExpenditureDetailsHibernate();
		
		hibernate.setExpenseName(expenseName);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date lastUpdateDate = new Date();
		//System.out.println(dateFormat.format(lastUpdateDate));
		hibernate.setLastUpdateDate(lastUpdateDate);
		
		ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
		dao.saveExpenseDetails(hibernate);
	}
	
	public List expenseList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, UserDetailsBean> map = new HashMap<Long, UserDetailsBean>();
		ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
		List<ExpenditureDetailsBean> expenseDetailsList = dao.expenseList();
		//System.out.println("IN HELPER--------------==== :  "+expenseDetailsList.size());
		return expenseDetailsList;
	}
	
	public List getExpenditureForEdit(Long pkExpenseId)
	{		
		//System.out.println("pkExpenseId :- "+pkExpenseId);
		Map<Long, AccessControlBean> map = new HashMap<Long, AccessControlBean>();
		ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
		List<ExpenditureDetailsBean> list = dao.getExpenditureForEdit(pkExpenseId);
		return list;
	}
	
	public void updateExpenditure(HttpServletRequest request,HttpServletResponse response) 
	{
		String pkExpenseId = request.getParameter("pkExpenseId");
		String expenditureName = request.getParameter("expenditureName");
		
		//System.out.println("pkCompTypeId from JSP  :  "+pkExpenseId);
		//System.out.println("componentTypeName from JSP  :  "+expenditureName);
		
		ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
		List compTypeList = dao.getAllExpenditure();
		
		//System.out.println("SIZE FROM DAO   : "+compTypeList.size());
		
		for(int i=0;i<compTypeList.size();i++)
		 {
			ExpenditureDetailsHibernate hibernateOld = (ExpenditureDetailsHibernate) compTypeList.get(i);
			 
			Long pkExpenseIdOldDB = hibernateOld.getPkExpenseId();
			String expenditureNameOldDB = hibernateOld.getExpenseName();
			
			
			 if(pkExpenseIdOldDB.equals(Long.parseLong(pkExpenseId)))
			 {
				 
				 HibernateUtility hbu = HibernateUtility.getInstance();
				 Session session = hbu.getHibernateSession();
				 Transaction transaction = session.beginTransaction();
				 
				 ExpenditureDetailsHibernate hibernate = (ExpenditureDetailsHibernate) session.get(ExpenditureDetailsHibernate.class,new Long(pkExpenseIdOldDB));
				 
				 hibernate.setPkExpenseId(Long.parseLong(pkExpenseId));
				 hibernate.setExpenseName(expenditureName);
				 
				 //lastUpdateDate
				 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Calendar cal = Calendar.getInstance();
					String currentDate =  dateFormat.format(cal.getTime()).toString();
					Date lastUpdateDate = null;
					try{
						lastUpdateDate = dateFormat.parse(currentDate);
						hibernate.setLastUpdateDate(lastUpdateDate);
						//System.out.println(" date compStockLastUpdateDate parsing" +lastUpdateDate);
					}
					catch(Exception e){
						e.printStackTrace();
						System.out.println("Exception in date parsing");
					}
				 
				 session.saveOrUpdate(hibernate);
				 transaction.commit();
				 
				 break;
			 }
		 }		
	}
	

	public List getAllEmployee(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, EmployeeDetailsHibernate> map = new HashMap<Long, EmployeeDetailsHibernate>();
		EmployeeDetailsDao dao = new EmployeeDetailsDao();
		List<EmployeeDetailsHibernate> exp1List = dao.getEmployeeList();
		return exp1List;
	}
	
	
	//List Of Employee Leave
	public List getAllLeaveEmployee(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, EmployeeLeaveBean> map = new HashMap<Long, EmployeeLeaveBean>();
		EmployeeDetailsDao dao = new EmployeeDetailsDao();
		List<EmployeeLeaveBean> exp1List = dao.getEmployeeLeaveList();		
		return exp1List;
	}

	
	
	//List Of Employee Leave Report
	public List getAllLeaveEmployeeByName(HttpServletRequest request, HttpServletResponse response) 
	{
		String empId = request.getParameter("fkEmployeeid");
		String empName = request.getParameter("employeeName");
		
		Map<Long, EmployeeLeaveBean> map = new HashMap<Long, EmployeeLeaveBean>();
		EmployeeDetailsDao dao = new EmployeeDetailsDao();
		List<EmployeeLeaveBean> exp1List = dao.getEmployeeLeaveListByName(empId,empName);
		
		
		return exp1List;
	}

}
