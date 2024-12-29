package com.embelSoft.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.EmployeePaymentDetailBean;
import com.embelSoft.bean.ExpenditureDetailsBean;
import com.embelSoft.bean.ExpenditurePaymentBean;
//import com.embelSoft.hibernate.ExpenditurePaymentBean;
import com.embelSoft.hibernate.ExpenditurePaymentHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ExpenditurePaymentDao {
	
	public void addExpensePayment(ExpenditurePaymentHibernate hibernate) {

		System.out.println("In DAO");

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();

			System.out.println("Tx started");

			// for mapping
			Long fkExpDetailId = hibernate.getFkExpDetailId();

			ExpenditurePaymentHibernate expenseDetail = (ExpenditurePaymentHibernate) session.get(ExpenditurePaymentHibernate.class, fkExpDetailId);
			hibernate.setExpenditurePaymentHibernate(expenseDetail);

			session.save(hibernate);
			transaction.commit();
			System.out.println("Successful");
		} catch (RuntimeException e) {
			try {
				transaction.rollback();
			} catch (RuntimeException rbe) {
				Log.error("Couldn't roll back tranaction", rbe);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}
	
	//getExpenditurePaymentList for Expenditure Payment List
	public List getExpenditurePaymentList()
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		List<ExpenditurePaymentBean> expList=null;
		
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query=session.createSQLQuery("SELECT expenditure_details.expense_name, expenditure_payment.service_provider, expenditure_payment.accountant_name, expenditure_payment.total_amount, expenditure_payment.credit, expenditure_payment.debit, expenditure_payment.contact_number, expenditure_payment.insert_date from expenditure_details INNER JOIN expenditure_payment ON expenditure_details.pk_expense_id=expenditure_payment.fk_expense_detail_id");
			//Query query=session.createSQLQuery("SELECT expenditure_details.expense_name, expenditure_details.last_update_date, expenditure_payment.service_provider, expenditure_payment.accountant_name, expenditure_payment.total_amount, expenditure_payment.credit, expenditure_payment.debit, expenditure_payment.contact_number from expenditure_details INNER JOIN expenditure_payment ON expenditure_details.pk_expense_details_id=expenditure_payment.fk_expense_detail_id");
			List<Object[]> list = query.list();
			
			System.out.println("list--------------====================+++++++++++++++++++++++++++ : "+list.size());
			
			
			expList = new ArrayList<ExpenditurePaymentBean>(0);
			
			for(Object[] o : list)
			{
//				expenditure_details.expense_name, expenditure_payment.service_provider, expenditure_payment.accountant_name,
//				expenditure_payment.total_amount, expenditure_payment.credit, expenditure_payment.debit,
//				expenditure_payment.contact_number, expenditure_payment.insert_date
				ExpenditurePaymentBean report = new ExpenditurePaymentBean();
				
				report.setExpenseName(o[0].toString());
				report.setServiceProvider(o[1].toString());
				report.setAccountantName(o[2].toString());
				report.setTotalAmount(Double.parseDouble(o[3].toString()));
				report.setExpCredit(Double.parseDouble(o[4].toString()));
				report.setExpDebit(Double.parseDouble(o[5].toString()));
				report.setContactNumber(Long.parseLong(o[6].toString()));
				report.setInsertDate((Date)o[7]);
				
				expList.add(report);				
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return expList;
		
	}
	
	// Expenditure Report with Two dates
	public List<ExpenditurePaymentBean> getExpensePaymentDetailByTwoDates(String fkRootexpId, String fDate, String tDate) {

		HibernateUtility hbu = null;
		Session session = null;
		
		
		List<ExpenditurePaymentBean> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query2 = session.createSQLQuery("select ed.expense_name, ep.service_provider, ep.accountant_name,  ep.credit, ep.debit, ep.total_amount, ep.insert_date FROM expenditure_payment ep JOIN expenditure_details ed ON ed.pk_expense_id = ep.fk_expense_detail_id  WHERE ep.fk_expense_detail_id=:eId AND ep.insert_date BETWEEN :fDate AND :tDate");
			query2.setParameter("fDate", fDate);
			query2.setParameter("tDate", tDate);
			query2.setParameter("eId", fkRootexpId);
			
			List<Object[]> list = query2.list();
			
			System.out.println("size =================================  :  "+list.size());
			
			expenseList = new ArrayList<ExpenditurePaymentBean>(0);

			int i=0;
			for (Object[] object : list) {

				i++;
				ExpenditurePaymentBean reports = new ExpenditurePaymentBean();

				reports.setExpenseName(object[0].toString());
				reports.setServiceProvider(object[1].toString());
				reports.setAccountantName(object[2].toString());
				reports.setExpCredit(Double.parseDouble(object[3].toString()));
				reports.setExpDebit(Double.parseDouble(object[4].toString()));
				reports.setTotalAmount(Double.parseDouble(object[5].toString()));
				reports.setInsertDate((Date) object[6]);

				reports.setSrNo(i);
				
				expenseList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;

	}

	
	// Expenditure Report with Two dates	
	public List<ExpenditurePaymentBean> getExpensePaymentDetailByDates(String fDate, String tDate) {

	
		HibernateUtility hbu = null;
		Session session = null;
		List<ExpenditurePaymentBean> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query2 = session.createSQLQuery("select ed.expense_name, ep.service_provider, ep.accountant_name,  ep.credit, ep.debit, ep.total_amount,ep.insert_date FROM expenditure_payment ep JOIN expenditure_details ed ON ed.pk_expense_id = ep.fk_expense_detail_id  WHERE ep.insert_date BETWEEN :fDate AND :tDate");
			query2.setParameter("fDate", fDate);
			query2.setParameter("tDate", tDate);
			
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<ExpenditurePaymentBean>(0);

			int i=0;
			for (Object[] object : list) {

				i++;
				ExpenditurePaymentBean reports = new ExpenditurePaymentBean();

//				reports.setExpenseName(object[0].toString());
//				reports.setServiceProviderName(object[1].toString());
//				reports.setAccountantName(object[2].toString());
//				reports.setCredit(Double.parseDouble(object[3].toString()));
//				reports.setDebit(Double.parseDouble(object[4].toString()));
//				reports.setTotalAmount(Double.parseDouble(object[5].toString()));
//				
//				String d1 = object[6].toString();
//				String[] edate = d1.split("-");
//				String InsertDate = edate[2]+"-"+edate[1]+"-"+edate[0]; 
//				reports.setInsertDate(InsertDate);
				
				reports.setExpenseName(object[0].toString());
				reports.setServiceProvider(object[1].toString());
				reports.setAccountantName(object[2].toString());
				reports.setExpCredit(Double.parseDouble(object[3].toString()));
				reports.setExpDebit(Double.parseDouble(object[4].toString()));
				reports.setTotalAmount(Double.parseDouble(object[5].toString()));
				reports.setInsertDate((Date) object[6]);
				
				reports.setSrNo(i);
				
				expenseList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;

	}
	

}
