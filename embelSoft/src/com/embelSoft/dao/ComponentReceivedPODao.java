package com.embelSoft.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.BillOfMaterialBean;
import com.embelSoft.bean.CompoentCategoryDetailBean;
import com.embelSoft.bean.ComponentReceivedPOBean;
import com.embelSoft.hibernate.CompoentCategoryDetailsHibernate;
import com.embelSoft.hibernate.ComponentReceivedPOHibernate;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ComponentReceivedPODao {
	
	//getAllCompTypeDetails
	public List getAllCompTypeDetails()
	{
		HibernateUtility hbu=null;
		Session session=null;
		
		List list=null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from CompTypeDetailsHibernate");
		 list = query.list();
		}catch(Exception e){	
			Log.error("Error in getAllCompTypeDetails",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return list;
	}
	
	
	//Bulk Upload saveCompGoodReceivedDetailas
	public void bulkSaveCompGoodReceivedDetailas(ComponentReceivedPOHibernate bean)
	{
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		transaction = session.beginTransaction();
		session.save(bean);
		transaction.commit();
		//System.out.println("Successful");
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
	
	
	//saveCompGoodReceivedDetailas
	public void saveCompGoodReceivedDetailas(ComponentReceivedPOHibernate hibernate)
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
		 
		session.save(hibernate);
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
	
	//componentReceivedPOList
	public List componentReceivedPOList()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ComponentReceivedPOBean> compList=null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query=session.createSQLQuery("SELECT vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name, comp_value, part_name, manufacturar_name, description, type, comp_package, tolerance, unit, unit_price, quantity, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM component_received_po_details");
			List<Object[]> list = query.list();
			
			//System.out.println("list Size:"+list);
			
			compList= new ArrayList<ComponentReceivedPOBean>(0);
			
			int i=0;
			
			for (Object[] o : list)
			{
				i++;
				
				/*vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name,
				 *  comp_value, part_name, manufacturar_name, description, type, comp_package, unit, unit_price, quantity,
				 *   sub_total, GST, IGST, tax_amount, total, gross_total*/
				
				ComponentReceivedPOBean bean = new ComponentReceivedPOBean();
				
				bean.setVendorName(o[0].toString());
				bean.setBillChallanNo(o[1].toString());
				bean.setPurchaseOrderDate((Date) o[2]);
				bean.setExpectPaymentDate((Date) o[3]);
				bean.setComponentType(o[4].toString());
				bean.setComponentName(o[5].toString());
				bean.setCompValue(o[6].toString());
				bean.setPartName(o[7].toString());
				bean.setManufacturarName(o[8].toString());
				bean.setDescription(o[9].toString());
				bean.setType(o[10].toString());
				bean.setCompPackage(o[11].toString());
				bean.setTolerance((o[12].toString()));
				bean.setUnit(o[13].toString());
				bean.setUnitPrice(Double.parseDouble(o[14].toString()));
				bean.setQuantity(Long.parseLong(o[15].toString()));
				bean.setSubTotal(Double.parseDouble(o[16].toString()));
				bean.setGST(Double.parseDouble(o[17].toString()));
				bean.setIGST(Double.parseDouble(o[18].toString()));
				bean.setTaxAmount(Double.parseDouble(o[19].toString()));
				bean.setTotal(Double.parseDouble(o[20].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[21].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[22].toString()));
				bean.setGrossTotal(Double.parseDouble(o[23].toString()));
				bean.setSrNo(i);
				
				compList.add(bean);
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
		return compList;
	}
	
	//componentReceivedPOReport
	public List componentReceivedPOReport()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ComponentReceivedPOBean> compList=null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query=session.createSQLQuery("SELECT vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name, comp_value, part_name, manufacturar_name, description, type, comp_package, tolerance, unit, unit_price, quantity, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM component_received_po_details");
			List<Object[]> list = query.list();
			
			//System.out.println("list Size:"+list);
			
			compList= new ArrayList<ComponentReceivedPOBean>(0);
			
			int i=0;
			
			for (Object[] o : list)
			{
				i++;
				
				/*vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name,
				 *  comp_value, part_name, manufacturar_name, description, type, comp_package, unit, unit_price, quantity,
				 *   sub_total, GST, IGST, tax_amount, total, gross_total*/
				
				ComponentReceivedPOBean bean = new ComponentReceivedPOBean();
				
				bean.setVendorName(o[0].toString());
				bean.setBillChallanNo(o[1].toString());
				bean.setPurchaseOrderDate((Date) o[2]);
				bean.setExpectPaymentDate((Date) o[3]);
				bean.setComponentType(o[4].toString());
				bean.setComponentName(o[5].toString());
				bean.setCompValue(o[6].toString());
				bean.setPartName(o[7].toString());
				bean.setManufacturarName(o[8].toString());
				bean.setDescription(o[9].toString());
				bean.setType(o[10].toString());
				bean.setCompPackage(o[11].toString());
				bean.setTolerance((o[12].toString()));
				bean.setUnit(o[13].toString());
				bean.setUnitPrice(Double.parseDouble(o[14].toString()));
				bean.setQuantity(Long.parseLong(o[15].toString()));
				bean.setSubTotal(Double.parseDouble(o[16].toString()));
				bean.setGST(Double.parseDouble(o[17].toString()));
				bean.setIGST(Double.parseDouble(o[18].toString()));
				bean.setTaxAmount(Double.parseDouble(o[19].toString()));
				bean.setTotal(Double.parseDouble(o[20].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[21].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[22].toString()));
				bean.setGrossTotal(Double.parseDouble(o[23].toString()));
				bean.setSrNo(i);
				
				compList.add(bean);
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
		return compList;
	}

	
	
	
	public List<CompoentCategoryDetailsHibernate> getCompoenetCategorydata(Long fkEmployeeid) 
	{
		System.out.println(fkEmployeeid + "    -----------   fkid In dao");
		HibernateUtility hbu = null;
		Session session = null;
		
		List<CompoentCategoryDetailsHibernate> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			
			
			Query query2 = session.createSQLQuery("SELECT pk_compoent_category_id,compoent_category,compoent_value,part_number,manufracture_name,descrption,type,packages,tov_rating,unit,unit_price_customduty,tax_percentage,fk_comp_type_id from compoent_category_details WHERE pk_compoent_category_id=  :fkEmployeeid");
			query2.setParameter("fkEmployeeid", fkEmployeeid);
			
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<CompoentCategoryDetailsHibernate>(0);
			
			for (Object[] object : list) 
			{
				CompoentCategoryDetailsHibernate reports = new CompoentCategoryDetailsHibernate();
				reports.setPkComponentCategoryDetailsId(Long.parseLong(object[0].toString()));
				reports.setComponentCategory(object[1].toString());
				reports.setComponentValue(object[2].toString());
				reports.setPartNumber(object[3].toString());
				reports.setManufractureName(object[4].toString());
				reports.setDescription(object[5].toString());
				reports.setComponentType(object[6].toString());
				reports.setPackages(object[7].toString());
				reports.setTovRating(object[8].toString());
				reports.setUnit(Double.parseDouble(object[9].toString()));
				reports.setUnitPriceWithCustomduty(Double.parseDouble(object[10].toString()));
				reports.setTaxPercentage(Double.parseDouble(object[11].toString()));
				System.out.println(reports.getTaxPercentage());
				reports.setFkCompTypeId(Long.parseLong(object[12].toString()));
				
				
				expenseList.add(reports);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;
	}
	public List<CompoentCategoryDetailBean> getcompentCategoryNameForselect1(Long componentType) 
	{

		System.out.println(componentType + "    -----------   Compoenent type id In dao");
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<CompoentCategoryDetailBean> venList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("SELECT fk_compoent_name_id,component_name from component_stock_dtl WHERE fk_comp_type_id= :fkCompTypeId");
			query2.setParameter("fkCompTypeId", componentType);

			
			List<Object[]> list = query2.list();
			
			venList = new ArrayList<CompoentCategoryDetailBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {
				

				
				CompoentCategoryDetailBean bean = new CompoentCategoryDetailBean();
				
				bean.setPkComponentCategoryDetailsId(Long.parseLong(o[0].toString()));
			
				bean.setComponentName(o[1].toString());
				
				
				venList.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return venList;

	}
	
	public List<CompoentCategoryDetailBean> getcompentCategoryNameForselect2(Long componentType) 
	{

		System.out.println(componentType + "    -----------   Compoenent type id In dao");
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<CompoentCategoryDetailBean> venList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("SELECT fk_compoent_name_id,component_name from component_received_po_details WHERE fk_comp_type_id= :fkCompTypeId GROUP BY component_name");
			query2.setParameter("fkCompTypeId", componentType);

			
			List<Object[]> list = query2.list();
			
			venList = new ArrayList<CompoentCategoryDetailBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {
				

				
				CompoentCategoryDetailBean bean = new CompoentCategoryDetailBean();
				
				bean.setPkComponentCategoryDetailsId(Long.parseLong(o[0].toString()));
			
				bean.setComponentName(o[1].toString());
				
				
				venList.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return venList;

	}
	
	
	public List<CompoentCategoryDetailBean> getcompentCategoryNameForselect3(Long componentType) 
	{

		System.out.println(componentType + "    -----------   Compoenent type id In dao");
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<CompoentCategoryDetailBean> venList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("SELECT fk_compoent_name_id,component_name from component_stock_dtl WHERE fk_comp_type_id= :fkCompTypeId GROUP BY component_name");
			query2.setParameter("fkCompTypeId", componentType);

			
			List<Object[]> list = query2.list();
			
			venList = new ArrayList<CompoentCategoryDetailBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {
				

				
				CompoentCategoryDetailBean bean = new CompoentCategoryDetailBean();
				
				bean.setPkComponentCategoryDetailsId(Long.parseLong(o[0].toString()));
			
				bean.setComponentName(o[1].toString());
				
				
				venList.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return venList;

	}
	
	
		
	public List<CompoentCategoryDetailBean> getcompentCategoryNameForselect(Long componentType) 
	{

		System.out.println(componentType + "    -----------   Compoenent type id In dao");
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<CompoentCategoryDetailBean> venList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("SELECT pk_compoent_category_id,compoent_name from compoent_category_details WHERE fk_comp_type_id= :fkCompTypeId");
			query2.setParameter("fkCompTypeId", componentType);

			
			List<Object[]> list = query2.list();
			
			venList = new ArrayList<CompoentCategoryDetailBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {
				

				
				CompoentCategoryDetailBean bean = new CompoentCategoryDetailBean();
				
				bean.setPkComponentCategoryDetailsId(Long.parseLong(o[0].toString()));
			
				bean.setComponentName(o[1].toString());
				
				
				venList.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return venList;

	}
	public List<CompoentCategoryDetailBean> getcompentCategoryNameForselect11(Long componentType,Long pksubCategoryId) 
	{

		System.out.println(componentType + "    -----------   Compoenent type id In dao");
		
		HibernateUtility hbu = null;
		Session session = null;
		
		List<CompoentCategoryDetailBean> venList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query2 = session.createSQLQuery("SELECT pk_compoent_category_id,compoent_name,compoent_value, packages,tov_rating from compoent_category_details WHERE fk_comp_type_id= "+componentType+" AND fksubCategory= "+pksubCategoryId);
		//	query2.setParameter("fkCompTypeId", componentType);

			
			List<Object[]> list = query2.list();
			
			venList = new ArrayList<CompoentCategoryDetailBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {
				

				
				CompoentCategoryDetailBean bean = new CompoentCategoryDetailBean();
				
				bean.setPkComponentCategoryDetailsId(Long.parseLong(o[0].toString()));
			
				bean.setComponentName(o[1].toString());
				
				bean.setComponentValue(o[2].toString());
				bean.setTovRating(o[4].toString());
				bean.setPackages(o[3].toString());
				venList.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return venList;

	}
	
	
	public List getAllVendorName() 
	{
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("FROM ComponentReceivedPOHibernate"); // GROUP BY vendor_name
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
	
	public List<ComponentReceivedPOBean> getVendorName() 
	{
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List<ComponentReceivedPOBean> venlist = new ArrayList<ComponentReceivedPOBean>();
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createSQLQuery("SELECT DISTINCT fk_vendor_id,vendor_name FROM component_received_po_details"); // GROUP BY vendor_name
			List<Object[]>list= query.list();
			
			for (Object[] objects : list) {
				ComponentReceivedPOBean bean = new ComponentReceivedPOBean();
				bean.setFkvendorId(Long.parseLong(objects[0].toString()));
				bean.setVendorName(objects[1].toString());
				venlist.add(bean);
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
		return venlist;

	}
	
	public List getvendorReportByDateAndName(String VendorName,String fkClientId2, String fisDate4, String endDate4)
	{
		
		
		HibernateUtility hbu=null;
		Session session=null;
		List<ComponentReceivedPOBean> compList=null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query=session.createSQLQuery("SELECT vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name, comp_value, part_name, manufacturar_name, description, type, comp_package, tolerance, unit, unit_price, quantity, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM component_received_po_details where vendor_name='"+fkClientId2+"' AND fk_vendor_id='"+VendorName+"' AND purchase_order_date BETWEEN '"+fisDate4+"' AND '"+endDate4+"'");
			List<Object[]> list = query.list();
			
			//System.out.println("list Size:"+list);
			
			compList= new ArrayList<ComponentReceivedPOBean>(0);
			
			int i=0;
			
			for (Object[] o : list)
			{
				i++;
				
				/*vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name,
				 *  comp_value, part_name, manufacturar_name, description, type, comp_package, unit, unit_price, quantity,
				 *   sub_total, GST, IGST, tax_amount, total, gross_total*/
				
				ComponentReceivedPOBean bean = new ComponentReceivedPOBean();
				
				bean.setVendorName(o[0].toString());
				bean.setBillChallanNo(o[1].toString());
				bean.setPurchaseOrderDate((Date) o[2]);
				bean.setExpectPaymentDate((Date) o[3]);
				bean.setComponentType(o[4].toString());
				bean.setComponentName(o[5].toString());
				bean.setCompValue(o[6].toString());
				bean.setPartName(o[7].toString());
				bean.setManufacturarName(o[8].toString());
				bean.setDescription(o[9].toString());
				bean.setType(o[10].toString());
				bean.setCompPackage(o[11].toString());
				bean.setTolerance((o[12].toString()));
				bean.setUnit(o[13].toString());
				bean.setUnitPrice(Double.parseDouble(o[14].toString()));
				bean.setQuantity(Long.parseLong(o[15].toString()));
				bean.setSubTotal(Double.parseDouble(o[16].toString()));
				bean.setGST(Double.parseDouble(o[17].toString()));
				bean.setIGST(Double.parseDouble(o[18].toString()));
				bean.setTaxAmount(Double.parseDouble(o[19].toString()));
				bean.setTotal(Double.parseDouble(o[20].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[21].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[22].toString()));
				bean.setGrossTotal(Double.parseDouble(o[23].toString()));
				bean.setSrNo(i);
				
				compList.add(bean);
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
		return compList;
	}
	
	public List getAllCompTypeDetails1() {
		
		HibernateUtility hbu=null;
		Session session=null;
		List list= null;
		
		try 
		{
			hbu=HibernateUtility.getInstance();
			session=hbu.getHibernateSession();
			Query query = session.createQuery("from ComponentReceivedPOHibernate"); // GROUP BY component_type
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
	
	public List<ComponentReceivedPOBean> getComponentCategoryName() 
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		Query query = null;
		List<ComponentReceivedPOBean> complist= new ArrayList<ComponentReceivedPOBean>();
		
		try 
		{
			hbu=HibernateUtility.getInstance();
			session=hbu.getHibernateSession();
			query = session.createSQLQuery("SELECT DISTINCT fk_comp_type_id,component_type FROM component_received_po_details"); // GROUP BY component_type
			 	
			 List<Object[]>list= query.list();
				
				for (Object[] objects : list) {
					ComponentReceivedPOBean bean = new ComponentReceivedPOBean();
					bean.setFkCompTypeId(Long.parseLong(objects[0].toString()));
					bean.setComponentType(objects[1].toString());
					complist.add(bean);
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
			return complist;
		
	}
	
	
	public List getAllCompTypeDetails9() {
	
		HibernateUtility hbu=null;
		Session session=null;
		List list= null;
		
		try 
		{
			hbu=HibernateUtility.getInstance();
			session=hbu.getHibernateSession();
			Query query = session.createQuery("from ComponentStockHibernate");
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
	public List<ComponentReceivedPOBean> getCompoentCategoryFromStock() {
		
		HibernateUtility hbu=null;
		Session session=null;
		List<ComponentReceivedPOBean> catlist= new ArrayList<ComponentReceivedPOBean>();
		
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
				catlist.add(bean);
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
		
		return catlist;
		
	}
	public List getCategoryReportByDateAndName(String CompoentCategory,String fkCompenetId, String fisDate4, String endDate4)
	{
		
		
		HibernateUtility hbu=null;
		Session session=null;
		List<ComponentReceivedPOBean> compList=null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query=session.createSQLQuery("SELECT vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name, comp_value, part_name, manufacturar_name, description, type, comp_package, tolerance, unit, unit_price, quantity, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM component_received_po_details where component_type='"+CompoentCategory+"' AND fk_comp_type_id='"+fkCompenetId+"' AND purchase_order_date BETWEEN '"+fisDate4+"' AND '"+endDate4+"'");
			List<Object[]> list = query.list();
			
			//System.out.println("list Size:"+list);
			
			compList= new ArrayList<ComponentReceivedPOBean>(0);
			
			int i=0;
			
			for (Object[] o : list)
			{
				i++;
				
				/*vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name,
				 *  comp_value, part_name, manufacturar_name, description, type, comp_package, unit, unit_price, quantity,
				 *   sub_total, GST, IGST, tax_amount, total, gross_total*/
				
				ComponentReceivedPOBean bean = new ComponentReceivedPOBean();
				
				bean.setVendorName(o[0].toString());
				bean.setBillChallanNo(o[1].toString());
				bean.setPurchaseOrderDate((Date) o[2]);
				bean.setExpectPaymentDate((Date) o[3]);
				bean.setComponentType(o[4].toString());
				bean.setComponentName(o[5].toString());
				bean.setCompValue(o[6].toString());
				bean.setPartName(o[7].toString());
				bean.setManufacturarName(o[8].toString());
				bean.setDescription(o[9].toString());
				bean.setType(o[10].toString());
				bean.setCompPackage(o[11].toString());
				bean.setTolerance((o[12].toString()));
				bean.setUnit(o[13].toString());
				bean.setUnitPrice(Double.parseDouble(o[14].toString()));
				bean.setQuantity(Long.parseLong(o[15].toString()));
				bean.setSubTotal(Double.parseDouble(o[16].toString()));
				bean.setGST(Double.parseDouble(o[17].toString()));
				bean.setIGST(Double.parseDouble(o[18].toString()));
				bean.setTaxAmount(Double.parseDouble(o[19].toString()));
				bean.setTotal(Double.parseDouble(o[20].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[21].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[22].toString()));
				bean.setGrossTotal(Double.parseDouble(o[23].toString()));
				bean.setSrNo(i);
				
				compList.add(bean);
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
		return compList;
	}
	public List getCategoryReportBybetweentwodates(String fisDate, String endDate)
	{
		
		
		HibernateUtility hbu=null;
		Session session=null;
		List<ComponentReceivedPOBean> compList=null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query=session.createSQLQuery("SELECT vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name, comp_value, part_name, manufacturar_name, description, type, comp_package, tolerance, unit, unit_price, quantity, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM component_received_po_details where   purchase_order_date BETWEEN '"+fisDate+"' AND '"+endDate+"'");
			List<Object[]> list = query.list();
			
			//System.out.println("list Size:"+list);
			
			compList= new ArrayList<ComponentReceivedPOBean>(0);
			
			int i=0;
			
			for (Object[] o : list)
			{
				i++;
				
				/*vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name,
				 *  comp_value, part_name, manufacturar_name, description, type, comp_package, unit, unit_price, quantity,
				 *   sub_total, GST, IGST, tax_amount, total, gross_total*/
				
				ComponentReceivedPOBean bean = new ComponentReceivedPOBean();
				
				bean.setVendorName(o[0].toString());
				bean.setBillChallanNo(o[1].toString());
				bean.setPurchaseOrderDate((Date) o[2]);
				bean.setExpectPaymentDate((Date) o[3]);
				bean.setComponentType(o[4].toString());
				bean.setComponentName(o[5].toString());
				bean.setCompValue(o[6].toString());
				bean.setPartName(o[7].toString());
				bean.setManufacturarName(o[8].toString());
				bean.setDescription(o[9].toString());
				bean.setType(o[10].toString());
				bean.setCompPackage(o[11].toString());
				bean.setTolerance((o[12].toString()));
				bean.setUnit(o[13].toString());
				bean.setUnitPrice(Double.parseDouble(o[14].toString()));
				bean.setQuantity(Long.parseLong(o[15].toString()));
				bean.setSubTotal(Double.parseDouble(o[16].toString()));
				bean.setGST(Double.parseDouble(o[17].toString()));
				bean.setIGST(Double.parseDouble(o[18].toString()));
				bean.setTaxAmount(Double.parseDouble(o[19].toString()));
				bean.setTotal(Double.parseDouble(o[20].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[21].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[22].toString()));
				bean.setGrossTotal(Double.parseDouble(o[23].toString()));
				bean.setSrNo(i);
				
				compList.add(bean);
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
		return compList;
	}



public List getCategoryReportBybetweentwodatesandname(String CompoentCategory,String fkCompenetId,String fisDate,String endDate,String fkCompoentid,String componentName)
{
	
	
	HibernateUtility hbu=null;
	Session session=null;
	List<ComponentReceivedPOBean> compList=null;
	
	try 
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query=session.createSQLQuery("SELECT vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name, comp_value, part_name, manufacturar_name, description, type, comp_package, tolerance, unit, unit_price, quantity, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM component_received_po_details where fk_comp_type_id='"+fkCompenetId+"' and component_type='"+CompoentCategory+"' AND fk_compoent_name_id='"+fkCompoentid+"' and component_name='"+componentName+"' AND purchase_order_date BETWEEN '"+fisDate+"' AND '"+endDate+"'");
		List<Object[]> list = query.list();
		
		//System.out.println("list Size:"+list);
		
		compList= new ArrayList<ComponentReceivedPOBean>(0);
		
		int i=0;
		
		for (Object[] o : list)
		{
			i++;
			
			/*vendor_name, bill_challan_no, purchase_order_date, expect_payment_date, component_type, component_name,
			 *  comp_value, part_name, manufacturar_name, description, type, comp_package, unit, unit_price, quantity,
			 *   sub_total, GST, IGST, tax_amount, total, gross_total*/
			
			ComponentReceivedPOBean bean = new ComponentReceivedPOBean();
			
			bean.setVendorName(o[0].toString());
			bean.setBillChallanNo(o[1].toString());
			bean.setPurchaseOrderDate((Date) o[2]);
			bean.setExpectPaymentDate((Date) o[3]);
			bean.setComponentType(o[4].toString());
			bean.setComponentName(o[5].toString());
			bean.setCompValue(o[6].toString());
			bean.setPartName(o[7].toString());
			bean.setManufacturarName(o[8].toString());
			bean.setDescription(o[9].toString());
			bean.setType(o[10].toString());
			bean.setCompPackage(o[11].toString());
			bean.setTolerance((o[12].toString()));
			bean.setUnit(o[13].toString());
			bean.setUnitPrice(Double.parseDouble(o[14].toString()));
			bean.setQuantity(Long.parseLong(o[15].toString()));
			bean.setSubTotal(Double.parseDouble(o[16].toString()));
			bean.setGST(Double.parseDouble(o[17].toString()));
			bean.setIGST(Double.parseDouble(o[18].toString()));
			bean.setTaxAmount(Double.parseDouble(o[19].toString()));
			bean.setTotal(Double.parseDouble(o[20].toString()));
			bean.setTotalSubTotal(Double.parseDouble(o[21].toString()));
			bean.setTotalTaxAmount(Double.parseDouble(o[22].toString()));
			bean.setGrossTotal(Double.parseDouble(o[23].toString()));
			bean.setSrNo(i);
			
			compList.add(bean);
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
	return compList;
}


//ComponentReceivedPO by Namrata
public List getcompentCategoryPODetailForBulkUpload(String vendorName, String componentType, String componentName, String compValue, String partName, String manufacturarName, String type, String compPackage, String tolerance, String unitPrice, String GST, String IGST) {

	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 
	 Query query = session.createQuery("From ComponentReceivedPOHibernate where vendorName = '"+vendorName+"' AND componentType = '"+componentType+"' AND componentName='"+componentName+"' AND compValue='"+compValue+"' AND partName='"+partName+"' AND manufacturarName='"+manufacturarName+"' AND type='"+type+"' AND compPackage='"+compPackage+"' AND tolerance='"+tolerance+"' AND unitPrice='"+unitPrice+"' AND GST='"+GST+"' AND IGST='"+IGST+"' ");
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

//VendorDetails By Namrata 
public List getVendorId(String vendorName) {

	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 
	 Query query = session.createQuery("From VendorDetailsHibernate where vendorName = '"+vendorName+"' GROUP BY vendorName");
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

//componentType by Namrata
public List getfkCompTypeId(String componentType) {

	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 
	 Query query = session.createQuery("From CompTypeDetailsHibernate where componentType = '"+componentType+"' GROUP BY componentType");
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

//componentNameId By Namrata
//public List getfkCompNameId(String componentName) {
//
//	HibernateUtility hbu=null;
//	Session session=null;
//	List list=null;
//	try{
//	 hbu = HibernateUtility.getInstance();
//	 session = hbu.getHibernateSession();
//	 
//	 Query query = session.createQuery("From CompTypeDetailsHibernate where componentType = '"+componentName+"' GROUP BY componentType");
//	 list = query.list();
//	}
//		catch(Exception e){	
//			e.printStackTrace();
//	}
//		finally
//		{
//				if(session!=null){
//				hbu.closeSession(session);
//			}
//		}
//	
//return list;
//
//}

}



