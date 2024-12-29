package com.embelSoft.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.CategorySubcategoryBean;
import com.embelSoft.bean.CompoentCategoryDetailBean;
import com.embelSoft.bean.GetProductDetailsBean;
import com.embelSoft.hibernate.CompTypeDetailsHibernate;
import com.embelSoft.hibernate.ComponentDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ComponentDetailsDao {
	
	public void valComponentDetails(ComponentDetailsHibernate cdh)
	{
		System.out.println("In DAO");
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			System.out.println("got session ");
			transaction = session.beginTransaction();
			System.out.println("Tx started");
			session.save(cdh);
			transaction.commit();
			System.out.println("Successful");
		}
		catch(RuntimeException e)
		{
			try
			{
				transaction.rollback();
			}
			catch(RuntimeException rbe)
			{
				Log.error("Couldn't roll back tranaction",rbe);
			}
		}
		finally
		{
			hbu.closeSession(session);
		}		
	}
	
	// Get Product List
	public List getComponentDtlList()
	{
		System.out.println("In DAO ComponentDetailsDao valComponentDetails Method");
		
		HibernateUtility hbu=null;
		Session session=null;
		List<CompoentCategoryDetailBean> componentDtlListmpList=null;
		
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query=session.createSQLQuery("SELECT compoent_category,compoent_name,manufracture_name,descrption,unit_price,unit_price_customduty FROM compoent_category_details");
			List<Object[]> list = query.list();
			System.out.println("list Size:"+list);
			
			componentDtlListmpList= new ArrayList<CompoentCategoryDetailBean>(0);
			
			int i=0;
			for (Object[] object : list)
			{
				i++;
				CompoentCategoryDetailBean reports = new CompoentCategoryDetailBean();
				reports.setSrNo(i);
				reports.setComponentCategory(object[0].toString());
				reports.setComponentName(object[1].toString());
				reports.setManufractureName(object[2].toString());
				System.out.println("ManufractureName "+object[2].toString());
				reports.setDescription(object[3].toString());
				reports.setUnit(object[4].toString());
				reports.setUnitPriceWithCustomduty(Double.parseDouble(object[5].toString()));
				
				componentDtlListmpList.add(reports);
			}
		}catch(RuntimeException e){
			
		}
		finally{
			hbu.closeSession(session);	
		}
		return componentDtlListmpList;			
	}
	
	// in jsp
	public List getAllProductNames()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("FROM ProductDetailsHibernate");
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
	
	
	
	//get Product Details for edit
	public List<GetProductDetailsBean> getProductDetailForEdit(Long fkProductid) 
	{

		System.out.println(fkProductid + "    -----------   fkid In dao");
		//System.out.println(employeeName + "     --------   Name In dao");
		HibernateUtility hbu = null;
		Session session = null;
		
		List<GetProductDetailsBean> venList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("select  date, cost, description, features, product_Name from product_details where pk_Product_Details_Id=:pkProductDetailsId ");
			query2.setParameter("pkProductDetailsId", fkProductid);

			
			List<Object[]> list = query2.list();
			
			venList = new ArrayList<GetProductDetailsBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {

				GetProductDetailsBean reports = new GetProductDetailsBean();

				
				reports.setProductName(o[4].toString());
				//reports.setClientName(o[0].toString());
				reports.setEnquiryDate(o[0].toString());
				reports.setCost(Long.parseLong(o[1].toString()));
				reports.setDescription(o[2].toString());
				reports.setFeatures(o[3].toString());
				//System.out.println(reports.getClientName());
				System.out.println(reports.getEnquiryDate());
				System.out.println(reports.getCost());
				System.out.println(reports.getDescription());
				System.out.println(reports.getFeatures());
				
				
				venList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return venList;

	}
	
	
	
	//get Product Details for edit
		public List<GetProductDetailsBean> getProductDetailForQuotation(Long fkProductid) 
		{

			System.out.println(fkProductid + "    -----------   fkid In dao");
			//System.out.println(employeeName + "     --------   Name In dao");
			HibernateUtility hbu = null;
			Session session = null;
			
			List<GetProductDetailsBean> venList = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				//System.out.println("Name "+employeeName);
				Query query2 = session.createSQLQuery("select  features from product_details where pk_Product_Details_Id=:pkProductDetailsId ");
				query2.setParameter("pkProductDetailsId", fkProductid);

				
				List<Object[]> list = query2.list();
				
				venList = new ArrayList<GetProductDetailsBean>(0);

				System.out.println("Size in DAO   : =====================  : "+list.size());
				
				for (Object[] o : list) {

					GetProductDetailsBean reports = new GetProductDetailsBean();

					
					
					reports.setFeatures(o[10].toString());
					
					System.out.println("FEATURES:"+reports.getFeatures());
					
					
					venList.add(reports);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return venList;

		}
		
		
		public List<ComponentDetailsHibernate> getComponentDropDown(Long fkCatgoryId) 
		{
			
			HibernateUtility hbu = null;
			Session session = null;
			
			List<ComponentDetailsHibernate> expenseList = null;
			List<ComponentDetailsHibernate> list = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				//System.out.println("Name "+employeeName);
				Query query2 = session.createQuery("From ComponentDetailsHibernate");
				//query2.setParameter("fkEmployeeid", fkCatgoryId);
				//query2.setParameter("employeeName", employeeName);
				
				list = query2.list();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public List<ComponentDetailsHibernate>getCompontDetailsList(Long fkCatgoryId, Long subCategoryId) 
		{
			
			HibernateUtility hbu = null;
			Session session = null;
			
			List<ComponentDetailsHibernate> expenseList = null;
			List<ComponentDetailsHibernate> list = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				//System.out.println("Name "+employeeName);
				Query query2 = session.createQuery("From CompoentCategoryDetailsHibernate");
				//query2.setParameter("fkEmployeeid", fkCatgoryId);
				//query2.setParameter("employeeName", employeeName);
				
				list = query2.list();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	
	

}
