package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.CategorySubcategoryBean;
import com.embelSoft.hibernate.CompTypeDetailsHibernate;
import com.embelSoft.hibernate.SubcategoryHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ComponentSubCategoryDao {
	
	public void valComponentSubCategoryDetails(SubcategoryHibernate hibernate)
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
			session.save(hibernate);
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
	
	public List getCompTypeList()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<CategorySubcategoryBean> compList=null;
		
		try
		{	
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query=session.createSQLQuery("SELECT sc.pk_subcategoryId, sc.sub_categoryname, sc.fk_categoryid, sc.status, sc.lastupdatedDate, ct.pk_comp_type_id, ct.component_type, ct.last_update_date FROM subcategory_details sc INNER JOIN component_type_details ct ON sc.fk_categoryid = ct.pk_comp_type_id");
			List<Object[]> list = query.list();
			//System.out.println("IN DAO list Size:"+list);

			compList = new ArrayList<CategorySubcategoryBean>(0);

			int i=0;
			for (Object[] object : list)
			{
				i++;
				CategorySubcategoryBean hibernate = new CategorySubcategoryBean();
				
				hibernate.setSrNo(i);
				hibernate.setPksubCategoryId(Long.parseLong(object[0].toString()));
				hibernate.setComponentSubCategory(object[1].toString());
				hibernate.setFkCategoryId(Long.parseLong(object[2].toString()));
				hibernate.setStatus(object[3].toString());
				hibernate.setPkCompTypeId(Long.parseLong(object[5].toString()));
				hibernate.setComponentType(object[6].toString());
				
				compList.add(hibernate);
			}
		}catch(RuntimeException e){
			System.out.println(e);
		}
		finally{
			hbu.closeSession(session);	
		}
		return compList;
	}
	
	
	public List<CategorySubcategoryBean> getComponentSubcategoryDropDown(Long fkCatgoryId) 
	{
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<CategorySubcategoryBean> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("Select pk_subcategoryId, sub_categoryname from subcategory_details WHERE fk_categoryid= :fkEmployeeid ");
			query2.setParameter("fkEmployeeid", fkCatgoryId);
			//query2.setParameter("employeeName", employeeName);
			
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<CategorySubcategoryBean>(0);
			
			for (Object[] object : list) 
			{
				CategorySubcategoryBean bean = new CategorySubcategoryBean();
				
				bean.setPksubCategoryId(Long.parseLong(object[0].toString()));
				bean.setComponentSubCategory(object[1].toString());
				//reports.setUserType(object[2].toString());
				
				expenseList.add(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;
	}
	
	
	public List<CategorySubcategoryBean> getComponentSubcategoryDropDownForComponentBilling(Long fkCatgoryId) 
	{
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<CategorySubcategoryBean> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("Select pk_subcategoryId, sub_categoryname from subcategory_details WHERE fk_categoryid= :fkEmployeeid ");
			query2.setParameter("fkEmployeeid", fkCatgoryId);
			//query2.setParameter("employeeName", employeeName);
			
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<CategorySubcategoryBean>(0);
			
			for (Object[] object : list) 
			{
				CategorySubcategoryBean bean = new CategorySubcategoryBean();
				
				bean.setPksubCategoryId(Long.parseLong(object[0].toString()));
				bean.setComponentSubCategory(object[1].toString());
				//reports.setUserType(object[2].toString());
				System.out.println(bean);
				expenseList.add(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;
	}
	
	
	public List<SubcategoryHibernate> getAllCompSubTypeDetails() {
		
		
		
		HibernateUtility hbu=null;
		Session session=null;
		List<SubcategoryHibernate> list= null;
		
		try 
		{
			hbu=HibernateUtility.getInstance();
			session=hbu.getHibernateSession();
			Query query = session.createQuery("from SubcategoryHibernate");
			 list = query.list();
			
				
		} catch (Exception e) 
		{
			Log.error("Error in getAllCompTypeDetails",e);
		}
		finally
		{
			if(session!=null)
			{
			hbu.closeSession(session);	
		}
		
		}
		
		return list;
		
	}

	public List<CategorySubcategoryBean> getSubcategoryForedit(Long subCategoryId) {
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<CategorySubcategoryBean> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query2 = session.createSQLQuery("SELECT pk_subcategoryId, sub_categoryname FROM subcategory_details WHERE pk_subcategoryId = "+subCategoryId);	
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<CategorySubcategoryBean>(0);
			
			for (Object[] object : list) 
			{
				CategorySubcategoryBean bean = new CategorySubcategoryBean();
				
				bean.setPksubCategoryId(Long.parseLong(object[0].toString()));
				bean.setComponentSubCategory(object[1].toString());
				System.out.println(bean);
				expenseList.add(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;
	}
	

}
