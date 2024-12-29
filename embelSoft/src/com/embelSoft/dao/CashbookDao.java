package com.embelSoft.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.ProductBillingDtlForClientPaymentCashBookBean;
import com.embelSoft.hibernate.ProductBillingDtlForClientPaymentCashBookHibernate;
import com.embelSoft.utility.HibernateUtility;

public class CashbookDao {

	// coding for client payment cashbook
	// getGrossTotal for client payment cashbook
	public List<ProductBillingDtlForClientPaymentCashBookBean> getGrossTotal(String fkClientId, String clientName) {
		System.out.println("IN DAO Method getGrossTotal");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		List<ProductBillingDtlForClientPaymentCashBookBean> memList = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"select client_name, balance_status FROM product_billing_dtl_for_client_payment_cash_book WHERE fk_client_id='"
							+ fkClientId + "' and client_name='" + clientName + "'  GROUP BY balance_status");
			List<Object[]> list = query.list();

			memList = new ArrayList<ProductBillingDtlForClientPaymentCashBookBean>(0);

			for (Object[] o : list) {
				ProductBillingDtlForClientPaymentCashBookBean report = new ProductBillingDtlForClientPaymentCashBookBean();

				report.setClientName(o[0].toString());
				report.setBalanceStatus(Double.parseDouble(o[1].toString()));

				memList.add(report);
			}
		} catch (RuntimeException e) {
			System.out.println(e);
		} finally {
			hbu.closeSession(session);
		}
		return memList;
	}

	// saveProductBillingDetailsForClientPaymentCashbook for client payment cashbook
	public void saveProductBillingDetailsForClientPaymentCashbook(
			ProductBillingDtlForClientPaymentCashBookHibernate hibernate) {

		System.out.println("IN DAO Method saveProductBillingDetailsForClientPaymentCashbook");
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

				Log.error("Error in saveProductBillingDetailsForClientPaymentCashbook", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}

	public List getTotalAmountAndBalanceAmountByClientName(String fkClientId, String clientName) {
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"SELECT gross_total, balance_status FROM product_billing_dtl_for_client_payment_cash_book WHERE fk_client_id =:fkClientId AND client_name=:clientName GROUP BY gross_total");
			
			query.setParameter("fkClientId", fkClientId);
			query.setParameter("clientName", clientName);

			list = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;
	}
	
	public BigDecimal getTotalClientPayment(String fkClientId) {

		HibernateUtility hbu = null;
		Session session = null;
		BigDecimal totalAmount = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query = session.createSQLQuery("SELECT COALESCE(SUM(paid_amount), 0) AS total_paid_amount FROM client_payment_details WHERE fk_client_payment_id = "+fkClientId);
			 
			totalAmount = (BigDecimal) query.uniqueResult();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		
		return totalAmount;	
	}

	// for addClientPaymentDetails METHOD ClientPaymentHelper
	public List getAllClientPurchaseOrderEntry() {
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("from ProductBillingDtlForClientPaymentCashBookHibernate");
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;
	}

	public Double getBalanceAmountforclient(String fkClientId) {
		HibernateUtility hbu = null;
		Session session = null;
		Double result = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT balance_status FROM product_billing_dtl_for_client_payment_cash_book WHERE fk_client_id ="+fkClientId+" ORDER BY pk_purchase_Id DESC LIMIT 1");
			 result = (Double) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return (result != null) ? result.doubleValue() : 0.0;
	}
	

}
