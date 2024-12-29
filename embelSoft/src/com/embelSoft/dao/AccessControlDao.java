package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.AccessControlBean;
import com.embelSoft.hibernate.AccessControlHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.utility.HibernateUtility;

public class AccessControlDao {

	// get User Details for edit
	public List<UserDetailasNewHibernate> getUserDtlForAccessControl(Long fkEmployeeid) {
		System.out.println(fkEmployeeid + "    -----------   fkid In dao");
		// System.out.println(employeeName + " -------- Name In dao");
		HibernateUtility hbu = null;
		Session session = null;

		List<UserDetailasNewHibernate> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			// System.out.println("Name "+employeeName);
			Query query2 = session
					.createSQLQuery("SELECT user_name, password FROM user_details WHERE pk_user_id = :fkEmployeeid ");
			query2.setParameter("fkEmployeeid", fkEmployeeid);
			// query2.setParameter("employeeName", employeeName);

			List<Object[]> list = query2.list();
			expenseList = new ArrayList<UserDetailasNewHibernate>(0);

			for (Object[] object : list) {
				UserDetailasNewHibernate reports = new UserDetailasNewHibernate();

				reports.setUserName(object[0].toString());
				reports.setPassword(object[1].toString());
				// reports.setUserType(object[2].toString());

				expenseList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;
	}

	// valAccessControlDetails
	public void valAccessControlDetails(AccessControlHibernate ach) {
		System.out.println("In DAO");
		System.out.println("In DAO------Name" + ach.getName());

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			System.out.println("got session ");
			transaction = session.beginTransaction();

			System.out.println("Tx started");

			session.saveOrUpdate(ach);
			System.out.println("oooooooooooooooooo");
			transaction.commit();
			System.out.println("Successful");
		}

		catch (RuntimeException e) {
			e.printStackTrace();
			try {
				transaction.rollback();
			} catch (RuntimeException rbe) {
				Log.error("Couldn't roll back tranaction", rbe);
			}
		} finally {
			hbu.closeSession(session);
		}
	}

	// getAccessControlList
	public List getAccessControlList() {
		HibernateUtility hbu = null;
		Session session = null;
		List<AccessControlBean> UserDetailsList = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT name, user_name, password, user_type FROM access_control");
			List<Object[]> list = query.list();
			System.out.println("list Size:" + list);

			UserDetailsList = new ArrayList<AccessControlBean>(0);

			int i = 0;
			for (Object[] o : list) {
				i++;

				AccessControlBean reports = new AccessControlBean();

				reports.setSrNo(i);

				reports.setName(o[0].toString());
				reports.setUserName(o[1].toString());
				reports.setPassword(o[2].toString());
				reports.setUserType(o[3].toString());

				UserDetailsList.add(reports);
			}
		} catch (RuntimeException e) {
			System.out.println(e);
		} finally {
			hbu.closeSession(session);
		}
		return UserDetailsList;
	}

	// getAllAccessControlDetails
	public List getAllAccessControlDetails() {
		HibernateUtility hbu = null;
		Session session = null;

		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("from AccessControlHibernate");
			list = query.list();
		} catch (Exception e) {
			Log.error("Error in AccessControlHibernate", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;
	}

	// getAccessControlDtlForEdit
	public List<AccessControlBean> getAccessControlDtlForEdit(Long pkACUserId) {
		System.out.println("IN DAO METHOD NAME AccessControlDao pkUserId :- " + pkACUserId);

		HibernateUtility hbu = null;
		Session session = null;

		List<AccessControlBean> userList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			// System.out.println("Name "+employeeName);
			Query query = session.createSQLQuery(
					"select pk_ac_user_id, name, user_name, password, user_type from access_control where pk_ac_user_id=:pkACUserId");
			query.setParameter("pkACUserId", pkACUserId);

			List<Object[]> list = query.list();

			userList = new ArrayList<AccessControlBean>(0);

			System.out.println("Size in DAO   : =====================  : " + list.size());

			for (Object[] o : list) {

				AccessControlBean reports = new AccessControlBean();

				reports.setPkACUserId(Long.parseLong(o[0].toString()));
				reports.setName(o[1].toString());
				reports.setUserName(o[2].toString());
				reports.setPassword(o[3].toString());
				reports.setUserType(o[4].toString());

				// reports.setAddingDate((Date) o[2]);

				userList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}

	// getAllUserDetailsForUpdate
	public List getAllAccessControlDetailsForUpdate() {
		System.out.println("IN DAO METHOD NAME :- getAllAccessControlDetailsForUpdate");

		HibernateUtility hbu = null;
		Session session = null;
		List userList = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createQuery("From AccessControlHibernate");
			userList = query.list();

		} catch (RuntimeException e) {
			Log.error("Error in AccessControlHibernate", e);
		} finally {
			hbu.closeSession(session);
		}
		return userList;
	}

}
