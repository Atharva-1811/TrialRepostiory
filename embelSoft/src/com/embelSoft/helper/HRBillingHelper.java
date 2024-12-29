package com.embelSoft.helper;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.embelSoft.bean.ExpenditurePaymentBean;
import com.embelSoft.bean.HrBillingBean;
import com.embelSoft.bean.VendorPaymentDetailsBean;
import com.embelSoft.dao.HRBillingDao;
import com.embelSoft.dao.PurchaseOrderDao;
import com.embelSoft.dao.VendorPaymentDetailsDao;
import com.embelSoft.hibernate.HRBillingHibernate;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.utility.HibernateUtility;

public class HRBillingHelper {
	
	
	public HrBillingBean getGridForHrBill(String description)
	{
		HrBillingBean hrbean = new HrBillingBean();
		hrbean.setDescription(description);
	
		return hrbean;
	}
	
	public void doHRBilligDetails(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException {
		{
			
				/*Object object=request.getParameter("data");
				System.out.println("json object ========="+object);
				
				JSONObject jsonObj = new JSONObject(object);
				JSONObject jObj = jsonObj;
				
				Iterator it = jObj.keys(); //gets all the keys
			

				while(it.hasNext())
				{
				     Object key = it.next(); // get key
				     System.out.println("+++++++ " +key);
				     String o = (String)jObj.get((String) key); // get value
				     System.out.println("key.................."+o);
				     HttpSession session = request.getSession();
				     session.setAttribute("key", o); // store in session
				}*/
				
			    String vendorName = request.getParameter("vendorName");		
				String fkVendorId = request.getParameter("fkVendorId");
				String billingDate = request.getParameter("billingDate");
				String billingPeriodFrom = request.getParameter("billingPeriodFrom");
				String billingPeriodTo = request.getParameter("billingPeriodTo");
				String srNO = request.getParameter("srNO");
				String description = request.getParameter("description");
				String quantity = request.getParameter("quantity");
				String unit = request.getParameter("unit");
				String amount = request.getParameter("amount");
				String subTotal = request.getParameter("subTotal");
				String gst = request.getParameter("gst");
				String vat = request.getParameter("vat");
				String grossTotal1 = request.getParameter("grossTotal1");
			// TODO Auto-generated method stub
			//response.setContentType("text/html"); 
				HRBillingHibernate hbh = new HRBillingHibernate();
			
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				
				Date date1,date2,date3 = null;
				
				try 
				{
					date1 = format.parse(billingDate);
					hbh.setBillingDate(date1);
					
					date2=format.parse(billingPeriodFrom);
					hbh.setBillingPeriodFrom(date2);
					
					date3=format.parse(billingPeriodTo);
					hbh.setBillingPeriodTo(date3);
				} 
				catch (Exception e){
					e.printStackTrace();	
				}
				hbh.setVendorName(vendorName);
				hbh.setFkVendorId(Long.parseLong(fkVendorId));
				//hbh.setSrNO(Integer.parseInt(srNO));
				hbh.setDescription(description);
				hbh.setQuantity(Long.parseLong(quantity));
				hbh.setUnit(Double.parseDouble(unit));
				hbh.setAmount(Double.parseDouble(amount));
				hbh.setSubTotal(Double.parseDouble(subTotal));
				hbh.setGst(Double.parseDouble(gst));
				hbh.setVat(Double.parseDouble(vat));
				hbh.setGrossTotal1(Double.parseDouble(grossTotal1));
				
				HRBillingDao hdo = new HRBillingDao();
				hdo.valVendorDetails(hbh);
				
			/*
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			Date dateOfBirth = null;
			try{
				dateOfBirth = format.parse(billingDate);
				hbh.setBillingDate(dateOfBirth);
				System.out.println(" date dateOfBirth parsing" +billingDate);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			
			Date joiningDate = null;
			try{
				joiningDate = format.parse(billingPeriodFrom);
				hbh.setBillingPeriodFrom(joiningDate);
				System.out.println(" date dateOfBirth parsing" +billingPeriodFrom);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			
			Date leavingDate = null;
			try{
				leavingDate = format.parse(billingPeriodTo);
				hbh.setBillingPeriodTo(leavingDate);
				System.out.println(" date dateOfBirth parsing" +billingPeriodTo);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			
			String json = "";
			//System.out.println("sfjdhf");
			String jsonString = request.getParameter("object");
			try {
				JSONArray jsonArray = new JSONArray(jsonString);
	 
				int count = jsonArray.length(); // get totalCount of all jsonObjects
				
				for(int i=0 ; i< count; i++){   // iterate through jsonArray 
					JSONObject jsonObject = jsonArray.getJSONObject(i);  // get jsonObject @ i position
					
					
					    hbh.setSrNO(Long.valueOf(jsonObject.getString("srNO")));
					    System.out.println(Long.valueOf(jsonObject.getString("srNO")));
						hbh.setDescription(jsonObject.getString("description"));
						System.out.println(jsonObject.getString("description"));
						hbh.setQuantity(Long.valueOf(jsonObject.getString("quantity")));
						hbh.setUnit(Double.valueOf(jsonObject.getString("unit")));
						hbh.setAmount(Double.valueOf(jsonObject.getString("amount")));
						
						hbh.setVendorName(vendorName);
						hbh.setFkVendorId(Long.parseLong(fkVendorId));
						hbh.setSubTotal(Double.parseDouble(subTotal));
						hbh.setGst(Double.parseDouble(gst));
						hbh.setVat(Double.parseDouble(vat));
						hbh.setGrossTotal1(Double.parseDouble(grossTotal1));
						System.out.println(Double.parseDouble(grossTotal1));
						
					    HRBillingDao hdo = new HRBillingDao();
						hdo.valVendorDetails(hbh);
					
				}
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			json = new Gson().toJson(hbh);
			System.out.println(json);
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");

			out.print(json);
			out.flush();
		//	doGet(request, response);
*/		
	}
}
	
	
	
	
	/*public void addHRBilligDetails(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException 
	{
			
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println("-------------------------============---------=-=-=-=    "+count);
		for(int i=0;i<=count;i++)
		{
			String fkVendorId = request.getParameter("fkVendorId"+i);
			String vendorName = request.getParameter("vendorName"+i);
			String billingDate = request.getParameter("billingDate"+i);
			String billingPeriodFrom = request.getParameter("billingPeriodFrom"+i);
			String billingPeriodTo = request.getParameter("billingPeriodTo"+i);
			
			String description = request.getParameter("description"+i);
			String quantity = request.getParameter("quantity"+i);
			String unit = request.getParameter("buyPrice"+i);
			String amount = request.getParameter("total"+i);
			String subTotal = request.getParameter("subTotal"+i);
			String gst = request.getParameter("gst"+i);
			String vat = request.getParameter("vat"+i);
			String grossTotal1 = request.getParameter("grossTotal1"+i);
			
			HRBillingHibernate hbh = new HRBillingHibernate();
			
			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
			Date d1,d2,d3 = null;
			
			try
			{
				d1 = format.parse(billingDate);
				hbh.setBillingDate(d1);
				
				d2 = format.parse(billingPeriodFrom);
				hbh.setBillingPeriodFrom(d2);
				
				d3 = format.parse(billingPeriodTo);
				hbh.setBillingPeriodTo(d3);
				
				
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			hbh.setFkVendorId(Long.parseLong(fkVendorId));
			hbh.setVendorName(vendorName);
			hbh.setSrNO(i);
			hbh.setDescription(description);
			hbh.setQuantity(Long.parseLong(quantity));
			hbh.setUnit(Double.parseDouble(unit));
			hbh.setAmount(Double.parseDouble(amount));
			hbh.setSubTotal(Double.parseDouble(subTotal));
			hbh.setGst(Double.parseDouble(gst));
			hbh.setVat(Double.parseDouble(vat));
			hbh.setGrossTotal1(Double.parseDouble(grossTotal1));
			
			
			HRBillingDao hdo = new HRBillingDao();
			hdo.valVendorDetailsMul(hbh);
			
			
		}
		*/
	
		String HrBill;
		String Hr;
		public void addHRBilligDetails(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException 
		{
			
			String billForPdf;
					
			HttpSession session5 = request.getSession();
			Integer count = Integer.parseInt(request.getParameter("count"));

			SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			Date dateobj = new Date();
			
			String d4 = dateobj.toString();
			
			String[] d = d4.split(" ");
			
			String year = d[5];
			String month = d[1];
			
			
			String HrBill = month+"/"+year+"/"+"00"+1;
			
			
			HRBillingDao hrDao = new HRBillingDao();
			List bill = hrDao.getVendorBill();
				
			for(int i=0;i<bill.size();i++)
			{
				HrBillingBean bean = (HrBillingBean)bill.get(i);
				//HrBill = bean.getBill();
				
				Hr = bean.getBill();
				String[] HrBil = Hr.split("/");
				
				String lNo = HrBil[2];
				
				int lstNo = Integer.parseInt(lNo);
				
				int LastNo = lstNo + 1;
				
				
				if(LastNo<10)
				{
					HrBill = month+"/"+year+"/"+"00"+LastNo;
				}				
				else
				{
					HrBill = month+"/"+year+"/"+LastNo;
				}
			}
			
				HRBillingHibernate hbh = new HRBillingHibernate();
				
				for(int i=0;i<count;i++)
				{
					
					if(HrBill == null)
					{
						hbh.setBillNo(HrBill);
						billForPdf = HrBill;
						
					}
					else
					{
						hbh.setBillNo(HrBill);
						billForPdf = HrBill;
						
					}
					System.out.println("HRBiilibgHelper addHRBilligDetails METHOD billForPdf :- " +billForPdf);
	
				String fkVendorId = request.getParameter("fkVendorId");
				String vendorName = request.getParameter("vendorName");
				String billingDate = request.getParameter("billingDate");
				String billingPeriodFrom = request.getParameter("billingPeriodFrom");
				String billingPeriodTo = request.getParameter("billingPeriodTo");
				//String id = request.getParameter("id"+i);
				String description = request.getParameter("description"+i);
				String hsn = request.getParameter("hsn"+i);
				String quantity = request.getParameter("quantity"+i);
				String unitPrice = request.getParameter("buyPrice"+i);
				
				String gridAmount = request.getParameter("gridAmount"+i);
				String gridDiscountPercent = request.getParameter("gridDiscountPercent"+i);
				String gridDiscountAmount = request.getParameter("gridDiscountAmount"+i);
				String gridSubTotal = request.getParameter("gridSubTotal"+i);
				String gridGstPercent = request.getParameter("gridGstPercent"+i);
				String gridGstPercentAmount = request.getParameter("gridGstPercentAmount"+i);
				
				String amount = request.getParameter("total"+i);
//				String subTotal = request.getParameter("subTotal");
//				
//				String gst = request.getParameter("gst");
//				String vat = request.getParameter("vat");
				String grossTotal1 = request.getParameter("grossTotal1");
								
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date d1 = null;
			
				try
				{
					d1 = format.parse(billingDate);
					hbh.setBillingDate(d1);
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
				
				Date d2 = null;				
				
				try
				{
					d2 = format.parse(billingPeriodFrom);
					hbh.setBillingPeriodFrom(d2);
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}

				Date d3 = null;
				
				try
				{				
					d3 = format.parse(billingPeriodTo);
					hbh.setBillingPeriodTo(d3);
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
				
				hbh.setFkVendorId(Long.parseLong(fkVendorId));
				hbh.setVendorName(vendorName);
				//hbh.setSrNO(Integer.parseInt(id+1));
				hbh.setDescription(description);
				
				if(!"".equals(hsn)){
					hbh.setHsn(hsn);
					System.out.println("if--setVat"+hbh.getHsn());
				}else{
					hbh.setHsn("0");
					System.out.println("else--setVat"+hbh.getHsn());
				}
				
//				hbh.setHsn(hsn);
				hbh.setQuantity(Long.parseLong(quantity));
				hbh.setUnit(Double.parseDouble(unitPrice));
				
				hbh.setGridAmount(Double.parseDouble(gridAmount));
				hbh.setGridDiscountPercent(Double.parseDouble(gridDiscountPercent));
				hbh.setGridDiscountAmount(Double.parseDouble(gridDiscountAmount));
				hbh.setGridSubTotal(Double.parseDouble(gridSubTotal));
				hbh.setGridGstPercent(Double.parseDouble(gridGstPercent));
				hbh.setGridGstPercentAmount(Double.parseDouble(gridGstPercentAmount));
				
				hbh.setAmount(Double.parseDouble(amount));
//				hbh.setSubTotal(Double.parseDouble(subTotal));
//								
//				if(!"".equals(gst)){
//					hbh.setGst(Double.parseDouble(gst));
//					System.out.println("if--setVat"+hbh.getGst());
//				}else{
//					hbh.setGst(Double.parseDouble("0"));
//					System.out.println("else--setVat"+hbh.getVat());
//				}
//				
////				hbh.setGst(Double.parseDouble(gst));
//				
//				if(!"".equals(vat)){
//					hbh.setVat(Double.parseDouble(vat));
//					System.out.println("if--setVat"+hbh.getVat());
//				}else{
//					hbh.setVat(Double.parseDouble("0"));	
//					System.out.println("else--setVat"+hbh.getVat());
//				}			
				
//				hbh.setVat(Double.parseDouble(vat));
				
				hbh.setGrossTotal1(Double.parseDouble(grossTotal1));
			  //  hbh.setBillNo(HrBill);
				
			//	Long bill5 = hbh.getBillNo();
				

				session5.setAttribute("fkVendorId", fkVendorId);
				session5.setAttribute("billForPdf", billForPdf);
				session5.setAttribute("vendorNameVendorBill", vendorName);
				session5.setAttribute("descriptionVendorBill", description);
				session5.setAttribute("quantityVendorBill", quantity);
				session5.setAttribute("unitVendorBill", unitPrice);
				session5.setAttribute("amountVendorBill", amount);
//				session5.setAttribute("subTotalVendorBill", subTotal);
//				session5.setAttribute("gstVendorBill", gst);
//				session5.setAttribute("vatVendorBill", vat);
				session5.setAttribute("gridGstPercentAmount", gridGstPercentAmount);
				session5.setAttribute("gridGstPercentAmount", gridGstPercentAmount);
				session5.setAttribute("grossTotal1VendorBill", grossTotal1);
				
				
				
				//Double grossTotalFromDB=0.0;
				//String grossTotal12 = request.getParameter("grossTotal1");
				//Double gTotal = Double.parseDouble(grossTotal12);
						
				
				
				//PurchaseOrderDao pod2 = new PurchaseOrderDao();
				//List<HrBillingBean> totalList = pod2.getGrossTotal(fkVendorId,vendorName);
				
			
			/*
			 * for(int j=0;j<totalList.size();j++) { HrBillingBean sr =
			 * (HrBillingBean)totalList.get(i); grossTotalFromDB = sr.getGrossTotal(); }
			 */
				
				//Double updateGrossTotal = gTotal + grossTotalFromDB;
				
				
				HibernateUtility hbu = HibernateUtility.getInstance();
				Session session2 = hbu.getHibernateSession();
				Transaction transaction = session2.beginTransaction();

				
				//Query query2 = session2.createSQLQuery("UPDATE purchase_order SET balance_status = '"+updateGrossTotal+"' WHERE Type='vendor' AND Name='"+vendorName+"' AND fk_vendor_client_id='"+fkVendorId+"'");
				//int count4 = query2.executeUpdate();

				transaction.commit();
				
				HRBillingDao hdo = new HRBillingDao();
				hdo.saveHrBillDetails(hbh);
				
				PurchaseHibernate poh = new PurchaseHibernate();
				
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				Date d11 = null;
			
				try
				{
					d11 = format2.parse(billingDate);
					poh.setPurchaseDate(d11);
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
				
				Date d22 = null;
				try
				{
					d22 = format.parse(billingPeriodTo);
					poh.setExpectPaymentDate(d22);
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}

				
			/*
			 * poh.setFkvendorId(Long.parseLong(fkVendorId)); poh.setName(vendorName);
			 * poh.setBillNo(Long.parseLong("00")); poh.setProductName(description);
			 * poh.setBuyPrice(Double.parseDouble(unitPrice));
			 * poh.setQuantity(Integer.parseInt(quantity));
			 * poh.setTotal(Double.parseDouble(amount));
			 * poh.setSubTotal(Double.parseDouble(subTotal));
			 * poh.setGst(Double.parseDouble(gst));
			 * poh.setGstAmount(Double.parseDouble(vat));
			 * poh.setGrossTotal(Double.parseDouble(grossTotal1));
			 * poh.setBalanceStatus(updateGrossTotal); poh.setType("vendor");
			 */
				
				HRBillingDao hdo2 = new HRBillingDao();
				hdo2.saveHrBillDetailsForPO(poh);
								
			}
		}

		// Get Vendor Records for Report with Date And Name Wise For HrBilling
		public List getVendorHrBillingReportByDateAndName(HttpServletRequest request, HttpServletResponse response) 
		{
			String fkVendorPaymentId = request.getParameter("fkVendorPaymentId");
			String vendorName = request.getParameter("vendorName");
			String startDate = request.getParameter("fisDate");
			String endDate = request.getParameter("endDate");
			
			Map<Long, HRBillingHibernate> map = new HashMap<Long, HRBillingHibernate>();

			HRBillingDao dao = new HRBillingDao();
			List<HRBillingHibernate> exp1List = dao.getVendorHrBillingReportByDateAndName(fkVendorPaymentId,vendorName,startDate,endDate);
			return exp1List;
		}
		
		
		
		
		
	private void putValue(Object key, String o) {
		// TODO Auto-generated method stub
		
	}
	
	
	// Get List For Hr Billing List
	public List getHrBillingList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, HrBillingBean> map = new HashMap<Long, HrBillingBean>();
		HRBillingDao dao = new HRBillingDao();
		List<ExpenditurePaymentBean> exp1List = dao.getHrBillingList();
		
		System.out.println("IN HELPER--------------==== :  "+exp1List.size());
		return exp1List;
	}

	
	
	
}