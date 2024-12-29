package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.HrBillingBean;
import com.embelSoft.hibernate.HRBillingHibernate;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.utility.HibernateUtility;

public class HRBillingDao {
	public void valVendorDetails(HRBillingHibernate bean) {

		System.out.println("IN DAO");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");
		} catch (RuntimeException e) {

			try {
				transaction.rollback();
			} catch (RuntimeException e2) {

				Log.error("Error in regEmpPayment", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}
	
	
	public void saveHrBillDetails(HRBillingHibernate bean) {

		System.out.println("IN HR BILLING DAO saveHrBillDetails METHOD");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");
		} catch (RuntimeException e) {

			try {
				transaction.rollback();
			} catch (RuntimeException e2) {

				Log.error("Error in regEmpPayment", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}

	public List getHrBillingList()
	{
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<HrBillingBean> hrList = null;
		
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query = session.createSQLQuery("SELECT vendor_name, date_of_billing, date_of_billing_from, date_of_billing_to, description, quantity, unit_price, amount, sub_total, gst, vat, gross_total, grid_amount, grid_discount_percent, grid_discount_amount, grid_sub_total, grid_gst_percent, grid_gst_percent_amount from hr_billing_details ");
			List<Object[]> list = query.list();
		
			hrList = new ArrayList<HrBillingBean>(0);
			System.out.println("=========================  SIze-----------------"+list.size());
			
			for(Object[] o : list)
			{
				HrBillingBean report = new HrBillingBean();
				
				report.setVendorName(o[0].toString());
				
				String d1 = o[1].toString();
				String[] edate = d1.split("-");
				String DateOfBilling = edate[2]+"-"+edate[1]+"-"+edate[0]; 
				report.setDateOfBilling(DateOfBilling);
			

				String d2 = o[2].toString();
				String[] edate2 = d2.split("-");
				String DateOfBillingFrom = edate2[2]+"-"+edate2[1]+"-"+edate2[0]; 
				report.setDateOfBillingFrom(DateOfBillingFrom);
				

				String d3 = o[3].toString();
				String[] edate3 = d3.split("-");
				String DateOfBillingTo = edate3[2]+"-"+edate3[1]+"-"+edate3[0]; 
				report.setDateOfBillingTo(DateOfBillingTo);
				
				
				report.setDescription(o[4].toString());
				report.setQuantity(Long.parseLong(o[5].toString()));
				report.setBuyPrice(Double.parseDouble(o[6].toString()));
				report.setTotal(Double.parseDouble(o[7].toString()));
				report.setSubTotal(Double.parseDouble(o[8].toString()));
				report.setGst(Double.parseDouble(o[9].toString()));
				report.setVat(Double.parseDouble(o[10].toString()));
				report.setGrossTotal(Double.parseDouble(o[11].toString()));
				report.setGridAmount(Double.parseDouble(o[12].toString()));
				report.setGridDiscountPercent(Double.parseDouble(o[13].toString()));
				report.setGridDiscountAmount(Double.parseDouble(o[14].toString()));
				report.setGridSubTotal(Double.parseDouble(o[15].toString()));
				report.setGridGstPercent(Double.parseDouble(o[16].toString()));
				report.setGridGstPercentAmount(Double.parseDouble(o[17].toString()));				
				
				hrList.add(report);
					
			}

			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("=========================  SIze-----------------"+hrList.size());
		return hrList;
		
	}
	
	public List getVendorBill()
	{		
		
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<HrBillingBean> billList = null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select vendor_name, bill_no from hr_billing_details ORDER BY bill_no DESC LIMIT 1");
			List<Object[]> list = query.list();

		
			
			billList = new ArrayList<HrBillingBean>(0);
			
			for(Object[] o : list)
			{
				HrBillingBean bean = new HrBillingBean();
				
				bean.setVendorName(o[0].toString());
				bean.setBill(o[1].toString());
				
				billList.add(bean);
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return billList;
		
	}
	
	public void saveHrBillDetailsForPO(PurchaseHibernate bean2) 
	{

		System.out.println("IN DAO saveHrBillDetailsForPO Method===============================  for PO  -=========  ");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(bean2);
			transaction.commit();
			System.out.println("Successful");
		} catch (RuntimeException e) {

			try {
				transaction.rollback();
			} catch (RuntimeException e2) {

				Log.error("Error in regEmpPayment", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}
	
	// in jsp
	public List getAllVendorName()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("FROM HRBillingHibernate");
		 list = query.list();
		 
		 System.out.println("Size in DAOAOAOAO  :  "+list.size());
		

		}catch(Exception e){	
			
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);	
		}
		}
		
		 
		return list;
	}
	
	// get all Vendor Payment Report By Date And Name For HrBilling
	public List getVendorHrBillingReportByDateAndName(String fkVendorPaymentId,String vendorName, String startDate, String endDate)
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		List<HrBillingBean> venList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();


		Query query=session.createSQLQuery("select vendor_name, bill_no, date_of_billing,  description, quantity,unit_price, gst, vat, gross_total, grid_amount, grid_discount_percent, grid_discount_amount, grid_sub_total, grid_gst_percent, grid_gst_percent_amount, amount from hr_billing_details WHERE vendor_name='"+vendorName+"' AND date_of_billing BETWEEN '"+startDate+"' AND '"+endDate+"'");
		List<Object[]> list = query.list(); 
		venList= new ArrayList<HrBillingBean>(0);

		int i=0;
		for (Object[] o : list) 
		{
	
			i++;
			HrBillingBean reports = new HrBillingBean();
			
			reports.setVendorName(o[0].toString());
			reports.setBillNo(o[1].toString());
		 reports.setDateOfBilling(o[2].toString()); 
		/*
		 * String d = o[2].toString(); String dt[] = d.split("-"); String
		 * date_of_billing = dt[2]+"-"+dt[1]+"-"+dt[0];
		 * 
		 * reports.setDate(date_of_billing);
		 */
			System.out.println(reports.getDate());
			//reports.setTotal(Double.parseDouble(o[3].toString()));
			reports.setDescription(o[3].toString());
			reports.setQuantity(Long.parseLong(o[4].toString()));
			reports.setBuyPrice(Double.parseDouble(o[5].toString()));
			reports.setGst(Double.parseDouble(o[6].toString()));
			reports.setVat(Double.parseDouble(o[7].toString()));
			reports.setGrossTotal(Double.parseDouble(o[8].toString()));
			reports.setGridAmount(Double.parseDouble(o[9].toString()));
			reports.setGridDiscountPercent(Double.parseDouble(o[10].toString()));
			reports.setGridDiscountAmount(Double.parseDouble(o[11].toString()));
			reports.setGridSubTotal(Double.parseDouble(o[12].toString()));
			reports.setGridGstPercent(Double.parseDouble(o[13].toString()));
			reports.setGridGstPercentAmount(Double.parseDouble(o[14].toString()));
			reports.setTotal(Double.parseDouble(o[15].toString()));
			
			System.out.println(reports.getVendorName());
			System.out.println(reports.getBillNo());
			System.out.println(reports.getDateOfBilling());
			System.out.println(reports.getTotal());
			System.out.println(reports.getDescription());
			System.out.println(reports.getQuantity());
			System.out.println(reports.getBuyPrice());
			System.out.println(reports.getGst());
			System.out.println(reports.getVat());
			System.out.println("gross"+reports.getGrossTotal());
								
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

}
