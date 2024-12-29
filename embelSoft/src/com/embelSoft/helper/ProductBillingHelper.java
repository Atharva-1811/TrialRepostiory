package com.embelSoft.helper;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import org.jfree.util.Log;
import org.json.JSONException;

import com.embelSoft.bean.HrBillingBean;
import com.embelSoft.bean.ProductBillingBean;
import com.embelSoft.bean.ProductBillingBeanNew;
import com.embelSoft.bean.ProductBillingDtlForClientPaymentCashBookBean;
import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.ResourceBillingBean;
import com.embelSoft.dao.CashbookDao;
import com.embelSoft.dao.HRBillingDao;
import com.embelSoft.dao.ProductBillingDao;
import com.embelSoft.dao.ProductDetailsDao;
import com.embelSoft.dao.PurchaseOrderDao;
import com.embelSoft.dao.ResourceBillingDao;
import com.embelSoft.hibernate.HRBillingHibernate;
import com.embelSoft.hibernate.ProductBillingDtlForClientPaymentCashBookHibernate;
import com.embelSoft.hibernate.ProductBillingHibernate;
import com.embelSoft.hibernate.ProductBillingHibernateNew;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.hibernate.ResourceBillingHibernate;
import com.embelSoft.hibernate.perfromabillingHibernate;
import com.embelSoft.utility.HibernateUtility;
import com.embelSoft.utility.MyJob;

public class ProductBillingHelper {
	
	//New Product Billing coding methods
	
	//getGridForProductBilling
	private Double productCost = 0d;
	private Double CGST = 0d;
	private Double SGST = 0d;

	public List getGridForProductBilling(String fkProductId, String billno) {
	
			Map<String, ProductBillingBeanNew> map = new HashMap<String, ProductBillingBeanNew>();
			ProductBillingDao dao = new ProductBillingDao();
			
			List<ProductBillingBeanNew> exp1List = dao.getTaxDetailsForProductBillibg(fkProductId,billno);

			return exp1List;
			
		}
	
