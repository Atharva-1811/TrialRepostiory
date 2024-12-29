package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.velocity.runtime.directive.Parse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.ClientPaymentDetailsBean;
import com.embelSoft.bean.CompoenentBillingBean;
import com.embelSoft.bean.CompoentCategoryDetailBean;
import com.embelSoft.bean.ComponentStockBean;
import com.embelSoft.bean.GetClientEnquiryDetailsBean;
import com.embelSoft.hibernate.CompoenentBillingHibernate;
import com.embelSoft.hibernate.CompoentCategoryDetailsHibernate;
import com.embelSoft.hibernate.ComponentReceivedPOHibernate;
import com.embelSoft.hibernate.ComponentStockHibernate;
import com.embelSoft.hibernate.ProductBillingHibernateNew;
import com.embelSoft.utility.HibernateUtility;

public class CompoenentBillingDao {

	
	
	public List getCompoentLastBillNo123()
	{
		HibernateUtility hbu = null;
		Session session = null;
		//Transaction transaction = null;
		List<CompoenentBillingBean> billList = null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select cilent_name, bill_no from compoenent_billing ORDER BY bill_no DESC LIMIT 1");
			List<Object[]> list = query.list();		
			System.out.println("IN METHOD getResourceLastBillNo List Size :-"+list.size());
			billList = new ArrayList<CompoenentBillingBean>(0);
			
			for(Object[] o : list)
			{
				CompoenentBillingBean bean = new CompoenentBillingBean();
				
				bean.setClientName(o[0].toString());
				bean.setBillNo(o[1].toString());
				System.out.println("IN METHOD getCompoenentLastBillNo Last CompoentBillNo : "+bean.getBillNo());
				billList.add(bean);				
			}			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception in getLastResourceBillNo :-"+e);
		}
		
