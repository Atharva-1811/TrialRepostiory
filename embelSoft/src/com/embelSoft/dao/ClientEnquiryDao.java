package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.GetClientEnquiryDetailsBean;
import com.embelSoft.hibernate.ClientEnquiryHibernate;
import com.embelSoft.hibernate.EnquiryFormHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ClientEnquiryDao {
	public void valClientEnqiry(ClientEnquiryHibernate ceh) {
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

			session.save(ceh);
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

	/*
	 * public List getAllClientName() {
	 *
	 * HibernateUtility hbu=null; Session session=null;
	 *
	 * List list=null; try{ hbu = HibernateUtility.getInstance(); session =
	 * hbu.getHibernateSession(); Query query =
	 * session.createQuery("from ClientEnquiryHibernate"); list = query.list();
	 * }catch(Exception e){ Log.error("Error in getAllClientName",e); } finally{
	 * if(session!=null){ hbu.closeSession(session); } } return list; }
	 */

	public List<GetClientEnquiryDetailsBean> getClientDetail(String fisDate, String endDate, String clientName) {

		String clientFullName = clientName;

//		String[] cName = clientFullName.split(" ");
//		System.out.println("Client Name =====> "+cName);
//
//		String firstName = cName[0];
//		String lastName = cName[1];

		HibernateUtility hbu = null;
		Session session = null;
		List<GetClientEnquiryDetailsBean> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			System.out.println("Name " + clientName);
			Query query2 = session.createSQLQuery(
					"SELECT first_name, middle_name, last_name, date_of_enquiry,contact_number,email_id,comment,reference_by FROM client_enquiry_details WHERE date_of_enquiry BETWEEN '"
							+ fisDate + "' AND '" + endDate + "' AND first_name='" + clientName + "'");
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<GetClientEnquiryDetailsBean>(0);

			System.out.println("SIZE LIST    ::  -----  " + list.size());

			int i = 0;

			for (Object[] object : list) {

				i++;
				GetClientEnquiryDetailsBean reports = new GetClientEnquiryDetailsBean();

				reports.setFirstName(object[0].toString());

				// reports.setMiddleName(object[1].toString());
				// reports.setLastName(object[2].toString());

				String d1 = object[3].toString();
				String[] edate = d1.split("-");
				String EnquiryDate = edate[2] + "-" + edate[1] + "-" + edate[0];
				reports.setEnquiryDate(EnquiryDate);
				reports.setContactNo(Long.parseLong(object[4].toString()));
				reports.setEmailId(object[5].toString());

				String comment = reports.getComment();
				if (comment == null || comment == "" || comment == " ") {
					reports.setComment("N/A");
				} else {
					reports.setComment(object[6].toString());
				}

				String reffBy = reports.getReferenceBy();
				if (reffBy == null || reffBy == "" || reffBy == " ") {
					reports.setReferenceBy("N/A");
				} else {
					reports.setReferenceBy(object[7].toString());
				}

				reports.setSrNo(i);

				expenseList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;

	}

	// Get Client Enquiry List
	// Get Client Enquiry List
	public List getClientEnquiryList() {

		HibernateUtility hbu = null;
		Session session = null;
		List<GetClientEnquiryDetailsBean> empList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query = session.createSQLQuery("SELECT first_name, date_of_enquiry, contact_number, email_id,business_name,business_address,Gst_No FROM client_enquiry_details");

			List<Object[]> list = query.list();
			System.out.println("list Size:" + list);

			empList = new ArrayList<GetClientEnquiryDetailsBean>(0);

			int i = 0;
			for (Object[] object : list) {

				i++;
				GetClientEnquiryDetailsBean reports = new GetClientEnquiryDetailsBean();

				reports.setFirstName(object[0].toString());
				

				String d1 = object[1].toString();
				String[] edate = d1.split("-");
				String EnquiryDate = edate[2] + "-" + edate[1] + "-" + edate[0];
				reports.setEnquiryDate(EnquiryDate);
				reports.setContactNo(Long.parseLong(object[2].toString()));
				reports.setEmailId(object[3].toString());
				// reports.setMiddleName(object[1].toString());
				// reports.setLastName(object[2].toString());
				// reports.setComment(object[6].toString());
				// reports.setReferenceBy(object[7].toString());
				// reports.setProductName(object[8].toString());
				reports.setBusinessName(object[4].toString());
				reports.setBusinessAddress(object[5].toString());
				reports.setGstNo(object[6].toString());
				reports.setSrNo(i);

				empList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return empList;
	}

	public List getAllClientName() {

		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session
					.createSQLQuery("select pk_client_enquiry_id,first_name,last_name from client_enquiry_details");

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

	// get Client Name For Quotation
	public List getClientNameForQuotation() {
		HibernateUtility hbu = null;
		Session session = null;

		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("from ClientEnquiryHibernate");
			list = query.list();
		} catch (Exception e) {
			Log.error("Error in ClientEnquiryHibernate", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;
	}

	// in jsp
	public List getAllClientNames() {
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("FROM ClientEnquiryHibernate  ");
			list = query.list();

		} catch (Exception e) {
			Log.error("Error in getAllVendorName", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

		return list;
	}

	public List getAllClientNames4() {
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("FROM ProductBillingHibernateNew Group By fkClientId"); //
			list = query.list();

		} catch (Exception e) {
			Log.error("Error in getAllVendorName", e);
			e.printStackTrace();
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

		return list;
	}

	public List getAllClientNames10() {
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("FROM ProductBillingHibernateNew group by fkClientId"); //
			list = query.list();

		} catch (Exception e) {
			Log.error("Error in getAllVendorName", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

		return list;
	}

	// in jsp for cashbook
	public List getAllClientNamesForCashBook() {
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session
					.createQuery("FROM PurchaseHibernate where type='client' and balanceStatus > 0 Group by name");
			list = query.list();

		} catch (Exception e) {
			Log.error("Error in getAllVendorName", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

		return list;
	}

	public List<GetClientEnquiryDetailsBean> getClientDetailForEdit(Long fk_Client_id) {

		System.out.println(fk_Client_id + "    -----------   fkid In dao");

		HibernateUtility hbu = null;
		Session session = null;

		List<GetClientEnquiryDetailsBean> cltList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			/*
			 * Query query2 = session.
			 * createSQLQuery("select first_name, middle_name, last_name, date_of_enquiry, business_name, business_address, contact_number, city, state, zipCode, Country, alternate_contact_no, product_name, email_id, comment, reference_by,Gst_No from client_enquiry_details where pk_client_enquiry_id=:ClientId"
			 * );
			 */
			Query query2 = session.createSQLQuery(
					"select first_name, date_of_enquiry, business_name, business_address, contact_number, city, state, zipCode, Country, alternate_contact_no, email_id,Gst_No from client_enquiry_details where pk_client_enquiry_id=:ClientId");
			query2.setParameter("ClientId", fk_Client_id);

			List<Object[]> list = query2.list();

			cltList = new ArrayList<GetClientEnquiryDetailsBean>(0);

			System.out.println("Size in DAO   : =====================  : " + list.size());

			for (Object[] o : list) {

				GetClientEnquiryDetailsBean reports = new GetClientEnquiryDetailsBean();

				reports.setFirstName(o[0].toString());
				/*
				 * reports.setMiddleName(o[1].toString()); reports.setLastName(o[2].toString());
				 */
				reports.setEnquiryDate(o[1].toString());
				reports.setBusinessName(o[2].toString());
				reports.setBusinessAddress(o[3].toString());
				reports.setContactNo(Long.parseLong(o[4].toString()));
				reports.setCity(o[5].toString());
				reports.setState(o[6].toString());
				reports.setZipCode(o[7].toString());
				reports.setCountry(o[8].toString());
				reports.setAlternateContactNo(o[9].toString());
				// reports.setProductName(o[12].toString());
				reports.setEmailId(o[10].toString());
				// reports.setComment(o[14].toString());
				// reports.setReferenceBy(o[15].toString());
				reports.setGstNo(o[11].toString());
				cltList.add(reports);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cltList;

	}

	public List getAllClient() {
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("FROM ClientEnquiryHibernate");
			list = query.list();

			System.out.println("Size in DAOAOAOAO  :  " + list.size());

		} catch (Exception e) {

		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

		return list;
	}

	public void addEnquiryFormDetails(EnquiryFormHibernate ceh) {

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

			session.save(ceh);
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

	// Get Client Enquiry List
	public List getAllEnquiryFormListDateWise(String startDate, String endDate) {

		HibernateUtility hbu = null;
		Session session = null;
		List<EnquiryFormHibernate> empList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"SELECT prsn_name, date_of_enquiry, contact_number,business_name, business_address, email_id, enqrd_for, description FROM enquiry_form_details WHERE date_of_enquiry BETWEEN '"
							+ startDate + "' AND '" + endDate + "'");

			List<Object[]> list = query.list();
			System.out.println("list Size:" + list);

			empList = new ArrayList<EnquiryFormHibernate>(0);

			int i = 0;
			for (Object[] object : list) {

				System.out.println("Result- " + Arrays.toString(object));

				i++;
				EnquiryFormHibernate reports = new EnquiryFormHibernate();

				reports.setPrsnName(object[0].toString());
				reports.setEnquiryDate((Date) object[1]);
				reports.setContactNo(Long.parseLong(object[2].toString()));
				reports.setBusinessName(object[3].toString());
				reports.setBusinessAddress(object[4].toString());
				reports.setEmailId(object[5].toString());
				reports.setEnqrdFor(object[6].toString());
				reports.setDescription(object[7].toString());
				reports.setSrNo(i);

				empList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return empList;
	}
	
	public List getAllEnquiryFormList() {

		HibernateUtility hbu = null;
		Session session = null;
		List<EnquiryFormHibernate> empList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT prsn_name, date_of_enquiry, contact_number,business_name, business_address, email_id, enqrd_for, description FROM enquiry_form_details");
			List<Object[]> list = query.list();
			System.out.println("list Size:" + list);

			empList = new ArrayList<EnquiryFormHibernate>(0);

			int i = 0;
			for (Object[] object : list) {

				System.out.println("Result- " + Arrays.toString(object));

				i++;
				EnquiryFormHibernate reports = new EnquiryFormHibernate();

				reports.setPrsnName(object[0].toString());
				reports.setEnquiryDate((Date) object[1]);
				reports.setContactNo(Long.parseLong(object[2].toString()));
				reports.setBusinessName(object[3].toString());
				reports.setBusinessAddress(object[4].toString());
				reports.setEmailId(object[5].toString());
				reports.setEnqrdFor(object[6].toString());
				reports.setDescription(object[7].toString());
				reports.setSrNo(i);

				empList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return empList;
	}

	public List getAllEnquiryList() {
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("FROM EnquiryFormHibernate");
			list = query.list();

			System.out.println("Size in DAOAOAOAO  :  " + list.size());

		} catch (Exception e) {

		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

		return list;
	}

	public List<EnquiryFormHibernate> fetchPersonInfo(Long fkprsnid) {

		System.out.println("\nfkprsnid In dao-----------  " + fkprsnid);

		HibernateUtility hbu = null;
		Session session = null;

		List<EnquiryFormHibernate> venList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query2 = session.createSQLQuery(
					"select  prsn_name, date_of_enquiry, contact_number, business_name, business_address, email_id, enqrd_for, description, alternate_contact_no, pk_enquiry_form_id from enquiry_form_details where pk_enquiry_form_id='"
							+ fkprsnid + "' ");

			List<Object[]> list = query2.list();

			venList = new ArrayList<EnquiryFormHibernate>(0);

			for (Object[] o : list) {

				System.out.println("result - " + Arrays.toString(o));

				EnquiryFormHibernate bean = new EnquiryFormHibernate();

				bean.setPrsnName(o[0].toString());
				bean.setStrEnquiryDate(o[1].toString());
				bean.setContactNo(Long.parseLong(o[2].toString()));
				bean.setBusinessName(o[3].toString());
				bean.setBusinessAddress(o[4].toString());
				bean.setEmailId(o[5].toString());
				bean.setEnqrdFor(o[6].toString());
				bean.setDescription(o[7].toString());
				bean.setAlternativeContactNo(Long.parseLong(o[8].toString()));
				bean.setPkEnquiryFormId(Long.parseLong(o[9].toString()));

				venList.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return venList;

	}

}
