package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.OfferLetterBean;
import com.embelSoft.hibernate.OfferLetterHibernate;
import com.embelSoft.utility.HibernateUtility;

public class OfferLetterDao {
	public void valOfferLetterDetails(OfferLetterHibernate bean) {

		System.out.println("IN DAO");
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");
		} catch (RuntimeException e) {

			try {
				transaction.rollback();
			} catch (RuntimeException e2) {

				Log.error("Error in regEmpPayment", e2);
			}
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

	}

	public List getEmployeeDetailas(Long employeeId)
	{
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT pk_empoyee_id, id_number, designation,salary,date_of_joining, place_of_posting, email_id FROM employee_details WHERE pk_empoyee_id =:employeeId");
			query.setParameter("employeeId", employeeId);
			list = query.list(); 
			 
			 
		}
		catch (Exception e) 
		{
			// TODO: handle exception
		}
	
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
		
		System.out.println("size in Dao------------------------"+list.size());
		return list;
	}

	// get All List of Offer Letter
	public List getOfferLetterList()
	{
		HibernateUtility hbu = null;
		Session session = null;
		List<OfferLetterBean> offerList = null;
		try 
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select employee_name, id_number, designation, salary, date_of_joining, place, email_id, description1, description2 from offer_letter_details");
			List<Object[]> list = query.list(); 
			
			
			offerList = new ArrayList<OfferLetterBean>(0);
			
			for(Object[] o : list)
			{
				OfferLetterBean report = new OfferLetterBean();
				
				report.setEmployeeName(o[0].toString());
				report.setIdNumber(o[1].toString());
				report.setDesignation(o[2].toString());
				report.setSalary(Double.parseDouble(o[3].toString()));
				
				
				String d1 = o[4].toString();
				String[] edate = d1.split("-");
				String DateOfJoining = edate[2]+"-"+edate[1]+"-"+edate[0]; 
				report.setDateOfJoining(DateOfJoining);

				report.setPlaceOfposting(o[5].toString());
				report.setEmail(o[6].toString());
				report.setDescription1(o[7].toString());
				report.setDescription2(o[8].toString());
				
				offerList.add(report);
			}
			
		}		
			catch (Exception e) {
				// TODO: handle exception
			}

	
		
		return offerList;
		
	}
	
	
  

}
