package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.ClientPaymentDetailsBean;
import com.embelSoft.hibernate.ClientPaymentDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ClientPaymentDetailsDao {

	public void addClientPaymentDetails(ClientPaymentDetailsHibernate cpdh) {
		System.out.println("In DAO");

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			System.out.println("got session ");
			transaction = session.beginTransaction();

			System.out.println("Tx started");

			session.save(cpdh);
			transaction.commit();
			System.out.println("Successful");

		}

		catch (RuntimeException e) {
			try {
				transaction.rollback();
			} catch (RuntimeException rbe) {
				Log.error("Couldn't roll back tranaction", rbe);
			}
		} finally {
			hbu.closeSession(session);
		}

	}

	// get all Client Payment List
	public List getClientPaymentList() {

		HibernateUtility hbu = null;
		Session session = null;
		List<ClientPaymentDetailsBean> cliList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"select client_name, total_amount, balance_amount, paid_amount from client_payment_details");
			List<Object[]> list = query.list();

			cliList = new ArrayList<ClientPaymentDetailsBean>(0);

			int i = 0;
			for (Object[] o : list) {
				i++;

				ClientPaymentDetailsBean reports = new ClientPaymentDetailsBean();

				reports.setClientName(o[0].toString());
				reports.setTotalAmount(Double.parseDouble(o[1].toString()));
				reports.setRemainingAmount(Double.parseDouble(o[2].toString()));
				reports.setPaidAmount(Double.parseDouble(o[3].toString()));

				Double remAmt = Double.parseDouble(o[2].toString());
				Double paidAmt = Double.parseDouble(o[3].toString());
				Double balanceAmount = remAmt - paidAmt;

				reports.setBalanceAmount(balanceAmount);

				reports.setSrNo(i);

				cliList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return cliList;
	}

	// get Client Name For Report
	public List getAllClientName() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("FROM ClientPaymentDetailsHibernate"); // GROUP BY client_name
			list = query.list();
		} catch (RuntimeException e) {
			Log.error("Error in getAllUnits", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}
	
	public List<ClientPaymentDetailsHibernate> getClientNameForRep() {

		HibernateUtility hbu = null;
		Session session = null;
		List<ClientPaymentDetailsHibernate> cliList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT DISTINCT fk_client_payment_id,client_name FROM client_payment_details;");
			List<Object[]> list = query.list();
			cliList = new ArrayList<ClientPaymentDetailsHibernate>();
			
			for (Object[] o : list) {
		
				ClientPaymentDetailsHibernate reports = new ClientPaymentDetailsHibernate();
				reports.setFkClientId(Long.parseLong(o[0].toString()));
				reports.setClientName(o[1].toString());
				cliList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return cliList;
	}

	// Client Payment Report by Date And Name Wise
	public List getClientReportByDateAndName(String fkClientId2, String clientName, String fDate, String endDate4) {

		HibernateUtility hbu = null;
		Session session = null;
		List<ClientPaymentDetailsBean> cliList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"select client_name, total_amount, balance_amount, paid_amount,insert_date from client_payment_details WHERE client_name ='"
							+ clientName + "' AND fk_client_payment_id ='" + fkClientId2 + "' AND insert_date BETWEEN '"
							+ fDate + "' AND '" + endDate4 + "'");
			List<Object[]> list = query.list();
			cliList = new ArrayList<ClientPaymentDetailsBean>(0);

			System.out.println("========================  SIZE  ======================  :: " + list.size());

			int i = 0;
			for (Object[] o : list) {
				i++;

				ClientPaymentDetailsBean reports = new ClientPaymentDetailsBean();

				reports.setClientName(o[0].toString());
				reports.setTotalAmount(Double.parseDouble(o[1].toString()));
				reports.setRemainingAmount(Double.parseDouble(o[2].toString()));
				reports.setPaidAmount(Double.parseDouble(o[3].toString()));

				Double remAmount = Double.parseDouble(o[2].toString());
				Double paidAmount = Double.parseDouble(o[3].toString());

				Double balanceAmount = remAmount - paidAmount;
				reports.setBalanceAmount(balanceAmount);

				String d = o[4].toString();
				String[] dt = d.split("-");
				String insertDate = dt[2] + "-" + dt[1] + "-" + dt[0];

				reports.setDate(insertDate);

				reports.setSrNo(i);
				System.out.println(reports.getClientName());
				System.out.println(reports.getTotalAmount());
				System.out.println(reports.getRemainingAmount());
				System.out.println(reports.getPaidAmount());
				System.out.println(reports.getBalanceAmount());
				System.out.println(reports.getDate());
				cliList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return cliList;
	}

	// Client Payment Report by Date Wise
	public List getClientReportByDates(String fDate, String lName) {

		HibernateUtility hbu = null;
		Session session = null;
		List<ClientPaymentDetailsBean> cliList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"select client_name, total_amount, balance_amount,paid_amount,insert_date from client_payment_details WHERE insert_date BETWEEN '"
							+ fDate + "' AND '" + lName + "'");
			List<Object[]> list = query.list();

			cliList = new ArrayList<ClientPaymentDetailsBean>(0);

			int i = 0;
			for (Object[] o : list) {
				i++;

				ClientPaymentDetailsBean reports = new ClientPaymentDetailsBean();

				reports.setClientName(o[0].toString());
				reports.setTotalAmount(Double.parseDouble(o[1].toString()));
				reports.setRemainingAmount(Double.parseDouble(o[2].toString()));
				reports.setPaidAmount(Double.parseDouble(o[3].toString()));

				Double remAmount = Double.parseDouble(o[2].toString());
				Double paidAmount = Double.parseDouble(o[3].toString());
				Double balanceAmount = remAmount - paidAmount;
				reports.setBalanceAmount(balanceAmount);

				String d = o[4].toString();
				String[] dt = d.split("-");
				String insertDate = dt[2] + "-" + dt[1] + "-" + dt[0];

				reports.setDate(insertDate);

				reports.setSrNo(i);

				cliList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return cliList;
	}

}