	//save Product Billing Details
	public void saveProductBillingDetails(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException 
	{
		System.out.println("IN HELPER");
		String Hr;
		String productBillNoForPdf;
		String Igst;
		String Sgst;
		String Cgest;
		HttpSession session = request.getSession();
		
		Integer count = Integer.parseInt(request.getParameter("count"));

		/*
		 * SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd"); Date
		 * dateobj = new Date();
		 * 
		 * String d4 = dateobj.toString(); String[] d = d4.split(" "); String year =
		 * d[5]; String month = d[1];
		 */
		
		SimpleDateFormat simpleformat = new SimpleDateFormat(" dd MM yyyy");


		// displaying month in MMMM format
		simpleformat = new SimpleDateFormat("MM yyyy");
		String strMonth= simpleformat.format(new Date());
		System.out.println("Month in MMMM format = "+strMonth);


		String d1123 = strMonth.toString();	
		String[] d = d1123.split(" ");
		String year = d[1];
		String month = d[0];
		String productBillNo = month+"/"+year+"/"+"00"+1;
		
		ProductBillingDao hrDao = new ProductBillingDao();
		List bill = hrDao.getProductLastBillNo();
			
		for(int i=0;i<bill.size();i++)
		{
			ProductBillingBeanNew bean = (ProductBillingBeanNew)bill.get(i);
			
			Hr = bean.getBillNo();
			String[] HrBil = Hr.split("/");			
			String lNo = HrBil[2];			
			int lstNo = Integer.parseInt(lNo);			
			int LastNo = lstNo + 1;			
			
			if(LastNo<10)
			{
				productBillNo = month+"/"+year+"/"+"00"+LastNo;
			}				
			else
			{
				productBillNo = month+"/"+year+"/"+LastNo;
			}
		}
		
		ProductBillingHibernateNew hibernate = new ProductBillingHibernateNew();
		
		for(int i=0;i<count;i++)
		{			
			//Long pkResourceBillId;
			//String billNo;
			
			String fkClientId = request.getParameter("fkClientId");
			String clientName = request.getParameter("clientName");
			String billDate = request.getParameter("productBillDate");
			
			String fkProductId = request.getParameter("fkProductId"+i);
			String productName = request.getParameter("productName"+i);
			String description = request.getParameter("description"+i);
			
			
			System.out.println("description is==="+description);
			
			
			String hsnSac = request.getParameter("hsnSac"+i);
			String unitPrice = request.getParameter("unitPrice"+i);
			String quantity = request.getParameter("quantity"+i);				
			String amount = request.getParameter("amount"+i);
			String discountPercent = request.getParameter("discountPercent"+i);
			String discountAmount = request.getParameter("discountAmount"+i);
			String subTotal = request.getParameter("subTotal"+i);
			String CGST = request.getParameter("CGST"+i);
			String SGST = request.getParameter("SGST"+i);
			String IGST = request.getParameter("IGST"+i);
			String taxAmount = request.getParameter("taxAmount"+i);
			String total = request.getParameter("total"+i);
			String bookingNoAB = request.getParameter("billNo"+i);
			String totalSubTotal = request.getParameter("totalSubTotalProduct");
			String totalTaxAmount = request.getParameter("totalTaxAmountProduct");
			System.out.println("HEALPER totalTaxAmount :-  "+totalTaxAmount);
			String grossTotal = request.getParameter("grossTotalProduct");
		
			String ShipAddress = request.getParameter("ShipAddress");
			
			
			String CourierName = request.getParameter("CourierName");
			String Courierid = request.getParameter("Courierid");
			
			String taxPercentage = request.getParameter("taxPercentage"+i);
			if(productBillNo == null)
			{
				hibernate.setBillNo(productBillNo);
				productBillNoForPdf = productBillNo;					
			}
			else
			{
				hibernate.setBillNo(productBillNo);
				productBillNoForPdf = productBillNo;	
			}
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date d1 = null;
		
			try
			{
				d1 = format.parse(billDate);
				hibernate.setBillDate(d1);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			hibernate.setFkClientId(Long.parseLong(fkClientId));
			hibernate.setClientName(clientName);
			
			hibernate.setFkProductId(Long.parseLong(fkProductId));
			hibernate.setProductName(productName);
			
			
			
			if(!"".equals(CourierName)){
				hibernate.setCourierName(CourierName);
			}else{
				hibernate.setCourierName("N/A");
			}
			if(!"".equals(Courierid)){
				hibernate.setCourierNumber(Courierid);
			}else{
				hibernate.setCourierNumber("N/A");
			}
			
			
			
			
			
			if(description == null || description.isEmpty() || description == "" || description == " ")
			{
				hibernate.setDescription("N/A");
			}else{
				
				hibernate.setDescription(description);
			}
			if(!"".equals(hsnSac)){
				hibernate.setHsnSac(hsnSac);
			}else{
				hibernate.setHsnSac("0");
			}
			hibernate.setUnitPrice(Double.parseDouble(unitPrice));
			hibernate.setQuantity(Long.parseLong(quantity));
			hibernate.setAmount(Double.parseDouble(amount));
			if(!"".equals(discountPercent)){
				hibernate.setDiscountPercent(Double.parseDouble(discountPercent));
			}else{
				hibernate.setDiscountPercent(Double.parseDouble("0"));
			}
			hibernate.setDiscountAmount(Double.parseDouble(discountAmount));
			hibernate.setSubTotal(Double.parseDouble(subTotal));
			if (CGST.equalsIgnoreCase("") || CGST == null || CGST.equalsIgnoreCase("undefined") || CGST.equalsIgnoreCase(" "))
			{
				hibernate.setCGST(Double.parseDouble("0"));
				
				Cgest="0";
			}else{
				
				hibernate.setCGST(Double.parseDouble(CGST));
				Cgest=CGST;
			}
			if (SGST.equalsIgnoreCase("") || SGST == null || SGST.equalsIgnoreCase("undefined") || SGST.equalsIgnoreCase(" "))
			{
				hibernate.setSGST(Double.parseDouble("0"));
				Sgst="0";
				
			}else{
				hibernate.setSGST(Double.parseDouble(SGST));
				Sgst=SGST;
			}
			if (IGST.equalsIgnoreCase("") || IGST == null || IGST.equalsIgnoreCase("undefined") || IGST.equalsIgnoreCase(" "))
			{
				hibernate.setIGST(Double.parseDouble("0"));
				Igst="0";
			}else{
				hibernate.setIGST(Double.parseDouble(IGST));
				Igst=IGST;
				
			}
			if(!"".equals(ShipAddress)){
				hibernate.setShipAddress(ShipAddress);
			}else{
				hibernate.setShipAddress("N/A");
			}
			hibernate.setTaxAmount(Double.parseDouble(taxAmount));
			hibernate.setTotal(Double.parseDouble(total));
			hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
			hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
			hibernate.setGrossTotal(Double.parseDouble(grossTotal));
			hibernate.setTaxPercentage(Double.parseDouble(taxPercentage));
			
			
			
			//set session attributes for product billing pdf			
			session.setAttribute("fkClientId", fkClientId);
			session.setAttribute("productBillNo", productBillNoForPdf);
			session.setAttribute("clientName", clientName);
			session.setAttribute("totalSubTotal", totalSubTotal);
			
			
			
			
			
			
			session.setAttribute("CGSTForPDF", Cgest);
			session.setAttribute("SGSTForPDF", Sgst);
			session.setAttribute("IGSTForPDF", Igst);
			session.setAttribute("totalTaxAmountForPDF", totalTaxAmount);
			session.setAttribute("grossTotalForPDF", grossTotal);
			session.setAttribute("billNo",productBillNo );
			session.setAttribute("taxPercentage",taxPercentage );
			
			ProductBillingDao dao = new ProductBillingDao();
			dao.saveProductBillingDetails(hibernate);
			
			
			 if(bookingNoAB != "0") {
				  //System.out.println("Long.parseLong(bookingNoAB) > 0 "+bookingNoAB);
				  ProductBillingDao advancebooking = new ProductBillingDao();
				  advancebooking.updateAdvanceBooking(bookingNoAB, productBillNo); }
			
			
			//code for save Product Billing Details For PO client
			//start 0
			Double grossTotalFromDB=0.0;
			String grossTotal12 = total;
			Double gTotal = Double.parseDouble(grossTotal12);					
			
			CashbookDao cbdao = new CashbookDao();
			List<ProductBillingDtlForClientPaymentCashBookBean> totalList = cbdao.getGrossTotal(fkClientId, clientName);	
		
			for(int j=0;j < totalList.size();j++)
			{
				
				ProductBillingDtlForClientPaymentCashBookBean sr =	(ProductBillingDtlForClientPaymentCashBookBean)totalList.get(j);
				grossTotalFromDB = sr.getBalanceStatus();
				System.out.println("gross total from db"+sr.getGrossTotal());
			}		 
			
			Double updateGrossTotal = gTotal + grossTotalFromDB;			
			
			HibernateUtility hbu = HibernateUtility.getInstance();
			Session session2 = hbu.getHibernateSession();
			Transaction transaction = session2.beginTransaction();
			
			//Query query2 = session2.createSQLQuery("UPDATE product_billing_dtl_for_client_payment_cash_book SET balance_status = '"+updateGrossTotal+"' WHERE Type='client' AND name='"+clientName+"' AND fk_vendor_client_id='"+fkClientId+"'");
			Query query2 = session2.createSQLQuery("UPDATE product_billing_dtl_for_client_payment_cash_book SET balance_status = '"+updateGrossTotal+"' WHERE client_name='"+clientName+"' AND fk_client_id='"+fkClientId+"'");
			int count4 = query2.executeUpdate();
			
			transaction.commit();
			
			ProductBillingDtlForClientPaymentCashBookHibernate poh = new ProductBillingDtlForClientPaymentCashBookHibernate();
						
			poh.setFkClientId(Long.parseLong(fkClientId));
			poh.setClientName(clientName);
			if(productBillNo == null)
			{				
				poh.setBillNo(productBillNo);				
			}
			else
			{				
				poh.setBillNo(productBillNo);
			}
			
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			Date purchaseDate = null;
		
			try
			{
				purchaseDate = format2.parse(billDate);
				poh.setDate(purchaseDate);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			poh.setProductName(productName);
			//poh.setDescription(description);
			
			if(description == null || description.isEmpty() || description == "" || description == " ")
			{
				poh.setDescription("N/A");
			}else{
				
				poh.setDescription(description);
			}
			
			poh.setHsnSac(hsnSac);
			poh.setUnitPrice(Double.parseDouble(unitPrice));
			poh.setQuantity(Long.parseLong(quantity));
			poh.setAmount(Double.parseDouble(amount));
			poh.setDiscountPercent(Double.parseDouble(discountPercent));
			poh.setDiscountAmount(Double.parseDouble(discountAmount));
			poh.setSubTotal(Double.parseDouble(subTotal));
			/*
			 * poh.setCGST(Double.parseDouble(CGST)); poh.setSGST(Double.parseDouble(SGST));
			 * poh.setIGST(Double.parseDouble(IGST));
			 */
			
			
			if (CGST.equalsIgnoreCase("") || CGST == null || CGST.equalsIgnoreCase("undefined") || CGST.equalsIgnoreCase(" "))
			{
				poh.setCGST(Double.parseDouble("0"));
			}else{
				
				poh.setCGST(Double.parseDouble(CGST));
			}
			if (SGST.equalsIgnoreCase("") || SGST == null || SGST.equalsIgnoreCase("undefined") || SGST.equalsIgnoreCase(" "))
			{
				poh.setSGST(Double.parseDouble("0"));
				
			}else{
				poh.setSGST(Double.parseDouble(SGST));
				
			}
			if (IGST.equalsIgnoreCase("") || IGST == null || IGST.equalsIgnoreCase("undefined") || IGST.equalsIgnoreCase(" "))
			{
				poh.setIGST(Double.parseDouble("0"));
			}else{
				poh.setIGST(Double.parseDouble(IGST));

				
			}
			
			poh.setTaxAmount(Double.parseDouble(taxAmount));
			poh.setTotal(Double.parseDouble(total));
			poh.setTotalSubTotal(Double.parseDouble(totalSubTotal));
			poh.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
			poh.setGrossTotal(Double.parseDouble(grossTotal));
			poh.setBalanceStatus(updateGrossTotal);
			poh.setShipAddress(ShipAddress);
			CashbookDao daoForPO = new CashbookDao();
			daoForPO.saveProductBillingDetailsForClientPaymentCashbook(poh);
			//end 1
			

		  // MyJob job= new MyJob();
		   //job.execute();
		
		}
	}
	
	
	public void saveProductBillingDetails1(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException 
	{
		System.out.println("IN HELPER");
		String Hr;
		String productBillNoForPdf;
		String Igst;
		String Sgst;
		String Cgest;
		HttpSession session = request.getSession();
		
		Integer count = Integer.parseInt(request.getParameter("count"));

		/*
		 * SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd"); Date
		 * dateobj = new Date();
		 * 
		 * String d4 = dateobj.toString(); String[] d = d4.split(" "); String year =
		 * d[5]; String month = d[1];
		 */
		
		SimpleDateFormat simpleformat = new SimpleDateFormat(" dd MM yyyy");


		// displaying month in MMMM format
		simpleformat = new SimpleDateFormat("MM yyyy");
		String strMonth= simpleformat.format(new Date());
		System.out.println("Month in MMMM format = "+strMonth);


		String d1123 = strMonth.toString();	
		String[] d = d1123.split(" ");
		String year = d[1];
		String month = d[0];
		String productBillNo = "PI"+"/"+month+"/"+year+"/"+"00"+1;
		
		ProductBillingDao hrDao = new ProductBillingDao();
		List bill = hrDao.getProfrmaLastBillNo();
			
		for(int i=0;i<bill.size();i++)
		{
			ProductBillingBeanNew bean = (ProductBillingBeanNew)bill.get(i);
			
			Hr = bean.getBillNo();
			String[] HrBil = Hr.split("/");			
			String lNo = HrBil[3];			
			int lstNo = Integer.parseInt(lNo);			
			int LastNo = lstNo + 1;			
			
			if(LastNo<10)
			{
				productBillNo = "PI"+"/"+month+"/"+year+"/"+"00"+LastNo;
			}				
			else
			{
				productBillNo = "PI"+"/"+month+"/"+year+"/"+LastNo;
			}
		}
		
		perfromabillingHibernate hibernate = new perfromabillingHibernate();
		
		for(int i=0;i<count;i++)
		{			
			//Long pkResourceBillId;
			//String billNo;
			
			String fkClientId = request.getParameter("fkClientId");
			String clientName = request.getParameter("clientName");
			String billDate = request.getParameter("productBillDate");
			
			String fkProductId = request.getParameter("fkProductId"+i);
			String productName = request.getParameter("productName"+i);
			String description = request.getParameter("description"+i);
			
			
			System.out.println("description is==="+description);
			
			
			String hsnSac = request.getParameter("hsnSac"+i);
			String unitPrice = request.getParameter("unitPrice"+i);
			String quantity = request.getParameter("quantity"+i);				
			String amount = request.getParameter("amount"+i);
			String discountPercent = request.getParameter("discountPercent"+i);
			String discountAmount = request.getParameter("discountAmount"+i);
			String subTotal = request.getParameter("subTotal"+i);
			String CGST = request.getParameter("CGST"+i);
			String SGST = request.getParameter("SGST"+i);
			String IGST = request.getParameter("IGST"+i);
			String taxAmount = request.getParameter("taxAmount"+i);
			String total = request.getParameter("total"+i);
			
			String totalSubTotal = request.getParameter("totalSubTotalProduct");
			String totalTaxAmount = request.getParameter("totalTaxAmountProduct");
			System.out.println("HEALPER totalTaxAmount :-  "+totalTaxAmount);
			String grossTotal = request.getParameter("grossTotalProduct");
		
			String ShipAddress = request.getParameter("ShipAddress");
			
			
			String CourierName = request.getParameter("CourierName");
			String Courierid = request.getParameter("Courierid");
			
			
			if(productBillNo == null)
			{
				hibernate.setBillNo(productBillNo);
				productBillNoForPdf = productBillNo;					
			}
			else
			{
				hibernate.setBillNo(productBillNo);
				productBillNoForPdf = productBillNo;	
			}
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date d1 = null;
		
			try
			{
				d1 = format.parse(billDate);
				hibernate.setBillDate(d1);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			hibernate.setFkClientId(Long.parseLong(fkClientId));
			hibernate.setClientName(clientName);
			
			hibernate.setFkProductId(Long.parseLong(fkProductId));
			hibernate.setProductName(productName);
			
			
			
			if(!"".equals(CourierName)){
				hibernate.setCourierName(CourierName);
			}else{
				hibernate.setCourierName("N/A");
			}
			if(!"".equals(Courierid)){
				hibernate.setCourierNumber(Courierid);
			}else{
				hibernate.setCourierNumber("N/A");
			}
			
			
			
			
			
			if(description == null || description.isEmpty() || description == "" || description == " ")
			{
				hibernate.setDescription("N/A");
			}else{
				
				hibernate.setDescription(description);
			}
			if(!"".equals(hsnSac)){
				hibernate.setHsnSac(hsnSac);
			}else{
				hibernate.setHsnSac("0");
			}
			hibernate.setUnitPrice(Double.parseDouble(unitPrice));
			hibernate.setQuantity(Long.parseLong(quantity));
			hibernate.setAmount(Double.parseDouble(amount));
			if(!"".equals(discountPercent)){
				hibernate.setDiscountPercent(Double.parseDouble(discountPercent));
			}else{
				hibernate.setDiscountPercent(Double.parseDouble("0"));
			}
			hibernate.setDiscountAmount(Double.parseDouble(discountAmount));
			hibernate.setSubTotal(Double.parseDouble(subTotal));
			if (CGST.equalsIgnoreCase("") || CGST == null || CGST.equalsIgnoreCase("undefined") || CGST.equalsIgnoreCase(" "))
			{
				hibernate.setCGST(Double.parseDouble("0"));
				
				Cgest="0";
			}else{
				
				hibernate.setCGST(Double.parseDouble(CGST));
				Cgest=CGST;
			}
			if (SGST.equalsIgnoreCase("") || SGST == null || SGST.equalsIgnoreCase("undefined") || SGST.equalsIgnoreCase(" "))
			{
				hibernate.setSGST(Double.parseDouble("0"));
				Sgst="0";
				
			}else{
				hibernate.setSGST(Double.parseDouble(SGST));
				Sgst=SGST;
			}
			if (IGST.equalsIgnoreCase("") || IGST == null || IGST.equalsIgnoreCase("undefined") || IGST.equalsIgnoreCase(" "))
			{
				hibernate.setIGST(Double.parseDouble("0"));
				Igst="0";
			}else{
				hibernate.setIGST(Double.parseDouble(IGST));
				Igst=IGST;
				
			}
			if(!"".equals(ShipAddress)){
				hibernate.setShipAddress(ShipAddress);
			}else{
				hibernate.setShipAddress("N/A");
			}
			hibernate.setTaxAmount(Double.parseDouble(taxAmount));
			hibernate.setTotal(Double.parseDouble(total));
			hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
			hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
			hibernate.setGrossTotal(Double.parseDouble(grossTotal));
			
			
			
			
			//set session attributes for product billing pdf			
			session.setAttribute("fkClientId", fkClientId);
			session.setAttribute("productBillNo", productBillNoForPdf);
			session.setAttribute("clientName", clientName);
			session.setAttribute("totalSubTotal", totalSubTotal);
			
			session.setAttribute("CGSTForPDF", Cgest);
			session.setAttribute("SGSTForPDF", Sgst);
			session.setAttribute("IGSTForPDF", Igst);
			session.setAttribute("totalTaxAmountForPDF", totalTaxAmount);
			session.setAttribute("grossTotalForPDF", grossTotal);
			session.setAttribute("billNo",productBillNo );

			ProductBillingDao dao = new ProductBillingDao();
			dao.saveProductBillingDetails1(hibernate);
			//code for save Product Billing Details For PO client
			//start 0
			
		
		}
	}
	
	//
	public List getProductBillingListNew(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ProductBillingBeanNew> map = new HashMap<Long, ProductBillingBeanNew>();
		ProductBillingDao dao = new ProductBillingDao();
		List<ProductBillingBeanNew> productBillingList = dao.getProductBillingListNew();
		System.out.println("IN HELPER--------------==== :  "+productBillingList.size());
		return productBillingList;
	}
	
	//getProductBillingReportByNameAndDates
	public List getProductBillingReportByNameAndDates(HttpServletRequest request, HttpServletResponse response) 
	{
		String fkClientId = request.getParameter("fkClientId");
		String clientName = request.getParameter("clientName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		ProductBillingDao dao = new ProductBillingDao();
		List<ProductBillingBeanNew> productBillingList = dao.getProductBillingReportByNameAndDates(fkClientId, clientName, startDate, endDate);
		return productBillingList;
	}
	
	public List getProductBillingReportByNameAndDates11(HttpServletRequest request, HttpServletResponse response) 
	{
		String fkClientId = request.getParameter("fkClientId");
		String clientName = request.getParameter("clientName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		ProductBillingDao dao = new ProductBillingDao();
		List<ProductBillingBeanNew> productBillingList = dao.getpfromaBillingReportByNameAndDates(fkClientId, clientName, startDate, endDate);
		return productBillingList;
	}
	
	public List getProductBillingReportByNameAndDates1(HttpServletRequest request, HttpServletResponse response) 
	{
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		ProductBillingDao dao = new ProductBillingDao();
		List<ProductBillingBeanNew> productBillingList = dao.getProductBillingReportByNameAndDates1( startDate, endDate);
		return productBillingList;
	}
	
	public List getProductBillingReportByNameAndDates111(HttpServletRequest request, HttpServletResponse response) 
	{
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		ProductBillingDao dao = new ProductBillingDao();
		List<ProductBillingBeanNew> productBillingList = dao.getProductBillingReportByNameAndDates11( startDate, endDate);
		return productBillingList;
	}
public void doProductBilligDetails(HttpServletRequest request,HttpServletResponse response) {
		
	
        String vendorName = request.getParameter("vendorName");		
		String fkVendorId = request.getParameter("fkVendorId");
		String billingDate = request.getParameter("billingDate");
		String srNO = request.getParameter("srNO");
		String description1 = request.getParameter("description1");
		String quantity1 = request.getParameter("quantity1");
		String unit1 = request.getParameter("unit1");
		String amount1 = request.getParameter("amount1");
		String subTotal1 = request.getParameter("subTotal1");
		String gst1 = request.getParameter("gst1");
		String vat1 = request.getParameter("vat1");
		String grossTotal2 = request.getParameter("grossTotal2");
	
		ProductBillingHibernate pbh = new ProductBillingHibernate();
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date dateOfBirth = null;
		try{
			dateOfBirth = format.parse(billingDate);
			pbh.setBillingDate(dateOfBirth);
			System.out.println(" date dateOfBirth parsing" +billingDate);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		//pbh.setSrNO(Long.parseLong(srNO));
		pbh.setDescription1(description1);
		pbh.setQuantity1(Long.parseLong(quantity1));
		pbh.setUnit1(Double.parseDouble(unit1));
		pbh.setAmount1(Double.parseDouble(amount1));
		pbh.setVendorName(vendorName);
		pbh.setFkVendorId(Long.parseLong(fkVendorId));
		pbh.setSubTotal1(Double.parseDouble(subTotal1));
		pbh.setGst1(Double.parseDouble(gst1));
		pbh.setVat1(Double.parseDouble(vat1));
		pbh.setGrossTotal2(Double.parseDouble(grossTotal2));
		
		ProductBillingDao pdo = new ProductBillingDao();
		pdo.valProductBillingDetails(pbh);
	}



	//get ProductBill Grid
	public ProductBillingBean getGridForProduct(String description)
	{
	
		ProductBillingBean bean = new ProductBillingBean();
		bean.setDescription(description);
		
		return bean;
	}
	
	
	//Add productBill Info
	String billNo;
	String prBill;
	public void doAddProductBilligDetails(HttpServletRequest request,HttpServletResponse response)
	{

		HttpSession session6 = request.getSession();
		Integer count = Integer.parseInt(request.getParameter("count"));
		
		String proBillForPdf;
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		
		String d1 = dateobj.toString();
		
		String[] d11 = d1.split(" ");
	
		String year = d11[5];
		String month = d11[1];
		
		String proBill = month+"/"+year+"/"+"00"+"1";

		
		ProductBillingDao hrDao = new ProductBillingDao();
		List bill = hrDao.getClientBill();
			
		ProductBillingHibernate bean = new ProductBillingHibernate();

		for(int i=0;i<bill.size();i++)
		{
			ProductBillingBean bean2 = (ProductBillingBean)bill.get(i);
			prBill = bean2.getBillNo();
			
			String[] pBill =  prBill.split("/");
			
			String lNo = pBill[2];
			
			int lstNo = Integer.parseInt(lNo);
			
			int lastNo = lstNo + 1;			
			
			if(lastNo<10)
			{
				proBill = month+"/"+year+"/"+"00"+lastNo;
			}			
			else
			{
				proBill = month+"/"+year+"/"+lastNo;
			}			
			
		}
		for(int i=0;i<count;i++)
		{
			
			if(billNo == null)
			{
				bean.setBillNo(proBill);
				proBillForPdf = proBill;				
			}
			else
			{
				bean.setBillNo(billNo);
				proBillForPdf = billNo;				
			}
	
			String fkClientId = request.getParameter("fkClientId1");
			String vendorName = request.getParameter("vendorName");
			String billingDate = request.getParameter("billingDate");
//			String subTotal1 = request.getParameter("subTotal1");
//			String gst1 = request.getParameter("gst1");
//			String vat1 = request.getParameter("vat1");
			String grossTotal2 = request.getParameter("grossTotal2");
			
			String description = request.getParameter("description"+i);
			String hsn = request.getParameter("hsn"+i);
			String quantity = request.getParameter("quantity"+i);
			String buyPrice = request.getParameter("buyPrice"+i);
			
			String gridAmount = request.getParameter("gridAmount"+i);
			String gridDiscountPercent = request.getParameter("gridDiscountPercent"+i);
			String gridDiscountAmount = request.getParameter("gridDiscountAmount"+i);
			String gridSubTotal = request.getParameter("gridSubTotal"+i);
			String gridGstPercent = request.getParameter("gridGstPercent"+i);
			String gridGstPercentAmount = request.getParameter("gridGstPercentAmount"+i);
			
			//String gst = request.getParameter("gst"+i);
			String total = request.getParameter("total"+i);
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date d = null;
			
			try 
			{
				d = format.parse(billingDate);
				bean.setBillingDate(d);
				
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			
			bean.setFkVendorId(Long.parseLong(fkClientId));
			bean.setVendorName(vendorName);
//			bean.setSubTotal1(Double.parseDouble(subTotal1));
//			//bean.setGst(Double.parseDouble(gst));
//			bean.setGst1(Double.parseDouble(gst1));
//			bean.setVat1(Double.parseDouble(vat1));
			bean.setGrossTotal2(Double.parseDouble(grossTotal2));
			bean.setDescription1(description);
			
			if(!"".equals(hsn)){
				bean.setHsn(hsn);
				System.out.println("in if--setHsn"+bean.getHsn());
			}else{
				bean.setHsn("0");
				System.out.println(" in else--setHsn"+bean.getHsn());
			}
//			bean.setHsn(hsn);
			bean.setQuantity1(Long.parseLong(quantity));
			bean.setUnit1(Double.parseDouble(buyPrice));
			bean.setGridAmount(Double.parseDouble(gridAmount));
			bean.setGridDiscountPercent(Double.parseDouble(gridDiscountPercent));
			bean.setGridDiscountAmount(Double.parseDouble(gridDiscountAmount));
			bean.setGridSubTotal(Double.parseDouble(gridSubTotal));
			bean.setGridGstPercent(Double.parseDouble(gridGstPercent));
			bean.setGridGstPercentAmount(Double.parseDouble(gridGstPercentAmount));
			//bean.setGrossTotal2(Double.parseDouble(total));
			//bean.setSrNO(Long.parseLong(fkVendorId));
			bean.setAmount1(Double.parseDouble(total));
			
			
			session6.setAttribute("fkClientId", fkClientId);
			session6.setAttribute("proBillForPdf", proBillForPdf);
			session6.setAttribute("clientNameClientBill", vendorName);
//			session6.setAttribute("subTotal1ClientBill", subTotal1);
//			session6.setAttribute("gst1ClientBill", gst1);
//			session6.setAttribute("vat1ClientBill", vat1);
			session6.setAttribute("grossTotal2ClientBill", grossTotal2);
			
			
			
			//Double grossTotalFromDB=0.0;
			//String grossTotal12 = request.getParameter("grossTotal2");
			//Double gTotal = Double.parseDouble(grossTotal12);
					
			
			
			/*
			 * PurchaseOrderDao pod2 = new PurchaseOrderDao(); List<HrBillingBean> totalList
			 * = pod2.getGrossTotal(fkClientId,vendorName);
			 * 
			 * 
			 * for(int j=0;j<totalList.size();j++) { HrBillingBean sr =
			 * (HrBillingBean)totalList.get(i); grossTotalFromDB = sr.getGrossTotal(); }
			 */
			
			//Double updateGrossTotal = gTotal + grossTotalFromDB;
			
			
			HibernateUtility hbu = HibernateUtility.getInstance();
			Session session2 = hbu.getHibernateSession();
			Transaction transaction = session2.beginTransaction();

			
			//Query query2 = session2.createSQLQuery("UPDATE purchase_order SET balance_status ='"+updateGrossTotal+"' WHERE Type='client' AND Name='"+vendorName+"' AND fk_vendor_client_id='"+fkClientId+"'");
			//int count4 = query2.executeUpdate();

			transaction.commit();			
			
			ProductBillingDao dao = new ProductBillingDao();
			dao.saveProductBillInfo(bean);
			
			
			/*
			 * PurchaseHibernate poh = new PurchaseHibernate();
			 * 
			 * 
			 * SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd"); Date d112 =
			 * null;
			 * 
			 * try { d112 = format2.parse(billingDate); poh.setPurchaseDate(d112);
			 * 
			 * 
			 * } catch (Exception e) { e.printStackTrace(); }
			 * 
			 * 
			 * 
			 * Date d22 = null; try { d22 = format.parse(billingDate);
			 * poh.setExpectPaymentDate(d22); } catch (Exception e) { e.printStackTrace(); }
			 * 
			 * 
			 * 
			 * poh.setFkvendorId(Long.parseLong(fkClientId)); poh.setName(vendorName);
			 * poh.setBillNo(Long.parseLong("00")); poh.setProductName(description);
			 * poh.setBuyPrice(Double.parseDouble(buyPrice));
			 * poh.setQuantity(Integer.parseInt(quantity));
			 * poh.setTotal(Double.parseDouble("00"));
			 * poh.setSubTotal(Double.parseDouble(subTotal1));
			 * poh.setGst(Double.parseDouble(gst1));
			 * poh.setGstAmount(Double.parseDouble(vat1));
			 * poh.setGrossTotal(Double.parseDouble(grossTotal2));
			 * poh.setBalanceStatus(updateGrossTotal); poh.setType("client");
			 * 
			 * 
			 * 
			 * ProductBillingDao dao2 = new ProductBillingDao();
			 * dao2.saveProductBillInfoInPO(poh);
			 */
			
		}
	
	}
	
	// Get Vendor Records for Report with Date And Name Wise For Product Billing
	public List getClientHrBillingReportByDateAndName(HttpServletRequest request, HttpServletResponse response) 
	{
		String fkVendorPaymentId = request.getParameter("fkVendorPaymentId");
		String vendorName = request.getParameter("vendorName");
		String startDate = request.getParameter("fis1Date");
		String endDate = request.getParameter("end1Date");
		
		Map<Long, ProductBillingHibernate> map = new HashMap<Long, ProductBillingHibernate>();
		ProductBillingDao dao = new ProductBillingDao();
		List<ProductBillingHibernate> exp1List = dao.getClientHrBillingReportByDateAndName(fkVendorPaymentId,vendorName,startDate,endDate);
		return exp1List;
	}

	public void OtherBillCOPY(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String billNo = request.getParameter("billNo");
		String fkclientid = request.getParameter("fkclientid");
		String clientname = request.getParameter("clientname");
		String igst = request.getParameter("igst");
		String sgst = request.getParameter("sgst");
		String cgst = request.getParameter("cgst");
		String totaltaxamount = request.getParameter("totaltaxamount");
		String grosstotal = request.getParameter("grosstotal");
		String subtotal = request.getParameter("subtotal");
		String taxpercentage=request.getParameter("taxpercentage");
		System.out.println("----------------Bill No before session create::" + billNo);
		HttpSession session3 = request.getSession();
		//Long billNo2 = Long.parseLong(billNo);
		session3.setAttribute("productBillNo", billNo);
		session3.setAttribute("fkClientId", fkclientid);
		session3.setAttribute("clientName", clientname);
		session3.setAttribute("IGSTForPDF", igst);
		session3.setAttribute("SGSTForPDF", sgst);
		session3.setAttribute("CGSTForPDF", cgst);
		session3.setAttribute("totalTaxAmountForPDF", totaltaxamount);
		session3.setAttribute("grossTotalForPDF", grosstotal);
		session3.setAttribute("totalSubTotal", subtotal);
		session3.setAttribute("taxpercentage", taxpercentage);
		
	}
	public void OtherBillCOPY1(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String billNo = request.getParameter("billNo");
		String fkclientid = request.getParameter("fkclientid");
		String clientname = request.getParameter("clientname");
		String igst = request.getParameter("igst");
		String gst = request.getParameter("gst");
		String billdate = request.getParameter("billdate");
		String totaltaxamount = request.getParameter("totaltaxamount");
		String grosstotal = request.getParameter("grosstotal");
		String subtotal = request.getParameter("subtotal");
		String Startdate = request.getParameter("staartdate");
		String Enddate = request.getParameter("enddate");
		System.out.println("----------------Bill No before session create::" + billNo);
		HttpSession session3 = request.getSession();
		//Long billNo2 = Long.parseLong(billNo);
		session3.setAttribute("resourceBillNoForPdf", billNo);
		session3.setAttribute("fkVendorId", fkclientid);
		session3.setAttribute("vendorName", clientname);
		session3.setAttribute("IGST", igst);
		session3.setAttribute("GST", gst);
		session3.setAttribute("billDate", billdate);
		session3.setAttribute("totalTaxAmount", totaltaxamount);
		session3.setAttribute("grossTotal", grosstotal);
		session3.setAttribute("totalSubTotal", subtotal);
		session3.setAttribute("billPeriodStartDate",Startdate );
		session3.setAttribute("billPeriodEndDate", Enddate);
		
	}

	public Map getProdEditbillnoAgainst(String fkClientId) {

			int count = 1;

			ProductBillingDao dao = new ProductBillingDao();
			List list= dao.getProdEditbillnoAgainst(fkClientId);

			Map  map =  new HashMap();
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				
				ProductBillingBeanNew bean=new ProductBillingBeanNew();
				bean.setBillNo(o[1].toString());
				bean.setPkProductBillId(Long.parseLong(o[0].toString()));
				
				System.out.println("***************"+o[0]);
				map.put(count,bean);
				count++;
			}
			return map;
		}

	
	public List getEditGridForProductBilling(String fkProductId, String billno) {
		
		Map<String, ProductBillingBeanNew> map = new HashMap<String, ProductBillingBeanNew>();
		ProductBillingDao dao = new ProductBillingDao();
		
		List<ProductBillingBeanNew> exp1List = dao.getEditGridForProductBilling(fkProductId,billno);

		return exp1List;
		
	}
	
	
	
	//update Product Billing Details
		public void updateProductBillingDetails(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException 
		{
			System.out.println("IN HELPER");
			String Hr;
			String productBillNoForPdf;
			String Igst;
			String Sgst;
			String Cgest;
			String grossTotal = null;
			Double grossTotaldb = null;
			Integer count = Integer.parseInt(request.getParameter("count"));
			String fkClientId2 = request.getParameter("fkClientId");
			
			for(int i=0;i<count;i++)
			{			
				
				String fkClientId = request.getParameter("fkClientId");
				String clientName = request.getParameter("clientName");
				String billDate = request.getParameter("productBillDate");
				
				//String fkProductId = request.getParameter("fkProductId"+i);
				String productName = request.getParameter("productName"+i);
				String description = request.getParameter("description"+i);
				
				String hsnSac = request.getParameter("hsnSac"+i);
				String unitPrice = request.getParameter("unitPrice"+i);
				String quantity = request.getParameter("quantity"+i);				
				String amount = request.getParameter("amount"+i);
				String discountPercent = request.getParameter("discountPercent"+i);
				String discountAmount = request.getParameter("discountAmount"+i);
				String subTotal = request.getParameter("subTotal"+i);
				String CGST = request.getParameter("CGST"+i);
				String SGST = request.getParameter("SGST"+i);
				String IGST = request.getParameter("IGST"+i);
				String taxAmount = request.getParameter("taxAmount"+i);
				String total = request.getParameter("total"+i);
				String bookingNoAB = request.getParameter("billNo"+i);
				String taxPercentage = request.getParameter("taxPercentage"+i);

				String pkProductBillId = request.getParameter("pkProductBillId"+i);
				
				String totalSubTotal = request.getParameter("totalSubTotalProduct");
				String totalTaxAmount = request.getParameter("totalTaxAmountProduct");
				grossTotal = request.getParameter("grossTotalProduct");
				String ShipAddress = request.getParameter("ShipAddress");
				String CourierName = request.getParameter("CourierName");
				String Courierid = request.getParameter("Courierid");
				
				
				HibernateUtility hbu = HibernateUtility.getInstance();
				Session session = hbu.getHibernateSession();
				Transaction transaction = session.beginTransaction();
				
				Long pkProductBillId1 = Long.parseLong(pkProductBillId);
				
				ProductBillingHibernateNew hibernate = (ProductBillingHibernateNew) session.get(ProductBillingHibernateNew.class,new Long(pkProductBillId1));
				grossTotaldb = hibernate.getGrossTotal();
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date d1 = null;
				try
				{
					d1 = format.parse(billDate);
					hibernate.setBillDate(d1);
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
				hibernate.setFkClientId(Long.parseLong(fkClientId));
				hibernate.setClientName(clientName);
				
				//hibernate.setFkProductId(Long.parseLong(fkProductId));
				
				hibernate.setProductName(productName);
				
				
				if(!"".equals(CourierName)){
					hibernate.setCourierName(CourierName);
				}else{
					hibernate.setCourierName("N/A");
				}
				if(!"".equals(Courierid)){
					hibernate.setCourierNumber(Courierid);
				}else{
					hibernate.setCourierNumber("N/A");
				}
				
				
				if(description == null || description.isEmpty() || description == "" || description == " ")
				{
					hibernate.setDescription("N/A");
				}else{
					
					hibernate.setDescription(description);
				}
				if(!"".equals(hsnSac)){
					hibernate.setHsnSac(hsnSac);
				}else{
					hibernate.setHsnSac("0");
				}
				hibernate.setUnitPrice(Double.parseDouble(unitPrice));
				hibernate.setQuantity(Long.parseLong(quantity));
				hibernate.setAmount(Double.parseDouble(amount));
				if(!"".equals(discountPercent)){
					hibernate.setDiscountPercent(Double.parseDouble(discountPercent));
				}else{
					hibernate.setDiscountPercent(Double.parseDouble("0"));
				}
				hibernate.setDiscountAmount(Double.parseDouble(discountAmount));
				hibernate.setSubTotal(Double.parseDouble(subTotal));
				if (CGST.equalsIgnoreCase("") || CGST == null || CGST.equalsIgnoreCase("undefined") || CGST.equalsIgnoreCase(" "))
				{
					hibernate.setCGST(Double.parseDouble("0"));
					
					Cgest="0";
				}else{
					
					hibernate.setCGST(Double.parseDouble(CGST));
					Cgest=CGST;
				}
				if (SGST.equalsIgnoreCase("") || SGST == null || SGST.equalsIgnoreCase("undefined") || SGST.equalsIgnoreCase(" "))
				{
					hibernate.setSGST(Double.parseDouble("0"));
					Sgst="0";
					
				}else{
					hibernate.setSGST(Double.parseDouble(SGST));
					Sgst=SGST;
				}
				if (IGST.equalsIgnoreCase("") || IGST == null || IGST.equalsIgnoreCase("undefined") || IGST.equalsIgnoreCase(" "))
				{
					hibernate.setIGST(Double.parseDouble("0"));
					Igst="0";
				}else{
					hibernate.setIGST(Double.parseDouble(IGST));
					Igst=IGST;
					
				}
				if(!"".equals(ShipAddress)){
					hibernate.setShipAddress(ShipAddress);
				}else{
					hibernate.setShipAddress("N/A");
				}
				hibernate.setTaxAmount(Double.parseDouble(taxAmount));
				hibernate.setTotal(Double.parseDouble(total));
				hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
				hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
				hibernate.setGrossTotal(Double.parseDouble(grossTotal));
				hibernate.setTaxPercentage(Double.parseDouble(taxPercentage));
				
				
				session.saveOrUpdate(hibernate);
				transaction.commit();
				
				HttpSession session3 = request.getSession();
				
				//set session attributes for product billing pdf			
				session3.setAttribute("fkClientId", fkClientId);
				session3.setAttribute("productBillNo", bookingNoAB);
				session3.setAttribute("clientName", clientName);
				session3.setAttribute("totalSubTotal", totalSubTotal);
				
				session3.setAttribute("CGSTForPDF", Cgest);
				session3.setAttribute("SGSTForPDF", Sgst);
				session3.setAttribute("IGSTForPDF", Igst);
				session3.setAttribute("totalTaxAmountForPDF", totalTaxAmount);
				session3.setAttribute("grossTotalForPDF", grossTotal);
				session3.setAttribute("billNo",bookingNoAB );
				session3.setAttribute("taxPercentage",taxPercentage );
				
				//ProductBillingDao dao = new ProductBillingDao();
				//dao.saveProductBillingDetails(hibernate);
				
				
				Double grossTotalFromDB=0.0;
				String grossTotal12 = total;
				Double gTotal = Double.parseDouble(grossTotal12);					
				
//				CashbookDao cbdao = new CashbookDao();
//				List<ProductBillingDtlForClientPaymentCashBookBean> totalList = cbdao.getGrossTotal(fkClientId, clientName);	
//			    
//				Double balanceAmount =cbdao.getBalanceAmountforclient(fkClientId2);
//				
//				Double updatedBalanceAmount = balanceAmount-(grossTotaldb-Double.parseDouble(grossTotal));
//				System.out.println("Updated Balance Amount = "+updatedBalanceAmount);
//				for(int j=0;j < totalList.size();j++)
//				{					
//					ProductBillingDtlForClientPaymentCashBookBean sr =	(ProductBillingDtlForClientPaymentCashBookBean)totalList.get(j);
//					grossTotalFromDB = sr.getBalanceStatus();
//					System.out.println("gross total from db="+sr.getGrossTotal());
//				}		 
//				
//				Double updateGrossTotal = gTotal;			
//				
//				HibernateUtility hbu2 = HibernateUtility.getInstance();
//				Session session2 = hbu2.getHibernateSession();
//				Transaction transaction2 = session.getTransaction();
//				
//				Query query2 = session2.createSQLQuery("UPDATE product_billing_dtl_for_client_payment_cash_book SET balance_status = '"+updatedBalanceAmount+"' WHERE client_name='"+clientName+"' AND fk_client_id='"+fkClientId+"'");
//				query2.executeUpdate();
//
//			    transaction2.commit();
//				session2.close();
				
//				ProductBillingDtlForClientPaymentCashBookHibernate poh = new ProductBillingDtlForClientPaymentCashBookHibernate();
//							
//				
//				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
//				Date purchaseDate = null;
//			
//				try
//				{
//					purchaseDate = format2.parse(billDate);
//					poh.setDate(purchaseDate);
//				}
//				catch (Exception e) 
//				{
//					e.printStackTrace();
//				}
//				
//				poh.setProductName(productName);
//				
//				if(description == null || description.isEmpty() || description == "" || description == " ")
//				{
//					poh.setDescription("N/A");
//				}else{
//					
//					poh.setDescription(description);
//				}
//				
//				poh.setFkClientId(Long.parseLong(fkClientId));
//				poh.setClientName(clientName);
//				poh.setBillNo(bookingNoAB);
//				poh.setHsnSac(hsnSac);
//				poh.setUnitPrice(Double.parseDouble(unitPrice));
//				poh.setQuantity(Long.parseLong(quantity));
//				poh.setAmount(Double.parseDouble(amount));
//				poh.setDiscountPercent(Double.parseDouble(discountPercent));
//				poh.setDiscountAmount(Double.parseDouble(discountAmount));
//				poh.setSubTotal(Double.parseDouble(subTotal));
//				
//				
//				if (CGST.equalsIgnoreCase("") || CGST == null || CGST.equalsIgnoreCase("undefined") || CGST.equalsIgnoreCase(" "))
//				{
//					poh.setCGST(Double.parseDouble("0"));
//				}else{
//					
//					poh.setCGST(Double.parseDouble(CGST));
//				}
//				if (SGST.equalsIgnoreCase("") || SGST == null || SGST.equalsIgnoreCase("undefined") || SGST.equalsIgnoreCase(" "))
//				{
//					poh.setSGST(Double.parseDouble("0"));
//					
//				}else{
//					poh.setSGST(Double.parseDouble(SGST));
//					
//				}
//				if (IGST.equalsIgnoreCase("") || IGST == null || IGST.equalsIgnoreCase("undefined") || IGST.equalsIgnoreCase(" "))
//				{
//					poh.setIGST(Double.parseDouble("0"));
//				}else{
//					poh.setIGST(Double.parseDouble(IGST));
//
//					
//				}
//				
//				poh.setTaxAmount(Double.parseDouble(taxAmount));
//				poh.setTotal(Double.parseDouble(total));
//				poh.setTotalSubTotal(Double.parseDouble(totalSubTotal));
//				poh.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
//				poh.setGrossTotal(Double.parseDouble(grossTotal));
//				poh.setBalanceStatus(updatedBalanceAmount);
//				poh.setShipAddress(ShipAddress);
//				CashbookDao daoForPO = new CashbookDao();
//				daoForPO.saveProductBillingDetailsForClientPaymentCashbook(poh);
//				
				
				//end 1
			
			
			}
			CashbookDao dao = new CashbookDao();
			Double balanceAmount =dao.getBalanceAmountforclient(fkClientId2);
	
			Double updatedBalanceAmount = balanceAmount-(grossTotaldb-Double.parseDouble(grossTotal));
			System.out.println("Updated Balance Amount = "+updatedBalanceAmount);
			
			HibernateUtility hbu2 = HibernateUtility.getInstance();
			Session session2 = hbu2.getHibernateSession();
			Transaction transaction2 = session2.beginTransaction();
			
			Query query2 = session2.createSQLQuery("UPDATE product_billing_dtl_for_client_payment_cash_book SET balance_status = '"+updatedBalanceAmount+"' WHERE fk_client_id='"+fkClientId2+"'");
			query2.executeUpdate();

		    transaction2.commit();
			session2.close();
		}

		public Map fetchEditProdBillDetails(String prodbillNo) {

				ProductBillingDao dao1 = new ProductBillingDao();
				
					List catList = dao1.fetchEditProdBillDetails(prodbillNo);
					Map  map =  new HashMap();
					for(int i=0;i<catList.size();i++)
					{
						Object[] o = (Object[])catList.get(i);
						ProductBillingBeanNew b = new ProductBillingBeanNew();
						b.setPkProductBillId(Long.parseLong(o[0].toString()));
						b.setShipAdreess(o[1].toString());
						b.setCuriorName(o[2].toString());
						b.setTrackingNumber(o[3].toString());
						b.setStrBillDate(o[4].toString());				
						b.setTotalTaxAmount(Double.parseDouble(o[5].toString()));
						b.setTotalSubTotal(Double.parseDouble(o[6].toString()));
						b.setGrossTotal(Double.parseDouble(o[7].toString()));
					
						map.put(b.getPkProductBillId(),b);
					}
					System.out.println("out of helper return map : "+map);
					return map;
				
				}
		
	
	
}
