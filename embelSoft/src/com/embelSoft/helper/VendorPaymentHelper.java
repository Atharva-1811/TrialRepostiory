package com.embelSoft.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.HrBillingBean;
import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.QuotationBean;
import com.embelSoft.bean.VendorPaymentDetailsBean;
import com.embelSoft.dao.ProductBillingDao;
import com.embelSoft.dao.PurchaseOrderDao;
import com.embelSoft.dao.QuotationDao;
import com.embelSoft.dao.VendorPaymentDetailsDao;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.hibernate.VendorPaymentDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class VendorPaymentHelper 
{
		
	public void addVendorPaymentDetailas(HttpServletRequest request, HttpServletResponse response)
	{		
		
		String fkVendorId = request.getParameter("fkVendorId");
		String vendorName = request.getParameter("vendorName");
		String totalAmount = request.getParameter("totalAmount");
		
		//String billNo = request.getParameter("billNo");
		//String billAmount = request.getParameter("billAmount");
		
		String balanceAmount = request.getParameter("balanceAmount");
		String paidAmount = request.getParameter("paidAmount");
		
		Double balAmount = Double.parseDouble(balanceAmount);
		Double pdAmount = Double.parseDouble(paidAmount);
		
		Double amount = balAmount - pdAmount;
		
		PurchaseOrderDao pDao = new PurchaseOrderDao();
		List list22 = pDao.getAllPurchaseOrderEntry();
	
		
		for (int j = 0; j < list22.size(); j++) 
		{
			
			
			PurchaseHibernate bean = (PurchaseHibernate) list22.get(j);
			
			Long purchaseId=bean.getPurchaseId();
			String venName = bean.getName();
			String billNum = bean.getBillNo();
			String Type = bean.getType();
			Long fkVenId = bean.getFkVendorClientId();
				
			
			if(venName.equals(vendorName) && fkVenId.equals(Long.parseLong(fkVendorId)))
			{
				
				HibernateUtility hbu = HibernateUtility.getInstance();
				Session session2 = hbu.getHibernateSession();
				Transaction transaction = session2.beginTransaction();
		

				Query query2 = session2.createSQLQuery("UPDATE purchase_order SET balance_status='"+amount+"' WHERE fk_vendor_client_id='"+fkVendorId+"' AND Name = '"+vendorName+"' AND Type='vendor'");
						
				int count = query2.executeUpdate();
				
				transaction.commit();
				Transaction transaction2 = session2.beginTransaction();
				
				Query query = session2.createSQLQuery("UPDATE resource_billing SET balance_Amount='"+amount+"' WHERE fk_vendor_id= '"+fkVendorId+"' AND vendor_name = '"+vendorName+"'");
				int count2 = query.executeUpdate();
				transaction2.commit();
				break;
				
				/*PurchaseHibernate purchase = (PurchaseHibernate) session.get(PurchaseHibernate.class,new Long(purchaseId));
				
				
				purchase.setBalanceStatus(amount);
				
				session.update(purchase);
				transaction.commit();
				
				break;*/
			}
		
		}
	
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));
		
		
		VendorPaymentDetailsHibernate vpdh = new VendorPaymentDetailsHibernate();
		
		vpdh.setFkVendorId(Long.parseLong(fkVendorId));
		vpdh.setVendorName(vendorName);
		vpdh.setTotalAmount(Double.parseDouble(totalAmount));
//		vpdh.setBillNo(Long.parseLong(billNo));
//		vpdh.setBillAmount(Double.parseDouble(billAmount));
		vpdh.setBalanceAmount(Double.parseDouble(balanceAmount));
		vpdh.setPaidAmount(Double.parseDouble(paidAmount));
		vpdh.setInsertDate(dateobj);
		
		VendorPaymentDetailsDao vpDao = new VendorPaymentDetailsDao();
		vpDao.addVendorPaymentDetails(vpdh);
	}
	
	
	
	
	// Get List For Vendor Payment List
	public List getVendorPaymentList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, VendorPaymentDetailsBean> map = new HashMap<Long, VendorPaymentDetailsBean>();
		VendorPaymentDetailsDao dao = new VendorPaymentDetailsDao();
		List<VendorPaymentDetailsBean> exp1List = dao.getVendorPaymentList();

		return exp1List;
	}
	
	
	// Get Vendor Records for Report with Date And Name Wise
		public List getVendorBillingReportByDateAndName(HttpServletRequest request, HttpServletResponse response) 
		{
			String fkVendorPaymentId = request.getParameter("fkVendorPaymentId");
			String vendorName = request.getParameter("vendorName");
			String startDate = request.getParameter("fisDate");
			String endDate = request.getParameter("endDate");
			
			Map<Long, HrBillingBean> map = new HashMap<Long, HrBillingBean>();

			ProductBillingDao dao = new ProductBillingDao();
			List<HrBillingBean> exp1List = dao.getVendorBillingReportByDateAndName(fkVendorPaymentId,vendorName,startDate,endDate);

			return exp1List;

		}
	
	
	
	// Get Vendor Records for Report with Date And Name Wise
	public List getVendorReportByDateAndName(HttpServletRequest request, HttpServletResponse response) 
	{
		String fkVendorPaymentId = request.getParameter("fkVendorPaymentId");
		String vendorName = request.getParameter("vendorName");
		String startDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");
		
		Map<Long, VendorPaymentDetailsBean> map = new HashMap<Long, VendorPaymentDetailsBean>();

		VendorPaymentDetailsDao dao = new VendorPaymentDetailsDao();
		List<VendorPaymentDetailsBean> exp1List = dao.getVendorReportByDateAndName(fkVendorPaymentId,vendorName,startDate,endDate);

		return exp1List;

	}
	
	
	// Get Vendor Records for Report Date Wise
	public List getVendorReportByDate(HttpServletRequest request, HttpServletResponse response) 
	{
		
		String startDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");
		
		Map<Long, VendorPaymentDetailsBean> map = new HashMap<Long, VendorPaymentDetailsBean>();

		VendorPaymentDetailsDao dao = new VendorPaymentDetailsDao();
		List<VendorPaymentDetailsBean> exp1List = dao.getVendorReportByDate(startDate,endDate);

		return exp1List;

	}
	
	
	
	
	

}
