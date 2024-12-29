package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.GetProductDetailsBean;
import com.embelSoft.bean.GetVendorDetailsBean;
import com.embelSoft.bean.PurchaseOrderCreateBeanNew;
import com.embelSoft.bean.QuotationBean;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.hibernate.TaxDetailsHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.utility.HibernateUtility;



public class ProductDetailsDao {
	
	public List<TaxDetailsHibernate> getTaxDetailsForProductDetails(Long fkEmployeeid) 
	{
		System.out.println(fkEmployeeid + "    -----------   fkid In dao");
		//System.out.println(employeeName + "     --------   Name In dao");
		HibernateUtility hbu = null;
		Session session = null;
		
		List<TaxDetailsHibernate> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("SELECT tax_type, tax_percentage, CGST, SGST FROM tax_details WHERE pk_tax_details_id = :fkEmployeeid ");
			query2.setParameter("fkEmployeeid", fkEmployeeid);
			//query2.setParameter("employeeName", employeeName);
			
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<TaxDetailsHibernate>(0);
			
			for (Object[] object : list) 
			{
				TaxDetailsHibernate reports = new TaxDetailsHibernate();
				
				reports.setTaxType(object[0].toString());
				reports.setTaxPercentage(Double.parseDouble(object[1].toString()));
				reports.setCGST(Double.parseDouble(object[2].toString()));
				reports.setSGST(Double.parseDouble(object[3].toString()));
				
				expenseList.add(reports);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;
	}
	
	public void saveProductDetails(ProductDetailsHibernate edh){
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
			Query query2 = session.createSQLQuery("select  product_name, product_cost, description, features, fk_tax_type_id, tax_type, tax_percentage, CGST, SGST ,hsn_sac from product_details where pk_Product_Details_Id=:pkProductDetailsId ");
			query2.setParameter("pkProductDetailsId", fkProductid);

			
			List<Object[]> list = query2.list();
			
			venList = new ArrayList<GetProductDetailsBean>(0);

			System.out.println("Size in DAO   : =====================  : "+list.size());
			
			for (Object[] o : list) {
				System.out.println("rslt - "+Arrays.toString(o));
//				product_name, product_cost, description, features, fk_tax_type_id, tax_type, tax_percentage, CGST, SGST

				GetProductDetailsBean bean = new GetProductDetailsBean();
				
				bean.setProductName(o[0].toString());
				bean.setProductCost(Double.parseDouble(o[1].toString()));
				bean.setDescription(o[2].toString());
				bean.setFeatures(o[3].toString());
				bean.setFkTaxTypeId(Long.parseLong(o[4].toString()));
				bean.setTaxType(o[5].toString());
				bean.setTaxPercentage(Double.parseDouble(o[6].toString()));
				bean.setCGST(Double.parseDouble(o[7].toString()));
				bean.setSGST(Double.parseDouble(o[8].toString()));
				if(o[9]==null) 
				{
					bean.setHsnsac("0");
				}else {
					bean.setHsnsac(o[9].toString());	
				}
				
				venList.add(bean);

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
	
	
	
	
	
	// Get Product List
		public List getProductList(){
				
				HibernateUtility hbu=null;
				Session session=null;
				List<GetProductDetailsBean> empList=null;
			try{	
		
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
		
				Query query=session.createSQLQuery("SELECT product_name, product_cost, description, features, tax_type, tax_percentage, CGST, SGST, last_update_date,hsn_sac FROM product_details");
				List<Object[]> list = query.list();
				System.out.println("list Size:"+list);
		
		
				empList= new ArrayList<GetProductDetailsBean>(0);
		
				int i=0;
			for (Object[] object : list) {
				
				i++;
				
				//product_name, product_cost, description, features, tax_type, tax_percentage, CGST, SGST, last_update_date
				
				GetProductDetailsBean reports = new GetProductDetailsBean();
				
				reports.setProductName(object[0].toString());
				reports.setProductCost(Double.parseDouble(object[1].toString()));
				reports.setDescription(object[2].toString());
				reports.setFeatures(object[3].toString());
				reports.setTaxType(object[4].toString());
				reports.setTaxPercentage(Double.parseDouble(object[5].toString()));
				reports.setCGST(Double.parseDouble(object[6].toString()));
				reports.setSGST(Double.parseDouble(object[7].toString()));
				reports.setLastUpdateDate((Date) object[8]);
				reports.setHsnsac(object[9].toString());
				reports.setSrNo(i);
				
//				reports.setProductName(object[0].toString());
//				System.out.println(reports.getProductName());
//				//reports.setClientName(object[1].toString());
//				//System.out.println(reports.getClientName());
//				String d1 = object[1].toString();
//				String[] edate = d1.split("-");
//				String EnquiryDate = edate[2]+"-"+edate[1]+"-"+edate[0]; 
//				reports.setEnquiryDate(EnquiryDate);
//				System.out.println(reports.getEnquiryDate());
//				reports.setCost(Long.parseLong(object[2].toString()));
//				System.out.println(reports.getCost());
//				reports.setDescription(object[3].toString());
//				System.out.println(reports.getDescription());
//				reports.setFeatures(object[4].toString());
//				System.out.println(reports.getFeatures());
//				reports.setSrNo(i); 
//				System.out.println(reports.getSrNo());
				
				empList.add(reports);
		
			}}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
			return empList;
			}

		public List getAllBillNoAgaintsSupller(String fkClientId) {

			HibernateUtility hbu = null;
			Session session =  null;
			Query query = null;
			 List list = null;
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 query = session.createSQLQuery("SELECT pk_perfroma_bill_id, bill_no,Ship_Address,Courier_number,Courier_Name FROM perfroma_billing WHERE fk_client_id = '"+fkClientId+"' AND productBillNo IS NULL GROUP BY bill_no;");
				 list = query.list(); 
			} catch (RuntimeException e) {
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

		public PurchaseOrderCreateBeanNew PurchaseOrder(Long productId) {

			HibernateUtility hbu = null;
			Session session = null;
			List<PurchaseOrderCreateBeanNew> proList = null;
			PurchaseOrderCreateBeanNew bean = new PurchaseOrderCreateBeanNew();
			try {

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();			
				Query query = session.createSQLQuery("SELECT product_name,product_cost,tax_percentage,CGST,SGST,hsn_sac FROM product_details WHERE pk_product_details_id = "+ productId);
							
				List<Object[]> list = query.list();
				System.out.println("list Size:" + list);
				for (Object[] objects : list) {
					
					bean.setProductName(objects[0].toString());
					Double unitPrice = Double.parseDouble(objects[1].toString());
					bean.setUnitPrice(unitPrice);
					bean.setTaxAmount(Double.parseDouble(objects[2].toString()));
					bean.setGST(Double.parseDouble(objects[3].toString())+Double.parseDouble(objects[4].toString()));
					bean.setIGST(0d);
					bean.setTotal(unitPrice+Double.parseDouble(objects[2].toString()));
					bean.setQuantity(0l);
					bean.setAmount(unitPrice);
					bean.setDiscountPercent(0d);
					bean.setDiscountAmount(0d);
					bean.setHsnSac(objects[5].toString());	
				}

			} catch (Exception e) {
				// TODO: handle exception
			}
			return bean;
		}

		public QuotationBean getQuotationDetails(String productName) {

			HibernateUtility hbu = null;
			Session session = null;
			List<PurchaseOrderCreateBeanNew> proList = null;
			QuotationBean bean = new QuotationBean();
			try {

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();			
				Query query = session.createSQLQuery("SELECT product_name,product_cost,tax_percentage,CGST,SGST,hsn_sac,description,pk_product_details_id FROM product_details WHERE product_name ='"+ productName+"'");
							
				List<Object[]> list = query.list();
				System.out.println("list Size:" + list);
				for (Object[] objects : list) {
					
					bean.setFkProductId(Long.parseLong(objects[7].toString()));
					bean.setProductName(objects[0].toString());
					Double unitPrice = Double.parseDouble(objects[1].toString());
					bean.setUnitPrice(unitPrice);
					bean.setTaxAmount(Double.parseDouble(objects[2].toString()));
					bean.setGST(Double.parseDouble(objects[3].toString())+Double.parseDouble(objects[4].toString()));
					bean.setIGST(0d);
					bean.setTotal(unitPrice+Double.parseDouble(objects[2].toString()));
					bean.setQuantity(0l);
					bean.setAmount(unitPrice);
					bean.setDiscountPercent(0d);
					bean.setDiscountAmount(0d);
					bean.setHsnSac(objects[5].toString());	
					bean.setSubTotal(unitPrice);
					bean.setDescription(objects[6].toString());
				}

			} catch (Exception e) {
				// TODO: handle exception
			}
			return bean;
		}
		
		
}

