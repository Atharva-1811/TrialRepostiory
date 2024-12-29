package com.embelSoft.helper;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.embelSoft.bean.ClientQuotationBean;
import com.embelSoft.bean.ProductBillingBeanNew;
import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.PurchaseOrderCreateBean;
import com.embelSoft.bean.PurchaseOrderCreateBeanNew;
import com.embelSoft.bean.QuotationBean;
import com.embelSoft.bean.ResourceBillingBean;
import com.embelSoft.dao.ProductBillingDao;
import com.embelSoft.dao.ProductDetailsDao;
import com.embelSoft.dao.PurchaseOrderDao;
import com.embelSoft.dao.QuotationDao;
import com.embelSoft.hibernate.ClientQuotationHibernate;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.hibernate.QuotationHibernate;

public class QuotationHelper
{
		
	public QuotationBean gridForVenderQuotation(String productName) {
	
		System.out.println(" DAO getPurchaseGrid Start 0");
		ProductDetailsDao dao = new ProductDetailsDao();
		QuotationBean proList= dao.getQuotationDetails(productName);
		return proList;
	}
	

	String PoBill;
	String poNo;
	
	//new
	public void saveQuotationDetails(HttpServletRequest request,HttpServletResponse response) 
	{
	
		String billNoForPdf;
		HttpSession session4 = request.getSession();
		Integer count = Integer.parseInt(request.getParameter("count"));
	
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		
		String d = dateobj.toString();
		
		String[] d1 = d.split(" ");
		
		
		String year = d1[5];
		
		String month = d1[1];
		
		/*	String yr = year[2]+""+year[3];
		
		int yr1 = Integer.parseInt(yr);
		int yr2 = yr1+1;
		
		String year2 = yr1+"-"+yr2;
*/	
		
		String qoNo = "QO"+"/"+year+"/"+month+"/"+"00"+1;

		QuotationDao poDao = new QuotationDao();
		List bill = poDao.getQOCreateBill();

		for(int i=0;i<bill.size();i++)
		{
			QuotationBean bean = (QuotationBean)bill.get(i);
			PoBill = bean.getQuotationNo();
			
			String[] billNo = PoBill.split("/");
			
			String latNo =billNo[3];
			
			int ltNo = Integer.parseInt(latNo);

			int lastNo = ltNo + 1;
			
			if(lastNo<10)
			{
				qoNo = "QO"+"/"+year+"/"+month+"/"+"00"+lastNo;
			}
			
			else
			{
				qoNo = "QO"+"/"+year+"/"+month+"/"+lastNo;
			}
			
		}
		
		QuotationHibernate hibernate = new QuotationHibernate();
		for(int i=0;i<count;i++)
		{
			
			
			if(PoBill == null || PoBill =="")
			{
				hibernate.setQuotationNo(qoNo);
				billNoForPdf = qoNo;
				
			}
			else
			{
				
				hibernate.setQuotationNo(qoNo);
				billNoForPdf = qoNo;
				
			}
			
			String quotationNo = request.getParameter("quotationNo");
			
			String type2 = request.getParameter("type");
			
//			if(type2 == "client")
//			{
//				String vendorName2 = request.getParameter("N/A");		
//				String fkVendorId = request.getParameter("0");
//				
//				String clientName = request.getParameter("clientName");		
//				String fkClientId = request.getParameter("fkClientId");
//				String fkProductId = request.getParameter("fkProductId"+i);
//			}
			
			
	        String vendorName2 = request.getParameter("vendorName");		
			String fkVendorId = request.getParameter("fkVendorId");
			
			String clientName = request.getParameter("clientName");		
			String fkClientId = request.getParameter("fkClientId");
			
			String quotDate2 = request.getParameter("quotDate");
			String uploadFile = request.getParameter("uploadFile");
			String companyname2 = request.getParameter("companyname");
			String companyaddress2 = request.getParameter("companyaddress");
			String city2 = request.getParameter("city");
			String state2 = request.getParameter("state");
			String zip2 = request.getParameter("zip");
			String phoneno2 = request.getParameter("phoneno");
//			String productName = request.getParameter("productName");
			String features = request.getParameter("features");
			
			String fkProductId = request.getParameter("fkProductId"+i);
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
			if (GST==""||GST==null) {
				GST="0.0";
			}
			//String SGST = request.getParameter("SGST"+i);
			String IGST = request.getParameter("IGST"+i);
			if (IGST=="" || IGST == null) {
				IGST = "0.0";
			}
			String taxAmount = request.getParameter("taxAmount"+i);
			String total = request.getParameter("total"+i);
			
			String totalSubTotal = request.getParameter("totalSubTotal");
			String totalTaxAmount = request.getParameter("totalTaxAmount");
			String grossTotal = request.getParameter("grossTotal");	
			
			
			
			
			File file = new File(uploadFile);
			byte[] imageData = new byte[(int) file.length()];

			try {
			    FileInputStream fileInputStream = new FileInputStream(file);
			    fileInputStream.read(imageData);
			    fileInputStream.close();
			} catch (Exception e) {
			    e.printStackTrace();
			}
			
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				
				Date dateOfBirth = null;
				try{
					dateOfBirth = format.parse(quotDate2);
					hibernate.setQuotDate(dateOfBirth);
					System.out.println(" date dateOfBirth parsing" +quotDate2);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				
				
				hibernate.setType(type2);
				
				//if vender
				if(!"".equals(vendorName2)){
					hibernate.setVendorName(vendorName2);
				}else{
					hibernate.setVendorName("N/A");
				}
				if(!"".equals(fkVendorId)){
					hibernate.setFkVendorId(Long.parseLong(fkVendorId));
				}else{
					hibernate.setFkVendorId(0l);
				}
				
				//if client
				if(!"".equals(clientName)){
					hibernate.setClientName(clientName);
				}else{
					hibernate.setClientName("N/A");
				}
				if(!"".equals(fkClientId)){
					hibernate.setFkClientId(Long.parseLong(fkClientId));
				}else{
					hibernate.setFkClientId(0l);
				}
				if(!"".equals(fkProductId)){
					hibernate.setFkProductId(Long.parseLong(fkProductId));
				}else{
					hibernate.setFkProductId(0l);
				}
				
				
				hibernate.setTaskPic(imageData);
				hibernate.setCompanyName(companyname2);
				hibernate.setCompanyAddress(companyaddress2);
				hibernate.setAddress(city2);
				hibernate.setFeatures(features);
				
								
				if(!"".equals(state2)){
					hibernate.setState(state2);
					
				}else{
					hibernate.setState("N/A");
				}
				
				
				if(!"".equals(zip2)){
					hibernate.setZip(zip2);
					
				}else{
					hibernate.setZip("N/A");
				}
				
				
				if(!"".equals(phoneno2)){
					hibernate.setPhoneno(phoneno2);
					
				}else{
					hibernate.setPhoneno("N/A");
				}
				
				
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
				
				
				
				
				session4.setAttribute("vendorName2", vendorName2);
				session4.setAttribute("companyname2", companyname2);
				session4.setAttribute("companyaddress2", companyaddress2);
				session4.setAttribute("city2", city2);
				session4.setAttribute("state2", state2);
				session4.setAttribute("zip2", zip2);
				session4.setAttribute("phoneno2", phoneno2);
				
				session4.setAttribute("totalSubTotalForPDF", totalSubTotal);
				session4.setAttribute("GSTForPDF", GST);
				session4.setAttribute("IGSTForPDF", IGST);
				session4.setAttribute("totalTaxAmountForPDF", totalTaxAmount);
				session4.setAttribute("grossTotalForPDF", grossTotal);
				session4.setAttribute("quotationNo", billNoForPdf);
				
				
				QuotationDao dao = new QuotationDao();
				dao.valQuotationDetails(hibernate);			
		  }
	}
	
	// Get Client Records for Report
	public List getVenderQuotationReport(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, QuotationBean> map = new HashMap<Long, QuotationBean>();

		QuotationDao dao = new QuotationDao();
		List<QuotationBean> exp1List = dao.getVenderQuotationReport();

		return exp1List;
	}
	
	
	//old
	public void doQuotationDetails(HttpServletRequest request,HttpServletResponse response) 
	{
	
		String billNoForPdf;
		HttpSession session4 = request.getSession();
		Integer count = Integer.parseInt(request.getParameter("count"));
	
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		
		String d = dateobj.toString();
		
		String[] d1 = d.split(" ");
		
		
		String year = d1[5];
		
		String month = d1[1];
		
		/*	String yr = year[2]+""+year[3];
		
		int yr1 = Integer.parseInt(yr);
		int yr2 = yr1+1;
		
		String year2 = yr1+"-"+yr2;
*/	
		
		String qoNo = "QO"+"/"+year+"/"+month+"/"+"00"+1;

		QuotationDao poDao = new QuotationDao();
		List bill = poDao.getQOCreateBill();

		for(int i=0;i<bill.size();i++)
		{
			QuotationBean bean = (QuotationBean)bill.get(i);
			PoBill = bean.getQuotationNo();
			
			String[] billNo = PoBill.split("/");
			
			String latNo =billNo[3];
			
			int ltNo = Integer.parseInt(latNo);

			int lastNo = ltNo + 1;
			
			if(lastNo<10)
			{
				qoNo = "QO"+"/"+year+"/"+month+"/"+"00"+lastNo;
			}
			
			else
			{
				qoNo = "QO"+"/"+year+"/"+month+"/"+lastNo;
			}
			
		}
		
		QuotationHibernate qh = new QuotationHibernate();
		for(int i=0;i<count;i++)
		{
			
			
			if(PoBill == null || PoBill =="")
			{
				qh.setQuotationNo(qoNo);
				billNoForPdf = qoNo;
				
			}
			else
			{
				
				qh.setQuotationNo(qoNo);
				billNoForPdf = qoNo;
				
			}
			
		
	        String vendorName2 = request.getParameter("vendorName");		
			String fkVendorId = request.getParameter("fkVendorId");
			String quotDate2 = request.getParameter("quotDate");
			String uploadFile = request.getParameter("uploadFile");
			String companyname2 = request.getParameter("companyname");
			String companyaddress2 = request.getParameter("companyaddress");
			String city2 = request.getParameter("city");
			String state2 = request.getParameter("state");
			String zip2 = request.getParameter("zip");
			String phoneno2 = request.getParameter("phoneno");
			String productName = request.getParameter("productName");
			String features = request.getParameter("features");
			String subTotal12 = request.getParameter("subTotal1");
			String gst12 = request.getParameter("gst1");
			String gstAmount2 = request.getParameter("gstAmount");
			String discount2 = request.getParameter("discount");
			String discountAmount2 = request.getParameter("discountAmount");
			String grossTotal12 = request.getParameter("grossTotal1");
			String type2 = request.getParameter("type");
			
			
			String description2 = request.getParameter("description"+i);
		
			String unitPrice2 = request.getParameter("unitPrice"+i);
			String quantity2 = request.getParameter("quantity"+i);
			String total2 = request.getParameter("total"+i);
			
			String quotationNo = request.getParameter("quotationNo");
			
			
			
			File file = new File(uploadFile);
			byte[] imageData = new byte[(int) file.length()];

			try {
			    FileInputStream fileInputStream = new FileInputStream(file);
			    fileInputStream.read(imageData);
			    fileInputStream.close();
			} catch (Exception e) {
			    e.printStackTrace();
			}
			
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				
				Date dateOfBirth = null;
				try{
					dateOfBirth = format.parse(quotDate2);
					qh.setQuotDate(dateOfBirth);
					System.out.println(" date dateOfBirth parsing" +quotDate2);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				
				
				
				
				qh.setVendorName(vendorName2);
				qh.setFkVendorId(Long.parseLong(fkVendorId));
				qh.setTaskPic(imageData);
				qh.setCompanyName(companyname2);
				qh.setCompanyAddress(companyaddress2);
				qh.setAddress(city2);
				qh.setSubTotal(Double.parseDouble(subTotal12));
				qh.setGst(Double.parseDouble(gst12));
				qh.setGstAmount(Double.parseDouble(gstAmount2));
				qh.setProductName(productName);
				qh.setFeatures(features);
				/*qh.setAfterGstTotal(Double.parseDouble(afterGstTotal12));*/
				
				qh.setDiscount(Double.parseDouble(discount2));
				qh.setDiscountAmount(Double.parseDouble(discountAmount2));
				qh.setGrossTotal1(Double.parseDouble(grossTotal12));
				
				qh.setDescription(description2);
				
				qh.setUnitPrice(Double.parseDouble(unitPrice2));
				qh.setQuantity(Long.parseLong(quantity2));
				qh.setTotal(Double.parseDouble(total2));
				//qh.setQuotationNo(Long.parseLong(quotationNo));
				
				qh.setType(type2);
				
				
				
				
/*				
				if(!"".equals(afterGstTotal12)){
					qh.setAfterGstTotal(Double.parseDouble(afterGstTotal12));
					
				}else{
					qh.setAfterGstTotal(Double.parseDouble("0.0"));
				}
				
				*/
				
				
				if(!"".equals(state2)){
					qh.setState(state2);
					
				}else{
					qh.setState("N/A");
				}
				
				
				if(!"".equals(zip2)){
					qh.setZip(zip2);
					
				}else{
					qh.setZip("N/A");
				}
				
				
				if(!"".equals(phoneno2)){
					qh.setPhoneno(phoneno2);
					
				}else{
					qh.setPhoneno("N/A");
				}
				
				
				
				
				session4.setAttribute("vendorName2", vendorName2);
				session4.setAttribute("companyname2", companyname2);
				session4.setAttribute("companyaddress2", companyaddress2);
				session4.setAttribute("city2", city2);
				session4.setAttribute("state2", state2);
				session4.setAttribute("zip2", zip2);
				session4.setAttribute("phoneno2", phoneno2);
				//session4.setAttribute(productName, productName);
				//session4.setAttribute(features, features);
				
				session4.setAttribute("subTotal12", subTotal12);
				session4.setAttribute("gst12", gst12);
				session4.setAttribute("gstAmount2", gstAmount2);
				/*session4.setAttribute("afterGstTotal12", afterGstTotal12);*/
				session4.setAttribute("discount2", discount2);
				session4.setAttribute("discountAmount2", discountAmount2);
				session4.setAttribute("grossTotal12", grossTotal12);
				session4.setAttribute("quotationNo", billNoForPdf);
				
				
				QuotationDao qdo = new QuotationDao();
				qdo.valQuotationDetails(qh);				
		  }
	}

	public QuotationBean getGridForQuotation(String description)
	{
		QuotationBean bean = new QuotationBean();
		bean.setDescription(description);
		return bean;
		
	}
	
	// Get Quotation List For Data Table
	public List getQuotationList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, QuotationBean> map = new HashMap<Long, QuotationBean>();
		QuotationDao dao = new QuotationDao();
		List<QuotationBean> exp1List = dao.getQuotationList();
		
		return exp1List;
	}
	
	
	// Get Vendor Records for Report
		public List getVendorRecords(HttpServletRequest request, HttpServletResponse response) 
		{
			Map<Long, QuotationBean> map = new HashMap<Long, QuotationBean>();

			QuotationDao dao = new QuotationDao();
			List<PurchaseOrderBean> exp1List = dao.getVendorRecordsForQuo();

			return exp1List;

		}
		
	
//	Client Quotation
	
	
	private Double productCost = 0d;
	private Double CGST = 0d;
	private Double SGST = 0d;
	
	public QuotationBean gridForClientQuotation(String fkProductId, String productName)
	{
		
		QuotationBean bean = new QuotationBean();
		
		Long fkProductId1 = Long.parseLong(fkProductId);
		
		QuotationDao dao = new QuotationDao();
		QuotationBean taxList = dao.getTaxDetailsForClientQuotation(fkProductId1);
		
		/*
		 * for (int i = 0; i < taxList.size(); i++) { ProductDetailsHibernate hibernate
		 * = (ProductDetailsHibernate) taxList.get(i); productCost =
		 * hibernate.getProductCost(); CGST = hibernate.getCGST(); SGST =
		 * hibernate.getSGST(); }
		 * 
		 * bean.setFkProductId(Long.parseLong(fkProductId));
		 * bean.setProductName(productName); //bean.setHsnSac("0");
		 * bean.setUnitPrice(productCost);
		 * System.out.println("IN HEALPER setUnitPrice(productCost) :"+bean.getUnitPrice
		 * ()); bean.setQuantity(1l); bean.setAmount(0d); bean.setDiscountPercent(0d);
		 * bean.setDiscountAmount(0d); bean.setSubTotal(0d); bean.setCGST(CGST);
		 * bean.setSGST(SGST); bean.setIGST(0d); bean.setTaxAmount(0d);
		 * bean.setTotal(0d);
		 */
		
		return taxList;
	}
	
	String clientPoBill;
	String clientPoNo;
	
	public void saveClientQuotationDetails(HttpServletRequest request,HttpServletResponse response) 
	{
	
		String billNoForPdf;
		HttpSession session4 = request.getSession();
		Integer count = Integer.parseInt(request.getParameter("count"));
	
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		
		String d = dateobj.toString();
		
		String[] d1 = d.split(" ");
		
		
		String year = d1[5];
		
		String month = d1[1];
		
		/*	String yr = year[2]+""+year[3];
		
		int yr1 = Integer.parseInt(yr);
		int yr2 = yr1+1;
		
		String year2 = yr1+"-"+yr2;
*/	
		
		String qoNo = "QO"+"/"+year+"/"+month+"/"+"00"+1;

		QuotationDao poDao = new QuotationDao();
		List bill = poDao.getClientQuotationNoDB();

		for(int i=0;i<bill.size();i++)
		{
			ClientQuotationBean bean = (ClientQuotationBean)bill.get(i);
			clientPoBill = bean.getQuotationNo();
			
			String[] billNo = clientPoBill.split("/");
			
			String latNo =billNo[3];
			
			int ltNo = Integer.parseInt(latNo);

			int lastNo = ltNo + 1;
			
			if(lastNo<10)
			{
				qoNo = "QO"+"/"+year+"/"+month+"/"+"00"+lastNo;
			}
			
			else
			{
				qoNo = "QO"+"/"+year+"/"+month+"/"+lastNo;
			}
			
		}
		
		ClientQuotationHibernate hibernate = new ClientQuotationHibernate();
		for(int i=0;i<count;i++)
		{
			
			if(clientPoBill == null || clientPoBill =="")
			{
				hibernate.setQuotationNo(qoNo);
				billNoForPdf = qoNo;
			}
			else
			{
				hibernate.setQuotationNo(qoNo);
				billNoForPdf = qoNo;
			}
			
			String quotationNo = request.getParameter("quotationNo");
			
			String type2 = request.getParameter("type");
			
			
			String fkClientId = request.getParameter("fkClientId");
			String clientName = request.getParameter("clientName");			
			String quotDate2 = request.getParameter("quotDate");
			String uploadFile = request.getParameter("uploadFile");
			String companyname2 = request.getParameter("companyname");
			String companyaddress2 = request.getParameter("companyaddress");
			String city2 = request.getParameter("city");
			if (city2==""||city2==null) {
				city2="N/A";
			}
			String state2 = request.getParameter("state");
			String zip2 = request.getParameter("zip");
			if (zip2=="") {
				zip2="N/A";
			}
			String phoneno2 = request.getParameter("phoneno");
			if (phoneno2=="") {
				phoneno2="N/A";
			}
			String features = request.getParameter("features");
			if (features=="" || features == null) {
				features ="N/A";
			}
			System.out.println("String features = request.getParameter('features') : "+hibernate.getFeatures());
			
			String fkProductId = request.getParameter("fkProductId"+i);
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
			if (SGST==""||SGST== null) {
				SGST="0.0";
			}
			String IGST = request.getParameter("IGST"+i);
			if (IGST==""||IGST== null) {
				IGST="0.0";
			}
			String taxAmount = request.getParameter("taxAmount"+i);
			String total = request.getParameter("total"+i);
			
			String totalSubTotal = request.getParameter("totalSubTotal");
			String totalTaxAmount = request.getParameter("totalTaxAmount");
			String grossTotal = request.getParameter("grossTotal");			
			
			
			File file = new File(uploadFile);
			byte[] imageData = new byte[(int) file.length()];

			try {
			    FileInputStream fileInputStream = new FileInputStream(file);
			    fileInputStream.read(imageData);
			    fileInputStream.close();
			} catch (Exception e) {
			    e.printStackTrace();
			}
			
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				
				Date dateOfBirth = null;
				try{
					dateOfBirth = format.parse(quotDate2);
					hibernate.setQuotDate(dateOfBirth);
					System.out.println(" date dateOfBirth parsing" +quotDate2);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				
				
				hibernate.setType(type2);
				
				
				//if client
				if(!"".equals(clientName)){
					hibernate.setClientName(clientName);
				}else{
					hibernate.setClientName("N/A");
				}
				if(!"".equals(fkClientId)){
					hibernate.setFkClientId(Long.parseLong(fkClientId));
				}else{
					hibernate.setFkClientId(0l);
				}
				if(!"".equals(fkProductId)){
					hibernate.setFkProductId(Long.parseLong(fkProductId));
				}else{
					hibernate.setFkProductId(0l);
				}
				
				
				hibernate.setTaskPic(imageData);
				hibernate.setCompanyName(companyname2);
				hibernate.setCompanyAddress(companyaddress2);
				hibernate.setAddress(city2);
//				hibernate.setFeatures(features);
				if(!"".equals(features)){
					hibernate.setFeatures(features);
					System.out.println("setFeatures(features) : "+hibernate.getFeatures());
				}else{
					hibernate.setFeatures("N/A");
					System.out.println("setFeatures('N/A') : "+hibernate.getFeatures());
				}
				if(!"".equals(state2)){
					hibernate.setState(state2);
					
				}else{
					hibernate.setState("N/A");
				}
				
				
				if(!"".equals(zip2)){
					hibernate.setZip(zip2);
					
				}else{
					hibernate.setZip("N/A");
				}
				
				
				if(!"".equals(phoneno2)){
					hibernate.setPhoneno(phoneno2);
					
				}else{
					hibernate.setPhoneno("N/A");
				}
				
				
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
				if(discountPercent==""){
					hibernate.setDiscountPercent(0.0);
				} else {
					hibernate.setDiscountPercent(Double.parseDouble(discountPercent));
				}
				
				hibernate.setDiscountAmount(Double.parseDouble(discountAmount));
				hibernate.setSubTotal(Double.parseDouble(subTotal));			
				if(!"".equals(CGST)){
					hibernate.setCGST(Double.parseDouble(CGST));
				}else{
					hibernate.setCGST(0d);
				}
				if(!"".equals(SGST)){
					hibernate.setSGST(Double.parseDouble(SGST));
				}else{
					hibernate.setSGST(0d);
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
				
				
				session4.setAttribute("vendorName2", clientName);
				session4.setAttribute("companyname2", companyname2);
				session4.setAttribute("companyaddress2", companyaddress2);
				session4.setAttribute("city2", city2);
				session4.setAttribute("state2", state2);
				session4.setAttribute("zip2", zip2);
				session4.setAttribute("phoneno2", phoneno2);
				
				session4.setAttribute("totalSubTotalForPDF", totalSubTotal);
				
				
				Double GST = (Double.parseDouble(CGST)+Double.parseDouble(SGST));
				String GSTForPDF = GST.toString();
				
				session4.setAttribute("GSTForPDF", GSTForPDF);
				
				System.out.println("GSTForPDF : "+GSTForPDF);
				
				session4.setAttribute("IGSTForPDF", IGST);
				session4.setAttribute("totalTaxAmountForPDF", totalTaxAmount);
				session4.setAttribute("grossTotalForPDF", grossTotal);
				session4.setAttribute("quotationNo", billNoForPdf);
				
				
				QuotationDao dao = new QuotationDao();
				dao.saveClientQuotationDetails(hibernate);		
		  }
	}
	
	// Get Client Records for Report
	public List getClientQuotationReport(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ClientQuotationBean> map = new HashMap<Long, ClientQuotationBean>();

		QuotationDao dao = new QuotationDao();
		List<ClientQuotationBean> exp1List = dao.getClientQuotationReport();

		return exp1List;
	}
}

