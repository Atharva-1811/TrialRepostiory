package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.ClientResponseDetailsBean;
import com.embelSoft.bean.ProductBillingBean;
import com.embelSoft.hibernate.ClientResponseHibernate;
import com.embelSoft.utility.HibernateUtility;


import java.time.LocalDateTime;
import java.time.LocalDate;

public class ClientResponseDao {
	public void valClientResponse(ClientResponseHibernate crh){
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
		 
		session.save(crh);
		transaction.commit();
		System.out.println("Successful");
		}
		
		catch(RuntimeException e){
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
	
	
	public List getClientResponseList()
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		List<ClientResponseDetailsBean> clientRes = null;
 		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select client_name, business_name, contact_person_name, product_name, client_response, client_followup_date, task_in_text, pk_client_response_id from client_response_details");
			List<Object[]> list = query.list();
			
			System.out.println("size After Query   LIST-----------======  :  "+list.size());
			
			clientRes = new ArrayList<ClientResponseDetailsBean>(0);
			
			int i=0;
			
			for(Object[] o : list)
			{
				i++;
				ClientResponseDetailsBean report = new ClientResponseDetailsBean();
				
				report.setClientName(o[0].toString());
				report.setBusinessName(o[1].toString());
				report.setContactPersonName(o[2].toString());
				report.setProductName(o[3].toString());
				report.setClientResponse(o[4].toString());
				
				if(!(o[5]==null))
				{

					String d1 = o[5].toString();
					String[] edate = d1.split("-");
					String ClientFollowUpDate = edate[2]+"-"+edate[1]+"-"+edate[0]; 
					
					
					report.setClientFollowUpDate(ClientFollowUpDate);
				}
				else
				{
					report.setClientFollowUpDate("NA");
				}
				
				report.setResponseDetailas(o[6].toString());
				report.setPk_client_response_id(Long.parseLong(o[7].toString()));
				
				report.setSrNo(i);
				
				
				clientRes.add(report);
				
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
 		
 		System.out.println("size LAST-----------======  :  "+clientRes.size());
		
		return clientRes;
		
	}
	
	
	// Client FollowUp Report by Date
	public List getClientResponseFollowUpReportByDate(String firstDate, String lastDate)
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		List<ClientResponseDetailsBean> clientRes = null;
 		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select client_name, business_name, contact_person_name, product_name, client_response, client_followup_date, task_in_text from client_response_details where client_followup_date BETWEEN '"+firstDate+"' AND '"+lastDate+"'");
			List<Object[]> list = query.list();
			
			System.out.println("size After Query   LIST-----------======  :  "+list.size());
			
			clientRes = new ArrayList<ClientResponseDetailsBean>(0);
			
			int i=0;
			
			for(Object[] o : list)
			{
				i++;
				ClientResponseDetailsBean report = new ClientResponseDetailsBean();
				
				report.setClientName(o[0].toString());
				report.setBusinessName(o[1].toString());
				report.setContactPersonName(o[2].toString());
				report.setProductName(o[3].toString());
				report.setClientResponse(o[4].toString());
				
				if(!(o[5]==null))
				{

					String d1 = o[5].toString();
					String[] edate = d1.split("-");
					String ClientFollowUpDate = edate[2]+"-"+edate[1]+"-"+edate[0]; 
					
					
					report.setClientFollowUpDate(ClientFollowUpDate);
				}
				else
				{
					report.setClientFollowUpDate("NA");
				}
				
				report.setResponseDetailas(o[6].toString());
				report.setSrNo(i);
				
				
				clientRes.add(report);
				
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
 		
 		System.out.println("size LAST-----------======  :  "+clientRes.size());
		
		return clientRes;
		
	}
	
	
	// Client Name for follow up Notification
	  public List<ClientResponseDetailsBean> getClientName()
	  {
			HibernateUtility hbu = null;
			Session session = null;
			Transaction transaction = null;
			List<ClientResponseDetailsBean> proList = null;
		  
		  try 
		  {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				transaction = session.beginTransaction();
				
				Query query = session.createSQLQuery("SELECT client_name,business_name FROM client_response_details WHERE client_followup_date = {fn curdate()}");
				List<Object[]> list = query.list();
				
			
				proList = new ArrayList<ClientResponseDetailsBean>(0);
				
				for(Object[] o : list)
				{
					ClientResponseDetailsBean report = new ClientResponseDetailsBean();
					
					report.setClientName(o[0].toString());
					report.setBusinessName(o[1].toString());
			
					proList.add(report);
				}
				
		  }	 
		  
		  catch (Exception e) 
		  {
			// TODO: handle exception
		  }
		  
		return proList;
		  
	  }
	  
	  
		// Get client response follow Up List for today
	    public List getAllClientResponseListForToday()
		{
	    	
			HibernateUtility hbu=null;
			Session session=null;
			Transaction transaction=null;
			List<ClientResponseDetailsBean> clientRes = null;
	 		try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT client_name, business_name, client_followup_date, product_name, task_in_text FROM client_response_details WHERE client_followup_date = {fn curdate()}");
				List<Object[]> list = query.list();
				
/*				System.out.println("size After Query   LIST-----------======  :  "+list.size());
*/				
				clientRes = new ArrayList<ClientResponseDetailsBean>(0);
				
				int i=0;
				
				for(Object[] o : list)
				{
					i++;
					ClientResponseDetailsBean report = new ClientResponseDetailsBean();
					
					report.setClientName(o[0].toString());
					report.setBusinessName(o[1].toString());
					
					if(!(o[2]==null))
					{

						String d1 = o[2].toString();
						String[] edate = d1.split("-");
						String ClientFollowUpDate = edate[2]+"-"+edate[1]+"-"+edate[0]; 
						
						
						report.setClientFollowUpDate(ClientFollowUpDate);
					}
					else
					{
						report.setClientFollowUpDate("NA");
					}
					
					report.setProductName(o[3].toString());
					report.setResponseDetailas(o[4].toString());
					report.setSrNo(i);
					
					
					
					clientRes.add(report);
					
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			return clientRes;
			
		}
	  
	 

}
