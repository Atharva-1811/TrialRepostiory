package com.embelSoft.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.BillOfMaterialBean;
import com.embelSoft.bean.HrBillingBean;
import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.PurchaseOrderCreateBeanNew;
import com.embelSoft.bean.PurchaseOrderCreateBean;
import com.embelSoft.bean.ResourceBillingBean;
import com.embelSoft.dao.BillOfMaterialDao;
import com.embelSoft.dao.ProductDetailsDao;
import com.embelSoft.dao.PurchaseOrderDao;
import com.embelSoft.dao.ResourceBillingDao;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.hibernate.PurchaseOrderCreateHibernate;
import com.embelSoft.hibernate.PurchaseOrderCreateHibernateNew;
import com.embelSoft.hibernate.PurchaseOrderHibernate;
import com.embelSoft.hibernate.PurchaseOrderReceivedHibernate;
import com.embelSoft.hibernate.ResourceBillingHibernate;
import com.embelSoft.hibernate.perfromaResourcesbillhibernate;
import com.embelSoft.utility.HibernateUtility;

public class PurchaseOrderHelper {
	
		
	public PurchaseOrderCreateBeanNew getPurchaseGrid(String productName)
	{
		System.out.println(" DAO getPurchaseGrid Start 0");
		
		Long productId = Long.parseLong(productName);
		ProductDetailsDao dao = new ProductDetailsDao();
		PurchaseOrderCreateBeanNew proList= dao.PurchaseOrder(productId);
		
		System.out.println(" DAO getPurchaseGrid Start 1");
		return proList;
	}
	
		
		public void doPurchaseOrderDetails(HttpServletRequest request,HttpServletResponse response) {
			// TODO Auto-generated method stub
	System.out.println("In helper");
		
		
		String customerName = request.getParameter("customerName");
		String purchaseDate = request.getParameter("purchaseDate");
		String regard = request.getParameter("regard");
		String cost = request.getParameter("cost");
		String reference = request.getParameter("reference");
		String detail = request.getParameter("detail");
		String requirement = request.getParameter("requirement");
		
		PurchaseOrderHibernate poh = new PurchaseOrderHibernate();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			Date dateOfBirth = null;
			try{
				dateOfBirth = format.parse(purchaseDate);
				poh.setPurchaseDate(dateOfBirth);
				System.out.println(" date dateOfBirth parsing" +purchaseDate);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}

			poh.setCustomerName(customerName);
			poh.setRegard(regard);
			poh.setCost(Double.parseDouble(cost));
			poh.setReference(reference);
			poh.setDetail(detail);
			poh.setRequirement(requirement);
			
			PurchaseOrderDao pod = new PurchaseOrderDao();
			pod.valPurchaseOrderDetails(poh);
}
	
	public PurchaseOrderCreateBean getGridForProductDescription(String productDescription)
	{
		PurchaseOrderCreateBean bean = new PurchaseOrderCreateBean();
		bean.setProductDescription(productDescription);
		//bean.setUnitPrice(0d);
		bean.setQuantity(1);
		return bean;
		
	}
	
	
	
