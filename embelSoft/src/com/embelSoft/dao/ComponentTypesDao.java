package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.CompTypeDetailsBean;
import com.embelSoft.hibernate.CompTypeDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ComponentTypesDao {

	//valComponentTypeDetails
	public void valComponentTypeDetails(CompTypeDetailsHibernate hibernate)
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

	//getCompTypeList to view list
	public List getCompTypeList()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<CompTypeDetailsHibernate> compList=null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT component_type, last_update_date FROM component_type_details Order by pk_comp_type_id DESC");
			List<Object[]> list = query.list();
			System.out.println("IN DAO list Size:"+list);

			compList = new ArrayList<CompTypeDetailsHibernate>(0);

			int i=0;
			for (Object[] object : list)
			{
				i++;
				CompTypeDetailsHibernate hibernate = new CompTypeDetailsHibernate();

				hibernate.setSrNo(i);
				hibernate.setComponentType(object[0].toString());
				hibernate.setLastUpdateDate((Date)(object[1]));

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

	//get Product Details for edit
	public List<CompTypeDetailsBean> getCompTypeDetailsForEdit(Long pkCompTypeId)
	{
		System.out.println(pkCompTypeId + "    -----------   pkCompTypeId In dao");

		HibernateUtility hbu = null;
		Session session = null;

		List<CompTypeDetailsBean> venList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("select pk_comp_type_id, component_type, last_update_date from component_type_details where pk_comp_type_id=:pkComponentTypeId");
			query2.setParameter("pkComponentTypeId", pkCompTypeId);

			List<Object[]> list = query2.list();

			venList = new ArrayList<CompTypeDetailsBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());

			for (Object[] o : list) {

				CompTypeDetailsBean bean = new CompTypeDetailsBean();

				bean.setPkCompTypeId(Long.parseLong(o[0].toString()));
				bean.setComponentType(o[1].toString());
				bean.setLastUpdateDate((Date) o[2]);

				venList.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return venList;
	}
	
	public List<CompTypeDetailsBean> getSubcategoyForEdit(Long pkCompTypeId)
	{
		System.out.println(pkCompTypeId + "    -----------   pkCompTypeId In dao");

		HibernateUtility hbu = null;
		Session session = null;

		List<CompTypeDetailsBean> venList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query2 = session.createSQLQuery("SELECT pk_subcategoryId,sub_categoryname,lastupdatedDate FROM subcategory_details WHERE `status` ='Active' AND pk_subcategoryId ="+pkCompTypeId);
			
			List<Object[]> list = query2.list();

			venList = new ArrayList<CompTypeDetailsBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());

			for (Object[] o : list) {

				CompTypeDetailsBean bean = new CompTypeDetailsBean();

				bean.setPkCompTypeId(Long.parseLong(o[0].toString()));
				bean.setComponentType(o[1].toString());
				bean.setLastUpdateDate((Date) o[2]);

				venList.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return venList;
	}
	

	//getAllComponentTypes Called in EditComponentType.jsp page
	public List getAllComponentTypes()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("FROM CompTypeDetailsHibernate");
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
	
	public List getSubcategory()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("FROM SubcategoryHibernate");
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
	
}
