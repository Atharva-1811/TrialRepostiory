package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.ClientQuotationBean;
import com.embelSoft.bean.QuotationBean;
import com.embelSoft.hibernate.ClientQuotationHibernate;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.hibernate.QuotationHibernate;
import com.embelSoft.utility.HibernateUtility;

public class QuotationDao {

	public QuotationBean getTaxDetailsForClientQuotation(Long fkEmployeeid)
	{
		System.out.println(fkEmployeeid + "    -----------  In ProductDetailsDao ");
		HibernateUtility hbu = null;
		Session session = null;

		List<ProductDetailsHibernate> expenseList = null;
		QuotationBean bean = new QuotationBean();
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("SELECT product_name,description,hsn_sac, product_cost, tax_type, tax_percentage, CGST, SGST,pk_product_details_id FROM product_details WHERE pk_product_details_id = :fkEmployeeid ");
			query2.setParameter("fkEmployeeid", fkEmployeeid);

			List<Object[]> list = query2.list();
			expenseList = new ArrayList<ProductDetailsHibernate>(0);

			for (Object[] object : list)
			{
			//	ProductDetailsHibernate reports = new ProductDetailsHibernate();
				bean.setFkProductId(Long.parseLong(object[8].toString()));
				bean.setProductName(object[0].toString());
				bean.setDescription(object[1].toString());
				bean.setHsnSac(object[2].toString());
				Double uPrice = Double.parseDouble(object[3].toString());
				bean.setUnitPrice(uPrice);
				bean.setQuantity(0l);
				bean.setAmount(uPrice);
				bean.setSubTotal(uPrice);
				bean.setCGST(Double.parseDouble(object[6].toString()));
				bean.setSGST(Double.parseDouble(object[7].toString()));
				bean.setTotal(uPrice);
				Double gst = Double.parseDouble(object[6].toString()) +Double.parseDouble(object[7].toString());
			    bean.setTaxAmount(uPrice*(gst/100));
				/*
				 * reports.setProductCost(Double.parseDouble(object[0].toString()));
				 * System.out.println("IN DAO setProductCost(productCost) :"+reports.
				 * getProductCost()); reports.setTaxType(object[1].toString());
				 * reports.setTaxPercentage(Double.parseDouble(object[2].toString()));
				 * reports.setCGST(Double.parseDouble(object[3].toString()));
				 * reports.setSGST(Double.parseDouble(object[4].toString()));
				 * 
				 * expenseList.add(reports);
				 */

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public void valQuotationDetails(QuotationHibernate hibernate) {

		System.out.println("IN DAO");
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

				Log.error("Error in regEmpPayment", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}

	// Get Quotation Report For Vender
		public List getVenderQuotationReport()
		{
			HibernateUtility hbu=null;
			Session session=null;
			List<QuotationBean> quoList=null;

			try
			{

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				Query query=session.createSQLQuery("SELECT quotation_no, Type, vendor_name, date_of_quotation, company_name, company_address, state, zip, phone_no, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST,tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM quotation_details WHERE Type='vendor' ");
				List<Object[]> list = query.list();

				quoList = new ArrayList<QuotationBean>(0);

				int i=0;
				for(Object[] o : list)
				{
//				quotation_no, Type, vendor_name, date_of_quotation, company_name, company_address, state, zip, phone_no,
//				product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount,
//				sub_total, GST, IGST,tax_amount, total, total_sub_total, total_tax_amount, gross_total


					i++;
					QuotationBean report = new QuotationBean();


					report.setQuotationNo(o[0].toString());
					report.setType(o[1].toString());
					report.setVendorName(o[2].toString());
					report.setDateOfQuotation(o[3].toString());
					report.setCompanyName(o[4].toString());
					report.setCompanyAddress(o[5].toString());
					report.setState(o[6].toString());
					report.setZip(o[7].toString());
					report.setPhoneNo(o[8].toString());
//					report.setFeatures(o[10].toString());
//					report.setFeatures("N/A");
					report.setProductName(o[9].toString());
					report.setDescription(o[10].toString());
					report.setHsnSac(o[11].toString());
					report.setUnitPrice(Double.parseDouble(o[12].toString()));
					report.setQuantity(Long.parseLong(o[13].toString()));
					report.setAmount(Double.parseDouble(o[14].toString()));
					report.setDiscountPercent(Double.parseDouble(o[15].toString()));
					report.setDiscountAmount(Double.parseDouble(o[16].toString()));
					report.setSubTotal(Double.parseDouble(o[17].toString()));
					report.setGST(Double.parseDouble(o[18].toString()));
//					report.setSGST(Double.parseDouble(o[19].toString()));
					report.setIGST(Double.parseDouble(o[19].toString()));
					report.setTaxAmount(Double.parseDouble(o[20].toString()));
					report.setTotal(Double.parseDouble(o[21].toString()));
					report.setTotalSubTotal(Double.parseDouble(o[22].toString()));
					report.setTotalTaxAmount(Double.parseDouble(o[23].toString()));
					report.setGrossTotal(Double.parseDouble(o[24].toString()));

					report.setSrNo(i);

					quoList.add(report);
				}
			}
			catch (Exception e)
			{
				// TODO: handle exception
			}
			System.out.println("LAST DAO ::"+quoList.size());
			return quoList;
		}

	// Get Quotation List For Data Table
	public List getQuotationList()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<QuotationBean> quoList=null;

		try
		{

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT vendor_name, Type, date_of_quotation, company_name, company_address, state, zip, phone_no, description, unit_price, quantity,total, sub_total, gst, gst_amount, discount, discount_amount, gross_total,quotation_no FROM quotation_details");
			List<Object[]> list = query.list();

			quoList = new ArrayList<QuotationBean>(0);

			int i=0;
			for(Object[] o : list)
			{
				i++;
				QuotationBean report = new QuotationBean();

				report.setVendorName(o[0].toString());

				report.setType(o[1].toString());

				String d1 = o[2].toString();
				String[] edate = d1.split("-");
				String DateOfQuotation = edate[2]+"-"+edate[1]+"-"+edate[0];
				report.setDateOfQuotation(DateOfQuotation);

				report.setCompanyName(o[3].toString());
				report.setCompanyAddress(o[4].toString());
				report.setState(o[5].toString());
				report.setZip(o[6].toString());
				report.setPhoneNo(o[7].toString());
				report.setDescription(o[8].toString());
				report.setUnitPrice(Double.parseDouble(o[9].toString()));
				report.setQuantity(Long.parseLong(o[10].toString()));
				report.setTotal(Double.parseDouble(o[11].toString()));
				report.setSubTotal(Double.parseDouble(o[12].toString()));
				report.setGst(Double.parseDouble(o[13].toString()));
				report.setGstAmount(Double.parseDouble(o[14].toString()));

				/*report.setTotalWithGst(Double.parseDouble(o[17].toString()));*/
				report.setDiscount(Double.parseDouble(o[15].toString()));
				report.setDiscountAmount(Double.parseDouble(o[16].toString()));
				report.setGrossTotal(Double.parseDouble(o[17].toString()));
				report.setQuotationNo(o[18].toString());

				report.setSrNo(i);


				quoList.add(report);


			}

		}
		catch (Exception e)
		{
			// TODO: handle exception
		}
		return quoList;



	}



	public List getQuotationNo()
	{

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<QuotationBean> quoNo = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT vendor_name, quotation_no FROM embel_soft.quotation_details order by quotation_no Desc limit 1;");
			List<Object[]> list = query.list();



			quoNo = new ArrayList<QuotationBean>(0);

			for(Object[] o : list)
			{
				QuotationBean bean = new QuotationBean();

				bean.setVendorName(o[0].toString());
				bean.setQuotationNo(o[1].toString());

				quoNo.add(bean);

			}


		} catch (Exception e) {
			// TODO: handle exception
		}

		return quoNo;

	}




	// Get Quotation Report For Vendor
	public List getVendorRecordsForQuo()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<QuotationBean> quoList=null;

		try
		{

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT vendor_name, Type, date_of_quotation, company_name, company_address, state, zip, phone_no, product_Name, description, unit_price, quantity,total, sub_total, gst, gst_amount, discount, discount_amount, gross_total, quotation_no FROM quotation_details WHERE Type='vendor' ");
			List<Object[]> list = query.list();

			quoList = new ArrayList<QuotationBean>(0);

			int i=0;
			for(Object[] o : list)
			{
				i++;
				QuotationBean report = new QuotationBean();

				report.setVendorName(o[0].toString());
				report.setType(o[1].toString());

				String d1 = o[2].toString();
				String[] edate = d1.split("-");
				String DateOfQuotation = edate[2]+"-"+edate[1]+"-"+edate[0];

				report.setDateOfQuotation(DateOfQuotation);

				report.setCompanyName(o[3].toString());
				report.setCompanyAddress(o[4].toString());
				//report.setCity(o[5].toString());
				report.setState(o[5].toString());
				report.setZip(o[6].toString());
				report.setPhoneNo(o[7].toString());
				report.setProductName(o[8].toString());
				report.setDescription(o[9].toString());
				report.setUnitPrice(Double.parseDouble(o[10].toString()));
				report.setQuantity(Long.parseLong(o[11].toString()));
				report.setTotal(Double.parseDouble(o[12].toString()));
				report.setSubTotal(Double.parseDouble(o[13].toString()));
				report.setGst(Double.parseDouble(o[14].toString()));
				report.setGstAmount(Double.parseDouble(o[15].toString()));

				/*report.setTotalWithGst(Double.parseDouble(o[17].toString()));*/
				report.setDiscount(Double.parseDouble(o[16].toString()));
				report.setDiscountAmount(Double.parseDouble(o[17].toString()));
				report.setGrossTotal(Double.parseDouble(o[18].toString()));
				report.setQuotationNo(o[19].toString());

				System.out.println("----------------------  ::"+o[0].toString());
				System.out.println("----------------------  ::"+o[1].toString());
				System.out.println("----------------------  ::"+o[2].toString());
				System.out.println("----------------------  ::"+o[3].toString());
				System.out.println("----------------------  ::"+o[4].toString());
				System.out.println("----------------------  ::"+o[5].toString());
				System.out.println("----------------------  ::"+o[6].toString());
				System.out.println("----------------------  ::"+o[7].toString());
				System.out.println("----------------------  ::"+o[8].toString());
				System.out.println("----------------------  ::"+o[9].toString());
				System.out.println("----------------------  ::"+o[10].toString());
				System.out.println("----------------------  ::"+o[11].toString());
				System.out.println("----------------------  ::"+o[12].toString());
				System.out.println("----------------------  ::"+o[13].toString());
				System.out.println("----------------------  ::"+o[14].toString());
				System.out.println("----------------------  ::"+o[15].toString());
				System.out.println("----------------------  ::"+o[16].toString());
				System.out.println("----------------------  ::"+o[17].toString());
				System.out.println("----------------------  ::"+o[18].toString());

				report.setSrNo(i);

				quoList.add(report);


			}

		}
		catch (Exception e)
		{
			// TODO: handle exception
		}
		System.out.println("LAST DAO ::"+quoList.size());
		return quoList;



	}


