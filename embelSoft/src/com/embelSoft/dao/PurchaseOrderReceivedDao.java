package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.PurchaseOrderCreateBean;
import com.embelSoft.bean.PurchaseOrderCreateBeanNew;
import com.embelSoft.bean.PurchaseOrderReceivedBean;
import com.embelSoft.hibernate.PurchaseOrderReceivedHibernate;
import com.embelSoft.hibernate.perfromaResourcesbillhibernate;
import com.embelSoft.utility.HibernateUtility;

public class PurchaseOrderReceivedDao {
	
	
	public List<PurchaseOrderReceivedBean> getGrossTotal(String fkMemberId2, String vendorName)
	{
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<PurchaseOrderReceivedBean> memList = null;
		
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query = session.createSQLQuery("select balance_status, vendor_name FROM purchase_order_received_details WHERE fk_vendor_id='"+fkMemberId2+"' and vendor_name='"+vendorName+"'  GROUP BY balance_status");
			List<Object[]> list = query.list();
		
			memList = new ArrayList<PurchaseOrderReceivedBean>(0);
			
			for(Object[] o : list)
			{
				PurchaseOrderReceivedBean report = new PurchaseOrderReceivedBean();
				
				report.setGrossTotal(Double.parseDouble(o[0].toString()));
				report.setVendorName(o[1].toString());
				
				memList.add(report);
					
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return memList;
		
	}
	
	public void savePurchaseOrderReceivedDetails(PurchaseOrderReceivedHibernate Hibernate)
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
		 
		session.save(Hibernate);
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
	
	
	public List getPurchaseOrderCreateList()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<PurchaseOrderReceivedBean> empList=null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			
			Query query=session.createSQLQuery("SELECT vendor_name, bill_no, purchase_order_date, expect_payment_date, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total, balance_status FROM purchase_order_received_details");
			List<Object[]> list = query.list();
			
			System.out.println("list Size:"+list);
			
			empList= new ArrayList<PurchaseOrderReceivedBean>(0);

			int i=0;

			for (Object[] o : list)
			{	
				i++;
				//vendor_name, bill_no, purchase_order_date, expect_payment_date, product_name, description, hsn_sac, unit_price,
				//quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total,
				//total_tax_amount, gross_total, balance_status
				
				PurchaseOrderReceivedBean bean = new PurchaseOrderReceivedBean();	
				
				bean.setVendorName(o[0].toString());
				bean.setBillNo(o[1].toString());
				bean.setPurchaseOrderDate((Date) o[2]);
				bean.setExpectPaymentDate((Date) o[3]);
				bean.setProductName(o[4].toString());
				bean.setDescription(o[5].toString());
				bean.setHsnSac(o[6].toString());
				bean.setUnitPrice(Double.parseDouble(o[7].toString()));
				bean.setQuantity(Long.parseLong(o[8].toString()));
				bean.setAmount(Double.parseDouble(o[9].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[10].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[11].toString()));
				bean.setSubTotal(Double.parseDouble(o[12].toString()));
				bean.setGST(Double.parseDouble(o[13].toString()));
				bean.setIGST(Double.parseDouble(o[14].toString()));
				bean.setTaxAmount(Double.parseDouble(o[15].toString()));
				bean.setTotal(Double.parseDouble(o[16].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[18].toString()));
				bean.setGrossTotal(Double.parseDouble(o[19].toString()));
				bean.setBalanceStatus(Double.parseDouble(o[20].toString()));
				
				
				bean.setSrNo(i);
				
				empList.add(bean);
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
	
	
	public List getReceivedPOReport()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<PurchaseOrderReceivedBean> receiveList=null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query2=session.createSQLQuery("SELECT vendor_name, bill_no, purchase_order_date, expect_payment_date, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total, balance_status FROM purchase_order_received_details");

			List<Object[]> list = query2.list();
			
			System.out.println("list Size in Dao -----------=============  :  "+list.size());
			
			receiveList= new ArrayList<PurchaseOrderReceivedBean>(0);

			int i=0;

			for (Object[] o : list)
			{	
				i++;
				
				PurchaseOrderReceivedBean bean = new PurchaseOrderReceivedBean();	
				
				bean.setVendorName(o[0].toString());
				bean.setBillNo(o[1].toString());
				bean.setPurchaseOrderDate((Date) o[2]);
				bean.setExpectPaymentDate((Date) o[3]);
				bean.setProductName(o[4].toString());
				bean.setDescription(o[5].toString());
				bean.setHsnSac(o[6].toString());
				bean.setUnitPrice(Double.parseDouble(o[7].toString()));
				bean.setQuantity(Long.parseLong(o[8].toString()));
				bean.setAmount(Double.parseDouble(o[9].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[10].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[11].toString()));
				bean.setSubTotal(Double.parseDouble(o[12].toString()));
				bean.setGST(Double.parseDouble(o[13].toString()));
				bean.setIGST(Double.parseDouble(o[14].toString()));
				bean.setTaxAmount(Double.parseDouble(o[15].toString()));
				bean.setTotal(Double.parseDouble(o[16].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[18].toString()));
				bean.setGrossTotal(Double.parseDouble(o[19].toString()));
				bean.setBalanceStatus(Double.parseDouble(o[20].toString()));				
				
				bean.setSrNo(i);
				
				receiveList.add(bean);
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
		
		System.out.println("list Size in Dao ---Last--------=============  :  "+receiveList.size());
		
		return receiveList;
	}

	public List<PurchaseOrderBean> receivePOGrid(String productName, String billno) {
		{
			System.out.println(productName + "    -----------   productName In dao");

			HibernateUtility hbu = null;
			Session session = null;

			List<PurchaseOrderBean> expenseList = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				if (billno != null) {

					
				Query query2 = session.createSQLQuery("SELECT product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, billNo, gross_total FROM purchase_order_create WHERE billNo = :billno ");

					query2.setParameter("billno", billno);

					List<Object[]> list = query2.list();
					expenseList = new ArrayList<PurchaseOrderBean>(0);

					for (Object[] object : list) {
						PurchaseOrderBean reports = new PurchaseOrderBean();

						reports.setProductName(object[0].toString());
						reports.setDescription(object[1].toString());
						reports.setHsnSac((object[2].toString()));
						reports.setUnitPrice(Double.parseDouble(object[3].toString()));
						reports.setQuantity(Long.parseLong(object[4].toString()));
						reports.setAmount(Double.parseDouble(object[5].toString()));
						reports.setDiscountPercent(Double.parseDouble(object[6].toString()));
						reports.setDiscountAmount(Double.parseDouble(object[7].toString()));
						reports.setSubTotal(Double.parseDouble(object[8].toString()));
						reports.setGST(Double.parseDouble(object[9].toString()));
						reports.setIGST(Double.parseDouble(object[10].toString()));
						reports.setTaxAmount(Double.parseDouble(object[11].toString()));
						reports.setTotal(Double.parseDouble(object[12].toString()));
						// reports.setVendorId(Long.parseLong(object[13].toString()));

						reports.setBillNo(object[13].toString());
						reports.setGrossTotal(Double.parseDouble(object[14].toString()));

						expenseList.add(reports);

					}
				} else {

					Query query2 = session.createSQLQuery(
							"SELECT product_name,product_cost,features,SGST,CGST,tax_percentage,description,hsn_sac FROM product_details WHERE product_name = '"+productName+"'");
					//query2.setParameter("productName", productName);
					List<Object[]> list = query2.list();

					expenseList = new ArrayList<PurchaseOrderBean>(0);
					for (Object[] object : list) {
						PurchaseOrderBean reports = new PurchaseOrderBean();

						reports.setProductName(object[0].toString());						
						reports.setUnitPrice(Double.parseDouble(object[1].toString()));
						reports.setQuantity(0l);
						reports.setAmount(0d);
						reports.setDescription("");
						reports.setHsnSac(object[7].toString());
						reports.setDiscountPercent(0d);
						reports.setDiscountAmount(0d);
						reports.setSubTotal(0d);
						Double dd = Double.parseDouble(object[3].toString());
						Double ss = Double.parseDouble(object[4].toString());
						Double gst = dd+ss;
						reports.setGST(gst);
						reports.setIGST(0d);
						reports.setTaxAmount(0d);
						reports.setTotal(0d);
						expenseList.add(reports);
					}
					

				}
			}
			// }

			catch (Exception e) {
				e.printStackTrace();
			}
			return expenseList;
		}
	}

	
	public List getROCreateBill()
	{		
		
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<PurchaseOrderReceivedHibernate> lastBillNo = null;
		
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select vendor_name, bill_no from purchase_order_received_details order by bill_no DESC limit 1");
			List<Object[]> list = query.list();

			System.out.println("Size in JSP   :   -     "+list.size());
			
			lastBillNo = new ArrayList<PurchaseOrderReceivedHibernate>(0);
			
			for(Object[] o : list)
			{
				PurchaseOrderReceivedHibernate bean = new PurchaseOrderReceivedHibernate();
				
				bean.setVendorName(o[0].toString());
				bean.setBillNo(o[1].toString());
				System.out.println("IN DAO getBillNo :- "+bean.getBillNo());
				
				lastBillNo.add(bean);
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("Size in JSP   :   -     "+lastBillNo.size());
		
		return lastBillNo;
		
	}

	public void updateAdvanceBooking(String bookingNoAB, String poNo) {

		System.out.println("updateAdvanceBooking bookingNoAB  ===>  "+bookingNoAB);
		HibernateUtility hbu = null;
		Session session = null;
		Transaction tx = null;
		
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			tx = session.beginTransaction();
			
			Query updateAdvanceBooking = session.createSQLQuery("update purchase_order_create set orderBillNo = '"+poNo+"' where billNo = '"+bookingNoAB+"'");
			updateAdvanceBooking.executeUpdate();
			tx.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}



}
