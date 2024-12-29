package com.embelSoft.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.ComponentReceivedPOBean;
import com.embelSoft.bean.ComponentStockBean;
import com.embelSoft.bean.GetProductDetailsBean;
import com.embelSoft.bean.HrBillingBean;
import com.embelSoft.bean.PurchaseOrderCreateBean;
import com.embelSoft.hibernate.ComponentStockHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ComponentStockDao {
	
	//Dao Method Call With The Help of Helper
	public List getAllLoadComponentStockEntry()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from ComponentStockHibernate");
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
	
	//saveComponentStockDetailas
	public void saveComponentStockDetailas(ComponentStockHibernate csh)
	{
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		System.out.println("got session ");
		transaction = session.beginTransaction();
		
		System.out.println("Tx started");
		 
		session.save(csh);
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
	
	//get All list of purchase order create for report
	public List getComponentStock()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ComponentStockBean> empList=null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query=session.createSQLQuery("SELECT component_type,component_name,manufacturar_name, comp_package,type,  unit, quantity, comp_stock_last_update_date FROM component_stock_dtl");
			List<Object[]> list = query.list();
			
			System.out.println("list Size:"+list);
			
			empList= new ArrayList<ComponentStockBean>(0);

			int i=0;

			for (Object[] o : list)
			{	
				i++;
				
				ComponentStockBean reports = new ComponentStockBean();
				
				reports.setComponentType(o[0].toString());
				reports.setComponentName(o[1].toString());
				reports.setManufacturarName(o[2].toString());
				reports.setCompPackage(o[4].toString());
				reports.setType(o[3].toString());
				reports.setUnit(o[5].toString());
				reports.setQuantity(Long.parseLong(o[6].toString()));
				reports.setCompStockLastUpdateDate((Date) o[7]);
				reports.setSrNo(i);
				
				empList.add(reports);
			}
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			hbu.closeSession(session);
		}
		
		return empList;
	}
	
	//get All list of purchase order create for report
	public List getAllComponentStockReport()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ComponentStockBean> empList=null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query=session.createSQLQuery("SELECT component_type,component_name,manufacturar_name, type, comp_package, unit, quantity, comp_stock_last_update_date FROM component_stock_dtl");
			List<Object[]> list = query.list();
			
			System.out.println("list Size:"+list);
			
			empList= new ArrayList<ComponentStockBean>(0);

			int i=0;

			for (Object[] o : list)
			{	
				i++;
				
				ComponentStockBean reports = new ComponentStockBean();
				
				reports.setComponentType(o[0].toString());
				reports.setComponentName(o[1].toString());
				reports.setManufacturarName(o[2].toString());
				reports.setType(o[3].toString());
				reports.setCompPackage(o[4].toString());
				reports.setUnit(o[5].toString());
				reports.setQuantity(Long.parseLong(o[6].toString()));
				reports.setCompStockLastUpdateDate((Date) o[7]);
				reports.setSrNo(i);
				
				empList.add(reports);
			}
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			hbu.closeSession(session);
		}
		
		return empList;
	}