		return billList;		
}

	
	public List getproframaLastBillNo11()
	{
		HibernateUtility hbu = null;
		Session session = null;
		//Transaction transaction = null;
		List<CompoenentBillingBean> billList = null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select client_name, bill_no from perfroma_billing ORDER BY bill_no DESC LIMIT 1");
			List<Object[]> list = query.list();		
			System.out.println("IN METHOD getResourceLastBillNo List Size :-"+list.size());
			billList = new ArrayList<CompoenentBillingBean>(0);
			
			for(Object[] o : list)
			{
				CompoenentBillingBean bean = new CompoenentBillingBean();
				
				bean.setClientName(o[0].toString());
				bean.setBillNo(o[1].toString());
				System.out.println("IN METHOD getCompoenentLastBillNo Last CompoentBillNo : "+bean.getBillNo());
				billList.add(bean);				
			}			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception in getLastResourceBillNo :-"+e);
		}
		
		return billList;		
}

	public List getAllClientNames()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("FROM ClientEnquiryHibernate ");
		 list = query.list();
		 
		

		}catch(Exception e){	
			Log.error("Error in getAllVendorName",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);	
		}
		}
		
		 
		return list;
	}

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

		//getAllCompTypeDetails
				public List getAllCompTypeDetails11()
				{
					HibernateUtility hbu=null;
					Session session=null;
					
					List list=null;
					
					try{
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 Query query = session.createQuery("from ComponentStockHibernate where quantity > 0"); // group by componentType 
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
		
		
		
		public List<CompoenentBillingBean> getCompoenetBilldata(Long fkEmployeeid) 
		{
			System.out.println(fkEmployeeid + "    -----------   fkid In dao");
			HibernateUtility hbu = null;
			Session session = null;
			
			List<CompoenentBillingBean> expenseList = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				
				
				
				Query query2 = session.createSQLQuery("SELECT A.component_type,A.component_name,A.unit_price,B.quantity,A.GST,B.fk_comp_type_id ,c.part_number,c.packages,c.compoent_value,c.manufracture_name FROM component_received_po_details as A LEFT JOIN component_stock_dtl AS B ON A.fk_compoent_name_id=b.fk_compoent_name_id LEFT JOIN compoent_category_details AS c ON a.fk_compoent_name_id=c.pk_compoent_category_id where A.fk_compoent_name_id =  :fkEmployeeid");
				query2.setParameter("fkEmployeeid", fkEmployeeid);
				
				List<Object[]> list = query2.list();
				expenseList = new ArrayList<CompoenentBillingBean>(0);
				
				for (Object[] object : list) 
				{
					CompoenentBillingBean reports = new CompoenentBillingBean();
					
					reports.setCompoenentCategory(object[0].toString());
					reports.setCompoenentName(object[1].toString());
					reports.setUnitPrice(Double.parseDouble(object[2].toString()));
					reports.setQuantity(Long.parseLong(object[3].toString()));
					reports.setGst(Double.parseDouble(object[4].toString()));
					reports.setFkComptypeId(Long.parseLong(object[5].toString()));
					reports.setPartNumber(object[6].toString());
					reports.setPackages(object[7].toString());
					reports.setValues(object[8].toString());
					reports.setMfgName(object[9].toString());
					expenseList.add(reports);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return expenseList;
		}
		
		
		
		
		public List<ComponentStockBean> getcompentCategoryNameForselect(Long componentType) 
		{

			System.out.println(componentType + "    -----------   Compoenent type id In dao");
			
			HibernateUtility hbu = null;
			Session session = null;
			
			List<ComponentStockBean> venList = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				//System.out.println("Name "+employeeName);
				Query query2 = session.createSQLQuery("SELECT fk_compoent_name_id,component_name,quantity from component_stock_dtl WHERE fk_comp_type_id= :fkCompTypeId and quantity > 0");
				query2.setParameter("fkCompTypeId", componentType);

				
				List<Object[]> list = query2.list();
				
				venList = new ArrayList<ComponentStockBean>(0);

				System.out.println("Size in DAO   : =====================  : "+list.size());
				
				for (Object[] o : list) {
					
					
					
					ComponentStockBean bean = new ComponentStockBean();
					
					
					bean.setFkCompoentnameid(Long.parseLong(o[0].toString()));
					
					//bean.getFkCompoentnameid(Long.parseLong(o[0].toString()));
				
					bean.setComponentName(o[1].toString());
					bean.setQuantity(Long.parseLong(o[2].toString()));
					
					venList.add(bean);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return venList;

		}
		
		int count=0;
		public void saveCompBillingDetails(CompoenentBillingHibernate hibernate)
		{
			count++;
			System.out.println("-----------In dao ------------"+count);
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

		
		public void saveProductBillingDetails(CompoenentBillingHibernate hibernate)
		{
			HibernateUtility hbu = null;
			Session session1 = null;
			Transaction transaction = null;
			try {
				hbu = HibernateUtility.getInstance();
				session1 = hbu.getHibernateSession();
				System.out.println("got session ");
				transaction = session1.beginTransaction();
				System.out.println("Tx started");
				 
				session1.save(hibernate);
				transaction.commit();
				System.out.println("Successful");
			} catch (RuntimeException e) {

				try {
					transaction.rollback();
				} catch (RuntimeException e2) {

					Log.error("Error in ProductBillingHibernateNew", e2);
				}
			} finally {
				if (session1 != null) {
					hbu.closeSession(session1);
				}
			}
		}
		
		//reports by clientName for compenet billing
		
		
		public List getClientReportByDateAndName(String fkClientId2,String clientName, String fDate, String endDate4)
		{
			
			
			HibernateUtility hbu=null;
			Session session=null;
			List<CompoenentBillingBean> cliList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			
			Query query=session.createSQLQuery("SELECT bill_no,bill_date, cilent_name,compoenent_category,compoenent_name,unit_price,quantity,amount,discount_percentage,discount_amount,sub_total,gst,igst,tax_amount,gross_total FROM compoenent_billing WHERE cilent_name='"+clientName+"'AND fk_client_id='"+fkClientId2+"' AND bill_date BETWEEN '"+fDate+"' AND '"+endDate4+"'");
			List<Object[]> list = query.list();
			cliList= new ArrayList<CompoenentBillingBean>(0);

			System.out.println("========================  SIZE  ======================  :: "+list.size());
			
			int i=0;
		for (Object[] o : list) 
		{
			i++;

			CompoenentBillingBean reports = new CompoenentBillingBean();
			
			
			
			reports.setBillNo(o[0].toString());
			reports.setBillingDate((Date)o[1]);
			reports.setClientName(o[2].toString());	
			reports.setCompoenentCategory(o[3].toString());
			reports.setCompoenentName(o[4].toString());
			
			reports.setUnitPrice(Double.parseDouble(o[5].toString()));
			reports.setQuantity(Long.parseLong(o[6].toString()));
			reports.setAmount(Double.parseDouble(o[7].toString()));
			reports.setDiscountPercentage(Double.parseDouble(o[8].toString()));	
			reports.setDiscountAmount(Double.parseDouble(o[9].toString()));
			reports.setSubtotal(Double.parseDouble(o[10].toString()));
			reports.setGst(Double.parseDouble(o[11].toString()));
			reports.setIgst(Double.parseDouble(o[12].toString()));
			reports.setTaxAmount(Double.parseDouble(o[13].toString()));
			reports.setTotal(Double.parseDouble(o[14].toString()));
		reports.setSrNo(i);
			
			cliList.add(reports);
			
		
		}
		}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
		return cliList;
		}

		public List getAllClientName() 
		{
			HibernateUtility hbu = null;
			Session session = null;
			Query query = null;
			List list = null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				query = session.createQuery("FROM CompoenentBillingHibernate");
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
	
		
		public List getClientReportByDates(String fDate, String lName)
		{
			
			HibernateUtility hbu=null;
			Session session=null;
			List<CompoenentBillingBean> cliList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();



			Query query=session.createSQLQuery("SELECT bill_no,bill_date, cilent_name,compoenent_category,compoenent_name,unit_price,quantity,amount,discount_percentage,discount_amount,sub_total,gst,igst,tax_amount,gross_total FROM compoenent_billing WHERE bill_date BETWEEN '"+fDate+"' AND '"+lName+"' GROUP BY bill_no");
			List<Object[]> list = query.list();
			cliList= new ArrayList<CompoenentBillingBean>(0);

			System.out.println("========================  SIZE  ======================  :: "+list.size());
			
			int i=0;
		for (Object[] o : list) 
		{
			i++;

			CompoenentBillingBean reports = new CompoenentBillingBean();
			
			
			
			reports.setBillNo(o[0].toString());
			reports.setBillingDate((Date)o[1]);
			reports.setClientName(o[2].toString());	
			reports.setCompoenentCategory(o[3].toString());
			reports.setCompoenentName(o[4].toString());
			
			reports.setUnitPrice(Double.parseDouble(o[5].toString()));
			reports.setQuantity(Long.parseLong(o[6].toString()));
			reports.setAmount(Double.parseDouble(o[7].toString()));
			reports.setDiscountPercentage(Double.parseDouble(o[8].toString()));	
			reports.setDiscountAmount(Double.parseDouble(o[9].toString()));
			reports.setSubtotal(Double.parseDouble(o[10].toString()));
			reports.setGst(Double.parseDouble(o[11].toString()));
			reports.setIgst(Double.parseDouble(o[12].toString()));
			reports.setTaxAmount(Double.parseDouble(o[13].toString()));
			reports.setTotal(Double.parseDouble(o[14].toString()));
		
		reports.setSrNo(i);
			
			cliList.add(reports);
			
			
		
		}
		}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
		return cliList;
		}
   
		
		
		
		public List<CompoenentBillingBean> getClientDetail(String fisDate, String endDate, String CompoentCategory, String fkCompenetId1) 
		{

			HibernateUtility hbu=null;
			Session session=null;
			List<CompoenentBillingBean> cliList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			
			Query query=session.createSQLQuery("SELECT bill_no,bill_date, cilent_name,compoenent_category,compoenent_name,unit_price,quantity,amount,discount_percentage,discount_amount,sub_total,gst,igst,tax_amount,gross_total FROM compoenent_billing WHERE compoenent_category='"+CompoentCategory+"'AND fk_comp_type_id='"+fkCompenetId1+"' AND bill_date BETWEEN '"+fisDate+"' AND '"+endDate+"'");
			List<Object[]> list = query.list();
			cliList= new ArrayList<CompoenentBillingBean>(0);

			System.out.println("========================  SIZE  ======================  :: "+list.size());
			
			int i=0;
		for (Object[] o : list) 
		{
			i++;

			CompoenentBillingBean reports = new CompoenentBillingBean();
			
			
			
			reports.setBillNo(o[0].toString());
			reports.setBillingDate((Date)o[1]);
			reports.setClientName(o[2].toString());	
			reports.setCompoenentCategory(o[3].toString());
			reports.setCompoenentName(o[4].toString());
			
			reports.setUnitPrice(Double.parseDouble(o[5].toString()));
			reports.setQuantity(Long.parseLong(o[6].toString()));
			reports.setAmount(Double.parseDouble(o[7].toString()));
			reports.setDiscountPercentage(Double.parseDouble(o[8].toString()));	
			reports.setDiscountAmount(Double.parseDouble(o[9].toString()));
			reports.setSubtotal(Double.parseDouble(o[10].toString()));
			reports.setGst(Double.parseDouble(o[11].toString()));
			reports.setIgst(Double.parseDouble(o[12].toString()));
			reports.setTaxAmount(Double.parseDouble(o[13].toString()));
			reports.setTotal(Double.parseDouble(o[14].toString()));
		
		reports.setSrNo(i);
			
			cliList.add(reports);
			
		
		}
		}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
		return cliList;
		}
		
		public List<CompoenentBillingBean> getCompoentNameDetail(String fisDate, String endDate, String CompoenentName, String fkCompenetId) 
		{

			HibernateUtility hbu=null;
			Session session=null;
			List<CompoenentBillingBean> cliList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			
			Query query=session.createSQLQuery("SELECT bill_no,bill_date, cilent_name,compoenent_category,compoenent_name,unit_price,quantity,amount,discount_percentage,discount_amount,sub_total,gst,igst,tax_amount,gross_total FROM compoenent_billing WHERE compoenent_name='"+CompoenentName+"'AND fk_compoent_name_id='"+fkCompenetId+"' AND bill_date BETWEEN '"+fisDate+"' AND '"+endDate+"'");
			List<Object[]> list = query.list();
			cliList= new ArrayList<CompoenentBillingBean>(0);

			System.out.println("========================  SIZE  ======================  :: "+list.size());
			
			int i=0;
		for (Object[] o : list) 
		{
			i++;

			CompoenentBillingBean reports = new CompoenentBillingBean();
			
			
			
		reports.setBillNo(o[0].toString());
		reports.setBillingDate((Date)o[1]);
		reports.setClientName(o[2].toString());	
		reports.setCompoenentCategory(o[3].toString());
		reports.setCompoenentName(o[4].toString());
		
		reports.setUnitPrice(Double.parseDouble(o[5].toString()));
		reports.setQuantity(Long.parseLong(o[6].toString()));
		reports.setAmount(Double.parseDouble(o[7].toString()));
		reports.setDiscountPercentage(Double.parseDouble(o[8].toString()));	
		reports.setDiscountAmount(Double.parseDouble(o[9].toString()));
		reports.setSubtotal(Double.parseDouble(o[10].toString()));
		reports.setGst(Double.parseDouble(o[11].toString()));
		reports.setIgst(Double.parseDouble(o[12].toString()));
		reports.setTaxAmount(Double.parseDouble(o[13].toString()));
		reports.setTotal(Double.parseDouble(o[14].toString()));
		
		reports.setSrNo(i);
			
			cliList.add(reports);
			
		
		}
		}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
		return cliList;
		}
	
		
		public List getAllComponentNameDetails() {
			
			
			
			HibernateUtility hbu=null;
			Session session=null;
			List list= null;
			
			try 
			{
				hbu=HibernateUtility.getInstance();
				session=hbu.getHibernateSession();
				Query query = session.createQuery("from CompoenentBillingHibernate");
				//GROUP BY compoenent_name
				 list = query.list();
				
				
			} catch (Exception e) 
			{
				Log.error("Error in getAllComponentNameDetails",e);
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

		public List getAllCompTypeDetails1() {
			
			
			
			HibernateUtility hbu=null;
			Session session=null;
			List list= null;
			
			try 
			{
				hbu=HibernateUtility.getInstance();
				session=hbu.getHibernateSession();
				Query query = session.createQuery("from CompoenentBillingHibernate");
//				 GROUP BY compoenentCategory
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


}
