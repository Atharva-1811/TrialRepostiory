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

import com.embelSoft.bean.ClientPaymentDetailsBean;
import com.embelSoft.bean.VendorPaymentDetailsBean;
import com.embelSoft.dao.CashbookDao;
import com.embelSoft.dao.ClientPaymentDetailsDao;
import com.embelSoft.dao.PurchaseOrderDao;
import com.embelSoft.dao.VendorPaymentDetailsDao;
import com.embelSoft.hibernate.ClientPaymentDetailsHibernate;
import com.embelSoft.hibernate.ProductBillingDtlForClientPaymentCashBookHibernate;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ClientPaymentHelper 
{
	public void addClientPaymentDetails(HttpServletRequest request, HttpServletResponse response)
	{
		String fkClientId2 = request.getParameter("fkClientId2");
		String clientName = request.getParameter("clientName");
		System.out.println("clientName : "+clientName);
		String totalAmount2 = request.getParameter("totalAmount2");
		String balanceAmount2 = request.getParameter("balanceAmount2");
		String paidAmount2 = request.getParameter("paidAmount2");		
		
		
		Double balAmount = Double.parseDouble(balanceAmount2);
		Double pdAmount = Double.parseDouble(paidAmount2);
		System.out.println("balanceAmount2 :- "+balAmount);
		System.out.println("paidAmount2 :- "+pdAmount);
		
		Double amount = balAmount - pdAmount;
		System.out.println("amount :- "+amount);
		CashbookDao cbDao = new CashbookDao();
		List list22 = cbDao.getAllClientPurchaseOrderEntry();
	
		
		for (int j = 0; j < list22.size(); j++) 
		{
			ProductBillingDtlForClientPaymentCashBookHibernate hibernate = (ProductBillingDtlForClientPaymentCashBookHibernate) list22.get(j);
			
			Long purchaseId = hibernate.getPkPurchaseId();
			Long fkVenClientId = hibernate.getFkClientId();
			String venName = hibernate.getClientName();
			System.out.println("venName"+venName);
			String billNum = hibernate.getBillNo();
//			String Type = hibernate.getType();		
			
			if(venName.equals(clientName) && fkVenClientId.equals(Long.parseLong(fkClientId2)))
			{	
				HibernateUtility hbu = HibernateUtility.getInstance();
				Session session = hbu.getHibernateSession();
				Transaction transaction = session.beginTransaction();
				
				Query query = session.createSQLQuery("update product_billing_dtl_for_client_payment_cash_book set balance_status ='"+amount+"' where fk_client_id ='"+fkClientId2+"' and client_name = '"+clientName+"'");
				//Query query = session.createSQLQuery("update purchase_order set balance_status ='"+amount+"' where Type='client' and  fk_vendor_client_id ='"+fkClientId2+"' and Name = '"+clientName+"'");
				int count = query.executeUpdate();
				transaction.commit();
				break;				
				
				/*
				PurchaseHibernate purchase = (PurchaseHibernate) session.get(PurchaseHibernate.class,new Long(purchaseId));
				purchase.setBalanceStatus(amount);
				session.update(purchase);
				transaction.commit();
				break;*/
			}		
		}
		
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));		
		
		ClientPaymentDetailsHibernate cpdh = new ClientPaymentDetailsHibernate();
		
		cpdh.setFkClientId(Long.parseLong(fkClientId2));
		cpdh.setClientName(clientName);
		cpdh.setTotalAmount(Double.parseDouble(totalAmount2));
		cpdh.setBalanceAmount(Double.parseDouble(balanceAmount2));
		cpdh.setPaidAmount(Double.parseDouble(paidAmount2));
		cpdh.setInsertDate(dateobj);
		
		ClientPaymentDetailsDao cpDao = new ClientPaymentDetailsDao();
		cpDao.addClientPaymentDetails(cpdh);
		
	}
	
	
	// Get List For Client Payment List
	public List getClientPaymentList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ClientPaymentDetailsBean> map = new HashMap<Long, ClientPaymentDetailsBean>();
		ClientPaymentDetailsDao dao = new ClientPaymentDetailsDao();
		List<ClientPaymentDetailsBean> exp1List = dao.getClientPaymentList();
		
		return exp1List;
	}
	
	
	// Get Client Records for Report with Date And Name Wise
		public List getClientReportByDateAndName(HttpServletRequest request, HttpServletResponse response) 
		{
			String fkClientId2 = request.getParameter("fkClientId2");
			String clientName = request.getParameter("clientName");
			String fisDate4 = request.getParameter("fisDate4");
			String endDate4 = request.getParameter("endDate4");
			
			Map<Long, ClientPaymentDetailsBean> map = new HashMap<Long, ClientPaymentDetailsBean>();

			ClientPaymentDetailsDao dao = new ClientPaymentDetailsDao();
			List<ClientPaymentDetailsBean> exp1List = dao.getClientReportByDateAndName(fkClientId2,clientName,fisDate4,endDate4);

			return exp1List;

		}
		
		
		

		// Get Client Records for Report Date Wise
			public List getClientReportByDates(HttpServletRequest request, HttpServletResponse response) 
			{
				String fisDate = request.getParameter("fisDate42");
				String endDate = request.getParameter("endDate42");
				
				Map<Long, ClientPaymentDetailsBean> map = new HashMap<Long, ClientPaymentDetailsBean>();

				ClientPaymentDetailsDao dao = new ClientPaymentDetailsDao();
				List<ClientPaymentDetailsBean> exp1List = dao.getClientReportByDates(fisDate,endDate);

				return exp1List;

			}
			
	
	
}
