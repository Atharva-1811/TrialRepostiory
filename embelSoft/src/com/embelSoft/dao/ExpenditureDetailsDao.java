package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.AccessControlBean;
import com.embelSoft.bean.ExpenditureDetailsBean;
import com.embelSoft.hibernate.ExpenditureDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ExpenditureDetailsDao {

	public void saveExpenseDetails(ExpenditureDetailsHibernate hibernate) {

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();

			System.out.println("Tx started");
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
			hbu.closeSession(session);
		}
	}
	
	public List expenseList()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ExpenditureDetailsBean> expenseDetailsList = null;
		
		try
		{	
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT expense_name, last_update_date FROM expenditure_details");
			List<Object[]> list = query.list();
			System.out.println("list Size:"+list);

			expenseDetailsList = new ArrayList<ExpenditureDetailsBean>(0);

			int i=0;
			for (Object[] o : list)
			{
				i++;
				
				ExpenditureDetailsBean bean = new ExpenditureDetailsBean();
				
				bean.setSrNo(i);
				bean.setExpenseName(o[0].toString());
				bean.setLastUpdateDate((Date) o[1]);
				
				expenseDetailsList.add(bean);
			}
		}catch(RuntimeException e){
			System.out.println(e);
		}
		finally{
			hbu.closeSession(session);	
		}
		return expenseDetailsList;
	}
	
	public List getExpenditureListForEdit()
	{
		HibernateUtility hbu=null;
		Session session=null;
		
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from ExpenditureDetailsHibernate");
		 list = query.list();
		}catch(Exception e){
			Log.error("Error in ExpenditureDetailsHibernate",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);
			}
		}
		return list;
	}
	
	public List<ExpenditureDetailsBean> getExpenditureForEdit(Long pkExpenseId) 
	{
		System.out.println("IN DAO METHOD NAME getExpenditureForEdit pkUserId :- "+pkExpenseId);
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<ExpenditureDetailsBean> userList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query = session.createSQLQuery("select pk_expense_id, expense_name from expenditure_details where pk_expense_id=:pkExpenseId");
			query.setParameter("pkExpenseId", pkExpenseId);
			
			List<Object[]> list = query.list();
			
			userList = new ArrayList<ExpenditureDetailsBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {
				
				ExpenditureDetailsBean bean = new ExpenditureDetailsBean();
				
				bean.setPkExpenseId(Long.parseLong(o[0].toString()));
				bean.setExpenseName(o[1].toString());
				System.out.println("ExpenditureDetailsBean :-"+bean);
				
//				AccessControlBean reports = new AccessControlBean();
//				
//				reports.setPkACUserId(Long.parseLong(o[0].toString()));
//				reports.setName(o[1].toString());
//				reports.setUserName(o[2].toString());
//				reports.setPassword(o[3].toString());
//				reports.setUserType(o[4].toString());
				
				//reports.setAddingDate((Date) o[2]);
				
				userList.add(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	public List getAllExpenditure()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("FROM ExpenditureDetailsHibernate");
			list = query.list();
			
			System.out.println("Size in DAOAOAOAO  :  "+list.size());
		}catch(Exception e){	
			
		}
		finally
		{
			if(session!=null){
				hbu.closeSession(session);	
			}
		}

		return list;
	}	

	public List getAllExpenseName() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("from ExpenditureDetailsHibernate");
			list = query.list();
		} catch (RuntimeException e) {
			Log.error("Error in getAllUnits", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}

	// get All expense Names
	public List getAllExpenseNames() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("from ExpenditureDetailsHibernate");
			list = query.list();
		} catch (RuntimeException e) {
			Log.error("Error in ExpenditureDetailsHibernate", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}
	
	
}
