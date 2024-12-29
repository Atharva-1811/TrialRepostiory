package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.GetEmployeeDetailsBean;
import com.embelSoft.bean.GetVendorDetailsBean;
import com.embelSoft.hibernate.VendorDetailsHibernate;
import com.embelSoft.hibernate.VendorPaymentDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class VendorDetailsDao {
	public void valVendorDetail(VendorDetailsHibernate edh){
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
		 
		session.save(edh);
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

	
/*	public List getAllVendorName()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<GetVendorDetailsBean> empList=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT * FROM vendor_details");
		 List<Object[]> list = query.list();
		 System.out.println("*************************************** in Dao :: "+list.size());
		 empList= new ArrayList<GetVendorDetailsBean>(0);
	 
		for (Object[] object : list) 
		{	
			GetVendorDetailsBean vdb = new GetVendorDetailsBean();	
				vdb.setVendorName(object[0].toString());
				
				empList.add(vdb);
				System.out.println(object[0]);
		}
		}catch(Exception e){	
			Log.error("Error in getAllVendorName",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);	
		}
		}
		 System.out.println("*************************************** in Dao ****** :: "+empList.size());
		 
		return empList;
	}*/

	
	// Get Vendor List
	public List getVendorList(){
			
			HibernateUtility hbu=null;
			Session session=null;
			List<GetVendorDetailsBean> empList=null;
		try{	
	
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
	
			Query query=session.createSQLQuery("SELECT vendor_name, date, contact_number, address, email_id,zip_code, country, state,PAN_number,CIM_number, gst_in_number, pk_vendor_details_id, company_address FROM vendor_details");
			List<Object[]> list = query.list();
			System.out.println("list Size:"+list);
	
	
			empList= new ArrayList<GetVendorDetailsBean>(0);
	
	
			int i=0;
		for (Object[] object : list) {
			
			i++;
			GetVendorDetailsBean reports = new GetVendorDetailsBean();
			
			
			reports.setVendorName(object[0].toString());
			
			String d1 = object[1].toString();
			String[] edate = d1.split("-");
			String EnquiryDate = edate[2]+"-"+edate[1]+"-"+edate[0]; 
			reports.setEnquiryDate(EnquiryDate);
			
			reports.setContactNo(Long.parseLong(object[2].toString()));
			reports.setAddress(object[3].toString());
			reports.setEmailId(object[4].toString());
			reports.setZipCode(object[5].toString());
			reports.setCountry(object[6].toString());
			reports.setState(object[7].toString());
			reports.setPANNum(object[8].toString());
			reports.setCIMNo(object[9].toString());
			reports.setGstInNo(object[10].toString());
			reports.setPkVendorDetailsId(Long.parseLong(object[11].toString()));
			reports.setCompanyAddress(object[12].toString());
			reports.setSrNo(i); 
			
			empList.add(reports);
	
		}}catch(RuntimeException e){	
	
		}
		finally{
	
		hbu.closeSession(session);	
		}
		return empList;
		}


//getAllVendorNames
public List getAllVendorNames()
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("FROM VendorDetailsHibernate");
	 list = query.list();
	 
	 System.out.println("Size in DAOAOAOAO  :  "+list.size());
	
	}catch(Exception e){	
		System.out.println("EXCEPTION IN getAllVendorNames FROM VendorDetailsHibernate");
	}
	finally{
		if(session!=null){
			hbu.closeSession(session);	
		}
	}
	return list;
}



public List getAllVendorNames10()
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("FROM VendorDetailsHibernate");
	 list = query.list();
//	 group by vendorName
	 
	 System.out.println("Size in DAOAOAOAO  :  "+list.size());
	
	}catch(Exception e){	
		System.out.println("EXCEPTION IN getAllVendorNames FROM VendorDetailsHibernate");
	}
	finally{
		if(session!=null){
			hbu.closeSession(session);	
		}
	}
	return list;
}


