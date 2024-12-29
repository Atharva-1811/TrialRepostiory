package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.UserDetailsBean;
import com.embelSoft.hibernate.UserDetailasHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.utility.HibernateUtility;

public class UserDetailasDao
{
	public void valUserDetails(UserDetailasHibernate u)
	{
		System.out.println("In DAO");
		
		System.out.println("In DAO------Name"+u.getName());		
				
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 System.out.println("got session ");
		 transaction = session.beginTransaction();
	
		 System.out.println("Tx started");
		 
		session.saveOrUpdate(u);
		System.out.println("oooooooooooooooooo");
		transaction.commit();
		System.out.println("Successful");
		}
		
		catch(RuntimeException e){
			e.printStackTrace();
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				Log.error("Couldn't roll back tranaction",rbe);
			}	
		}finally{
			hbu.closeSession(session);
		}	
	}
	
	public void saveUserDetails(UserDetailasNewHibernate udnh)
	{
		System.out.println("In DAO");
		
		System.out.println("In DAO------Name"+udnh.getFirstName());
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 System.out.println("got session ");
		 transaction = session.beginTransaction();
	
		 System.out.println("Tx started");
		 
		session.saveOrUpdate(udnh);
		transaction.commit();
		
		System.out.println("Successful");
		}
		
		catch(RuntimeException e){
			e.printStackTrace();
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				Log.error("Couldn't roll back tranaction",rbe);
			}	
		}finally{
			hbu.closeSession(session);
		}		
	}
	
	
	public List getAllMainUserDetailsNew()
	{
		HibernateUtility hbu=null;
		Session session=null;
		
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from UserDetailasNewHibernate");
		 list = query.list();
		}catch(Exception e){	
			Log.error("Error in getAllMainUserDetailsNew",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);
			}
		}
		return list;
	}
	
	//getAllUserDetails for Update in Helper in update User Details methods
	public List getAllUserDetailsForUpdate()
	{
		System.out.println("IN DAO METHOD getAllUserDetails");
		
		HibernateUtility hbu=null;
		Session session=null;
		List userList=null;
		
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		
			Query query=session.createQuery("From UserDetailasNewHibernate");
			userList = query.list();

		}catch(RuntimeException e){	
			Log.error("Error in getAllMainUserDetailsNew",e);
		}
		finally{
			hbu.closeSession(session);
		}
		return userList;
	}
	
	//getAllUserDetailsList
	public List getAllUserDetailsList()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<UserDetailsBean> UserDetailsList = null;
		
		try
		{	
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT first_name, last_name, contact_no, address, city, pincode, email_id, user_name, password, re_password, pan_number FROM user_details");
			List<Object[]> list = query.list();
			System.out.println("list Size:"+list);

			UserDetailsList = new ArrayList<UserDetailsBean>(0);

			int i=0;
			for (Object[] object : list)
			{
				i++;
				
				UserDetailsBean reports = new UserDetailsBean();
				
				reports.setSrNo(i);
				
				reports.setFirstName(object[0].toString());
				reports.setLastName(object[1].toString());
				reports.setContactNo(Long.parseLong(object[2].toString()));
				reports.setAddress(object[3].toString());
				reports.setCity(object[4].toString());
				reports.setPincode(Long.parseLong(object[5].toString()));
				reports.setEmailId(object[6].toString());
				reports.setUserName(object[7].toString());
				reports.setPassword(object[8].toString());
				reports.setRePassword(object[9].toString());
				reports.setPanNumber(object[10].toString());
				
				UserDetailsList.add(reports);
			}
		}catch(RuntimeException e){
			System.out.println(e);
		}
		finally{
			hbu.closeSession(session);	
		}
		return UserDetailsList;
	}
	
	//getUserDetailForEdit
	public List<UserDetailsBean> getUserDetailForEdit(Long pkUserId) 
	{
		System.out.println("IN DAO METHOD NAME getUserDetailForEdit pkUserId :- "+pkUserId);
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<UserDetailsBean> userList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query = session.createSQLQuery("select pk_user_id, first_name, last_name, contact_no, address, city, pincode, email_id, user_name, password, re_password, pan_number from user_details where pk_user_id=:pkUserId");
			query.setParameter("pkUserId", pkUserId);
			
			List<Object[]> list = query.list();
			
			userList = new ArrayList<UserDetailsBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {
				
				//pk_user_id, first_name, last_name, contact_no, address, city, pincode, email_id,
				//user_name, password, re_password, pan_number

				UserDetailsBean reports = new UserDetailsBean();
				
				reports.setPkUserId(Long.parseLong(o[0].toString()));
				reports.setFirstName(o[1].toString());
				reports.setLastName(o[2].toString());
				reports.setContactNo(Long.parseLong(o[3].toString()));
				reports.setAddress(o[4].toString());
				reports.setCity(o[5].toString());
				reports.setPincode(Long.parseLong(o[6].toString()));
				reports.setEmailId(o[7].toString());
				reports.setUserName(o[8].toString());
				reports.setPassword(o[9].toString());
				reports.setRePassword(o[10].toString());
				reports.setPanNumber(o[11].toString());
							
				//reports.setAddingDate((Date) o[2]);
				
				userList.add(reports);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
}
