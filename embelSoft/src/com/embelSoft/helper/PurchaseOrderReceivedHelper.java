package com.embelSoft.helper;

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

import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.PurchaseOrderCreateBean;
import com.embelSoft.bean.PurchaseOrderCreateBeanNew;
import com.embelSoft.bean.PurchaseOrderReceivedBean;
import com.embelSoft.bean.ResourceBillingBean;
import com.embelSoft.dao.PurchaseOrderDao;
import com.embelSoft.dao.PurchaseOrderReceivedDao;
import com.embelSoft.dao.ResourceBillingDao;
import com.embelSoft.hibernate.PurchaseOrderCreateHibernateNew;
import com.embelSoft.hibernate.PurchaseOrderReceivedHibernate;
import com.embelSoft.hibernate.perfromaResourcesbillhibernate;
import com.embelSoft.utility.HibernateUtility;

public class PurchaseOrderReceivedHelper {
	
	public PurchaseOrderBean receivePOGrid(String productName)
	{
		PurchaseOrderBean bean = new PurchaseOrderBean();
		
		bean.setProductName(productName);
		//bean.setHsnSac("0");
		bean.setUnitPrice(0d);
		bean.setQuantity(0l);
		bean.setAmount(0d);
		bean.setDiscountPercent(0d);
		bean.setDiscountAmount(0d);
		bean.setSubTotal(0d);
		//bean.setCGST(0d);
		//bean.setSGST(0d);
		bean.setGST(0d);
		bean.setIGST(0d);
		bean.setTaxAmount(0d);
		bean.setTotal(0d);
	
		return bean;
	}
	