	String PoBill;
	public void addPurchaseOrderCreateInfo(HttpServletRequest request,HttpServletResponse response)
	{
			String billNoForPdf;
			HttpSession session3 = request.getSession();
			Integer count = Integer.parseInt(request.getParameter("count"));

			
			SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			Date dateobj = new Date();
			
			String d1 = dateobj.toString();
			
			String[] d = d1.split(" ");
			
			String year = d[5];
			
			String month = d[1];
			
			String date = d[2];
			
/*			String yr = year[2]+""+year[3];
			
			int yr1 = Integer.parseInt(yr);
			int yr2 = yr1+1;
			
			String year2 = yr1+"-"+yr2;
*/		
			
			String poNo = "PO"+"/"+year+"/"+month+"/"+"00"+1;
			System.out.println("IN HELPER poNo :- "+poNo);
		
			
			
			PurchaseOrderDao poDao = new PurchaseOrderDao();
			List bill = poDao.getPOCreateBill();
	
			for(int i=0;i<bill.size();i++)
			{
				PurchaseOrderCreateBean bean = (PurchaseOrderCreateBean)bill.get(i);
				String PoBill = bean.getBillNo();
				
				String[] billNo = PoBill.split("/");
				
				String lNo = billNo[3]; 

				int lstNo = Integer.parseInt(lNo);
				
				int lastNo = lstNo + 1;
				
				if(lastNo<10)
				{
					poNo = "PO"+"/"+year+"/"+month+"/"+"00"+lastNo;
					System.out.println("IN IF 1 HELPER poNo :- "+poNo);
				}
				else
				{
					poNo = "PO"+"/"+year+"/"+month+"/"+lastNo;
					System.out.println("IN ELSE 1 HELPER poNo :- "+poNo);
				}
				
				
			}
			
			PurchaseOrderCreateHibernateNew hibernate = new PurchaseOrderCreateHibernateNew();
				for(int i=0;i<count;i++)
				{
					
					if(PoBill == null || PoBill =="")
					{
						hibernate.setBillNo(poNo);
						billNoForPdf = poNo;
						System.out.println("IN IF 2 HELPER setBillNo(poNo) :- "+poNo);
						
					}
					else
					{
						hibernate.setBillNo(poNo);
						billNoForPdf = poNo;
						System.out.println("IN ELSE 2 HELPER setBillNo(poNo) :- "+poNo);
						
					}
					
					
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						String strMonth= format.format(new Date());
						String d1123 = strMonth.toString();	
						String[] dt = d1123.split("-");
						String year1 = dt[0];
						String month1 = dt[1];
						String date1 = dt[2];
						String poDate = year1+"-"+month1+"-"+date1;
						
							hibernate.setPurchaseOrderDate(poDate);
							System.out.println("IN HELPER setPurchaseOrderDate:- "+poDate);
					
			
				String vendorname = request.getParameter("vendorname");
				String vendorcompanyname = request.getParameter("vendorcompanyname");
				String contactno = request.getParameter("contactno");
				String streetaddress = request.getParameter("streetaddress");
				String city = request.getParameter("city");
				String fax = request.getParameter("fax");
				
//				String grossTotal = request.getParameter("grossTotal");
//				String productDescription = request.getParameter("productDescription"+i);
//				String quantity = request.getParameter("quantity"+i);
//				String unitPrice = request.getParameter("unitPrice"+i);
//				String gst = request.getParameter("gst");
//				String vat = request.getParameter("vat");
//				String total = request.getParameter("total"+i);
//				String subtotal = request.getParameter("subtotal");
				
				String productName = request.getParameter("productName"+i);
				String description = request.getParameter("description"+i);
				String hsnSac = request.getParameter("hsnSac"+i);
				String unitPrice = request.getParameter("unitPrice"+i);
				String quantity = request.getParameter("quantity"+i);				
				String amount = request.getParameter("amount"+i);
				String discountPercent = request.getParameter("discountPercent"+i);
				String discountAmount = request.getParameter("discountAmount"+i);
				String subTotal = request.getParameter("subTotal"+i);
				String GST = request.getParameter("GST"+i);
				//String SGST = request.getParameter("SGST"+i);
				String IGST = request.getParameter("IGST"+i);
				String taxAmount = request.getParameter("taxAmount"+i);
				String total = request.getParameter("total"+i);
				
				String totalSubTotal = request.getParameter("totalSubTotal");
				String totalTaxAmount = request.getParameter("totalTaxAmount");
				String grossTotal = request.getParameter("grossTotal");
				
				String companyAddress = request.getParameter("companyAddress");
				String gstinNumber = request.getParameter("gstinNumber");
				String panNumber = request.getParameter("panNumber");
				String cinNumber = request.getParameter("cinNumber");
				String zipcode = request.getParameter("zipcode");
				String phone = request.getParameter("phone");
				
				
				hibernate.setCompanyAddress(companyAddress);
				hibernate.setPanNumber(panNumber);
				hibernate.setVendorName(vendorname);
				hibernate.setVendorCompanyName(vendorcompanyname);
				hibernate.setContactNo(contactno);
				hibernate.setStreetAddress(streetaddress);
				
				
				hibernate.setProductName(productName);
				if(!"".equals(description)){
					hibernate.setDescription(description);
				}else{
					hibernate.setDescription("N/A");
				}
				if(!"".equals(hsnSac)){
					hibernate.setHsnSac(hsnSac);
				}else{
					hibernate.setHsnSac("0");
				}			
				hibernate.setUnitPrice(Double.parseDouble(unitPrice));
				hibernate.setQuantity(Long.parseLong(quantity));
				hibernate.setAmount(Double.parseDouble(amount));
				hibernate.setDiscountPercent(Double.parseDouble(discountPercent));
				hibernate.setDiscountAmount(Double.parseDouble(discountAmount));
				hibernate.setSubTotal(Double.parseDouble(subTotal));			
				if(!"".equals(GST)){
					hibernate.setGST(Double.parseDouble(GST));
				}else{
					hibernate.setGST(0d);
				}
				//hibernate.setSGST(Double.parseDouble(SGST));
				//hibernate.setGST(Double.parseDouble(GST));
				if(!"".equals(IGST)){
					hibernate.setIGST(Double.parseDouble(IGST));
				}else{
					hibernate.setIGST(0d);
				}
				hibernate.setTaxAmount(Double.parseDouble(taxAmount));
				hibernate.setTotal(Double.parseDouble(total));
				hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
				hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
				hibernate.setGrossTotal(Double.parseDouble(grossTotal));
				
				
				
//				hibernate.setSubTotal(Double.parseDouble(subtotal));
//				hibernate.setGst(Long.parseLong(gst));
//				hibernate.setVat(Double.parseDouble(vat));
//				hibernate.setGrossTotal(Double.parseDouble(grossTotal));
//				hibernate.setProductDescription(productDescription);
//				hibernate.setQuantity(Long.parseLong(quantity));
//				hibernate.setUnitPrice(Double.parseDouble(unitPrice));
//				hibernate.setTotal(Double.parseDouble(total));
				hibernate.setCity(city);
				hibernate.setZipCode(zipcode);
				
				
				if(!"".equals(gstinNumber)){
					hibernate.setGstinNumber(gstinNumber);
					
				}else{
					hibernate.setGstinNumber("N/A");
				}
				
				if(!"".equals(cinNumber)){
					hibernate.setCinNumber(cinNumber);
					
				}else{
					hibernate.setCinNumber("N/A");
				}
				
				
				/*
				if(!"".equals(city)){
					bean.setCity(city);
					
				}else{
					bean.setCity("-");
				}
				
				
				if(!"".equals(zipcode)){
					bean.setZipCode(zipcode);
					
				}else{
					bean.setZipCode("-");
				}
				*/
				
				
				
				if(!"".equals(phone)){
					hibernate.setPhone(phone);
					
				}else{
					hibernate.setPhone("N/A");
				}
				
				
				if(!"".equals(fax)){
					hibernate.setFax(fax);
					
				}else{
					hibernate.setFax("N/A");
				}
			
				session3.setAttribute("vendorName", vendorname);
				session3.setAttribute("vendorCompanyName",vendorcompanyname);
				session3.setAttribute("contactNo", contactno);
				session3.setAttribute("streetAddress",streetaddress);
				session3.setAttribute("City", city);
				session3.setAttribute("zipCode",zipcode);
			
			//	session3.setAttribute("Phone", phone);
			//	session3.setAttribute("Fax",fax);
				
//				String totalSubTotal = request.getParameter("totalSubTotal");
//				String totalTaxAmount = request.getParameter("totalTaxAmount");
//				String grossTotal = request.getParameter("grossTotal");
				
				String gst ="0";
				session3.setAttribute("subTotal",totalSubTotal);
				session3.setAttribute("GSTForPDF",GST);
				session3.setAttribute("IGSTForPDF",IGST);
				session3.setAttribute("totalTaxAmount",totalTaxAmount);
				
//				session3.setAttribute("subTotal",subtotal);
//				session3.setAttribute("gst",gst);
//				session3.setAttribute("vat",vat);
				session3.setAttribute("grossTotalForPDF",grossTotal);
				session3.setAttribute("billNoForPdf",billNoForPdf);
				
				
				
				PurchaseOrderDao dao = new PurchaseOrderDao();
				dao.savePurchaseOrderCreateDetailas(hibernate);
				
			}
		}

	
	// get Total And Balance Amount By VendorName
	public Map getTotalAndBalanceAmountByVendorName(String fkVendorId, String vendorName) 
	{
		int count = 1;
		PurchaseOrderDao dao = new PurchaseOrderDao();
		List list= dao.getTotalAndBalanceAmountByVendorName(fkVendorId,vendorName);

		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			
			PurchaseOrderBean bean = new PurchaseOrderBean();
			System.out.println(Arrays.toString(o));
			
			Double gr = (double) Math.round(Double.parseDouble(o[0].toString()));
		    Double ba = (double) Math.round(Double.parseDouble(o[1].toString()));
		
			bean.setGrossTotal(gr);
			bean.setBalanceStatus(ba);
			
			System.out.println("***************"+o[0]);
			
			System.out.println("***************"+o[1]);
			
			map.put(count,bean);
			count++;
		}
		return map;
	}
	

		// get Bill Amount And Balance Amount By Bill No By
		public Map getTotalByBillNo(String billNo) 
		{
			int count = 1;
			PurchaseOrderDao dao = new PurchaseOrderDao();
			List list= dao.getTotalByBillNo(billNo);
			
			System.out.println("FOR TOTAL-------=========== SIZE   : "+list.size());
			
			Map  map =  new HashMap();
			
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				
				PurchaseOrderBean bean = new PurchaseOrderBean();
				System.out.println(Arrays.toString(o));
				
				bean.setBillNo(o[0].toString());
				bean.setBillAmount(o[1].toString());
				bean.setBalanceStatus(Double.parseDouble(o[2].toString()));
				
				System.out.println("***************"+o[0]);
				
				map.put(count,bean);
				count++;
			}
			
			System.out.println("MAP in HELPER  :    --FOR TOTAL--------   "+map.size());
			return map;
		}
		
		// get Bill Amount And Balance Amount By Bill No By
			public Map getTotalByBillNoForClient(String billNo2) 
			{
				int count = 1;
				PurchaseOrderDao dao = new PurchaseOrderDao();
				List list= dao.getTotalByBillNoForClient(billNo2);
				
				System.out.println("FOR TOTAL-------=========== SIZE   : "+list.size());
				
				Map  map =  new HashMap();
				
				for(int i=0;i<list.size();i++)
				{
					Object[] o = (Object[])list.get(i);
					
					PurchaseOrderBean bean = new PurchaseOrderBean();
					System.out.println(Arrays.toString(o));
					
					bean.setBillNo(o[0].toString());
					bean.setBillAmount(o[1].toString());
					bean.setBalanceStatus(Double.parseDouble(o[2].toString()));
					
					System.out.println("***************"+o[0]);
					
					map.put(count,bean);
					count++;
				}
				
				System.out.println("MAP in HELPER  :    --FOR TOTAL--------   "+map.size());
				return map;
			}
			
			
			//get Vendor detailas for Purchase Order Create
			public Map getVendorDetailas(Long vendorId) {

			 	System.out.println("into helper class");
			 	PurchaseOrderDao dao1 = new PurchaseOrderDao();
				List venList = dao1.getVendorDetailas(vendorId);
				
				Map  map =  new HashMap();
				for(int i=0;i<venList.size();i++)
				{
					Object[] o = (Object[])venList.get(i);
				
					PurchaseOrderCreateBean b = new PurchaseOrderCreateBean();
					
				//	System.out.println("in for loop----------------- : "+catList.size());
					
					b.setPkVendorId(Long.parseLong(o[0].toString()));
					b.setVendorCompanyName(o[1].toString());
					b.setContactNumber(o[2].toString());
					b.setStreetAddress(o[3].toString());
					b.setVendorCompanyAddress(o[4].toString());
					b.setGstInNumber(o[5].toString());
					b.setPanNumber(o[6].toString());
					b.setCimNumber(o[7].toString());
					b.setCity(o[8].toString());
					b.setZipCode(o[9].toString());
					b.setPhone(o[10].toString());

					map.put(b.getPkVendorId(),b);
				}
				System.out.println("out of helper return map : "+map.size());
				return map;
			
			}	
					
			
			// Get List For Purchase Order Create
			public List getPurchaseOrderCreateList(HttpServletRequest request, HttpServletResponse response) 
			{
				Map<Long, PurchaseOrderCreateBeanNew> map = new HashMap<Long, PurchaseOrderCreateBeanNew>();
				PurchaseOrderDao dao = new PurchaseOrderDao();
				List<PurchaseOrderCreateBeanNew> exp1List = dao.getPurchaseOrderCreateList();
				
				System.out.println("IN HELPER--------------==== :  "+exp1List.size());
				return exp1List;
			}
			
			//get purchase Order Create Report
			public List getpurchaseOrderCreateReport(HttpServletRequest request, HttpServletResponse response) 
			{
				Map<Long, PurchaseOrderCreateBeanNew> map = new HashMap<Long, PurchaseOrderCreateBeanNew>();
				PurchaseOrderDao dao = new PurchaseOrderDao();
				List<PurchaseOrderCreateBeanNew> exp1List = dao.getpurchaseOrderCreateReport();
				
				System.out.println("IN HELPER--------------==== :  "+exp1List.size());
				return exp1List;
			}
			
			// Get List For Purchase Order Receive
			public List getpurchaseOrderReceiveList(HttpServletRequest request, HttpServletResponse response) 
			{
				Map<Long, PurchaseOrderBean> map = new HashMap<Long, PurchaseOrderBean>();
				PurchaseOrderDao dao = new PurchaseOrderDao();
				List<PurchaseOrderBean> exp1List = dao.getAllPurchaseOrderReceiveInfo();
				
				System.out.println("IN HELPER--------------==== :  "+exp1List.size());
				return exp1List;
			}
			
	
			// Get Client Records
			public List getClientRecords(HttpServletRequest request, HttpServletResponse response) 
			{
				String type = request.getParameter("client");
				Map<Long, PurchaseOrderBean> map = new HashMap<Long, PurchaseOrderBean>();

				PurchaseOrderDao dao = new PurchaseOrderDao();
				List<PurchaseOrderBean> exp1List = dao.getClientRecords(type);

				return exp1List;

			}


			public Map getPOBillNo(String fkVendorId) {
				int count = 1;

				PurchaseOrderDao dao = new PurchaseOrderDao();
				List list = dao.getPOBillNo(fkVendorId);

				Map map = new HashMap();
				for (int i = 0; i < list.size(); i++) {
					Object[] o = (Object[]) list.get(i);

					PurchaseOrderCreateBeanNew bean = new PurchaseOrderCreateBeanNew();
					bean.setBillNo(o[1].toString());
					bean.setPkVendorId(Long.parseLong(o[0].toString()));

					System.out.println("***************" + o[0]);
					map.put(count, bean);
					count++;
				}
				return map;
}


			public Map getPODate(String billno) {

				int count = 1;

				PurchaseOrderDao dao = new PurchaseOrderDao();
				List list = dao.getPODate(billno);

				Map map = new HashMap();
				for (int i = 0; i < list.size(); i++) {
					Object[] o = (Object[]) list.get(i);

					PurchaseOrderCreateBeanNew bean = new PurchaseOrderCreateBeanNew();
					bean.setPoDate(o[1].toString());
					bean.setPkVendorId(Long.parseLong(o[0].toString()));

					System.out.println("***************" + o[0]);
					map.put(count, bean);
					count++;
				}
				return map;
}


			public Map getPurchaseFieldsInfo(String billno) {

				int count = 1;

				PurchaseOrderDao dao = new PurchaseOrderDao();
				List list = dao.getPurchaseFieldsInfo(billno);

				Map map = new HashMap();
				for (int i = 0; i < list.size(); i++) {
					Object[] o = (Object[]) list.get(i);
					
					System.out.println("result - " +Arrays.toString(o));
					
					PurchaseOrderCreateHibernateNew bean = new PurchaseOrderCreateHibernateNew();
					
					bean.setPkVendorId(Long.parseLong(o[0].toString()));
					bean.setVendorName(o[1].toString());
					bean.setVendorCompanyName(o[2].toString());
					bean.setContactNo(o[3].toString());
					bean.setStreetAddress(o[4].toString());
					bean.setCompanyAddress(o[5].toString());
					bean.setGstinNumber(o[5].toString());
					bean.setPanNumber(o[7].toString());
					bean.setCinNumber(o[8].toString());
					bean.setCity(o[9].toString());
					bean.setZipCode(o[10].toString());
					bean.setPhone(o[11].toString());
					bean.setFax(o[12].toString());					
					bean.setTotalSubTotal(Double.parseDouble(o[13].toString()));
					bean.setTotalTaxAmount(Double.parseDouble(o[14].toString()));
					bean.setGrossTotal(Double.parseDouble(o[15].toString()));
					
					map.put(count, bean);
					count++;
				}
				return map;
}



			public Map getAllPOBillNoAgainst(String fkVendorId) {

					int count = 1;

					PurchaseOrderDao dao = new PurchaseOrderDao();
					List list = dao.getAllPOBillNoAgainst(fkVendorId);

					Map map = new HashMap();
					for (int i = 0; i < list.size(); i++) {
						Object[] o = (Object[]) list.get(i);

						PurchaseOrderCreateHibernateNew bean = new PurchaseOrderCreateHibernateNew();
						bean.setBillNo(o[1].toString());
						bean.setPkVendorId(Long.parseLong(o[0].toString()));

						System.out.println("Result - "+ Arrays.toString(o));
						map.put(count, bean);
						count++;
					}
					return map;
				}

	public List getPOGridsInfo1(String billno) {

		Map<String, PurchaseOrderCreateHibernateNew> map = new HashMap<String, PurchaseOrderCreateHibernateNew>();
		PurchaseOrderDao dao = new PurchaseOrderDao();
		List<PurchaseOrderCreateHibernateNew> exp1List = dao.getPOGridsInfo1(billno);

		return exp1List;

	}
			
			public void updatePurchaseOrderInfo(HttpServletRequest request,HttpServletResponse response)
			{
					Integer count = Integer.parseInt(request.getParameter("count"));
					
						for(int i=0;i<count;i++)
						{
					
						String vendorname = request.getParameter("vendorname");
						String vendorcompanyname = request.getParameter("vendorcompanyname");
						String contactno = request.getParameter("contactno");
						String streetaddress = request.getParameter("streetaddress");
						String city = request.getParameter("city");
						String fax = request.getParameter("fax");
						
						
						//String productName = request.getParameter("productName"+i);
						String description = request.getParameter("description"+i);
						String hsnSac = request.getParameter("hsnSac"+i);
						String unitPrice = request.getParameter("unitPrice"+i);
						String quantity = request.getParameter("quantity"+i);				
						String amount = request.getParameter("amount"+i);
						String discountPercent = request.getParameter("discountPercent"+i);
						String discountAmount = request.getParameter("discountAmount"+i);
						String subTotal = request.getParameter("subTotal"+i);
						String GST = request.getParameter("GST"+i);
						//String SGST = request.getParameter("SGST"+i);
						String IGST = request.getParameter("IGST"+i);
						String taxAmount = request.getParameter("taxAmount"+i);
						String total = request.getParameter("total"+i);
						String billNo = request.getParameter("billNo"+i);
						String pkVendorId = request.getParameter("pkVendorId"+i);
						
						String totalSubTotal = request.getParameter("totalSubTotal");
						String totalTaxAmount = request.getParameter("totalTaxAmount");
						String grossTotal = request.getParameter("grossTotal");
						
						String companyAddress = request.getParameter("companyAddress");
						String gstinNumber = request.getParameter("gstinNumber");
						String panNumber = request.getParameter("panNumber");
						String cinNumber = request.getParameter("cinNumber");
						String zipcode = request.getParameter("zipcode");
						String phone = request.getParameter("phone");
						

						HibernateUtility hbu = HibernateUtility.getInstance();
						Session session = hbu.getHibernateSession();
						Transaction transaction = session.beginTransaction();
						
						Long pkVendorId1 = Long.parseLong(pkVendorId);
						
						PurchaseOrderCreateHibernateNew hibernate = (PurchaseOrderCreateHibernateNew) session.get(PurchaseOrderCreateHibernateNew.class,new Long(pkVendorId1));
						
						hibernate.setCompanyAddress(companyAddress);
						hibernate.setPanNumber(panNumber);
						//hibernate.setVendorName(vendorname);
						hibernate.setVendorCompanyName(vendorcompanyname);
						hibernate.setContactNo(contactno);
						hibernate.setStreetAddress(streetaddress);
						
						
					/*	hibernate.setProductName(productName);
						if(!"".equals(description)){
							hibernate.setDescription(description);
						}else{
							hibernate.setDescription("N/A");
						}*/
						
						if(!"".equals(hsnSac)){
							hibernate.setHsnSac(hsnSac);
						}else{
							hibernate.setHsnSac("0");
						}			
						hibernate.setUnitPrice(Double.parseDouble(unitPrice));
						hibernate.setQuantity(Long.parseLong(quantity));
						hibernate.setAmount(Double.parseDouble(amount));
						hibernate.setDiscountPercent(Double.parseDouble(discountPercent));
						hibernate.setDiscountAmount(Double.parseDouble(discountAmount));
						hibernate.setSubTotal(Double.parseDouble(subTotal));			
						if(!"".equals(GST)){
							hibernate.setGST(Double.parseDouble(GST));
						}else{
							hibernate.setGST(0d);
						}
						if(!"".equals(IGST)){
							hibernate.setIGST(Double.parseDouble(IGST));
						}else{
							hibernate.setIGST(0d);
						}
						hibernate.setTaxAmount(Double.parseDouble(taxAmount));
						hibernate.setTotal(Double.parseDouble(total));
						hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
						hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
						hibernate.setGrossTotal(Double.parseDouble(grossTotal));
						//hibernate.setGrossTotal(Double.parseDouble(billNo));
		
						hibernate.setCity(city);
						hibernate.setZipCode(zipcode);
						
						
						if(!"".equals(gstinNumber)){
							hibernate.setGstinNumber(gstinNumber);
							
						}else{
							hibernate.setGstinNumber("N/A");
						}
						
						if(!"".equals(cinNumber)){
							hibernate.setCinNumber(cinNumber);
							
						}else{
							hibernate.setCinNumber("N/A");
						}
						
						if(!"".equals(phone)){
							hibernate.setPhone(phone);
							
						}else{
							hibernate.setPhone("N/A");
						}
						
						
						if(!"".equals(fax)){
							hibernate.setFax(fax);
							
						}else{
							hibernate.setFax("N/A");
						}
						
						session.saveOrUpdate(hibernate);
						transaction.commit();
						
						//break;
						
						HttpSession session3 = request.getSession();
						
						session3.setAttribute("vendorName", vendorname);
						session3.setAttribute("vendorCompanyName",vendorcompanyname);
						session3.setAttribute("contactNo", contactno);
						session3.setAttribute("streetAddress",streetaddress);
						session3.setAttribute("City", city);
						session3.setAttribute("zipCode",zipcode);
						
						//String gst ="0";
						session3.setAttribute("subTotal",totalSubTotal);
						session3.setAttribute("GSTForPDF",GST);
						session3.setAttribute("IGSTForPDF",IGST);
						session3.setAttribute("totalTaxAmount",totalTaxAmount);
						
						session3.setAttribute("grossTotalForPDF",grossTotal);
						session3.setAttribute("billNoForPdf",billNo);
						
						
						
						//PurchaseOrderDao dao = new PurchaseOrderDao();
						//dao.savePurchaseOrderCreateDetailas(hibernate);
						
					}
				}
			
			public List getPurchaseDetailsRangeWise(HttpServletRequest request, HttpServletResponse response) {

				String startDate = request.getParameter("startDate");
				String endDate = request.getParameter("endDate");
				
				Map<Long, PurchaseOrderHibernate> map = new HashMap<Long, PurchaseOrderHibernate>();

				PurchaseOrderDao dao = new PurchaseOrderDao();
				List<PurchaseOrderCreateHibernateNew> exp1List = dao.getPurchaseDetailsRangeWise(startDate, endDate);

				return exp1List;

			}
			
}