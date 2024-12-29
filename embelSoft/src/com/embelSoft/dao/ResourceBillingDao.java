package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.ResourceBillingBean;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.hibernate.ResourceBillingHibernate;
import com.embelSoft.hibernate.perfromaResourcesbillhibernate;
import com.embelSoft.hibernate.perfromabillingHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ResourceBillingDao {

	public List<ResourceBillingBean> getResourceLastBillNo()
	{
		HibernateUtility hbu = null;
		Session session = null;
		//Transaction transaction = null;
		List<ResourceBillingBean> billList = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select vendor_name, bill_no from resource_billing ORDER BY bill_no desc LIMIT 1");
			List<Object[]> list = query.list();
			System.out.println("IN METHOD getResourceLastBillNo List Size :-"+list.size());
			billList = new ArrayList<ResourceBillingBean>(0);

			for(Object[] o : list)
			{
				ResourceBillingBean bean = new ResourceBillingBean();

				bean.setVendorName(o[0].toString());
				bean.setBillNo(o[1].toString());
				System.out.println("IN METHOD getResourceLastBillNo Last ResourceLastBillNo : "+bean.getBillNo());
				billList.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception in getLastResourceBillNo :-"+e);
		}

		return billList;
	}

	public List<ResourceBillingBean> getResourceLastBillNo11()
	{
		HibernateUtility hbu = null;
		Session session = null;
		//Transaction transaction = null;
		List<ResourceBillingBean> billList = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select vendor_name, bill_no from resource_billing_perfroma ORDER BY bill_no desc LIMIT 1");
			List<Object[]> list = query.list();
			System.out.println("IN METHOD getResourceLastBillNo List Size :-"+list.size());
			billList = new ArrayList<ResourceBillingBean>(0);

			for(Object[] o : list)
			{
				ResourceBillingBean bean = new ResourceBillingBean();

				bean.setVendorName(o[0].toString());
				bean.setBillNo(o[1].toString());
				System.out.println("IN METHOD getResourceLastBillNo Last ResourceLastBillNo : "+bean.getBillNo());
				billList.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception in getLastResourceBillNo :-"+e);
		}

		return billList;
	}

	public void saveResourceBillDetails(ResourceBillingHibernate hibernate) {

		System.out.println("IN DAO");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			System.out.println(""+hibernate.toString());
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

				Log.error("Error in ResourceBillingHibernate", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
	}


	public void saveperfromaResourceBillDetails(perfromaResourcesbillhibernate hibernate) {

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

				Log.error("Error in ResourceBillingHibernate", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
	}

	// get GrossTotal for saveResourceBillDetailsForPOForVenderCashbook
	public List<PurchaseOrderBean> getGrossTotal(String fkVendorId, String vendorName)
	{
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<PurchaseOrderBean> memList = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("select name, balance_status, quantity,purchase_Id, fk_vendor_client_id,bill_no FROM purchase_order WHERE fk_vendor_client_id='"+fkVendorId+"' and name='"+vendorName+"'  ");  //GROUP BY balance_status
			List<Object[]> list = query.list();

			memList = new ArrayList<PurchaseOrderBean>(0);

			for(Object[] o : list)
			{
				PurchaseOrderBean report = new PurchaseOrderBean();

				report.setName(o[0].toString());
				report.setBalanceStatus(Double.parseDouble(o[1].toString()));
				report.setQuantity(Long.parseLong(o[2].toString()));
				report.setPurchaseId(Long.parseLong(o[3].toString()));
				report.setFkVendorClientId(Long.parseLong(o[4].toString()));
				report.setBillNo(o[5].toString());

				memList.add(report);
			}
		}catch(RuntimeException e){
			System.out.println(e);
		}
		finally{
			hbu.closeSession(session);
		}
		return memList;
	}


	// get GrossTotal for updateResourceBillDetailsForPOForVenderCashbook
		public List<PurchaseOrderBean> getBillNoForTaxResourceEdit(String billNo, String fkVendorId)
		{
			HibernateUtility hbu = null;
			Session session = null;
			Transaction transaction = null;
			List<PurchaseOrderBean> memList = null;

			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				Query query = session.createSQLQuery("select name, balance_status, quantity,purchase_Id, fk_vendor_client_id,bill_no FROM purchase_order WHERE bill_no='"+billNo+"' AND fk_vendor_client_id='"+fkVendorId+"'");
				List<Object[]> list = query.list();

				memList = new ArrayList<PurchaseOrderBean>(0);

				for(Object[] o : list)
				{
					PurchaseOrderBean report = new PurchaseOrderBean();

					report.setName(o[0].toString());
					report.setBalanceStatus(Double.parseDouble(o[1].toString()));
					report.setQuantity(Long.parseLong(o[2].toString()));
					report.setPurchaseId(Long.parseLong(o[3].toString()));
					report.setFkVendorClientId(Long.parseLong(o[4].toString()));
					report.setBillNo(o[5].toString());

					memList.add(report);
				}
			}catch(RuntimeException e){
				System.out.println(e);
			}
			finally{
				hbu.closeSession(session);
			}
			return memList;
		}


	//save Resource Bill DetailsForPO Vender Cashbook
	public void saveResourceBillDetailsForPOForVenderCashbook(PurchaseHibernate hibernate)
	{

		System.out.println("IN DAO Method saveResourceBillDetailsForPOForVenderCashbook");
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

				Log.error("Error in saveResourceBillDetailsForPOForVenderCashbook", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}



	//save After Update Resource Bill DetailsForPO Vender Cashbook
		public void updteResourceBillDetailsForPOForVenderCashbook(PurchaseHibernate hibernate)
		{

			System.out.println("IN DAO Method updateResourceBillDetailsForPOForVenderCashbook");
			HibernateUtility hbu = null;
			Session session = null;
			Transaction transaction = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				transaction = session.beginTransaction();
				session.saveOrUpdate(hibernate);
				transaction.commit();
				System.out.println("Successful");
			} catch (RuntimeException e) {

				try {
					transaction.rollback();
				} catch (RuntimeException e2) {

					Log.error("Error in saveResourceBillDetailsForPOForVenderCashbook", e2);
				}
			} finally {
				if (session != null) {
					hbu.closeSession(session);
				}
			}

		}



	//getResourceBillingList
	public List<ResourceBillingBean> getResourceBillingList()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ResourceBillingBean> resourceBillingList = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("SELECT bill_no, bill_date, vendor_name, bill_period_start_date, bill_period_end_date, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM resource_billing");
			List<Object[]> list = query.list();

			resourceBillingList = new ArrayList<ResourceBillingBean>(0);

			int i=0;
			for (Object[] o : list)
			{
				i++;

				/* bill_no, bill_date, vendor_name, bill_period_start_date,
				 *  bill_period_end_date, product_name, description, hsn_sac, unit_price, quantity, amount,
				 *   discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total,
				 *    total_tax_amount, gross_total*/

				ResourceBillingBean bean = new ResourceBillingBean();

				bean.setSrNo(i);

				bean.setBillNo(o[0].toString());
				bean.setBillDate((Date) o[1]);
				bean.setVendorName(o[2].toString());
				bean.setBillPeriodStartDate((Date) o[3]);
				bean.setBillPeriodEndDate((Date) o[4]);
				bean.setProductName(o[5].toString());
				bean.setDescription(o[6].toString());
				bean.setHsnSac(o[7].toString());
				bean.setUnitPrice(Double.parseDouble(o[8].toString()));
				bean.setQuantity(Long.parseLong(o[9].toString()));
				bean.setAmount(Double.parseDouble(o[10].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[11].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[12].toString()));
				bean.setSubTotal(Double.parseDouble(o[13].toString()));
				bean.setGST(Double.parseDouble(o[14].toString()));
				//bean.setSGST(Double.parseDouble(o[15].toString()));
				bean.setIGST(Double.parseDouble(o[15].toString()));
				bean.setTaxAmount(Double.parseDouble(o[16].toString()));
				bean.setTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[18].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[19].toString()));
				bean.setGrossTotal(Double.parseDouble(o[20].toString()));

				resourceBillingList.add(bean);
			}
		}catch(RuntimeException e){
			System.out.println(e);
		}
		finally{
			hbu.closeSession(session);
		}
		return resourceBillingList;
	}

	public List<ResourceBillingBean> getResourceBillingReportByNameAndBetweenTwoDates(String fkVendorId, String vendorName, String startDate, String endDate)
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ResourceBillingBean> resourceBillingList=null;
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT bill_no, bill_date, vendor_name, bill_period_start_date, bill_period_end_date, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM resource_billing WHERE vendor_name='"+vendorName+"' AND fk_vendor_id='"+fkVendorId+"' AND bill_date BETWEEN '"+startDate+"' AND '"+endDate+"'");
			List<Object[]> list = query.list();
			resourceBillingList= new ArrayList<ResourceBillingBean>(0);

			int i=0;
			for (Object[] o : list)
			{
				i++;

				/*"SELECT bill_no, bill_date, vendor_name, bill_period_start_date, bill_period_end_date, product_name, description, hsn_sac, unit_price,
				 *  quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount,
				 *   gross_total FROM resource_billing WHERE vendor_name='"+vendorName+"' AND fk_vendor_id='"+fkVendorId+"'
				 *    AND bill_date BETWEEN '"+startDate+"' AND '"+endDate+"'"*/

				ResourceBillingBean bean = new ResourceBillingBean();

				bean.setSrNo(i);

				bean.setBillNo(o[0].toString());
				bean.setBillDate((Date) o[1]);
				bean.setVendorName(o[2].toString());
				bean.setBillPeriodStartDate((Date) o[3]);
				bean.setBillPeriodEndDate((Date) o[4]);
				bean.setProductName(o[5].toString());
				bean.setDescription(o[6].toString());
				bean.setHsnSac(o[7].toString());
				bean.setUnitPrice(Double.parseDouble(o[8].toString()));
				bean.setQuantity(Long.parseLong(o[9].toString()));
				bean.setAmount(Double.parseDouble(o[10].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[11].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[12].toString()));
				bean.setSubTotal(Double.parseDouble(o[13].toString()));
				bean.setGST(Double.parseDouble(o[14].toString()));
//				bean.setSGST(Double.parseDouble(o[15].toString()));
				bean.setIGST(Double.parseDouble(o[15].toString()));
				bean.setTaxAmount(Double.parseDouble(o[16].toString()));
				bean.setTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[18].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[19].toString()));
				bean.setGrossTotal(Double.parseDouble(o[20].toString()));

				resourceBillingList.add(bean);
		}
		}catch(RuntimeException e){

		}
		finally{
			hbu.closeSession(session);
		}
		return resourceBillingList;
	}

	public List<ResourceBillingBean> getResourceBillingReportByNameAndBetweenTwoDates1(String startDate, String endDate)
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ResourceBillingBean> resourceBillingList=null;
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT rb.bill_no,rb.bill_date,rb.vendor_name,rb.bill_period_start_date,rb.bill_period_end_date,rb.product_name,rb.description,rb.hsn_sac,rb.unit_price,rb.quantity,rb.amount,rb.discount_percent,rb.discount_amount,rb.sub_total,rb.GST,rb.IGST,rb.tax_amount,rb.total,rb.total_sub_total,rb.total_tax_amount,rb.gross_total,vd.gst_in_number FROM resource_billing rb JOIN vendor_details vd ON rb.fk_vendor_id = vd.pk_vendor_details_id WHERE rb.bill_date BETWEEN '"+startDate+"' AND '"+endDate+"' ORDER BY rb.bill_no");
			List<Object[]> list = query.list();
			resourceBillingList= new ArrayList<ResourceBillingBean>(0);

			int i=0;
			for (Object[] o : list)
			{
				i++;

				ResourceBillingBean bean = new ResourceBillingBean();

				bean.setSrNo(i);

				bean.setBillNo(o[0].toString());
				bean.setBillDate((Date) o[1]);
				bean.setVendorName(o[2].toString());
				bean.setBillPeriodStartDate((Date) o[3]);
				bean.setBillPeriodEndDate((Date) o[4]);
				bean.setProductName(o[5].toString());
				bean.setDescription(o[6].toString());
				bean.setHsnSac(o[7].toString());
				bean.setUnitPrice(Double.parseDouble(o[8].toString()));
				bean.setQuantity(Long.parseLong(o[9].toString()));
				bean.setAmount(Double.parseDouble(o[10].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[11].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[12].toString()));
				bean.setSubTotal(Double.parseDouble(o[13].toString()));
				bean.setGST(Double.parseDouble(o[14].toString()));
//				bean.setSGST(Double.parseDouble(o[15].toString()));
				bean.setIGST(Double.parseDouble(o[15].toString()));
				bean.setTaxAmount(Double.parseDouble(o[16].toString()));
				bean.setTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[18].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[19].toString()));
				bean.setGrossTotal(Double.parseDouble(o[20].toString()));
				bean.setGstNo(o[21].toString());

				resourceBillingList.add(bean);
		}

			System.out.println(resourceBillingList);
		}catch(RuntimeException e){

		}
		finally{
			hbu.closeSession(session);
		}
		return resourceBillingList;
	}


	public List<ResourceBillingBean> getCommonBillingReportByNameAndBetweenTwoDates1(String startDate, String endDate)
	{
		HibernateUtility hbu=null;
		Session session=null;
		List<ResourceBillingBean> resourceBillingList=null;
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT bill_no, bill_date, vendor_name, bill_period_start_date, bill_period_end_date, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM resource_billing WHERE bill_date BETWEEN '"+startDate+"' AND '"+endDate+"' ");
			List<Object[]> list = query.list();
			resourceBillingList= new ArrayList<ResourceBillingBean>(0);

			int i=0;
			for (Object[] o : list)
			{
				i++;

				ResourceBillingBean bean = new ResourceBillingBean();

				bean.setSrNo(i);

				bean.setBillNo(o[0].toString());
				bean.setBillDate((Date) o[1]);
				bean.setVendorName(o[2].toString());
				bean.setBillPeriodStartDate((Date) o[3]);
				bean.setBillPeriodEndDate((Date) o[4]);
				bean.setProductName(o[5].toString());
				bean.setDescription(o[6].toString());
				bean.setHsnSac(o[7].toString());
				bean.setUnitPrice(Double.parseDouble(o[8].toString()));
				bean.setQuantity(Long.parseLong(o[9].toString()));
				bean.setAmount(Double.parseDouble(o[10].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[11].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[12].toString()));
				bean.setSubTotal(Double.parseDouble(o[13].toString()));
				bean.setGST(Double.parseDouble(o[14].toString()));
//				bean.setSGST(Double.parseDouble(o[15].toString()));
				bean.setIGST(Double.parseDouble(o[15].toString()));
				bean.setTaxAmount(Double.parseDouble(o[16].toString()));
				bean.setTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[18].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[19].toString()));
				bean.setGrossTotal(Double.parseDouble(o[20].toString()));

				resourceBillingList.add(bean);
		}

			Query query1 = session.createSQLQuery("SELECT bill_no, bill_date, client_name, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, CGST, SGST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total,Ship_Address,Courier_Name,Courier_number FROM product_billing WHERE bill_date BETWEEN '"+startDate+"' AND '"+endDate+"' ORDER BY bill_no");
			List<Object[]> list1 = query1.list();
			//resourceBillingList= new ArrayList<ResourceBillingBean>(0);

			//int j=0;
			for (Object[] o : list1)
			{
				i++;

				ResourceBillingBean bean = new ResourceBillingBean();

				bean.setSrNo(i);

				bean.setBillNo(o[0].toString());
				bean.setBillDate((Date) o[1]);
				bean.setVendorName(o[2].toString());
				bean.setProductName(o[3].toString());
				bean.setDescription(o[4].toString());
				bean.setHsnSac(o[5].toString());
				bean.setUnitPrice(Double.parseDouble(o[6].toString()));
				bean.setQuantity(Long.parseLong(o[7].toString()));
				bean.setAmount(Double.parseDouble(o[8].toString()));
				bean.setDiscountPercent(Double.parseDouble(o[9].toString()));
				bean.setDiscountAmount(Double.parseDouble(o[10].toString()));
				bean.setSubTotal(Double.parseDouble(o[11].toString()));
				bean.setGST(Double.parseDouble(o[12].toString()) + Double.parseDouble(o[13].toString()));
				//bean.setSGST();
				bean.setIGST(Double.parseDouble(o[14].toString()));
				bean.setTaxAmount(Double.parseDouble(o[15].toString()));
				bean.setTotal(Double.parseDouble(o[16].toString()));
				bean.setTotalSubTotal(Double.parseDouble(o[17].toString()));
				bean.setTotalTaxAmount(Double.parseDouble(o[18].toString()));
				bean.setGrossTotal(Double.parseDouble(o[19].toString()));


				resourceBillingList.add(bean);
			}
			System.out.println(resourceBillingList);
		}catch(RuntimeException e){

		}
		finally{
			hbu.closeSession(session);
		}
		return resourceBillingList;
	}


	public List getAllResourceBillNo()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("FROM ResourceBillingHibernate");
		 list = query.list();

		 System.out.println("Size in DAOAOAOAO  :  "+list.size());

		}catch(Exception e){
			System.out.println("EXCEPTION IN getAllResourceBillNo FROM ResourceBillingHibernate");
		}
		finally{
			if(session!=null){
				hbu.closeSession(session);
			}
		}
		return list;
	}

	public List getAllBillNoAgainst(String fkVendorId) {

		System.out.println("fkVendorId........."+fkVendorId);
		HibernateUtility hbu = null ;
		Session session = null;
		List list  = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT pk_resource_bill_id, bill_no FROM resource_billing_perfroma WHERE fk_vendor_id='"+fkVendorId+"' AND resourceBillNo IS NULL GROUP BY bill_no");  //AND resourceBillNo IS NULL GROUP BY bill_no//AND productBillNo IS NULL

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


public List getAlleditResourceBillNoAgainst(String fkVendorId) {

		System.out.println("fkVendorId........."+fkVendorId);
		HibernateUtility hbu = null ;
		Session session = null;
		List list  = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT pk_resource_bill_id, bill_no FROM resource_billing WHERE fk_vendor_id='"+fkVendorId+"' GROUP BY bill_no");  //AND resourceBillNo IS NULL

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



	public List getGridForResourceBilling2(String resrcbillNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<perfromaResourcesbillhibernate> getTaxDetailsForResourceBilling2(String productName, String billno) {

		{
			System.out.println(productName + "    -----------   productName In dao");

			HibernateUtility hbu = null;
			Session session = null;

			List<perfromaResourcesbillhibernate> expenseList = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				if(billno !=null) {

				Query query2 = session.createSQLQuery("SELECT product_name,description,hsn_sac,unit_price,quantity,discount_percent,discount_amount,sub_total,GST,IGST,tax_amount,total,fk_vendor_id,amount,bill_no,gross_total,pk_resource_bill_id, bill_period_start_date, bill_period_end_date from resource_billing_perfroma WHERE bill_no = :billno ");

				query2.setParameter("billno", billno);

				List<Object[]> list = query2.list();
				expenseList = new ArrayList<perfromaResourcesbillhibernate>(0);

				for (Object[] object : list)
				{
					perfromaResourcesbillhibernate reports = new perfromaResourcesbillhibernate();
					reports.setProductName(object[0].toString());
					reports.setDescription(object[1].toString());
					reports.setHsnSac((object[2].toString()));
					reports.setUnitPrice(Double.parseDouble(object[3].toString()));
					reports.setQuantity(Long.parseLong(object[4].toString()));
					reports.setDiscountPercent(Double.parseDouble(object[5].toString()));
					reports.setDiscountAmount(Double.parseDouble(object[6].toString()));
					reports.setSubTotal(Double.parseDouble(object[7].toString()));
					reports.setGST(Double.parseDouble(object[8].toString()));
					reports.setIGST(Double.parseDouble(object[9].toString()));
					reports.setTaxAmount(Double.parseDouble(object[10].toString()));
					reports.setTotal(Double.parseDouble(object[11].toString()));
					reports.setFkVendorId(Long.parseLong(object[12].toString()));
					reports.setAmount(Double.parseDouble(object[13].toString()));
					reports.setBillNo(object[14].toString());
					reports.setGrossTotal(Double.parseDouble(object[15].toString()));
					reports.setPkResourceBillId(Long.parseLong(object[16].toString()));
					reports.setStartDate(object[17].toString());
					reports.setEndDate(object[18].toString());

					expenseList.add(reports);

				}}
				else {
				/*	Query query2 = session.createSQLQuery("SELECT product_name,description,hsn_sac,unit_price,quantity,discount_percent,discount_amount,sub_total,GST,IGST,tax_amount,total,fk_vendor_id,amount,bill_no from resource_billing_perfroma WHERE product_name= :productName ");
					query2.setParameter("productName", productName);
					List<Object[]> list = query2.list();
					*/

					expenseList = new ArrayList<perfromaResourcesbillhibernate>(0);

						perfromaResourcesbillhibernate reports = new perfromaResourcesbillhibernate();

						reports.setProductName(productName);
						reports.setUnitPrice(0d);
						reports.setQuantity(0l);
						reports.setAmount(0d);
						reports.setDiscountPercent(0d);
						reports.setDiscountAmount(0d);
						reports.setSubTotal(0d);
						reports.setGST(18d);
						reports.setIGST(0d);
						reports.setTaxAmount(0d);
						reports.setTotal(0d);
						expenseList.add(reports);
				}
				}
			//}

			 catch (Exception e) {
				e.printStackTrace();
			}
			return expenseList;
		}
	}


	public List<ResourceBillingHibernate> getGridForEditResourceBilling2(String productName, String billno) {

		{
			System.out.println(productName + "    -----------   productName In dao");

			HibernateUtility hbu = null;
			Session session = null;

			List<ResourceBillingHibernate> expenseList = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				if(billno !=null) {

				Query query2 = session.createSQLQuery("SELECT r.product_name,r.description,r.hsn_sac,r.unit_price,r.quantity,r.discount_percent,r.discount_amount,r.sub_total,r.GST,r.IGST,r.tax_amount,r.total,r.fk_vendor_id,r.amount,bill_no,r.gross_total,r.pk_resource_bill_id ,total_sub_total,total_tax_amount from resource_billing r WHERE r.bill_no = :billno ");

				query2.setParameter("billno", billno);

				List<Object[]> list = query2.list();
				expenseList = new ArrayList<ResourceBillingHibernate>(0);

				for (Object[] object : list)
				{
					ResourceBillingHibernate reports = new ResourceBillingHibernate();

					reports.setProductName(object[0].toString());
					reports.setDescription(object[1].toString());
					reports.setHsnSac((object[2].toString()));
					reports.setUnitPrice(Double.parseDouble(object[3].toString()));
					reports.setQuantity(Long.parseLong(object[4].toString()));
					reports.setDiscountPercent(Double.parseDouble(object[5].toString()));
					reports.setDiscountAmount(Double.parseDouble(object[6].toString()));
					reports.setSubTotal(Double.parseDouble(object[7].toString()));
					reports.setGST(Double.parseDouble(object[8].toString()));
					reports.setIGST(Double.parseDouble(object[9].toString()));
					reports.setTaxAmount(Double.parseDouble(object[10].toString()));
					reports.setTotal(Double.parseDouble(object[11].toString()));
					reports.setFkVendorId(Long.parseLong(object[12].toString()));
					reports.setAmount(Double.parseDouble(object[13].toString()));
					reports.setBillNo(object[14].toString());
					reports.setGrossTotal(Double.parseDouble(object[15].toString()));
					reports.setPkResourceBillId(Long.parseLong(object[16].toString()));
					reports.setTotalSubTotal(Double.parseDouble(object[17].toString()));
					reports.setTotalTaxAmount(Double.parseDouble(object[18].toString()));

					expenseList.add(reports);

				}}
				else {
				/*	Query query2 = session.createSQLQuery("SELECT product_name,description,hsn_sac,unit_price,quantity,discount_percent,discount_amount,sub_total,GST,IGST,tax_amount,total,fk_vendor_id,amount,bill_no from resource_billing_perfroma WHERE product_name= :productName ");
					query2.setParameter("productName", productName);
					List<Object[]> list = query2.list();
					*/

					expenseList = new ArrayList<ResourceBillingHibernate>(0);

					ResourceBillingHibernate reports = new ResourceBillingHibernate();

						reports.setProductName(productName);
						reports.setUnitPrice(0d);
						reports.setQuantity(0l);
						reports.setAmount(0d);
						reports.setDiscountPercent(0d);
						reports.setDiscountAmount(0d);
						reports.setSubTotal(0d);
						reports.setGST(18d);
						reports.setIGST(0d);
						reports.setTaxAmount(0d);
						reports.setTotal(0d);
						expenseList.add(reports);
				}
				}
			//}

			 catch (Exception e) {
				e.printStackTrace();
			}
			return expenseList;
		}
	}



	//getResourceBillingList
		public List<ResourceBillingBean> getResourcePIList()
		{
			HibernateUtility hbu=null;
			Session session=null;
			List<ResourceBillingBean> resourceBillingList = null;

			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				Query query=session.createSQLQuery("SELECT bill_no, bill_date, vendor_name, bill_period_start_date, bill_period_end_date, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total FROM resource_billing_perfroma");
				List<Object[]> list = query.list();

				resourceBillingList = new ArrayList<ResourceBillingBean>(0);

				int i=0;
				for (Object[] o : list)
				{
					i++;

					/* bill_no, bill_date, vendor_name, bill_period_start_date,
					 *  bill_period_end_date, product_name, description, hsn_sac, unit_price, quantity, amount,
					 *   discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total,
					 *    total_tax_amount, gross_total*/

					ResourceBillingBean bean = new ResourceBillingBean();

					bean.setSrNo(i);

					bean.setBillNo(o[0].toString());
					bean.setBillDate((Date) o[1]);
					bean.setVendorName(o[2].toString());
					bean.setBillPeriodStartDate((Date) o[3]);
					bean.setBillPeriodEndDate((Date) o[4]);
					bean.setProductName(o[5].toString());
					bean.setDescription(o[6].toString());
					bean.setHsnSac(o[7].toString());
					bean.setUnitPrice(Double.parseDouble(o[8].toString()));
					bean.setQuantity(Long.parseLong(o[9].toString()));
					bean.setAmount(Double.parseDouble(o[10].toString()));
					bean.setDiscountPercent(Double.parseDouble(o[11].toString()));
					bean.setDiscountAmount(Double.parseDouble(o[12].toString()));
					bean.setSubTotal(Double.parseDouble(o[13].toString()));
					bean.setGST(Double.parseDouble(o[14].toString()));
					//bean.setSGST(Double.parseDouble(o[15].toString()));
					bean.setIGST(Double.parseDouble(o[15].toString()));
					bean.setTaxAmount(Double.parseDouble(o[16].toString()));
					bean.setTotal(Double.parseDouble(o[17].toString()));
					bean.setTotalSubTotal(Double.parseDouble(o[18].toString()));
					bean.setTotalTaxAmount(Double.parseDouble(o[19].toString()));
					bean.setGrossTotal(Double.parseDouble(o[20].toString()));

					resourceBillingList.add(bean);
				}
			}catch(RuntimeException e){
				System.out.println(e);
			}
			finally{
				hbu.closeSession(session);
			}
			return resourceBillingList;
		}

		//getResourceBillingList
			public List<perfromabillingHibernate> clientPiList()
			{
				HibernateUtility hbu=null;
				Session session=null;
				List<perfromabillingHibernate> clientPerformaList = null;

				try
				{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();

					Query query=session.createQuery("From perfromabillingHibernate");
					clientPerformaList = query.list();

					//clientPerformaList = new ArrayList<ResourceBillingBean>(0);

					}catch(RuntimeException e){
					System.out.println(e);
				}
				finally{
					hbu.closeSession(session);
				}
				return clientPerformaList;
			}

		public void updateAdvanceBooking(String bookingNoAB, String resourceBillNo) {

			System.out.println("updateAdvanceBooking bookingNoAB  ===>  "+bookingNoAB);
				HibernateUtility hbu = null;
				Session session = null;
				Transaction tx = null;

				try
				{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					tx = session.beginTransaction();

					Query updateAdvanceBooking = session.createSQLQuery("update resource_billing_perfroma set resourceBillNo = '"+resourceBillNo+"' where bill_no = '"+bookingNoAB+"'");
					updateAdvanceBooking.executeUpdate();
					tx.commit();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}

		public List getRPIBillingDate(String resrcbillNo) {

				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createSQLQuery("SELECT pk_resource_bill_id, bill_period_start_date, bill_period_end_date FROM resource_billing where bill_no='"+resrcbillNo+"' ");
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

