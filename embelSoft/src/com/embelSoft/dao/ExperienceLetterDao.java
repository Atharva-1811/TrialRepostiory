package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.ExperienceLetterBean;
import com.embelSoft.bean.GetEmployeeDetailsBean;
import com.embelSoft.hibernate.ExperienceLetterHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ExperienceLetterDao 
{
	public void experienceLetterDetails(ExperienceLetterHibernate edh)
	{
		System.out.println("In DAO");
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();	
		 System.out.println("got session ");
		 transaction = session.beginTransaction();
	
		 System.out.println("Tx started");
		 
		session.save(edh);
		transaction.commit();
		
		System.out.println("Successful");
		}
		
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				Log.error("Couldn't roll back tranaction",rbe);
			}	
		}finally{
		hbu.closeSession(session);
		}
		
	}
	
	public List getExperienceLetterList(){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<ExperienceLetterBean> expList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("select fk_emp_id, employee_name,designation, date_of_joining, date_of_leaving from experience_letter_details");
		List<Object[]> list = query.list();
		
		expList= new ArrayList<ExperienceLetterBean>(0);

		
	for (Object[] o : list) 
	{

		ExperienceLetterBean reports = new ExperienceLetterBean();
		reports.setFk_Emp_id(Long.parseLong(o[0].toString()));
		reports.setEmployeeName(o[1].toString());
		reports.setDesignation(o[2].toString());
		
		String d1 = o[3].toString();
		String[] edate = d1.split("-");
		String DateOfJoining = edate[2]+"-"+edate[1]+"-"+edate[0]; 
		reports.setDateOfJoining(DateOfJoining);
		
		String d2 = o[4].toString();
		String[] edate2 = d2.split("-");
		String DateOfLeaving = edate2[2]+"-"+edate2[1]+"-"+edate2[0];		
		reports.setDateOfLeaving(DateOfLeaving);
		
		expList.add(reports);
	
		
	
	
	}
	}catch(RuntimeException e){	
	
		}
		finally{
	
		hbu.closeSession(session);	
		}

	return expList;
	}


	


}