//in jsp for cashbook
public List getAllVendorNamesForCashBook()
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("FROM PurchaseHibernate where type='vendor' and balanceStatus > 0 Group By name");
	 list = query.list(); 

	}catch(Exception e){	
		
	}
	finally{
		if(session!=null){
		hbu.closeSession(session);	
	}
	}
	
	 
	return list;
}


//Get Vendor Name For DropDown
public List getAllVendorName() {

	HibernateUtility hbu = null ;
	Session session = null;
	List list  = null;
	try {
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("select pk_vendor_details_id, vendor_name,gst_in_number from vendor_details");

		list = query.list();

	} catch (Exception e) {
		e.printStackTrace();
	}

	finally
	{
		if (session!=null) {
			hbu.closeSession(session);
		}
	}
	return list;
}

//Vender Names List For Quotation
public List getVenderNamesListForQuotation()
{
	HibernateUtility hbu=null;
	Session session=null;
	
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from VendorDetailsHibernate");
	 list = query.list();
	}catch(Exception e){	
		Log.error("Error in VendorDetailsHibernate",e);
	}
	finally{
		if(session!=null){
		hbu.closeSession(session);
		}
	}
	return list;
}



//get Vendor Details for edit
public List<GetVendorDetailsBean> getVendorDetailForEdit(Long fkVendorid) 
{

	System.out.println(fkVendorid + "    -----------   fkid In dao");
	//System.out.println(employeeName + "     --------   Name In dao");
	HibernateUtility hbu = null;
	Session session = null;
	
	List<GetVendorDetailsBean> venList = null;
	try {
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		//System.out.println("Name "+employeeName);
		Query query2 = session.createSQLQuery("select  date, contact_number, address, alternate_contact_number, emergency_contact_number, company_name, company_address, contact_person_name, company_number, zip_code, email_id, Country, state, pan_number, CIM_number, gst_in_number ,vendor_name from vendor_details where pk_vendor_details_id=:vendorId ");
		query2.setParameter("vendorId", fkVendorid);

		
		List<Object[]> list = query2.list();
		
		venList = new ArrayList<GetVendorDetailsBean>(0);

		System.out.println("Size in DAO   : =====================  : "+list.size());
		
		for (Object[] o : list) {

			GetVendorDetailsBean reports = new GetVendorDetailsBean();

			reports.setEnquiryDate(o[0].toString());
			reports.setContactNo(Long.parseLong(o[1].toString()));
			reports.setAddress(o[2].toString());
			reports.setAlternateContactNo(o[3].toString());
			reports.setEmergencyContactNo(o[4].toString());
			reports.setCompanyName(o[5].toString());
			reports.setCompanyAddress(o[6].toString());
			reports.setContactPersonName(o[7].toString());
			reports.setCompanyNumber(Long.parseLong(o[8].toString()));
			reports.setZipCode(o[9].toString());
			reports.setEmailId(o[10].toString());
			reports.setCountry(o[11].toString());
			reports.setState(o[12].toString());
			reports.setPANNum(o[13].toString());
			reports.setCIMNo(o[14].toString());
			reports.setGstInNo(o[15].toString());
/*			reports.setPermanentAddress(o[16].toString());*/
			reports.setVendorName(o[16].toString());
			
			venList.add(reports);

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return venList;

}


public void getDeleteVendorList(String pkTempId) {

System.out.println("In getRemoveVendorList Dao...");
		
HibernateUtility hbu = null ;
 Session session = null;
 Transaction transaction = null;
 
 try {
	
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 transaction = session.beginTransaction();
	Query query = session.createSQLQuery("delete from vendor_details where pk_vendor_details_id="+pkTempId);
	query.executeUpdate();
	transaction.commit();
	System.out.println("Transaction Successful");
	} 
 catch (Exception e) {
		e.printStackTrace();
	}
				
 finally
 {
	 if (session!=null) {
		hbu.closeSession(session);
	}
 }

}





}