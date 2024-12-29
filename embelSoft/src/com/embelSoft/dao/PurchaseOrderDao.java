package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.BillOfMaterialBean;
import com.embelSoft.bean.GetPurchaseOrderBean;
import com.embelSoft.bean.HrBillingBean;
import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.PurchaseOrderCreateBean;
import com.embelSoft.bean.PurchaseOrderCreateBeanNew;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.hibernate.PurchaseOrderCreateHibernate;
import com.embelSoft.hibernate.PurchaseOrderCreateHibernateNew;
import com.embelSoft.hibernate.PurchaseOrderHibernate;
import com.embelSoft.hibernate.perfromaResourcesbillhibernate;
import com.embelSoft.utility.HibernateUtility;

public class PurchaseOrderDao {
	
	public void valPurchaseOrderDetails(PurchaseOrderHibernate edh){
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
	

	// Get Purchase Order List
		public List getPurchaseOrderList(){
				
				HibernateUtility hbu=null;
				Session session=null;
				List<GetPurchaseOrderBean> empList=null;
			try{	

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				Query query=session.createSQLQuery("SELECT customer_name,date_of_purchase,regarding, cost, reference_by, detail, requirement FROM purchase_order_details");
				//Query query = session.createQuery("from PurchaseBill2");
				List<Object[]> list = query.list();
				System.out.println("list Size:"+list);


				empList= new ArrayList<GetPurchaseOrderBean>(0);


			for (Object[] object : list) {	
				GetPurchaseOrderBean reports = new GetPurchaseOrderBean();
				
				reports.setCustomerName(object[0].toString());
				reports.setPurchaseDate(object[1].toString());
				reports.setRegard(object[2].toString());
				reports.setCost(Double.parseDouble(object[3].toString()));
				reports.setReference(object[4].toString());
				reports.setDetail(object[5].toString());
				reports.setRequirement(object[6].toString());
				empList.add(reports);

			}}catch(RuntimeException e){	

			}
			finally{

			hbu.closeSession(session);	
			}
			return empList;
			}
		
		
		public void savePurchaseOrderCreateDetailas(PurchaseOrderCreateHibernateNew poch)
		{
			System.out.println("In DAO");
			
			System.out.println("In DAO name----------------------- :"+poch.getVendorName());
			HibernateUtility hbu=null;
			Session session=null;
			Transaction transaction=null;
			try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			 System.out.println("got session ");
			 transaction = session.beginTransaction();
		
			 System.out.println("Tx started");
			 
			session.save(poch);
			
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
		
		
		
		public List getAllPurchaseOrdersAllBillNumbers()
		{
			HibernateUtility hbu=null;
			Session session=null;
			List list=null;
			try{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createQuery("from PurchaseOrderCreateHibernateNew GROUP BY billNo");
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
		
		
		//get list of purchase order create
		public List getPurchaseOrderCreateList()
		{
			HibernateUtility hbu=null;
			Session session=null;
			List<PurchaseOrderCreateBeanNew> empList=null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				//, company_address, gstin_number, pan_number, cin_address,
				Query query=session.createSQLQuery("SELECT vendor_name,vendor_company_name,contact_no, street_address, city, zip_code, phone,fax, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total, company_address, gstin_number, pan_number, cin_address, billNo FROM purchase_order_create");
				List<Object[]> list = query.list();
				
				System.out.println("list Size:"+list);
				
				empList= new ArrayList<PurchaseOrderCreateBeanNew>(0);

				int i=0;

				for (Object[] o : list)
				{	
					i++;
					//vendor_name,vendor_company_name,contact_no, street_address, city, zip_code, phone,fax, product_name, description, hsn_sac, unit_price, quantity, amount,
					//discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total, company_address, gstin_number,
					//pan_number, cin_address, billNo FROM purchase_order_create
					PurchaseOrderCreateBeanNew reports = new PurchaseOrderCreateBeanNew();										
					
					reports.setVendorName(o[0].toString());
					reports.setVendorCompanyName(o[1].toString());
					reports.setContactNo(o[2].toString());
					reports.setStreetAddress(o[3].toString());
					reports.setCity(o[4].toString());
					reports.setZipCode(o[5].toString());
					reports.setPhone(o[6].toString());
					reports.setFax(o[7].toString());					
					reports.setProductName(o[8].toString());
					reports.setDescription(o[9].toString());
					reports.setHsnSac(o[10].toString());
					reports.setUnitPrice(Double.parseDouble(o[11].toString()));
					reports.setQuantity(Long.parseLong(o[12].toString()));
					reports.setAmount(Double.parseDouble(o[13].toString()));
					reports.setDiscountPercent(Double.parseDouble(o[14].toString()));
					reports.setDiscountAmount(Double.parseDouble(o[15].toString()));
					reports.setSubTotal(Double.parseDouble(o[16].toString()));
					reports.setGST(Double.parseDouble(o[17].toString()));
					reports.setIGST(Double.parseDouble(o[18].toString()));
					reports.setTaxAmount(Double.parseDouble(o[19].toString()));
					reports.setTotal(Double.parseDouble(o[20].toString()));
					reports.setTotalSubTotal(Double.parseDouble(o[21].toString()));
					reports.setTotalTaxAmount(Double.parseDouble(o[22].toString()));
					reports.setGrossTotal(Double.parseDouble(o[23].toString()));					
					reports.setCompanyAddress(o[24].toString());
					reports.setGstinNumber(o[25].toString());
					reports.setPanNumber(o[26].toString());
					reports.setCinNumber(o[27].toString());					
					reports.setBillNo(o[28].toString());
					
					reports.setSrNO(i);
					
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
		
		//get purchase Order Create Report
		public List getpurchaseOrderCreateReport()
		{
			HibernateUtility hbu=null;
			Session session=null;
			List<PurchaseOrderCreateBeanNew> empList=null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				//, company_address, gstin_number, pan_number, cin_address,
				Query query=session.createSQLQuery("SELECT vendor_name,vendor_company_name,contact_no, street_address, city, zip_code, phone,fax, product_name, description, hsn_sac, unit_price, quantity, amount, discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total, company_address, gstin_number, pan_number, cin_address, billNo FROM purchase_order_create");
				List<Object[]> list = query.list();
				
				System.out.println("list Size:"+list);
				
				empList= new ArrayList<PurchaseOrderCreateBeanNew>(0);

				int i=0;

				for (Object[] o : list)
				{	
					i++;
					//vendor_name,vendor_company_name,contact_no, street_address, city, zip_code, phone,fax, product_name, description, hsn_sac, unit_price, quantity, amount,
					//discount_percent, discount_amount, sub_total, GST, IGST, tax_amount, total, total_sub_total, total_tax_amount, gross_total, company_address, gstin_number,
					//pan_number, cin_address, billNo FROM purchase_order_create
					PurchaseOrderCreateBeanNew reports = new PurchaseOrderCreateBeanNew();										
					
					reports.setVendorName(o[0].toString());
					reports.setVendorCompanyName(o[1].toString());
					reports.setContactNo(o[2].toString());
					reports.setStreetAddress(o[3].toString());
					reports.setCity(o[4].toString());
					reports.setZipCode(o[5].toString());
					reports.setPhone(o[6].toString());
					reports.setFax(o[7].toString());					
					reports.setProductName(o[8].toString());
					reports.setDescription(o[9].toString());
					reports.setHsnSac(o[10].toString());
					reports.setUnitPrice(Double.parseDouble(o[11].toString()));
					reports.setQuantity(Long.parseLong(o[12].toString()));
					reports.setAmount(Double.parseDouble(o[13].toString()));
					reports.setDiscountPercent(Double.parseDouble(o[14].toString()));
					reports.setDiscountAmount(Double.parseDouble(o[15].toString()));
					reports.setSubTotal(Double.parseDouble(o[16].toString()));
					reports.setGST(Double.parseDouble(o[17].toString()));
					reports.setIGST(Double.parseDouble(o[18].toString()));
					reports.setTaxAmount(Double.parseDouble(o[19].toString()));
					reports.setTotal(Double.parseDouble(o[20].toString()));
					reports.setTotalSubTotal(Double.parseDouble(o[21].toString()));
					reports.setTotalTaxAmount(Double.parseDouble(o[22].toString()));
					reports.setGrossTotal(Double.parseDouble(o[23].toString()));					
					reports.setCompanyAddress(o[24].toString());
					reports.setGstinNumber(o[25].toString());
					reports.setPanNumber(o[26].toString());
					reports.setCinNumber(o[27].toString());					
					reports.setBillNo(o[28].toString());
					
					reports.setSrNO(i);
					
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
		
		
		
		// get Total And Balance Amount By VendorName
		public List getTotalAndBalanceAmountByVendorName(String fkVendorId, String vendorName) 
		{			
			HibernateUtility hbu = null ;
			Session session = null;
			List list  = null;
			try {
				
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
	
				/*Query query = session.createSQLQuery("SELECT bill_no,gross_total  FROM purchase_order where Type='vendor' and fk_vendor_client_id=:fkClientId  group by bill_no");*/
						
				Query query = session.createSQLQuery("SELECT gross_total,balance_Amount FROM resource_billing WHERE fk_vendor_id=:fkVendorId AND vendor_name=:vendorName GROUP BY gross_total");
				query.setParameter("fkVendorId", fkVendorId);
				query.setParameter("vendorName", vendorName);
				
				list = query.list();
			
				System.out.println("------------------------------------SIZE-----------------   :: "+list.size());
				
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
		
		
		// Get Bill Amount And balance Amount By Bill No
		public List getTotalByBillNo(String billNo) 
		{

			HibernateUtility hbu = null ;
			Session session = null;
			List list  = null;
			try {
				
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("select bill_no, gross_total,balance_status from purchase_order where Type='vendor' and bill_no =:billNo");
				query.setParameter("billNo", billNo);
				
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
		

		
		
		public List getAllPurchaseOrderEntry()
		{
			HibernateUtility hbu=null;
			Session session=null;
			List list=null;
			try{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createQuery("from PurchaseHibernate");
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
		
		// Get Bill Amount And balance Amount By Bill No
		public List getTotalByBillNoForClient(String billNo2) 
		{

			HibernateUtility hbu = null ;
			Session session = null;
			List list  = null;
			try {
				
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("select bill_no, gross_total,balance_status from purchase_order where Type='client' and bill_no =:billNo2");
				query.setParameter("billNo2", billNo2);
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
		
		public List getVendorDetailas(Long vendorId)
		{
			HibernateUtility hbu = null;
			Session session = null;
			List list = null;
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("select pk_vendor_details_id, company_name, contact_number, address, company_address, gst_in_number, pan_number,CIM_number,state,zip_code,company_number from vendor_details WHERE pk_vendor_details_id =:vendorId");
				query.setParameter("vendorId", vendorId);
				list = query.list(); 
				 
				 
			}
			catch (Exception e) 
			{
				// TODO: handle exception
			}
		
			 finally
			 {
				 if (session!=null) {
					hbu.closeSession(session);
				}
			 }
			
			
			return list;
		}
		

		public List getPOCreateBill()
		{		
			
			HibernateUtility hbu = null;
			Session session = null;
			Transaction transaction = null;
			List<PurchaseOrderCreateBean> lastBillNo = null;
			
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("select vendor_name, billNo from purchase_order_create order by billNo DESC limit 1");
				List<Object[]> list = query.list();

				System.out.println("Size in JSP   :   -     "+list.size());
				
				lastBillNo = new ArrayList<PurchaseOrderCreateBean>(0);
				
				for(Object[] o : list)
				{
					PurchaseOrderCreateBean bean = new PurchaseOrderCreateBean();
					
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
		
		//get Client Records
			public List getClientRecords(String type)
			{
				HibernateUtility hbu=null;
				Session session=null;
				List<PurchaseOrderBean> receiveList=null;
				
				try 
				{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					
					Query query2=session.createSQLQuery("SELECT Name,Type,bill_no,purchase_Date,expect_Payment_Date,product_Name,buy_Price,quantity,total,sub_total,gst,gst_amount,gross_total,balance_status,grid_amount,grid_discount_percent,grid_discount_amount,grid_sub_total,grid_gst_percent,grid_gst_amount FROM purchase_order WHERE Type='client'");
					List<Object[]> list = query2.list();
					
					System.out.println("list Size in Dao -----------=============  :  "+list.size());
					
					receiveList= new ArrayList<PurchaseOrderBean>(0);


					int i=0;
					for (Object[] o : list)
					{	
						i++;
						PurchaseOrderBean reports = new PurchaseOrderBean();
						
						//reports.setVendorName(o[0].toString());
						reports.setType(o[1].toString());
						reports.setBillNo(o[2].toString());
						
						

						String d1 = o[3].toString();
						String[] edate = d1.split("-");
						String PurchaseDate = edate[2]+"-"+edate[1]+"-"+edate[0]; 
						//reports.setPurchaseDate(PurchaseDate);
						

						String d2 = o[4].toString();
						String[] edate2 = d2.split("-");
						String ExpectPaymentDate = edate2[2]+"-"+edate2[1]+"-"+edate2[0]; 
						//reports.setExpectPaymentDate(ExpectPaymentDate);
						
//						reports.setProductName(o[5].toString());
//						reports.setBuyPrice(o[6].toString());
//						reports.setQuantity(o[7].toString());
//						reports.setTotal(o[8].toString());
//						reports.setSubSotal(o[9].toString());
//						reports.setGst(o[10].toString());
//						reports.setGstAmount(o[11].toString());
//						reports.setGrossTotal(o[12].toString());
						reports.setBalanceStatus(Double.parseDouble(o[13].toString()));
						
//						reports.setGridAmount(o[14].toString());
//						reports.setGridDiscountPercent(o[15].toString());
//						reports.setGridDiscountAmount(o[16].toString());
//						reports.setGridSubTotal(o[17].toString());
//						reports.setGridGstPercent(o[18].toString());
//						reports.setGridGstAmount(o[19].toString());
						
						reports.setSrNo(i);
						
						receiveList.add(reports);
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
				return receiveList;
			}
		

			
			public List<HrBillingBean> getGrossTotal(String fkMemberId2, String vendorName)
			{
				HibernateUtility hbu = null;
				Session session = null;
				Transaction transaction = null;
				List<HrBillingBean> memList = null;
				
				try
				{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					
					Query query = session.createSQLQuery("select balance_status, Name FROM purchase_order WHERE fk_vendor_client_id='"+fkMemberId2+"' and Name='"+vendorName+"'  GROUP BY balance_status");
					List<Object[]> list = query.list();
				
					memList = new ArrayList<HrBillingBean>(0);
					
					for(Object[] o : list)
					{
						HrBillingBean report = new HrBillingBean();
						
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
			
			
			public List getPOBillNo(String fkVendorId) {

				System.out.println("fkClientId........."+fkVendorId);
				HibernateUtility hbu = null ;
				Session session = null;
				List list  = null;
				try {
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					
					Query query = session.createSQLQuery("SELECT pk_vendor_id, billNo FROM purchase_order_create WHERE vendor_name='"+fkVendorId+"' AND orderBillNo IS NULL GROUP BY billNo");

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



			public List getPODate(String billno) {

				System.out.println("billno........."+billno);
				HibernateUtility hbu = null ;
				Session session = null;
				List list  = null;
				try {
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					
					Query query = session.createSQLQuery("SELECT pk_vendor_id, purchase_order_date FROM purchase_order_create WHERE billNo='"+billno+"' ");

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

			
			public List getPurchaseFieldsInfo(String billno) {

				System.out.println("billno........."+billno);
				HibernateUtility hbu = null ;
				Session session = null;
				List list  = null;
				try {
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					
					Query query = session.createSQLQuery("SELECT pk_vendor_id, vendor_name, vendor_company_name, contact_no, street_address, company_address, gstin_number, pan_number, cin_address, city, zip_code, phone, fax,total_tax_amount,total_sub_total,gross_total FROM purchase_order_create WHERE billNo='"+billno+"' GROUP BY billNo");

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

			

			public List<PurchaseOrderBean> getAllPurchaseOrderReceiveInfo() {
				// TODO Auto-generated method stub
				return null;
			}


	public List<PurchaseOrderCreateHibernateNew> getPOGridsInfo1(String billno) {

		{

			HibernateUtility hbu = null;
			Session session = null;

			List<PurchaseOrderCreateHibernateNew> expenseList = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				// if(billno !=null) {

				
		Query query2 = session.createSQLQuery("SELECT product_name,description,hsn_sac,unit_price,quantity,discount_percent,discount_amount,sub_total,GST,IGST,tax_amount,total,pk_vendor_id,amount,total_tax_amount,total_sub_total,gross_total,billNo from purchase_order_create WHERE billNo = :billno");

				query2.setParameter("billno", billno);

				List<Object[]> list = query2.list();
				expenseList = new ArrayList<PurchaseOrderCreateHibernateNew>(0);

				for (Object[] object : list) {
					PurchaseOrderCreateHibernateNew reports = new PurchaseOrderCreateHibernateNew();

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
					reports.setPkVendorId(Long.parseLong(object[12].toString()));
					reports.setAmount(Double.parseDouble(object[13].toString()));
					reports.setBillNo(object[17].toString());
					reports.setTotalTaxAmount(Double.parseDouble(object[14].toString()));
					reports.setTotalSubTotal(Double.parseDouble(object[15].toString()));
					reports.setGrossTotal(Double.parseDouble(object[16].toString()));

					System.out.println("Result - " + Arrays.toString(object));

					expenseList.add(reports);

				}
			}

			catch (Exception e) {
				e.printStackTrace();
			}
			return expenseList;
		}
	}

			public List getAllPOBillNoAgainst(String fkVendorId) {

					System.out.println("fkVendorId........."+fkVendorId);
					HibernateUtility hbu = null ;
					Session session = null;
					List list  = null;
					try {
						hbu = HibernateUtility.getInstance();
						session = hbu.getHibernateSession();
						
						Query query = session.createSQLQuery("SELECT pk_vendor_id, billNo FROM purchase_order_create WHERE vendor_name='"+fkVendorId+"' GROUP BY billNo");  //AND orderBillNo IS NULL

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

			
			public List getAllPOEntriesForBillNo()
			{
				HibernateUtility hbu=null;
				Session session=null;
				List list=null;
				try{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					Query query = session.createQuery("from PurchaseOrderCreateHibernateNew");
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
			
			public List<PurchaseOrderCreateHibernateNew> getPurchaseDetailsRangeWise(String fisDate, String endDate) 
			{

				HibernateUtility hbu=null;
				Session session=null;
				List<PurchaseOrderCreateHibernateNew> cliList=null;
			try{	

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				
				Query query=session.createSQLQuery("SELECT poc.pk_vendor_id, poc.vendor_name, poc.billNo, poc.purchase_order_date, poc.vendor_company_name, poc.contact_no, poc.street_address, poc.city, poc.product_name, poc.description, poc.amount, poc.hsn_sac, poc.unit_price, poc.quantity, poc.discount_percent, poc.discount_amount, poc.sub_total, poc.GST, poc.IGST, poc.tax_amount, poc.total, poc.total_sub_total, poc.total_tax_amount, poc.gross_total, poc.company_address, poc.gstin_number FROM purchase_order_create poc WHERE purchase_order_date BETWEEN '"+fisDate+"' AND '"+endDate+"'");
				List<Object[]> list = query.list();
				cliList= new ArrayList<PurchaseOrderCreateHibernateNew>(0);

				System.out.println("========================  SIZE  ======================  :: "+list.size());
				
				int i=0;
				
			for (Object[] o : list) 
			{
				i++;

				PurchaseOrderCreateHibernateNew reports = new PurchaseOrderCreateHibernateNew();
				
				reports.setPkVendorId(Long.parseLong(o[0].toString()));
				reports.setVendorName(o[1].toString());
				reports.setBillNo(o[2].toString());
				reports.setPurchaseOrderDate(o[3].toString());
				reports.setVendorCompanyName(o[4].toString());
				reports.setContactNo(o[5].toString());
				reports.setStreetAddress(o[6].toString());
				reports.setCity(o[7].toString());
				reports.setProductName(o[8].toString());
				reports.setDescription(o[9].toString());
				reports.setAmount(Double.parseDouble(o[10].toString()));
				reports.setHsnSac(o[11].toString());
				reports.setUnitPrice(Double.parseDouble(o[12].toString()));
				reports.setQuantity(Long.parseLong(o[13].toString()));
				reports.setDiscountPercent(Double.parseDouble(o[14].toString()));
				reports.setDiscountAmount(Double.parseDouble(o[15].toString()));
				reports.setSubTotal(Double.parseDouble(o[16].toString()));
				reports.setGST(Double.parseDouble(o[17].toString()));
				reports.setIGST(Double.parseDouble(o[18].toString()));
				reports.setTaxAmount(Double.parseDouble(o[19].toString()));
				reports.setTotal(Double.parseDouble(o[20].toString()));
				reports.setTotalSubTotal(Double.parseDouble(o[21].toString()));
				reports.setTotalTaxAmount(Double.parseDouble(o[22].toString()));
				reports.setGrossTotal(Double.parseDouble(o[23].toString()));
				reports.setCompanyAddress(o[24].toString());
				reports.setGstinNumber(o[25].toString());
				
				
			
			
			
			reports.setSrNO(i);
				
				cliList.add(reports);
				
			
			}
			}catch(RuntimeException e){	
			
				}
				finally{
			
				hbu.closeSession(session);	
				}
			return cliList;
			}
			
			
}
			
			
			


