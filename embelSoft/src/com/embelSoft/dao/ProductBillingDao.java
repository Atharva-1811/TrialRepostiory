package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.HrBillingBean;
import com.embelSoft.bean.ProductBillingBean;
import com.embelSoft.bean.ProductBillingBeanNew;
import com.embelSoft.hibernate.ProductBillingHibernate;
import com.embelSoft.hibernate.ProductBillingHibernateNew;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.hibernate.perfromabillingHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ProductBillingDao {

	//New Product Billing coding methods

	public List<ProductBillingBeanNew> getTaxDetailsForProductBillibg(String fkProductId,String billno)
	{
		System.out.println(fkProductId + "    -----------   fkid In dao");
		HibernateUtility hbu = null;
		Session session = null;

		List<ProductBillingBeanNew> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);

			if(billno !=null) {


			Query query2 = session.createSQLQuery("SELECT product_name,description,hsn_sac,unit_price,quantity,discount_percent,discount_amount,sub_total,CGST,SGST,IGST,tax_amount,total,fk_product_id,amount,bill_no,pk_perfroma_bill_id from perfroma_billing WHERE bill_no = :billno ");
			query2.setParameter("billno", billno);

			List<Object[]> list = query2.list();
			expenseList = new ArrayList<ProductBillingBeanNew>(0);

			for (Object[] object : list)
			{
				ProductBillingBeanNew reports = new ProductBillingBeanNew();
				reports.setProductName(object[0].toString());
				reports.setUnitPrice(Double.parseDouble(object[3].toString()));
				reports.setDescription(object[1].toString());
				reports.setHsnSac((object[2].toString()));
				reports.setCGST(Double.parseDouble(object[8].toString()));
				reports.setSGST(Double.parseDouble(object[9].toString()));
				reports.setFkProductId(Long.parseLong(object[13].toString()));

				Double sgst = (Double) object[8];
				Double cgst = (Double) object[9];

				Double taxPer = sgst+cgst;

				reports.setQuantity(Long.parseLong(object[4].toString()));
				reports.setAmount(Double.parseDouble(object[14].toString()));
				reports.setDiscountPercent(Double.parseDouble(object[5].toString()));
				reports.setDiscountAmount(Double.parseDouble(object[6].toString()));
				reports.setSubTotal(Double.parseDouble(object[7].toString()));

				reports.setIGST(Double.parseDouble(object[10].toString()));
				reports.setTaxAmount(Double.parseDouble(object[11].toString()));
				reports.setTotal(Double.parseDouble(object[12].toString()));
				reports.setBillNo(object[15].toString());
				//reports.setPkProductBillId(Long.parseLong(object[16].toString()));

				reports.setTaxPercentage(taxPer);

				expenseList.add(reports);

			}}
			else {
				Query query2 = session.createSQLQuery("SELECT product_cost, tax_type, tax_percentage, CGST, SGST,product_name,pk_product_details_id,hsn_sac FROM product_details WHERE pk_product_details_id = :fkProductId ");
				query2.setParameter("fkProductId", fkProductId);

				List<Object[]> list = query2.list();
				expenseList = new ArrayList<ProductBillingBeanNew>(0);

				for (Object[] object : list)
				{
					ProductBillingBeanNew reports = new ProductBillingBeanNew();

					reports.setUnitPrice(Double.parseDouble(object[0].toString()));
					reports.setTaxType(object[1].toString());
					reports.setTaxPercentage(Double.parseDouble(object[2].toString()));
					reports.setCGST(Double.parseDouble(object[3].toString()));
					reports.setSGST(Double.parseDouble(object[4].toString()));
					reports.setFkProductId(Long.parseLong(object[6].toString()));
					reports.setProductName(object[5].toString());
					reports.setHsnSac(object[7].toString());
					//reports.setUnitPrice(productCost);
					reports.setQuantity(0l);
					reports.setAmount(0d);
					reports.setDiscountPercent(0d);
					reports.setDiscountAmount(0d);
					reports.setSubTotal(0d);

					reports.setIGST(0d);
					reports.setTaxAmount(0d);
					reports.setTotal(0d);
					reports.setBillNo("00");
					expenseList.add(reports);
			}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;
	}

	//getProductLastBillNo
	public List getProductLastBillNo()
	{
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<ProductBillingBeanNew> billList = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select client_name, bill_no from product_billing ORDER BY bill_no DESC LIMIT 1");
			List<Object[]> list = query.list();

			billList = new ArrayList<ProductBillingBeanNew>(0);

			for(Object[] o : list)
			{
				System.out.println("rslt "+Arrays.toString(o));
				ProductBillingBeanNew bean = new ProductBillingBeanNew();

				bean.setClientName(o[0].toString());
				bean.setBillNo(o[1].toString());

				billList.add(bean);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("Success getProductLastBillNo");
		return billList;
	}


	public List getProfrmaLastBillNo()
	{
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<ProductBillingBeanNew> billList = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select client_name, bill_no from perfroma_billing ORDER BY bill_no DESC LIMIT 1");
			List<Object[]> list = query.list();

			billList = new ArrayList<ProductBillingBeanNew>(0);

			for(Object[] o : list)
			{
				System.out.println("rslt "+Arrays.toString(o));
				ProductBillingBeanNew bean = new ProductBillingBeanNew();

				bean.setClientName(o[0].toString());
				bean.setBillNo(o[1].toString());

				billList.add(bean);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("Success getProductLastBillNo");
		return billList;
	}


	//getAllProductNames for product billing and client/product quotation
	public List getAllProductNames()
	{
		HibernateUtility hbu=null;
		Session session=null;

		List list=null;

		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from ProductDetailsHibernate");
		 list = query.list();
		}catch(Exception e){
			Log.error("Error in ProductDetailsHibernate",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);
		}
		}
		return list;
	}

	//saveProductBillingDetails
	public void saveProductBillingDetails(ProductBillingHibernateNew hibernate)
	{
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(hibernate);
			transaction.commit();
			System.out.println("Successful");
		} catch (RuntimeException e) {

			try {
				transaction.rollback();
			} catch (RuntimeException e2) {

				Log.error("Error in ProductBillingHibernateNew", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
	}

	public void saveProductBillingDetails1(perfromabillingHibernate hibernate)
	{
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(hibernate);
			transaction.commit();
			System.out.println("Successful");
		} catch (RuntimeException e) {

			try {
				transaction.rollback();
			} catch (RuntimeException e2) {

				Log.error("Error in ProductBillingHibernateNew", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
	}

	//getProductBillingListNew
	public List getProductBillingListNew()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ProductBillingBeanNew> productBillingList = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT bill_no, bill_date, client_name, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, CGST, SGST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total,Ship_Address,Courier_Name,Courier_number FROM product_billing");
			List<Object[]> list = query.list();

			productBillingList = new ArrayList<ProductBillingBeanNew>(0);

			int i=0;
			for (Object[] o : list)
			{
				i++;

				/* bill_no, bill_date, client_name, product_name, description, hsn_sac, unit_price, quantity, amount,
				 *  discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total,
				 *   total_tax_amount, gross_total*/

				ProductBillingBeanNew bean = new ProductBillingBeanNew();

				bean.setSrNo(i);

				bean.setBillNo(o[0].toString());
				bean.setBillDate((Date) o[1]);
				bean.setClientName(o[2].toString());
				bean.setProductName(o[3].toString());
				bean.setDescription(o[4].toString());
				bean.setHsnSac(o[5].toString());
				bean.setUnitPrice(Double.parseDouble(o[6].toString()));
				bean.setQuantity(Long.parseLong(o[7].toString()));
				bean.setAmount(Double.parseDouble(o[8].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[9].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[10].toString()));
				bean.setSubTotal(Double.parseDouble(o[11].toString()));
				bean.setCGST(Double.parseDouble(o[12].toString()));
				bean.setSGST(Double.parseDouble(o[13].toString()));
				bean.setIGST(Double.parseDouble(o[14].toString()));
				bean.setTaxAmount(Double.parseDouble(o[15].toString()));
				bean.setTotal(Double.parseDouble(o[16].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[18].toString()));
				bean.setGrossTotal(Double.parseDouble(o[19].toString()));
				bean.setShipAdreess((o[20].toString()));
				bean.setCuriorName((o[21].toString()));
				bean.setTrackingNumber((o[22].toString()));
				productBillingList.add(bean);
			}
		}catch(RuntimeException e){
			System.out.println(e);
		}
		finally{
			hbu.closeSession(session);
		}
		return productBillingList;
	}

	//getProductBillingReportByNameAndDates
	public List getProductBillingReportByNameAndDates(String fkClientId,String clientName, String startDate, String endDate)
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ProductBillingBeanNew> productBillingList=null;
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT bill_no, bill_date, client_name, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, CGST, SGST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total,Ship_Address,Courier_Name,Courier_number FROM product_billing WHERE client_name='"+clientName+"' AND fk_client_id='"+fkClientId+"' AND bill_date BETWEEN '"+startDate+"' AND '"+endDate+"'");
			List<Object[]> list = query.list();
			productBillingList= new ArrayList<ProductBillingBeanNew>(0);

			int i=0;
			for (Object[] o : list)
			{
				i++;

				/*"SELECT bill_no, bill_date, client_name, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent,
				 *  discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM product_billing
				 *   WHERE client_name='"+clientName+"' AND fk_client_id='"+fkClientId+"' AND bill_date BETWEEN '"+startDate+"' AND '"+endDate+"'"*/

				ProductBillingBeanNew bean = new ProductBillingBeanNew();

				bean.setSrNo(i);

				bean.setBillNo(o[0].toString());
				bean.setBillDate((Date) o[1]);
				bean.setClientName(o[2].toString());
				bean.setProductName(o[3].toString());
				bean.setDescription(o[4].toString());
				bean.setHsnSac(o[5].toString());
				bean.setUnitPrice(Double.parseDouble(o[6].toString()));
				bean.setQuantity(Long.parseLong(o[7].toString()));
				bean.setAmount(Double.parseDouble(o[8].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[9].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[10].toString()));
				bean.setSubTotal(Double.parseDouble(o[11].toString()));
				bean.setCGST(Double.parseDouble(o[12].toString()));
				bean.setSGST(Double.parseDouble(o[13].toString()));
				bean.setIGST(Double.parseDouble(o[14].toString()));
				bean.setTaxAmount(Double.parseDouble(o[15].toString()));
				bean.setTotal(Double.parseDouble(o[16].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[18].toString()));
				bean.setGrossTotal(Double.parseDouble(o[19].toString()));
				bean.setShipAdreess((o[20].toString()));
				bean.setCuriorName((o[21].toString()));
				bean.setTrackingNumber((o[22].toString()));
				System.out.println(bean.getShipAdreess()+" name"+bean.getCuriorName());

				productBillingList.add(bean);
			}
		}catch(RuntimeException e){

		}
		finally{
			hbu.closeSession(session);
		}
		return productBillingList;
	}

	public List getpfromaBillingReportByNameAndDates(String fkClientId,String clientName, String startDate, String endDate)
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ProductBillingBeanNew> productBillingList=null;
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT bill_no, bill_date, client_name, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, CGST, SGST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM perfroma_billing WHERE client_name='"+clientName+"' AND fk_client_id='"+fkClientId+"' AND bill_date BETWEEN '"+startDate+"' AND '"+endDate+"' GROUP BY bill_no");
			List<Object[]> list = query.list();
			productBillingList= new ArrayList<ProductBillingBeanNew>(0);

			int i=0;
			for (Object[] o : list)
			{
				i++;

				/*"SELECT bill_no, bill_date, client_name, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent,
				 *  discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM product_billing
				 *   WHERE client_name='"+clientName+"' AND fk_client_id='"+fkClientId+"' AND bill_date BETWEEN '"+startDate+"' AND '"+endDate+"'"*/

				ProductBillingBeanNew bean = new ProductBillingBeanNew();

				bean.setSrNo(i);

				bean.setBillNo(o[0].toString());
				bean.setBillDate((Date) o[1]);
				bean.setClientName(o[2].toString());
				bean.setProductName(o[3].toString());
				bean.setDescription(o[4].toString());
				bean.setHsnSac(o[5].toString());
				bean.setUnitPrice(Double.parseDouble(o[6].toString()));
				bean.setQuantity(Long.parseLong(o[7].toString()));
				bean.setAmount(Double.parseDouble(o[8].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[9].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[10].toString()));
				bean.setSubTotal(Double.parseDouble(o[11].toString()));
				bean.setCGST(Double.parseDouble(o[12].toString()));
				bean.setSGST(Double.parseDouble(o[13].toString()));
				bean.setIGST(Double.parseDouble(o[14].toString()));
				bean.setTaxAmount(Double.parseDouble(o[15].toString()));
				bean.setTotal(Double.parseDouble(o[16].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[18].toString()));
				bean.setGrossTotal(Double.parseDouble(o[19].toString()));


				productBillingList.add(bean);
			}
		}catch(RuntimeException e){

		}
		finally{
			hbu.closeSession(session);
		}
		return productBillingList;
	}














	//Old Product Billing coding methods


	public void valProductBillingDetails(ProductBillingHibernate bean) {

		System.out.println("IN DAO");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;

		/*
		long pk_product_Billing_id = bean.getGetPkProductBillingId();
		long fk_vendor_id = bean.getFkVendorId();
		String vendor_name = bean.getVendorName();
		String date_of_billing = bean.getBillingDate().toString();
		long  sr_number = bean.getSrNO();
		String description = bean.getDescription1();
		long quantity = bean.getQuantity1();
		double unit_price = bean.getUnit1();
		double amount = bean.getAmount1();
		double sub_total = bean.getSubTotal1();
		double gst = bean.getGst1();
		double vat = bean.getVat1();
		double gross_total = bean.getGrossTotal2();*/



		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			/*Query q = session.createSQLQuery("insert into product_billing_details(pk_product_Billing_id,fk_vendor_id,vendor_name,date_of_billing,sr_number,description,quantity,unit_price,amount,sub_total,gst,vat,gross_total) values(pk_product_Billing_id,fk_vendor_id,vendor_name,date_of_billing,sr_number,description,quantity,unit_price,amount,sub_total,gst,vat,gross_total)");
			q.executeUpdate();*/
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

	public void saveProductBillInfo(ProductBillingHibernate bn)
	{
		System.out.println("IN DAO");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(bn);
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

  public List getProductBillingList()
  {
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<ProductBillingBean> proList = null;

	  try
	  {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();

			Query query = session.createSQLQuery("SELECT vendor_name, date_of_billing, description,quantity, unit_price, amount, sub_total, gst, vat, gross_total, grid_amount, grid_discount_percent, grid_discount_amount, grid_sub_total, grid_gst_percent, grid_gst_percent_amount FROM embel_soft.product_billing_details;");
			List<Object[]> list = query.list();

			proList = new ArrayList<ProductBillingBean>(0);

			for(Object[] o : list)
			{
				ProductBillingBean report = new ProductBillingBean();

				report.setClientName(o[0].toString());


				String d1 = o[1].toString();
				String[] edate = d1.split("-");
				String DateOfBilling = edate[2]+"-"+edate[1]+"-"+edate[0];
				report.setDateOfBilling(DateOfBilling);

				report.setDescription(o[2].toString());
				report.setQuantity(Long.parseLong(o[3].toString()));
				report.setBuyPrice(Double.parseDouble(o[4].toString()));
				report.setTotal(Double.parseDouble(o[5].toString()));
				report.setSubTotal(Double.parseDouble(o[6].toString()));
				report.setGst(Double.parseDouble(o[7].toString()));
				report.setGstAmount(Double.parseDouble(o[8].toString()));
				report.setGrossTotal(Double.parseDouble(o[9].toString()));
				report.setGridAmount(Double.parseDouble(o[10].toString()));
				report.setGridDiscountPercent(Double.parseDouble(o[11].toString()));
				report.setGridDiscountAmount(Double.parseDouble(o[12].toString()));
				report.setGridSubTotal(Double.parseDouble(o[13].toString()));
				report.setGridGstPercent(Double.parseDouble(o[14].toString()));
				report.setGridGstPercentAmount(Double.parseDouble(o[15].toString()));

				proList.add(report);
			}

	  }

	  catch (Exception e)
	  {
		// TODO: handle exception
	  }

	return proList;

  }


	public List getClientBill()
	{
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<ProductBillingBean> billList = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select vendor_name, bill_nos from product_billing_details ORDER BY bill_nos DESC LIMIT 1");
			List<Object[]> list = query.list();

			billList = new ArrayList<ProductBillingBean>(0);

			for(Object[] o : list)
			{
				ProductBillingBean bean = new ProductBillingBean();

				bean.setClientName(o[0].toString());
				bean.setBillNo(o[1].toString());

				billList.add(bean);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return billList;
	}


	public void saveProductBillInfoInPO(PurchaseHibernate bn)
	{
		System.out.println("IN DAO");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(bn);
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


	// get Vendor Name For Report
		public List getAllVendorname()
		{
			HibernateUtility hbu = null;
			Session session = null;
			Query query = null;
			List list = null;

			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				query = session.createQuery("FROM ProductBillingHibernate GROUP BY vendorName");
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


	// get all Vendor Payment Report By Date And Name
				public List getVendorBillingReportByDateAndName(String fkVendorPaymentId,String vendorName, String startDate, String endDate)
				{

					HibernateUtility hbu=null;
					Session session=null;
					List<HrBillingBean> venList=null;
				try{

					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();


					Query query=session.createSQLQuery("select vendor_name, bill_no, date_of_billing, description, quantity,unit_price, gst, vat, gross_total from hr_billing_details WHERE vendor_name='"+vendorName+"' AND fk_vendor_payment_id='"+fkVendorPaymentId+"' AND insert_date BETWEEN '"+startDate+"' AND '"+endDate+"'");
					List<Object[]> list = query.list();
					venList= new ArrayList<HrBillingBean>(0);

					int i=0;
					for (Object[] o : list)
					{

						i++;
						HrBillingBean reports = new HrBillingBean();

						reports.setVendorName(o[0].toString());
						reports.setBillNo(o[1].toString());
						reports.setTotal(Double.parseDouble(o[2].toString()));
						reports.setDescription(o[3].toString());//RemainingAmount(Double.parseDouble(o[2].toString()));
						reports.setQuantity(Long.parseLong(o[4].toString()));//(Double.parseDouble(o[3].toString()));
						reports.setBuyPrice(Double.parseDouble(o[5].toString()));
						reports.setGst(Double.parseDouble(o[6].toString()));
						reports.setVat(Double.parseDouble(o[7].toString()));
						reports.setGrossTotal(Double.parseDouble(o[8].toString()));
				/*
				 * Double remAmount = Double.parseDouble(o[2].toString()); Double paidAmount =
				 * Double.parseDouble(o[3].toString());
				 *
				 * Double balanceAmount = remAmount - paidAmount;
				 */
						//reports.setBalanceAmount(balanceAmount);

						String d = o[4].toString();
						String dt[] = d.split("-");
						String insertDate = dt[2]+"-"+dt[1]+"-"+dt[0];

						reports.setDate(insertDate);
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


	// get all Vendor Payment Report By Date And Name For Product Billing
				public List getClientHrBillingReportByDateAndName(String fkVendorPaymentId,String vendorName, String startDate, String endDate)
				{

					HibernateUtility hbu=null;
					Session session=null;
					List<ProductBillingBean> venList=null;
				try{

					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();


					Query query=session.createSQLQuery("select vendor_name, bill_nos, date_of_billing,  description, quantity,unit_price, gst, vat, gross_total, grid_amount, grid_discount_percent, grid_discount_amount, grid_sub_total, grid_gst_percent,grid_gst_percent_amount, amount from product_billing_details WHERE vendor_name='"+vendorName+"' AND date_of_billing BETWEEN '"+startDate+"' AND '"+endDate+"'");
					List<Object[]> list = query.list();
					venList= new ArrayList<ProductBillingBean>(0);

					int i=0;
					for (Object[] o : list)
					{

						i++;
						ProductBillingBean reports = new ProductBillingBean();

						//reports.setVendorName(o[0].toString());
						reports.setClientName(o[0].toString());
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
						reports.setVat1(Double.parseDouble(o[7].toString()));
						reports.setGrossTotal(Double.parseDouble(o[8].toString()));
						reports.setGridAmount(Double.parseDouble(o[9].toString()));
						reports.setGridDiscountPercent(Double.parseDouble(o[10].toString()));
						reports.setGridDiscountAmount(Double.parseDouble(o[11].toString()));
						reports.setGridSubTotal(Double.parseDouble(o[12].toString()));
						reports.setGridGstPercent(Double.parseDouble(o[13].toString()));
						reports.setGridGstPercentAmount(Double.parseDouble(o[14].toString()));
						reports.setTotal(Double.parseDouble(o[15].toString()));


						System.out.println(reports.getClientName());
						System.out.println(reports.getBillNo());
						System.out.println(reports.getDateOfBilling());
						System.out.println(reports.getTotal());
						System.out.println(reports.getDescription());
						System.out.println(reports.getQuantity());
						System.out.println(reports.getBuyPrice());
						System.out.println(reports.getGst());
						System.out.println(reports.getVat1());
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

				public List getProductBillingReportByNameAndDates1( String startDate, String endDate)
				{
					HibernateUtility hbu=null;
					Session session=null;
					List<ProductBillingBeanNew> productBillingList=null;
					try{
						hbu = HibernateUtility.getInstance();
						session = hbu.getHibernateSession();

						Query query = session.createSQLQuery("SELECT bill_no, bill_date, client_name, pb.product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, CGST, SGST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total,Ship_Address,Courier_Name,Courier_number, cd.Gst_No FROM product_billing pb JOIN client_enquiry_details cd on pb.fk_client_id=cd.pk_client_enquiry_id WHERE bill_date BETWEEN '"+startDate+"' AND '"+endDate+"' ORDER BY bill_no");
						List<Object[]> list = query.list();
						productBillingList= new ArrayList<ProductBillingBeanNew>(0);

						int i=0;
						for (Object[] o : list)
						{
							i++;

							/*"SELECT bill_no, bill_date, client_name, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent,
							 *  discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM product_billing
							 *   WHERE client_name='"+clientName+"' AND fk_client_id='"+fkClientId+"' AND bill_date BETWEEN '"+startDate+"' AND '"+endDate+"'"*/

							ProductBillingBeanNew bean = new ProductBillingBeanNew();

							bean.setSrNo(i);

							bean.setBillNo(o[0].toString());
							bean.setBillDate((Date) o[1]);
							bean.setClientName(o[2].toString());
							bean.setProductName(o[3].toString());
							bean.setDescription(o[4].toString());
							bean.setHsnSac(o[5].toString());
							bean.setUnitPrice(Double.parseDouble(o[6].toString()));
							bean.setQuantity(Long.parseLong(o[7].toString()));
							bean.setAmount(Double.parseDouble(o[8].toString()));
							bean.setDiscountPercent(Double.parseDouble(o[9].toString()));
							bean.setDiscountAmount(Double.parseDouble(o[10].toString()));
							bean.setSubTotal(Double.parseDouble(o[11].toString()));
							bean.setCGST(Double.parseDouble(o[12].toString()));
							bean.setSGST(Double.parseDouble(o[13].toString()));
							bean.setIGST(Double.parseDouble(o[14].toString()));
							bean.setTaxAmount(Double.parseDouble(o[15].toString()));
							bean.setTotal(Double.parseDouble(o[16].toString()));
							bean.setTotalSubTotal(Double.parseDouble(o[17].toString()));
							bean.setTotalTaxAmount(Double.parseDouble(o[18].toString()));
							bean.setGrossTotal(Double.parseDouble(o[19].toString()));
							bean.setShipAdreess((o[20].toString()));
							bean.setCuriorName((o[21].toString()));
							bean.setTrackingNumber((o[22].toString()));
							bean.setGSTNo((o[23].toString()));


							productBillingList.add(bean);
						}
					}catch(RuntimeException e){

					}
					finally{
						hbu.closeSession(session);
					}
					return productBillingList;
				}

				public List getProductBillingReportByNameAndDates11( String startDate, String endDate)
				{
					HibernateUtility hbu=null;
					Session session=null;
					List<ProductBillingBeanNew> productBillingList=null;
					try{
						hbu = HibernateUtility.getInstance();
						session = hbu.getHibernateSession();

						Query query = session.createSQLQuery("SELECT bill_no, bill_date, client_name, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, CGST, SGST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM perfroma_billing WHERE bill_date BETWEEN '"+startDate+"' AND '"+endDate+"' ORDER BY bill_no");
						List<Object[]> list = query.list();
						productBillingList= new ArrayList<ProductBillingBeanNew>(0);

						int i=0;
						for (Object[] o : list)
						{
							i++;

							ProductBillingBeanNew bean = new ProductBillingBeanNew();

							bean.setSrNo(i);

							bean.setBillNo(o[0].toString());
							bean.setBillDate((Date) o[1]);
							bean.setClientName(o[2].toString());
							bean.setProductName(o[3].toString());
							bean.setDescription(o[4].toString());
							bean.setHsnSac(o[5].toString());
							bean.setUnitPrice(Double.parseDouble(o[6].toString()));
							bean.setQuantity(Long.parseLong(o[7].toString()));
							bean.setAmount(Double.parseDouble(o[8].toString()));
							bean.setDiscountPercent(Double.parseDouble(o[9].toString()));
							bean.setDiscountAmount(Double.parseDouble(o[10].toString()));
							bean.setSubTotal(Double.parseDouble(o[11].toString()));
							bean.setCGST(Double.parseDouble(o[12].toString()));
							bean.setSGST(Double.parseDouble(o[13].toString()));
							bean.setIGST(Double.parseDouble(o[14].toString()));
							bean.setTaxAmount(Double.parseDouble(o[15].toString()));
							bean.setTotal(Double.parseDouble(o[16].toString()));
							bean.setTotalSubTotal(Double.parseDouble(o[17].toString()));
							bean.setTotalTaxAmount(Double.parseDouble(o[18].toString()));
							bean.setGrossTotal(Double.parseDouble(o[19].toString()));



							productBillingList.add(bean);
						}
					}catch(RuntimeException e){

					}
					finally{
						hbu.closeSession(session);
					}
					return productBillingList;
				}


				public void updateAdvanceBooking(String bookingNoAB, String productBillNo)
				{
					System.out.println("updateAdvanceBooking bookingNoAB  ===>  "+bookingNoAB);
					HibernateUtility hbu = null;
					Session session = null;
					Transaction tx = null;

					try
					{
						hbu = HibernateUtility.getInstance();
						session = hbu.getHibernateSession();
						tx = session.beginTransaction();

						Query updateAdvanceBooking = session.createSQLQuery("update perfroma_billing set productBillNo = '"+productBillNo+"' where bill_no = '"+bookingNoAB+"'");
						updateAdvanceBooking.executeUpdate();
						tx.commit();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				}

				// in jsp
				public List getAllPIBillNo()
				{
					HibernateUtility hbu=null;
					Session session=null;
					List list=null;
					try{
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 Query query = session.createQuery("FROM perfromabillingHibernate");
					 list = query.list();



					}catch(Exception e){
						Log.error("Error in getAllPIBillNo",e);
					}
					finally{
						if(session!=null){
						hbu.closeSession(session);
					}
					}


					return list;
				}

				public List getProdEditbillnoAgainst(String fkClientId) {


						System.out.println("Ankit........."+fkClientId);
						HibernateUtility hbu = null ;
						Session session = null;
						List list  = null;
						try {
							hbu = HibernateUtility.getInstance();
							session = hbu.getHibernateSession();

							Query query = session.createSQLQuery("SELECT pk_product_bill_id,bill_no FROM product_billing WHERE fk_client_id='"+fkClientId+"'  GROUP BY bill_no");	// AND productBillNo IS NULL

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


		public List<ProductBillingBeanNew> getEditGridForProductBilling(String fkProductId, String billno) {
					{
						System.out.println(fkProductId + "    -----------   fkid In dao");
						HibernateUtility hbu = null;
						Session session = null;

						List<ProductBillingBeanNew> expenseList = null;
						try {
							hbu = HibernateUtility.getInstance();
							session = hbu.getHibernateSession();
							//System.out.println("Name "+employeeName);

							if(billno !=null) {


							Query query2 = session.createSQLQuery("SELECT product_name,description,hsn_sac,unit_price,quantity,discount_percent,discount_amount,sub_total,CGST,SGST,IGST,tax_amount,total,fk_product_id,amount,bill_no,pk_product_bill_id,total_tax_amount,total_sub_total,gross_total from product_billing WHERE bill_no = :billno ");
							query2.setParameter("billno", billno);

							List<Object[]> list = query2.list();
							expenseList = new ArrayList<ProductBillingBeanNew>(0);

							for (Object[] object : list)
							{
								ProductBillingBeanNew reports = new ProductBillingBeanNew();
								reports.setProductName(object[0].toString());
								reports.setUnitPrice(Double.parseDouble(object[3].toString()));
								reports.setDescription(object[1].toString());
								reports.setHsnSac((object[2].toString()));
								reports.setCGST(Double.parseDouble(object[8].toString()));
								reports.setSGST(Double.parseDouble(object[9].toString()));
								reports.setFkProductId(Long.parseLong(object[13].toString()));

								Double sgst = (Double) object[8];
								Double cgst = (Double) object[9];

								Double taxPer = sgst+cgst;

								reports.setQuantity(Long.parseLong(object[4].toString()));
								reports.setAmount(Double.parseDouble(object[14].toString()));
								reports.setDiscountPercent(Double.parseDouble(object[5].toString()));
								reports.setDiscountAmount(Double.parseDouble(object[6].toString()));
								reports.setSubTotal(Double.parseDouble(object[7].toString()));

								reports.setIGST(Double.parseDouble(object[10].toString()));
								reports.setTaxAmount(Double.parseDouble(object[11].toString()));
								reports.setTotal(Double.parseDouble(object[12].toString()));
								reports.setBillNo(object[15].toString());
								reports.setPkProductBillId(Long.parseLong(object[16].toString()));
								reports.setTotalTaxAmount(Double.parseDouble(object[17].toString()));
								reports.setTotalSubTotal(Double.parseDouble(object[18].toString()));
								reports.setGrossTotal(Double.parseDouble(object[19].toString()));

								reports.setTaxPercentage(taxPer);

								expenseList.add(reports);

							}
						}
							else {
								Query query2 = session.createSQLQuery("SELECT product_cost, tax_type, tax_percentage, CGST, SGST,product_name,pk_product_details_id,hsn_sac FROM product_details WHERE pk_product_details_id = :fkProductId ");
								query2.setParameter("fkProductId", fkProductId);

								List<Object[]> list = query2.list();
								expenseList = new ArrayList<ProductBillingBeanNew>(0);

								for (Object[] object : list)
								{
									ProductBillingBeanNew reports = new ProductBillingBeanNew();

									reports.setUnitPrice(Double.parseDouble(object[0].toString()));
									reports.setTaxType(object[1].toString());
									reports.setTaxPercentage(Double.parseDouble(object[2].toString()));
									reports.setCGST(Double.parseDouble(object[3].toString()));
									reports.setSGST(Double.parseDouble(object[4].toString()));
									reports.setFkProductId(Long.parseLong(object[6].toString()));
									reports.setProductName(object[5].toString());
									reports.setHsnSac(object[7].toString());
									//reports.setUnitPrice(productCost);
									reports.setQuantity(1l);
									reports.setAmount(0d);
									reports.setDiscountPercent(0d);
									reports.setDiscountAmount(0d);
									reports.setSubTotal(0d);

									reports.setIGST(0d);
									reports.setTaxAmount(0d);
									reports.setTotal(0d);
									reports.setBillNo("00");
									expenseList.add(reports);
							}
						}

						} catch (Exception e) {
							e.printStackTrace();
						}
						return expenseList;
					}
}

		public List fetchEditProdBillDetails(String prodbillNo) {

				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createSQLQuery("SELECT pk_product_bill_id, Ship_Address, Courier_Name, Courier_number,bill_date,total_tax_amount,total_sub_total,gross_total FROM product_billing where bill_no='"+prodbillNo+"' ");
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

}