		public List getQOCreateBill()
		{

			HibernateUtility hbu = null;
			Session session = null;
			Transaction transaction = null;
			List<QuotationBean> lastBillNo = null;

			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("select vendor_name, quotation_no from quotation_details order by quotation_no DESC limit 1");
				List<Object[]> list = query.list();

				System.out.println("Size in JSP   :   -     "+list.size());

				lastBillNo = new ArrayList<QuotationBean>(0);

				for(Object[] o : list)
				{
					QuotationBean bean = new QuotationBean();

					bean.setVendorName(o[0].toString());
					bean.setQuotationNo(o[1].toString());;

					lastBillNo.add(bean);

				}


			} catch (Exception e) {
				// TODO: handle exception
			}

			System.out.println("Size in JSP   :   -     "+lastBillNo.size());

			return lastBillNo;

		}



	//client Quotation
	int a;



	public List getClientQuotationNo()
	{

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<ClientQuotationBean> quoNo = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT client_name, quotation_no FROM embel_soft.client_quotation_details order by quotation_no Desc limit 1;");
			List<Object[]> list = query.list();



			quoNo = new ArrayList<ClientQuotationBean>(0);

			for(Object[] o : list)
			{
				ClientQuotationBean bean = new ClientQuotationBean();

				bean.setClientName(o[0].toString());
				bean.setQuotationNo(o[1].toString());

				quoNo.add(bean);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return quoNo;

	}

	public List getClientQuotationNoDB()
	{

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<ClientQuotationBean> lastBillNo = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select client_name, quotation_no from client_quotation_details order by quotation_no DESC limit 1");
			List<Object[]> list = query.list();

			System.out.println("Size in JSP   :   -     "+list.size());

			lastBillNo = new ArrayList<ClientQuotationBean>(0);

			for(Object[] o : list)
			{
				ClientQuotationBean bean = new ClientQuotationBean();

				bean.setClientName(o[0].toString());
				bean.setQuotationNo(o[1].toString());

				lastBillNo.add(bean);
			}


		} catch (Exception e) {
			// TODO: handle exception
			//e.printStackTrace();
		}

		System.out.println("Size in JSP   :   -     "+lastBillNo.size());

		return lastBillNo;

	}


	public void saveClientQuotationDetails(ClientQuotationHibernate hibernate) {

		System.out.println("IN DAO");
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

				Log.error("Error in regEmpPayment", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}


	// Get Quotation Report For Client
	public List getClientQuotationReport()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ClientQuotationBean> quoList=null;

		try
		{

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT quotation_no, date_of_quotation, Type, client_name, company_name, company_address, state, zip, phone_no, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, CGST, SGST, IGST,tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM client_quotation_details WHERE Type='client' ORDER BY quotation_no");
			List<Object[]> list = query.list();

			quoList = new ArrayList<ClientQuotationBean>(0);

			int i=0;
			for(Object[] o : list)
			{

//				quotation_no, Type, date_of_quotation, client_name, company_name, company_address, state, zip, phone_no,
//				features, product_name, description, hsn_sac, unit_price, quantity, amount,
//				discount_percent, discount_amount, sub_total, CGST, SGST, IGST,tax_amount, total, total_sub_total,
//				total_tax_amount, gross_total

				i++;
				ClientQuotationBean report = new ClientQuotationBean();


				report.setQuotationNo(o[0].toString());
				report.setQuotDate((Date) o[1]);
				report.setType(o[2].toString());
				report.setClientName(o[3].toString());
				report.setCompanyName(o[4].toString());
				report.setCompanyAddress(o[5].toString());
				//System.out.println("         ))))))))))))))))  :: "+o[5].toString()+" Parbhani");

				report.setState(o[6].toString());
				report.setZip(o[7].toString());
				report.setPhoneno(o[8].toString());
//				report.setFeatures(o[10].toString());
//				report.setFeatures("N/A");
				report.setProductName(o[9].toString());
				report.setDescription(o[10].toString());
				report.setHsnSac(o[11].toString());
				report.setUnitPrice(Double.parseDouble(o[12].toString()));
				report.setQuantity(Long.parseLong(o[13].toString()));
				report.setAmount(Double.parseDouble(o[14].toString()));
				report.setDiscountPercent(Double.parseDouble(o[15].toString()));
				report.setDiscountAmount(Double.parseDouble(o[16].toString()));
				report.setSubTotal(Double.parseDouble(o[17].toString()));
				report.setCGST(Double.parseDouble(o[18].toString()));
				report.setSGST(Double.parseDouble(o[19].toString()));
				report.setIGST(Double.parseDouble(o[20].toString()));
				report.setTaxAmount(Double.parseDouble(o[21].toString()));
				report.setTotal(Double.parseDouble(o[22].toString()));
				report.setTotalSubTotal(Double.parseDouble(o[23].toString()));
				report.setTotalTaxAmount(Double.parseDouble(o[24].toString()));
				report.setGrossTotal(Double.parseDouble(o[25].toString()));

				report.setSrNo(i);

				quoList.add(report);
			}
		}
		catch (Exception e)
		{
			// TODO: handle exception
		}
		System.out.println("LAST DAO ::"+quoList.size());
		return quoList;
	}



}


