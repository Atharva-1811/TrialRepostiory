package com.embelSoft.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

import com.embelSoft.dao.ClientPaymentDetailsDao;
import com.embelSoft.dao.ExpenditurePaymentDao;
import com.embelSoft.bean.ExpenditurePaymentBean;
import com.embelSoft.hibernate.ExpenditurePaymentHibernate;
import com.embelSoft.utility.HibernateUtility;
import com.embelSoft.bean.ClientPaymentDetailsBean;
public class ExpenditurePaymentHelper {

	Double bal;
	public void regExpensePayment(HttpServletRequest request, HttpServletResponse response) {

		String fkExpDetailId = request.getParameter("expenseName");
		String serviceProvider = request.getParameter("serviceProvider");
		String expCredit = request.getParameter("expCredit");
		String expDebit = request.getParameter("expDebit");
		String contactNumber = request.getParameter("contactNumber");
		String accountantName = request.getParameter("accountantName");

		ExpenditurePaymentHibernate hibernate = new ExpenditurePaymentHibernate();

		HibernateUtility hbu = HibernateUtility.getInstance();
		Session session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT total_amount ,fk_expense_detail_id from expenditure_payment ORDER BY  pk_expenditure_payment_id  DESC LIMIT 1 ;");
		List<Object[]> list = query.list();
		System.out.println(list.size());
		int listSize = list.size();
		System.out.println("list size in helper" + listSize);

		if (listSize == 0) {
			System.out.println("if block 1");
			if (!"".equals(expCredit)) {
				bal = Double.parseDouble(expCredit);
				hibernate.setExpCredit(bal);
				hibernate.setTotalAmount(bal);
				hibernate.setExpDebit(0.0);
				System.out.println(expCredit);
			}

			else if (!"".equals(expDebit)) {
				hibernate.setTotalAmount(Double.parseDouble(expDebit));
				System.out.println(expDebit);
			} else {
				hibernate.setTotalAmount(0.0);
			}
			hibernate.setFkExpDetailId(Long.parseLong(fkExpDetailId));
			hibernate.setServiceProvider(serviceProvider);

			if (!"".equals(accountantName)) {
				hibernate.setAccountantName(accountantName);
			} else {
				hibernate.setAccountantName("N/A");
			}

			hibernate.setContactNumber(Long.parseLong(contactNumber));

			SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			Date dateobj = new Date();
			System.out.println(dateFormat1.format(dateobj));

			hibernate.setInsertDate(dateobj);
			ExpenditurePaymentDao dao = new ExpenditurePaymentDao();
			dao.addExpensePayment(hibernate);

		} else if (listSize > 0) {
			System.out.println("else block 1");

			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				Object[] objects = (Object[]) iterator.next();

				bal = (Double) objects[0];

				System.out.println("balance" + bal);

			}

			if (!"".equals(expCredit)) {

				bal = bal + Double.parseDouble(expCredit);
				hibernate.setTotalAmount(bal);
				hibernate.setExpCredit(Double.parseDouble(expCredit));
				if ("".equals(expDebit)) {
					hibernate.setExpDebit(0.0d);
				} else {
					hibernate.setExpDebit(Double.parseDouble(expDebit));
				}
				System.out.println(expCredit);

			} else if (!"".equals(expDebit)) {
				bal = bal - Double.parseDouble(expDebit);
				hibernate.setTotalAmount(bal);
				hibernate.setExpDebit(Double.parseDouble(expDebit));
				if ("".equals(expCredit)) {
					hibernate.setExpCredit(0.0d);
				} else {
					hibernate.setExpCredit(Double.parseDouble(expCredit));
				}
			}

			hibernate.setFkExpDetailId(Long.parseLong(fkExpDetailId));
			hibernate.setServiceProvider(serviceProvider);
			hibernate.setAccountantName(accountantName);
			hibernate.setContactNumber(Long.parseLong(contactNumber));

			SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			Date dateobj = new Date();
			System.out.println(dateFormat1.format(dateobj));

			hibernate.setInsertDate(dateobj);
			ExpenditurePaymentDao dao = new ExpenditurePaymentDao();
			dao.addExpensePayment(hibernate);
		}

	}
	
	// Expnediture reports bet two dates and name
	public List getExpensePaymentDetailByTwoDate(HttpServletRequest request, HttpServletResponse response) {
		String fkRootexpId= request.getParameter("fkRootexpId");
		String fDate = request.getParameter("fisDate");
		String tDate = request.getParameter("endDate");
		
		Map<Long, ExpenditurePaymentBean> map = new HashMap<Long, ExpenditurePaymentBean>();

		ExpenditurePaymentDao dao = new ExpenditurePaymentDao();
		List<ExpenditurePaymentBean> exp1List = dao.getExpensePaymentDetailByTwoDates(fkRootexpId,fDate, tDate);

		return exp1List;

	}
	
	
	// Expnediture reports bet dates only
		public List getExpensePaymentDetailByDate(HttpServletRequest request, HttpServletResponse response) 
		{
			String fDate = request.getParameter("fisDate");
			String tDate = request.getParameter("endDate");

			Map<Long, ExpenditurePaymentBean> map = new HashMap<Long, ExpenditurePaymentBean>();

			ExpenditurePaymentDao dao = new ExpenditurePaymentDao();
			List<ExpenditurePaymentBean> exp1List = dao.getExpensePaymentDetailByDates(fDate, tDate);

			return exp1List;

		}
		
		
		// Get List For Expenditure Payment List
		public List getExpenditurePaymentList(HttpServletRequest request, HttpServletResponse response) 
		{
			Map<Long, ExpenditurePaymentBean> map = new HashMap<Long, ExpenditurePaymentBean>();
			ExpenditurePaymentDao dao = new ExpenditurePaymentDao();
			List<ExpenditurePaymentBean> exp1List = dao.getExpenditurePaymentList();
			
			System.out.println("IN HELPER--------------==== :  "+exp1List.size());
			return exp1List;
		}

}
	
	

	