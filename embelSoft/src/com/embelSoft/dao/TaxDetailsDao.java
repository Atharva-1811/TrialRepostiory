package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.TaxDetailsBean;
import com.embelSoft.bean.UserDetailsBean;
import com.embelSoft.hibernate.TaxDetailsHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.utility.HibernateUtility;

public class TaxDetailsDao {
	
	public void saveTaxDetails(TaxDetailsHibernate hibernate)
	{
		System.out.println("In DAO");
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 System.out.println("got session ");
		 transaction = session.beginTransaction();
	
		 System.out.println("Tx started");
		 
		session.saveOrUpdate(hibernate);
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
	
	//getLoadAllTaxDetailsEntry to check Tax Entry made in database table or not
	public List getLoadAllTaxDetailsEntry()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from TaxDetailsHibernate");
		 list = query.list();
		}
			catch(Exception e){	
				e.printStackTrace();
		}
			finally
			{
					if(session!=null){
					hbu.closeSession(session);
				}
			}
		
	return list;
	}
	
	
	//getAllUserDetailsList
	public List getTaxDetailsList()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<TaxDetailsBean> taxDetailsList = null;
		
		try
		{	
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT tax_type, tax_percentage, CGST, SGST, last_update_date FROM tax_details");
			List<Object[]> list = query.list();
			System.out.println("list Size:"+list);

			taxDetailsList = new ArrayList<TaxDetailsBean>(0);

			int i=0;
			for (Object[] object : list)
			{
				i++;
				
				TaxDetailsBean reports = new TaxDetailsBean();
				
				reports.setSrNo(i);
				
				reports.setTaxType(object[0].toString());
				reports.setTaxPercentage(Double.parseDouble(object[1].toString()));
				reports.setCGST(Double.parseDouble(object[2].toString()));
				reports.setSGST(Double.parseDouble(object[3].toString()));
				reports.setLastUpdateDate((Date) object[4]);
				
				taxDetailsList.add(reports);
			}
		}catch(RuntimeException e){
			System.out.println(e);
		}
		finally{
			hbu.closeSession(session);	
		}
		return taxDetailsList;
	}
	
	//getTaxDetailsForEdit
	public List<TaxDetailsBean> getTaxDetailsForEdit(Long pkTaxDetailsId) 
	{
		System.out.println("IN DAO METHOD NAME getUserDetailForEdit pkUserId :- "+pkTaxDetailsId);
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<TaxDetailsBean> userList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query = session.createSQLQuery("select tax_type, tax_percentage, CGST, SGST from tax_details where pk_tax_details_id=:PkTaxDetailsId");
			query.setParameter("PkTaxDetailsId", pkTaxDetailsId);
			
			List<Object[]> list = query.list();
			
			userList = new ArrayList<TaxDetailsBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {
				
				//pk_user_id, first_name, last_name, contact_no, address, city, pincode, email_id,
				//user_name, password, re_password, pan_number

				TaxDetailsBean bean = new TaxDetailsBean();
				
				bean.setTaxType(o[0].toString());
				bean.setTaxPercentage(Double.parseDouble(o[1].toString()));
				bean.setCGST(Double.parseDouble(o[2].toString()));
				bean.setSGST(Double.parseDouble(o[3].toString()));
							
				//reports.setAddingDate((Date) o[2]);
				
				userList.add(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	//getAllTaxDetailsForUpdate for pudate in updateTaxDetails Method
	public List getAllTaxDetailsForUpdate()
	{
		System.out.println("IN DAO METHOD getAllTaxDetailsForUpdate");
		
		HibernateUtility hbu=null;
		Session session=null;
		List userList=null;
		
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		
			Query query=session.createQuery("From TaxDetailsHibernate");
			userList = query.list();

		}catch(RuntimeException e){	
			Log.error("Error in TaxDetailsHibernate",e);
		}
		finally{
			hbu.closeSession(session);
		}
		return userList;
	}
	
	//getTaxDetailsForProductRegistation used on ProductDetails.jsp
	public List getTaxDetailsForProductRegistation()
	{
		HibernateUtility hbu=null;
		Session session=null;
		
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from TaxDetailsHibernate");
		 list = query.list();
		}catch(Exception e){
			Log.error("Error in TaxDetailsHibernate",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);
			}
		}
		return list;
	}
	
	// get tax details list for edit
	public List getTaxDetailsForEdit()
	{
		HibernateUtility hbu=null;
		Session session=null;
		
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from TaxDetailsHibernate");
		 list = query.list();
		}catch(Exception e){	
			Log.error("Error in TaxDetailsHibernate",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);
			}
		}
		return list;
	}
	
	public List<TaxDetailsHibernate> getTaxDetailsForBulkUpload(Double taxPercentage)
	{
		System.out.println("IN DAO METHOD getAllTaxDetailsForUpdate");
		
		HibernateUtility hbu=null;
		Session session=null;
		List<TaxDetailsHibernate> userList=null;
		
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		
			Query query=session.createQuery("From TaxDetailsHibernate WHERE taxPercentage="+taxPercentage+"");
			userList = query.list();

		}catch(RuntimeException e){	
			Log.error("Error in TaxDetailsHibernate",e);
		}
		finally{
			hbu.closeSession(session);
		}
		return userList;
	}
	

}
