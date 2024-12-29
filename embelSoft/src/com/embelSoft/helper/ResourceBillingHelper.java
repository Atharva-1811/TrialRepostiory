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
import org.json.JSONException;

import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.ResourceBillingBean;
import com.embelSoft.dao.ResourceBillingDao;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.hibernate.ResourceBillingHibernate;
import com.embelSoft.hibernate.perfromaResourcesbillhibernate;
import com.embelSoft.utility.HibernateUtility;

//import javafx.beans.binding.SetBinding;

public class ResourceBillingHelper {

	public ResourceBillingBean getGridForResourceBilling(String productName) {
		ResourceBillingBean bean = new ResourceBillingBean();

		bean.setProductName(productName);
		// bean.setHsnSac("0");
		bean.setUnitPrice(0d);
		bean.setQuantity(0l);
		bean.setAmount(0d);
		bean.setDiscountPercent(0d);
		bean.setDiscountAmount(0d);
		bean.setSubTotal(0d);
		// bean.setCGST(0d);
		// bean.setSGST(0d);
		bean.setGST(18d);
		bean.setIGST(0d);
		bean.setTaxAmount(0d);
		bean.setTotal(0d);

		return bean;
	}

	// String HrBill;
	// String Hr;
	public void saveResourceBillDetails(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {

		/*
		 * Double CGSTPercentOldDBForPdf = 0.00; Double SGSTPercentOldDBForPdf = 0.00;
		 * Double GSTPercentOldDBForPdf = 0.00; Double IGSTPercentOldDBForPdf = 0.00;
		 *
		 * TaxDetailsDao tddao = new TaxDetailsDao(); List taxDetailsList =
		 * tddao.getLoadAllTaxDetailsEntry();
		 *
		 * for(int j=0;j<taxDetailsList.size();j++) { System.out.
		 * println("1ST IF's ELSE().....\nwhen Stockdetails is GREATER THAN 0 =====> "
		 * +taxDetailsList.size());
		 *
		 * TaxDetailsHibernate taxDetailshibernate =
		 * (TaxDetailsHibernate)taxDetailsList.get(j);
		 *
		 * Long pkTaxDetailsIdDB = taxDetailshibernate.getPkTaxDetailsId();
		 * CGSTPercentOldDBForPdf = taxDetailshibernate.getCGST();
		 * SGSTPercentOldDBForPdf = taxDetailshibernate.getSGST();
		 * IGSTPercentOldDBForPdf = taxDetailshibernate.getIGST(); }
		 */

		String Hr;
		String resourceBillNoForPdf;

		Date startDate;
		Date endDate;
		HttpSession session = request.getSession();
		Integer count = Integer.parseInt(request.getParameter("count"));

		/*
		 * SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd"); Date
		 * dateobj = new Date();
		 *
		 * String d4 = dateobj.toString();
		 *
		 * String[] d = d4.split(" ");
		 *
		 * String year = d[5]; String month = d[1];
		 */
		SimpleDateFormat simpleformat = new SimpleDateFormat(" dd MM yyyy");

		// displaying month in MMMM format
		simpleformat = new SimpleDateFormat("MM yyyy");
		String strMonth = simpleformat.format(new Date());
		System.out.println("Month in MMMM format = " + strMonth);

		String d1123 = strMonth.toString();
		String[] d = d1123.split(" ");
		String year = d[1];
		String month = d[0];

		String resourceBillNo = month + "/" + year + "/" + "00" + 1;

		ResourceBillingDao hrDao = new ResourceBillingDao();
		List bill = hrDao.getResourceLastBillNo();

		for (int i = 0; i < bill.size(); i++) {
			ResourceBillingBean bean = (ResourceBillingBean) bill.get(i);

			Hr = bean.getBillNo();
			String[] HrBil = Hr.split("/");

			String lNo = HrBil[2];
			int lstNo = Integer.parseInt(lNo);
			int LastNo = lstNo + 1;
			if (LastNo < 10) {
				resourceBillNo = month + "/" + year + "/" + "00" + LastNo;
			} else {
				resourceBillNo = month + "/" + year + "/" + LastNo;
			}
		}



		for (int i = 0; i < count; i++) {
			// Long pkResourceBillId;
			// String billNo;

			ResourceBillingHibernate hibernate = new ResourceBillingHibernate();

			String vendorName = request.getParameter("vendorName");
			String fkVendorId = request.getParameter("fkVendorId");
			String billDate = request.getParameter("billDate");
			String billPeriodStartDate = request.getParameter("billPeriodStartDate");
			String billPeriodEndDate = request.getParameter("billPeriodEndDate");

			String productName = request.getParameter("productName" + i);
			String description = request.getParameter("description" + i);
			String hsnSac = request.getParameter("hsnSac" + i);
			String unitPrice = request.getParameter("unitPrice" + i);
			String quantity = request.getParameter("quantity" + i);
			String amount = request.getParameter("amount" + i);
			String discountPercent = request.getParameter("discountPercent" + i);
			String discountAmount = request.getParameter("discountAmount" + i);
			String subTotal = request.getParameter("subTotal" + i);
			String GST = request.getParameter("GST" + i);

			String IGST = request.getParameter("IGST" + i);
			String taxAmount = request.getParameter("taxAmount" + i);
			String total = request.getParameter("total" + i);

			String bookingNoAB = request.getParameter("billNo" + i);

			String totalSubTotal = request.getParameter("totalSubTotal");
			String totalTaxAmount = request.getParameter("totalTaxAmount");
			String grossTotal = request.getParameter("grossTotal");

			if (resourceBillNo == null) {
				hibernate.setBillNo(resourceBillNo);
				resourceBillNoForPdf = resourceBillNo;
			} else {
				hibernate.setBillNo(resourceBillNo);
				resourceBillNoForPdf = resourceBillNo;
			}
			System.out.println("IN HELPER resourceBillNoForPdf :- " + resourceBillNoForPdf);


			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			/* SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy"); */
			Date d1 = null;
			try {
				d1 = format.parse(billDate);
				hibernate.setBillDate(d1);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Date d2 = null;
			try {
				d2 = format.parse(billPeriodStartDate);

			}

			catch (Exception e) {
				e.printStackTrace();
			}
			hibernate.setBillPeriodStartDate(d2);
			System.out.println("billing-------------------------------------------------------" + d2);
			startDate = d2;
			Date d3 = null;
			try {
				d3 = format.parse(billPeriodEndDate);
				hibernate.setBillPeriodEndDate(d3);

				endDate = d3;
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("IN HELPER date :- " + d1 + "--" + d2 + "--" + d3);
			hibernate.setFkVendorId(Long.parseLong(fkVendorId));

			hibernate.setVendorName(vendorName);
			hibernate.setProductName(productName);
			if (!"".equals(description)) {
				hibernate.setDescription(description);
			} else {
				hibernate.setDescription("N/A");
			}
			if (!"".equals(hsnSac)) {
				hibernate.setHsnSac(hsnSac);
			} else {
				hibernate.setHsnSac("0");
			}
			hibernate.setUnitPrice(Double.parseDouble(unitPrice));
			hibernate.setQuantity(Long.parseLong(quantity));
			hibernate.setAmount(Double.parseDouble(amount));
			hibernate.setDiscountPercent(Double.parseDouble(discountPercent));
			hibernate.setDiscountAmount(Double.parseDouble(discountAmount));
			hibernate.setSubTotal(Double.parseDouble(subTotal));
			if (!"".equals(GST)) {
				hibernate.setGST(Double.parseDouble(GST));
			} else {
				hibernate.setGST(0d);
			}
			// hibernate.setSGST(Double.parseDouble(SGST));
			// hibernate.setGST(Double.parseDouble(GST));
			if (!"".equals(IGST)) {
				hibernate.setIGST(Double.parseDouble(IGST));
			} else {
				hibernate.setIGST(0d);
			}
			hibernate.setTaxAmount(Double.parseDouble(taxAmount));
			hibernate.setTotal(Double.parseDouble(total));
			hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
			hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
			hibernate.setGrossTotal(Double.parseDouble(grossTotal));

			 if(bookingNoAB != "0")
			 {
				 ResourceBillingDao advancebooking = new ResourceBillingDao();
				 advancebooking.updateAdvanceBooking(bookingNoAB, resourceBillNo);

				 System.out.println("Update resourceBillNo in Resource Proforma::-" + bookingNoAB);
			 }

			// *************To get the balance Amount*********************\\

			Double TotalFromDB = 0.0;
			String Total12 = total;
			Double gTotal = Double.parseDouble(Total12);
			System.out.println("total of grid" + gTotal);
			ResourceBillingDao rbdao = new ResourceBillingDao();
			List<PurchaseOrderBean> totalList = rbdao.getGrossTotal(fkVendorId, vendorName);

			for (int j = 0; j < totalList.size(); j++) {
				PurchaseOrderBean sr = totalList.get(j);
				TotalFromDB = sr.getBalanceStatus();
				System.out.println("old gross totsl from db::-" + TotalFromDB);
			}
			Double updateGrossTotal = gTotal + TotalFromDB;
			System.out.println("updated gross total ::- " + updateGrossTotal);
			
			hibernate.setBalanceAmount(updateGrossTotal);

			// SETIING SESSION ATTIBUTES FOR RESOUCE BILLING PDF
			session.setAttribute("fkVendorId", fkVendorId);
			session.setAttribute("resourceBillNoForPdf", resourceBillNoForPdf);
			session.setAttribute("vendorName", vendorName);
			session.setAttribute("totalSubTotal", totalSubTotal);
			session.setAttribute("billPeriodStartDate", billPeriodStartDate);
			session.setAttribute("billPeriodEndDate", billPeriodEndDate);
			session.setAttribute("billDate", billDate);
			session.setAttribute("billNo",resourceBillNo);

			// session.setAttribute("CGST", CGST);
			// session.setAttribute("SGST", SGST);
			/*
			 * String GST1 = "0"; if(!"".equals(GST)){ session.setAttribute("GST", GST);
			 * }else{ session.setAttribute("GST", GST1); } String IGST1 = "0";
			 * if(!"".equals(IGST)){ session.setAttribute("IGST", IGST); }else{
			 * session.setAttribute("IGST", IGST1); }
			 */
			session.setAttribute("GST", GST);
			session.setAttribute("IGST", IGST);
			// session.setAttribute("CGSTPercentOldDBForPdf", CGSTPercentOldDBForPdf);
			// session.setAttribute("SGSTPercentOldDBForPdf", SGSTPercentOldDBForPdf);
			// session.setAttribute("IGSTPercentOldDBForPdf", IGSTPercentOldDBForPdf);
			session.setAttribute("totalTaxAmount", totalTaxAmount);
			session.setAttribute("grossTotal", grossTotal);

			ResourceBillingDao dao = new ResourceBillingDao();
			System.out.println("This is My Object from Helper Class" +hibernate);
			dao.saveResourceBillDetails(hibernate);


	//**********************To update the Balance Amount In purchase_order ******************\\ 	

			HibernateUtility hbu = HibernateUtility.getInstance();
			Session session2 = hbu.getHibernateSession();
			Transaction transaction = session2.beginTransaction();

			Query query2 = session2.createSQLQuery("UPDATE purchase_order SET balance_status = '" + updateGrossTotal
					+ "' WHERE Type='vendor' AND name='" + vendorName + "' AND fk_vendor_client_id='" + fkVendorId
					+ "'");
			int count4 = query2.executeUpdate();

			transaction.commit();
			
	//**********************To update the Balance Amount In Resource Billing ******************\\ 
			
			HibernateUtility hbu2 = HibernateUtility.getInstance();
			Session session3 = hbu2.getHibernateSession();
			Transaction transaction2 = session3.beginTransaction();

			Query query3 = session3.createSQLQuery("UPDATE resource_billing SET balance_Amount = '" + updateGrossTotal
					+ "' WHERE vendor_name='" + vendorName + "' AND fk_vendor_id='" + fkVendorId
					+ "'");
			int count5 = query3.executeUpdate();
              //System.out.println(count5);
			transaction2.commit();

			PurchaseHibernate poh = new PurchaseHibernate();

			poh.setFkVendorClientId(Long.parseLong(fkVendorId));
			poh.setName(vendorName);
			poh.setType("vendor");

			if (resourceBillNo == null) {
				poh.setBillNo(resourceBillNo);
			} else {
				poh.setBillNo(resourceBillNo);
			}

			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			Date purchaseDate = null;

			try {
				purchaseDate = format2.parse(billDate);
				poh.setPurchaseDate(purchaseDate);
			} catch (Exception e) {
				e.printStackTrace();
			}

			poh.setProductName(productName);
			poh.setDescription(description);
			poh.setHsnSac(hsnSac);
			poh.setUnitPrice(Double.parseDouble(unitPrice));
			poh.setQuantity(Long.parseLong(quantity));
			poh.setAmount(Double.parseDouble(amount));
			poh.setDiscountPercent(Double.parseDouble(discountPercent));
			poh.setDiscountAmount(Double.parseDouble(discountAmount));
			poh.setSubTotal(Double.parseDouble(subTotal));
			poh.setGST(Double.parseDouble(GST));
//			poh.setSGST(Double.parseDouble(SGST));
			poh.setIGST(Double.parseDouble(IGST));
			poh.setTaxAmount(Double.parseDouble(taxAmount));
			poh.setTotal(Double.parseDouble(total));
			poh.setTotalSubTotal(Double.parseDouble(totalSubTotal));
			poh.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
			poh.setGrossTotal(Double.parseDouble(grossTotal));
			poh.setBalanceStatus(updateGrossTotal);

			ResourceBillingDao daoForPO = new ResourceBillingDao();
			daoForPO.saveResourceBillDetailsForPOForVenderCashbook(poh);

			// end 0

		}
	}

	public List getResourceBillingList(HttpServletRequest request, HttpServletResponse response) {
		Map<Long, ResourceBillingBean> map = new HashMap<Long, ResourceBillingBean>();
		ResourceBillingDao dao = new ResourceBillingDao();
		List<ResourceBillingBean> ResourceBillingList = dao.getResourceBillingList();
		System.out.println("IN HELPER--------------==== :  " + ResourceBillingList.size());
		return ResourceBillingList;
	}

	public List getResourceBillingReportByNameAndBetweenTwoDates(HttpServletRequest request,
			HttpServletResponse response) {
		String fkVendorId = request.getParameter("fkVendorId");
		String vendorName = request.getParameter("vendorName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		ResourceBillingDao dao = new ResourceBillingDao();
		List<ResourceBillingBean> resourceBillingList = dao.getResourceBillingReportByNameAndBetweenTwoDates(fkVendorId,vendorName, startDate, endDate);
		return resourceBillingList;
	}

	public List getResourceBillingReportByNameAndBetweenTwoDates1(HttpServletRequest request,
			HttpServletResponse response) {

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		ResourceBillingDao dao = new ResourceBillingDao();
		List<ResourceBillingBean> resourceBillingList = dao.getResourceBillingReportByNameAndBetweenTwoDates1(startDate,
				endDate);
		return resourceBillingList;
	}

	public List getCommonBillingReportByNameAndBetweenTwoDates1(HttpServletRequest request,
			HttpServletResponse response) {

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		ResourceBillingDao dao = new ResourceBillingDao();
		List<ResourceBillingBean> resourceBillingList = dao.getCommonBillingReportByNameAndBetweenTwoDates1(startDate,
				endDate);
		return resourceBillingList;
	}

	public Map getAllBillNoAgainst(String fkVendorId) {
		int count = 1;

		ResourceBillingDao dao = new ResourceBillingDao();
		List list = dao.getAllBillNoAgainst(fkVendorId);

		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);

			ResourceBillingHibernate bean = new ResourceBillingHibernate();
			bean.setBillNo(o[1].toString());
			bean.setPkResourceBillId(Long.parseLong(o[0].toString()));

			System.out.println("***************" + o[0]);
			map.put(count, bean);
			count++;
		}
		return map;
	}

	public void saveperfromaResourceBillDetails(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {


		String Hr;
		String resourceBillNoForPdf;

		System.out.println(request.getParameter("count"));

		Date startDate;
		Date endDate;
		HttpSession session = request.getSession();
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println("This is My Count Atharva..." +count);


		SimpleDateFormat simpleformat = new SimpleDateFormat(" dd MM yyyy");

		// displaying month in MMMM format
		simpleformat = new SimpleDateFormat("MM yyyy");
		String strMonth = simpleformat.format(new Date());
		System.out.println("Month in MMMM format = " + strMonth);

		String d1123 = strMonth.toString();
		String[] d = d1123.split(" ");
		String year = d[1];
		String month = d[0];
		String resourceBillNo = "RPI"+"/"+month+"/"+year+"/"+"00"+1;

		ResourceBillingDao hrDao = new 	ResourceBillingDao();
		List bill = hrDao.getResourceLastBillNo11();

		for(int i=0;i<bill.size();i++)
		{
			ResourceBillingBean bean = (ResourceBillingBean)bill.get(i);

			Hr = bean.getBillNo();
			String[] HrBil = Hr.split("/");
			String lNo = HrBil[3];
			int lstNo = Integer.parseInt(lNo);
			int LastNo = lstNo + 1;

			if(LastNo<10)
			{
				resourceBillNo = "RPI"+"/"+month+"/"+year+"/"+"00"+LastNo;
			}
			else
			{
				resourceBillNo = "RPI"+"/"+month+"/"+year+"/"+LastNo;
			}
		}


		perfromaResourcesbillhibernate hibernate = new perfromaResourcesbillhibernate();

		for (int i = 0; i < count; i++) {

			System.out.println("This is Iteration number: "+i);


			String vendorName = request.getParameter("vendorName");
			String fkVendorId = request.getParameter("fkVendorId");
			String billDate = request.getParameter("billDate");
			String billPeriodStartDate = request.getParameter("billPeriodStartDate");
			String billPeriodEndDate = request.getParameter("billPeriodEndDate");

			String productName = request.getParameter("productName" + i);
			String description = request.getParameter("description" + i);
			String hsnSac = request.getParameter("hsnSac" + i);
			String unitPrice = request.getParameter("unitPrice" + i);
			String quantity = request.getParameter("quantity" + i);
			String amount = request.getParameter("amount" + i);
			String discountPercent = request.getParameter("discountPercent" + i);
			String discountAmount = request.getParameter("discountAmount" + i);
			String subTotal = request.getParameter("subTotal" + i);
			String GST = request.getParameter("GST" + i);

			String IGST = request.getParameter("IGST" + i);
			String taxAmount = request.getParameter("taxAmount" + i);
			String total = request.getParameter("total" + i);

			String totalSubTotal = request.getParameter("totalSubTotal");
			String totalTaxAmount = request.getParameter("totalTaxAmount");
			String grossTotal = request.getParameter("grossTotal");

			if (resourceBillNo == null) {
				hibernate.setBillNo(resourceBillNo);
				resourceBillNoForPdf = resourceBillNo;
			} else {
				hibernate.setBillNo(resourceBillNo);
				resourceBillNoForPdf = resourceBillNo;
			}
			System.out.println("IN HELPER resourceBillNoForPdf :- " + resourceBillNoForPdf);

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			/* SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy"); */
			Date d1 = null;
			try {
				d1 = format.parse(billDate);
				hibernate.setBillDate(d1);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Date d2 = null;
			try {
				d2 = format.parse(billPeriodStartDate);

			}

			catch (Exception e) {
				e.printStackTrace();
			}
			hibernate.setBillPeriodStartDate(d2);
			System.out.println("billing-------------------------------------------------------" + d2);
			startDate = d2;
			Date d3 = null;
			try {
				d3 = format.parse(billPeriodEndDate);
				hibernate.setBillPeriodEndDate(d3);

				endDate = d3;
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("IN HELPER date :- " + d1 + "--" + d2 + "--" + d3);
			hibernate.setFkVendorId(Long.parseLong(fkVendorId));
			hibernate.setVendorName(vendorName);
			hibernate.setProductName(productName);
			if (!"".equals(description)) {
				hibernate.setDescription(description);
			} else {
				hibernate.setDescription("N/A");
			}
			if (!"".equals(hsnSac)) {
				hibernate.setHsnSac(hsnSac);
			} else {
				hibernate.setHsnSac("0");
			}
			hibernate.setUnitPrice(Double.parseDouble(unitPrice));
			hibernate.setQuantity(Long.parseLong(quantity));
			hibernate.setAmount(Double.parseDouble(amount));
			hibernate.setDiscountPercent(Double.parseDouble(discountPercent));
			hibernate.setDiscountAmount(Double.parseDouble(discountAmount));
			hibernate.setSubTotal(Double.parseDouble(subTotal));
			if (!"".equals(GST)) {
				hibernate.setGST(Double.parseDouble(GST));
			} else {
				hibernate.setGST(0d);
			}
			// hibernate.setSGST(Double.parseDouble(SGST));
			// hibernate.setGST(Double.parseDouble(GST));
			if (!"".equals(IGST)) {
				hibernate.setIGST(Double.parseDouble(IGST));
			} else {
				hibernate.setIGST(0d);
			}
			hibernate.setTaxAmount(Double.parseDouble(taxAmount));
			hibernate.setTotal(Double.parseDouble(total));
			hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
			hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
			hibernate.setGrossTotal(Double.parseDouble(grossTotal));

			// SETIING SESSION ATTIBUTES FOR RESOUCE BILLING PDF
			session.setAttribute("fkVendorId", fkVendorId);
			session.setAttribute("resourceBillNoForPdf", resourceBillNoForPdf);
			session.setAttribute("vendorName", vendorName);
			session.setAttribute("totalSubTotal", totalSubTotal);
			session.setAttribute("billPeriodStartDate", billPeriodStartDate);
			session.setAttribute("billPeriodEndDate", billPeriodEndDate);

			session.setAttribute("billDate", billDate);

			// session.setAttribute("CGST", CGST);
			// session.setAttribute("SGST", SGST);
			/*
			 * String GST1 = "0"; if(!"".equals(GST)){ session.setAttribute("GST", GST);
			 * }else{ session.setAttribute("GST", GST1); } String IGST1 = "0";
			 * if(!"".equals(IGST)){ session.setAttribute("IGST", IGST); }else{
			 * session.setAttribute("IGST", IGST1); }
			 */
			session.setAttribute("GST", GST);
			session.setAttribute("IGST", IGST);
			// session.setAttribute("CGSTPercentOldDBForPdf", CGSTPercentOldDBForPdf);
			// session.setAttribute("SGSTPercentOldDBForPdf", SGSTPercentOldDBForPdf);
			// session.setAttribute("IGSTPercentOldDBForPdf", IGSTPercentOldDBForPdf);
			session.setAttribute("totalTaxAmount", totalTaxAmount);
			session.setAttribute("grossTotal", grossTotal);

			ResourceBillingDao dao = new ResourceBillingDao();
			dao.saveperfromaResourceBillDetails(hibernate);

		}
	}

	public List getGridForResourceBilling2(String productName, String billno) {

		Map<String, perfromaResourcesbillhibernate> map = new HashMap<String, perfromaResourcesbillhibernate>();
		ResourceBillingDao dao = new ResourceBillingDao();

		List<perfromaResourcesbillhibernate> exp1List = dao.getTaxDetailsForResourceBilling2(productName,billno);
		return exp1List;
	}


	public List getGridForEditResourceBilling2(String productName, String billno) {

		Map<String, ResourceBillingHibernate> map = new HashMap<String, ResourceBillingHibernate>();
		ResourceBillingDao dao = new ResourceBillingDao();

		List<ResourceBillingHibernate> exp1List = dao.getGridForEditResourceBilling2(productName,billno);
		return exp1List;
	}


	public Map getAlleditResourceBillNoAgainst(String fkVendorId) {
		int count = 1;

		ResourceBillingDao dao = new ResourceBillingDao();
		List list = dao.getAlleditResourceBillNoAgainst(fkVendorId);

		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);

			ResourceBillingHibernate bean = new ResourceBillingHibernate();
			bean.setBillNo(o[1].toString());
			bean.setPkResourceBillId(Long.parseLong(o[0].toString()));

			System.out.println("***************" + o[0]);
			map.put(count, bean);
			count++;
		}
		return map;
	}

	public Map getRPIBillingDate(String resrcbillNo) {

		ResourceBillingDao dao1 = new ResourceBillingDao();
			List catList = dao1.getRPIBillingDate(resrcbillNo);
			Map  map =  new HashMap();
			for(int i=0;i<catList.size();i++)
			{
				Object[] o = (Object[])catList.get(i);
				//int sr =0;
				ResourceBillingHibernate b = new ResourceBillingHibernate();
				b.setPkResourceBillId(Long.parseLong(o[0].toString()));
				b.setStrStartDate(o[1].toString());
				b.setStrEndDate(o[2].toString());

				map.put(b.getPkResourceBillId(),b);
				//sr++;
			}
			System.out.println("out of helper return map : "+map);
			return map;

		}


	public void updateResourceBill2(HttpServletRequest request, HttpServletResponse response) {

		Integer count = Integer.parseInt(request.getParameter("count"));
		Double updatedBalanceAmt = 0.0;
		String vendorName = null;
		String fkVendorId = null;

		for (int i = 0; i < count; i++) {

			vendorName = request.getParameter("vendorName");
			fkVendorId = request.getParameter("fkVendorId");
			String billDate = request.getParameter("billDate");
			String billPeriodStartDate = request.getParameter("billPeriodStartDate");
			String billPeriodEndDate = request.getParameter("billPeriodEndDate");

			String productName = request.getParameter("productName" + i);
			String description = request.getParameter("description" + i);
			String hsnSac = request.getParameter("hsnSac" + i);
			String unitPrice = request.getParameter("unitPrice" + i);
			String quantity = request.getParameter("quantity" + i);
			String amount = request.getParameter("amount" + i);
			String discountPercent = request.getParameter("discountPercent" + i);
			String discountAmount = request.getParameter("discountAmount" + i);
			String subTotal = request.getParameter("subTotal" + i);
			String GST = request.getParameter("GST" + i);

			String IGST = request.getParameter("IGST" + i);
			String taxAmount = request.getParameter("taxAmount" + i);
			String total = request.getParameter("total" + i);

			String billNo = request.getParameter("billNo" + i);

			String pkResourceBillId = request.getParameter("pkResourceBillId" + i);

			String totalSubTotal = request.getParameter("totalSubTotal");
			String totalTaxAmount = request.getParameter("totalTaxAmount");
			String grossTotal = request.getParameter("grossTotal");


			//ResourceBillingDao rbdao1 = new ResourceBillingDao();

			HibernateUtility hbu = HibernateUtility.getInstance();
			Session session = hbu.getHibernateSession();
			Transaction transaction = session.beginTransaction();

			Long pkVendorId1 = Long.parseLong(pkResourceBillId);

			ResourceBillingHibernate hibernate = (ResourceBillingHibernate) session.get(ResourceBillingHibernate.class,new Long(pkVendorId1));

			Double balanceAmt = hibernate.getBalanceAmount();
			Double grTotalDb = hibernate.getGrossTotal();
			Double amt = Math.abs(grTotalDb - Double.parseDouble(grossTotal));
			
			if (grTotalDb > Double.parseDouble(grossTotal)) {
				System.out.println("Perfom minus operation  "); 
				updatedBalanceAmt = balanceAmt-amt;
			}
			if (grTotalDb < Double.parseDouble(grossTotal)) {
				System.out.println("Perfom plus operation  ");
				updatedBalanceAmt = balanceAmt+amt;
			}
			if (grTotalDb == Double.parseDouble(grossTotal)) {
				System.out.println("Perfom == operation  ");
				updatedBalanceAmt = balanceAmt;
			}
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

			Date d1 = null;
			try {
				d1 = format.parse(billDate);
				hibernate.setBillDate(d1);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Date d2 = null;
			try {
				d2 = format.parse(billPeriodStartDate);
			}
			catch (Exception e) {
				e.printStackTrace();
			}

			hibernate.setBillPeriodStartDate(d2);
			System.out.println("billing--------------------------" + d2);

			Date d3 = null;
			try {
				d3 = format.parse(billPeriodEndDate);
				hibernate.setBillPeriodEndDate(d3);

			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println("IN HELPER date :- " + d1 + "--" + d2 + "--" + d3);

			hibernate.setFkVendorId(Long.parseLong(fkVendorId));

			if (!"".equals(description)) {
				hibernate.setDescription(description);
			} else {
				hibernate.setDescription("N/A");
			}
			if (!"".equals(hsnSac)) {
				hibernate.setHsnSac(hsnSac);
			} else {
				hibernate.setHsnSac("0");
			}
			hibernate.setVendorName(vendorName);
			hibernate.setUnitPrice(Double.parseDouble(unitPrice));
			hibernate.setQuantity(Long.parseLong(quantity));
			hibernate.setAmount(Double.parseDouble(amount));
			hibernate.setDiscountPercent(Double.parseDouble(discountPercent));
			hibernate.setDiscountAmount(Double.parseDouble(discountAmount));
			hibernate.setSubTotal(Double.parseDouble(subTotal));
			if (!"".equals(GST)) {
				hibernate.setGST(Double.parseDouble(GST));
			} else {
				hibernate.setGST(0d);
			}
			if (!"".equals(IGST)) {
				hibernate.setIGST(Double.parseDouble(IGST));
			} else {
				hibernate.setIGST(0d);
			}
			hibernate.setTaxAmount(Double.parseDouble(taxAmount));
			hibernate.setTotal(Double.parseDouble(total));
			hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
			hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
			hibernate.setGrossTotal(Double.parseDouble(grossTotal));
			hibernate.setBalanceAmount(updatedBalanceAmt);

			session.saveOrUpdate(hibernate);
			transaction.commit();
			
			

		/*
			Double TotalFromDB = 0.0;
			String Total12 = total;
			Double gTotal = Double.parseDouble(Total12);
			System.out.println("total of grid" + gTotal);
			ResourceBillingDao rbdao = new ResourceBillingDao();
			List<PurchaseOrderBean> totalList = rbdao.getBillNoForTaxResourceEdit(billNo,fkVendorId);

			for (int j = 0; j < totalList.size(); j++) {

				PurchaseOrderBean sr = (PurchaseOrderBean) totalList.get(j);
				TotalFromDB = sr.getBalanceStatus();

				System.out.println("old gross totsl from db::-" + TotalFromDB);


			Double updateGrossTotal = gTotal;

			System.out.println("updated gross total ::-" + updateGrossTotal);


			HibernateUtility hbu2 = HibernateUtility.getInstance();
			Session session2 = hbu2.getHibernateSession();
			Transaction transaction2 = session2.beginTransaction();

			Query query2 = session2.createSQLQuery("UPDATE purchase_order SET purchase_date='"+billDate+"', description='"+description+"', hsn_sac='"+hsnSac
					+"', unit_price='"+unitPrice+"', quantity='"+quantity+"', amount='"+amount+"', discount_percent='"+discountPercent
					+"', discount_amount='"+discountAmount+"', sub_total='"+subTotal+"', GST='"+GST+"', IGST='"+IGST+"', tax_amount='"+taxAmount
					+"', total='"+total+"', total_sub_total='"+totalSubTotal+"', total_tax_amount='"+totalTaxAmount+"', gross_total='"+grossTotal
					+"', balance_status='"+updateGrossTotal+"' WHERE fk_vendor_client_id='"+fkVendorId+"' AND bill_no='" + billNo + "' ");
			int count4 = query2.executeUpdate();

			transaction2.commit();

			}

			//ResourceBillingDao daoForPO = new ResourceBillingDao();
			//daoForPO.updteResourceBillDetailsForPOForVenderCashbook(poh);

			*/

			HttpSession session3 = request.getSession();

			// SETIING SESSION ATTIBUTES FOR RESOUCE BILLING PDF
			session3.setAttribute("fkVendorId", fkVendorId);
			session3.setAttribute("resourceBillNoForPdf", billNo);
			session3.setAttribute("vendorName", vendorName);
			session3.setAttribute("totalSubTotal", totalSubTotal);
			session3.setAttribute("billPeriodStartDate", billPeriodStartDate);
			session3.setAttribute("billPeriodEndDate", billPeriodEndDate);
			session3.setAttribute("billDate", billDate);
			session3.setAttribute("billNo",billNo);

			session3.setAttribute("GST", GST);
			session3.setAttribute("IGST", IGST);
			session3.setAttribute("totalTaxAmount", totalTaxAmount);
			session3.setAttribute("grossTotal", grossTotal);

		}
		HibernateUtility hbu2 = HibernateUtility.getInstance();
		Session session2 = hbu2.getHibernateSession();
		Transaction transaction2 = session2.beginTransaction();
		Query query2 = session2.createSQLQuery("UPDATE resource_billing SET balance_Amount = '"+updatedBalanceAmt+"' WHERE vendor_name='"+vendorName+"' AND fk_vendor_id= "+fkVendorId);
		int count4 = query2.executeUpdate();

		transaction2.commit();
	}





}
