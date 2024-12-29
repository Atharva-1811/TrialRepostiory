package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.EmployeePaymentDetailBean;
import com.embelSoft.bean.VendorPaymentDetailsBean;
import com.embelSoft.hibernate.VendorPaymentDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class VendorPaymentDetailsDao 
{
		
	public void addVendorPaymentDetails(VendorPaymentDetailsHibernate vpdh){
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
		 
		session.save(vpdh);
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

	
	// get all Vendor Payment List
	public List getVendorPaymentList(){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<VendorPaymentDetailsBean> venList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();


		Query query=session.createSQLQuery("select vendor_name, total_amount, balance_amount, paid_amount from vendor_payment_detailas");
		List<Object[]> list = query.list();
	
		venList= new ArrayList<VendorPaymentDetailsBean>(0);

		int i=0;
		for (Object[] o : list) 
		{
	
			i++;
			VendorPaymentDetailsBean reports = new VendorPaymentDetailsBean();
			
			reports.setVendorName(o[0].toString());
			reports.setTotalAmount(Double.parseDouble(o[1].toString()));
			reports.setRemainingAmount(Double.parseDouble(o[2].toString()));
			reports.setPaidAmount(Double.parseDouble(o[3].toString()));
			
			Double remAmt =Double.parseDouble(o[2].toString());
			Double pdAmt =Double.parseDouble(o[3].toString());
			
			Double balAmt = remAmt - pdAmt;
			reports.setBalanceAmount(balAmt);
			
			
			reports.setSrNo(i);
			
			venList.add(reports);
			
		
		}
		}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
		return venList;
		
	}
	
	// get Vendor Name For Report
	public List getAllVendorame() 
	{
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("FROM VendorPaymentDetailsHibernate"); // GROUP BY vendorName
			list = query.list();
		}
		catch (RuntimeException e) 
		{
			Log.error("Error in getAllUnits", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}
	
	public List<VendorPaymentDetailsBean> getVendornameForPaymentReports() {

		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List<VendorPaymentDetailsBean> vlist = new ArrayList<VendorPaymentDetailsBean>();
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createSQLQuery("SELECT DISTINCT fk_vendor_payment_id,vendor_name FROM vendor_payment_detailas"); 
			List<Object[]> list = query.list();
			
			for (Object[] objects : list) {
				VendorPaymentDetailsBean reports = new VendorPaymentDetailsBean();
				reports.setFkVenderId(Long.parseLong(objects[0].toString()));
				reports.setVendorName(objects[1].toString());
				vlist.add(reports);
			}
		}
		catch (RuntimeException e) 
		{
			Log.error("Error in getAllUnits", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return vlist;
	}
	
	
	
			// get all Vendor Payment Report By Date And Name
			public List getVendorReportByDateAndName(String fkVendorPaymentId,String vendorName, String startDate, String endDate)
			{
				
				HibernateUtility hbu=null;
				Session session=null;
				List<VendorPaymentDetailsBean> venList=null;
			try{	
		
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
		
		
				Query query=session.createSQLQuery("select vendor_name, total_amount,balance_amount, paid_amount, insert_date from vendor_payment_detailas WHERE vendor_name='"+vendorName+"' AND fk_vendor_payment_id='"+fkVendorPaymentId+"' AND insert_date BETWEEN '"+startDate+"' AND '"+endDate+"'");
				List<Object[]> list = query.list();
				venList= new ArrayList<VendorPaymentDetailsBean>(0);
	
				int i=0;
				for (Object[] o : list) 
				{
			
					i++;
					VendorPaymentDetailsBean reports = new VendorPaymentDetailsBean();
					
					reports.setVendorName(o[0].toString());
					reports.setTotalAmount(Double.parseDouble(o[1].toString()));
					reports.setRemainingAmount(Double.parseDouble(o[2].toString()));
					reports.setPaidAmount(Double.parseDouble(o[3].toString()));
	
					Double remAmount = Double.parseDouble(o[2].toString());
					Double paidAmount = Double.parseDouble(o[3].toString());
					
					Double balanceAmount = remAmount  - paidAmount;
					reports.setBalanceAmount(balanceAmount);
					
					String d = o[4].toString();
					String dt[] = d.split("-");
					String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
					
					reports.setDate(insertDate);
					reports.setSrNo(i);
					
					venList.add(reports);
				
				}
				}catch(RuntimeException e){	
				
					}
					finally{
				
					hbu.closeSession(session);	
					}
				
				return venList;
				
			}

			
			
			// get all Vendor Payment Report By Date
			public List getVendorReportByDate(String startDate, String endDate)
			{
				
				HibernateUtility hbu=null;
				Session session=null;
				List<VendorPaymentDetailsBean> venList=null;
			try{	
		
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
		
		
				Query query=session.createSQLQuery("select vendor_name, total_amount, balance_amount, paid_amount,insert_date from vendor_payment_detailas WHERE insert_date BETWEEN '"+startDate+"' AND '"+endDate+"'");
				List<Object[]> list = query.list();
			
				venList= new ArrayList<VendorPaymentDetailsBean>(0);
		
				int i=0;
			for (Object[] o : list) 
			{
		
				i++;
				VendorPaymentDetailsBean reports = new VendorPaymentDetailsBean();
				
				reports.setVendorName(o[0].toString());
				reports.setTotalAmount(Double.parseDouble(o[1].toString()));
				reports.setRemainingAmount(Double.parseDouble(o[2].toString()));
				reports.setPaidAmount(Double.parseDouble(o[3].toString()));
				
				Double remAmount = Double.parseDouble(o[2].toString());
				Double paidAmount = Double.parseDouble(o[3].toString());
				
				Double balanceAmount = remAmount - paidAmount;
				reports.setBalanceAmount(balanceAmount);
				
				String d = o[4].toString();
				String dt[] = d.split("-");
				String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];
				
				reports.setDate(insertDate);
				
				
				reports.setSrNo(i);
				
				venList.add(reports);
			
			}
			}catch(RuntimeException e){	
			
				}
				finally{
			
				hbu.closeSession(session);	
				}
			System.out.println("list Size--------------------------------  :  "+venList.size());
			
			return venList;
			}


}