public List getAllCompTypeDetails1() {
		
		
		
		HibernateUtility hbu=null;
		Session session=null;
		List list= null;
		
		try 
		{
			hbu=HibernateUtility.getInstance();
			session=hbu.getHibernateSession();
			Query query = session.createQuery("from ComponentReceivedPOHibernate GROUP BY component_type");
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



public List getAllCompTypeDetails5() {
	
	HibernateUtility hbu=null;
	Session session=null;
	List list= null;
	
	try 
	{
		hbu=HibernateUtility.getInstance();
		session=hbu.getHibernateSession();
		Query query = session.createQuery("from ComponentStockHibernate");
		 list = query.list();
//		 GROUP BY componentType
			
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

public List<ComponentReceivedPOBean> getCompoentCategoryFromStock() {
	
	HibernateUtility hbu=null;
	Session session=null;
	List<ComponentReceivedPOBean> complist= new ArrayList<ComponentReceivedPOBean>();
	
	try 
	{
		hbu=HibernateUtility.getInstance();
		session=hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT DISTINCT fk_comp_type_id,component_type FROM component_stock_dtl");
		List<Object[]> list = query.list();
		
		for (Object[] objects : list) {
			ComponentReceivedPOBean bean = new ComponentReceivedPOBean();
			bean.setFkCompTypeId(Long.parseLong(objects[0].toString()));
			bean.setComponentType(objects[1].toString());
			complist.add(bean);
		}
			
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
	
	return complist;
	
}

public List getCategoryReportByDateAndName(String CompoentCategory,String fkCompenetId, String fisDate4, String endDate4)
{
	
	
	HibernateUtility hbu=null;
	Session session=null;
	List<ComponentStockBean> empList=null;
	
	try 
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query=session.createSQLQuery("SELECT component_type,component_name,manufacturar_name, type, comp_package, unit, quantity, comp_stock_last_update_date FROM component_stock_dtl WHERE component_type='"+CompoentCategory+"' AND fk_comp_type_id='"+fkCompenetId+"' AND comp_stock_last_update_date BETWEEN '"+fisDate4+"'AND '"+endDate4+"'");
		List<Object[]> list = query.list();
		
		System.out.println("list Size:"+list);
		
		empList= new ArrayList<ComponentStockBean>(0);

		int i=0;

		for (Object[] o : list)
		{	
			i++;
			
			ComponentStockBean reports = new ComponentStockBean();
			
			reports.setComponentType(o[0].toString());
			reports.setComponentName(o[1].toString());
			reports.setManufacturarName(o[2].toString());
			reports.setType(o[3].toString());
			reports.setCompPackage(o[4].toString());
			reports.setUnit(o[5].toString());
			reports.setQuantity(Long.parseLong(o[6].toString()));
			reports.setCompStockLastUpdateDate((Date) o[7]);
			reports.setSrNo(i);
			
			empList.add(reports);
		}
		
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	finally
	{
		hbu.closeSession(session);
	}
	
	return empList;
}

public List getCategoryReportByDateAndName1(String CompoentCategory,String fkCompenetId, String fisDate4, String endDate4,String componentName,String fkCompoentid)
{
	
	
	HibernateUtility hbu=null;
	Session session=null;
	List<ComponentStockBean> empList=null;
	
	try 
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query=session.createSQLQuery("SELECT component_type,component_name,manufacturar_name, type, comp_package, unit, quantity, comp_stock_last_update_date FROM component_stock_dtl WHERE component_type='"+CompoentCategory+"' AND fk_comp_type_id='"+fkCompenetId+"'  AND fk_compoent_name_id='"+componentName+"' and component_name='"+fkCompoentid+"' AND comp_stock_last_update_date BETWEEN '"+fisDate4+"'AND '"+endDate4+"'");
		List<Object[]> list = query.list();
		
		System.out.println("list Size:"+list);
		
		empList= new ArrayList<ComponentStockBean>(0);

		int i=0;

		for (Object[] o : list)
		{	
			i++;
			
			ComponentStockBean reports = new ComponentStockBean();
			
			reports.setComponentType(o[0].toString());
			reports.setComponentName(o[1].toString());
			reports.setManufacturarName(o[2].toString());
			reports.setType(o[3].toString());
			reports.setCompPackage(o[4].toString());
			reports.setUnit(o[5].toString());
			reports.setQuantity(Long.parseLong(o[6].toString()));
			reports.setCompStockLastUpdateDate((Date) o[7]);
			reports.setSrNo(i);
			
			empList.add(reports);
		}
		
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	finally
	{
		hbu.closeSession(session);
	}
	
	return empList;
}

public List getstockrepoertbydates(String fisDate, String endDate)
{
	
	
	HibernateUtility hbu=null;
	Session session=null;
	List<ComponentStockBean> empList=null;
	
	try 
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query=session.createSQLQuery("SELECT component_type,component_name,manufacturar_name, type, comp_package, unit, quantity, comp_stock_last_update_date FROM component_stock_dtl WHERE  comp_stock_last_update_date BETWEEN '"+fisDate+"'AND '"+endDate+"'");
		List<Object[]> list = query.list();
		
		System.out.println("list Size:"+list);
		
		empList= new ArrayList<ComponentStockBean>(0);

		int i=0;

		for (Object[] o : list)
		{	
			i++;
			
			ComponentStockBean reports = new ComponentStockBean();
			
			reports.setComponentType(o[0].toString());
			reports.setComponentName(o[1].toString());
			reports.setManufacturarName(o[2].toString());
			reports.setType(o[3].toString());
			reports.setCompPackage(o[4].toString());
			reports.setUnit(o[5].toString());
			reports.setQuantity(Long.parseLong(o[6].toString()));
			reports.setCompStockLastUpdateDate((Date) o[7]);
			reports.setSrNo(i);
			
			empList.add(reports);
		}
		
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	finally
	{
		hbu.closeSession(session);
	}
	
	return empList;
}

public Map getproductByCatName(String ComponentCategory)
{
	
	
	HibernateUtility hbu=null;
	Session session=null;
	List<ComponentStockBean> catList=null;
	Map map = new HashMap();
	
	try 
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query=session.createSQLQuery("SELECT pk_comp_stock_id, component_name FROM component_stock_dtl WHERE component_type='"+ComponentCategory+"'; ");
		List<Object[]> list = query.list();
		
		System.out.println("list Size:"+list);
		
		catList= new ArrayList<ComponentStockBean>(0);

		int i=0;

		for (Object[] o : list)
		{	
			i++;
			ComponentStockBean reports = new ComponentStockBean();
			
			reports.setFkCompoentnameid(Long.parseLong(o[0].toString()));
			reports.setComponentName(o[1].toString());
			reports.setSrNo(i);
			
			catList.add(reports);
			map.put(i, reports);
		}
		
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	finally
	{
		hbu.closeSession(session);
	}
	
	return map;
}

public List getproductDetailsForGrid(String ComponentName)
{
	
	
	HibernateUtility hbu=null;
	Session session=null;
	List<ComponentStockBean> catList=null;
	Map map = new HashMap();
	
	try 
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query=session.createSQLQuery("SELECT a.pk_comp_stock_id, a.component_type, a.component_name, a.manufacturar_name, a.type, a.comp_package, a.unit, a.quantity, b.part_number, b.packages, b.tov_rating, b.descrption, b.unit_price      \r\n" + 
				"FROM component_stock_dtl a JOIN compoent_category_details b ON a.component_name = b.compoent_name WHERE b.pk_compoent_category_id= "+ComponentName);
		List<Object[]> list = query.list();
		
		System.out.println("list Size:"+list);
		
		catList= new ArrayList<ComponentStockBean>(0);

		int i=0;

		for (Object[] o : list)
		{	
			i++;
			ComponentStockBean reports = new ComponentStockBean();
			
			reports.setFkCompoentnameid(Long.parseLong(o[0].toString()));
			reports.setComponentType(o[1].toString());
			reports.setComponentName(o[2].toString());
			reports.setManufacturarName(o[3].toString());
			reports.setType(o[4].toString());
			reports.setCompPackage(o[5].toString());
			reports.setUnit(o[6].toString());
			reports.setQuantity(Long.parseLong(o[7].toString()));
			reports.setPart_Number(o[8].toString());
			reports.setDescription(o[9].toString());
			reports.setTolvRating(o[10].toString());
			reports.setBoardCost(Double.parseDouble(o[12].toString())*1d);
			reports.setOneBoardQty(1d);
			
			reports.setUnitPrice(Double.parseDouble(o[12].toString()));
			reports.setSrNo(i);
			
			catList.add(reports);
			map.put(i, reports);
			
		}
		
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	finally
	{
		hbu.closeSession(session);
	}
	
	return catList;
}



}