	String RoBill;
	public void saveReceivedPODetails(HttpServletRequest request,HttpServletResponse response)
	{
		
		String Hr;
		String billNoForPdf;

		HttpSession session = request.getSession();
		
		Integer count = Integer.parseInt(request.getParameter("count"));

		SimpleDateFormat simpleformat = new SimpleDateFormat(" dd MM yyyy");
		simpleformat = new SimpleDateFormat("MM yyyy");
		String strMonth = simpleformat.format(new Date());
		System.out.println("Month in MMMM format = " + strMonth);

		String d1123 = strMonth.toString();
		String[] d = d1123.split(" ");
		String year = d[1];
		String month = d[0];

		String poNo = "RO"+"/"+ month + "/" + year + "/" + "00" + 1;

		PurchaseOrderReceivedDao hrDao = new PurchaseOrderReceivedDao();
		List bill = hrDao.getROCreateBill();

		for (int i = 0; i < bill.size(); i++) {
			PurchaseOrderReceivedHibernate bean = (PurchaseOrderReceivedHibernate) bill.get(i);

			Hr = bean.getBillNo();
			String[] HrBil = Hr.split("/");

			String lNo = HrBil[3];
			int lstNo = Integer.parseInt(lNo);
			int LastNo = lstNo + 1;
			if (LastNo < 10) {
				poNo = "RO"+"/"+ month + "/" + year + "/" + "00" + LastNo;
			} else {
				poNo = "RO"+"/"+ month + "/" + year + "/" + LastNo;
			}
		}
		
		PurchaseOrderReceivedHibernate hibernate = new PurchaseOrderReceivedHibernate();
		
		String vendorId2 = request.getParameter("fkVendorId");
		System.out.println("vendorId2 fkVendorId :-"+vendorId2);
		String vendorName2 = request.getParameter("vendorName");
		System.out.println("vendorName2  :-"+vendorName2);
		Double grossTotalFromDB=0.0;
		
		String grossTotal12 = request.getParameter("grossTotal");
		Double gTotal = Double.parseDouble(grossTotal12);				
		
		
		PurchaseOrderReceivedDao pod2 = new PurchaseOrderReceivedDao();
		List<PurchaseOrderReceivedBean> totalList = pod2.getGrossTotal(vendorId2,vendorName2);
		
	
		for(int i=0;i<totalList.size();i++)
		{
			PurchaseOrderReceivedBean sr = (PurchaseOrderReceivedBean)totalList.get(i);
			grossTotalFromDB = sr.getGrossTotal();
		}
		
		Double updateGrossTotal = gTotal + grossTotalFromDB;
		
		
		HibernateUtility hbu = HibernateUtility.getInstance();
		Session session2 = hbu.getHibernateSession();
		Transaction transaction = session2.beginTransaction();

		
		Query query2 = session2.createSQLQuery("UPDATE purchase_order_received_details SET balance_status = '"+updateGrossTotal+"' WHERE vendor_name='"+vendorName2+"' AND fk_vendor_id='"+vendorId2+"'");
		int count4 = query2.executeUpdate();
		
		System.out.println("=========================  count4  ======================  :: "+count4);
		
		System.out.println(+count4==0);
		
		if(count4==0)
		{
			System.out.println("in IF----------  count4  -------------------- HELPER   :: "+count4);
			
			Query query3 = session2.createSQLQuery("UPDATE purchase_order_received_details SET balance_status = '"+updateGrossTotal+"' WHERE vendor_name='"+vendorName2+"' AND fk_vendor_id='"+vendorId2+"'");
			int count6 = query3.executeUpdate();
		}

		transaction.commit();
			
		
		for(int i=0;i<count;i++)
		{
			
			String fkVendorId = request.getParameter("fkVendorId");
			String vendorName = request.getParameter("vendorName");
			//String type = request.getParameter("type");
			//String vendorId = request.getParameter("fkVendorId1"+i);
			String purchasedate = request.getParameter("purchasedate");
			String expectpaymentdate = request.getParameter("expectpaymentdate");
			
			String productname = request.getParameter("productName"+i);
			String description = request.getParameter("description"+i);
			String hsnSac = request.getParameter("hsnSac"+i);
			String unitPrice = request.getParameter("unitPrice"+i);
			String quantity = request.getParameter("quantity"+i);			
			String amount = request.getParameter("amount"+i);
			String discountPercent = request.getParameter("discountPercent"+i);
			String discountAmount = request.getParameter("discountAmount"+i);
			String subTotal = request.getParameter("subTotal"+i);
			String GST = request.getParameter("GST"+i);
			String IGST = request.getParameter("IGST"+i);
			String taxAmount = request.getParameter("taxAmount"+i);
			String total = request.getParameter("total"+i);
			
			String bookingNoAB = request.getParameter("billNo"+i);
			
			String totalSubTotal = request.getParameter("totalSubTotal");
			String totalTaxAmount = request.getParameter("totalTaxAmount");
			String grossTotal = request.getParameter("grossTotal");
			
				
				if(RoBill == null || RoBill =="")
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
				System.out.println("IN HELPER billNoForPdf :- " + billNoForPdf);
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date d1,d2 = null;
			
			try {
				d1=format.parse(purchasedate);
				hibernate.setPurchaseOrderDate(d1);
				
				d2=format.parse(expectpaymentdate);
				hibernate.setExpectPaymentDate(d2);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			hibernate.setVendorName(vendorName);
			hibernate.setFkVendorId(Long.parseLong(fkVendorId));
			
			hibernate.setProductName(productname);
			
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
			
//			hibernate.setDescription(description);
//			hibernate.setHsnSac(hsnSac);
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
			
//			hibernate.setGST(Double.parseDouble(GST));
//			hibernate.setIGST(Double.parseDouble(IGST));
			hibernate.setTaxAmount(Double.parseDouble(taxAmount));			
			hibernate.setTotal(Double.parseDouble(total));			
			
			hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
			hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
			hibernate.setGrossTotal(Double.parseDouble(grossTotal));
			hibernate.setBalanceStatus(updateGrossTotal);
			
			 if(bookingNoAB != "0") 
			 {
				 PurchaseOrderReceivedDao advancebooking = new PurchaseOrderReceivedDao();
				 advancebooking.updateAdvanceBooking(bookingNoAB, poNo); 
				 
				 System.out.println("Update resourceBillNo in Resource Proforma::-" + bookingNoAB);
			 }			
			
			PurchaseOrderReceivedDao pod = new PurchaseOrderReceivedDao();
			pod.savePurchaseOrderReceivedDetails(hibernate);
			
		}
		
	}
	
	public List getReceivedPOList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, PurchaseOrderReceivedBean> map = new HashMap<Long, PurchaseOrderReceivedBean>();
		PurchaseOrderReceivedDao dao = new PurchaseOrderReceivedDao();
		List<PurchaseOrderReceivedBean> exp1List = dao.getPurchaseOrderCreateList();
		
		System.out.println("IN HELPER Size----------==== :  "+exp1List.size());
		return exp1List;
	}
	
	public List getReceivedPOReport(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, PurchaseOrderBean> map = new HashMap<Long, PurchaseOrderBean>();
		
		PurchaseOrderReceivedDao dao = new PurchaseOrderReceivedDao();
		List<PurchaseOrderBean> exp1List = dao.getReceivedPOReport();


		return exp1List;

	}

	public List<PurchaseOrderBean> receivePOGrid(HttpServletRequest request, HttpServletResponse response) {

		//String fkProductId = request.getParameter("fkProductId");
		String productName = request.getParameter("productName");
		String billno = request.getParameter("billno");
		
		PurchaseOrderReceivedDao dao = new PurchaseOrderReceivedDao();
		
		List<PurchaseOrderBean> catList = dao.receivePOGrid(productName,billno);
		
		PurchaseOrderBean cs = null;
		if (catList != null && catList.size() > 0) {
			cs =  catList.get(0);
		}
		return catList;
		
	//	return taxList;
	}
}
