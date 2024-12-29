package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.EmployeeLeaveBean;
import com.embelSoft.bean.EmployeePaymentDetailBean;
import com.embelSoft.bean.GetEmployeeDetailsBean;
import com.embelSoft.hibernate.EmployeeDetailsHibernate;
import com.embelSoft.hibernate.EmployeeLeaveHibernate;
import com.embelSoft.utility.HibernateUtility;


public class EmployeeDetailsDao {
	
	public void valEmployeeDetails(EmployeeDetailsHibernate edh)
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
	

	public List getAllMainEmployee()
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from EmployeeDetailsHibernate where status='Active'");
		 list = query.list();
		}catch(Exception e){	
			Log.error("Error in getAllMainEmployee",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return list;
	}
	
	// get employee name list for payment report
	public List getAllMainEmployeeForPaymentReport()
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from EmployeePaymentBeanHibernate"); // group by employeeName
		 list = query.list();
		}catch(Exception e){	
			Log.error("Error in getAllMainEmployee",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return list;
	}
	
	public List<EmployeePaymentDetailBean> getAllMainEmployeeForPayment()
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		
		List<EmployeePaymentDetailBean> empList= new ArrayList<EmployeePaymentDetailBean>();
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT DISTINCT fk_employee_id,employee_name FROM employee_payment;"); // group by employeeName
		 List<Object[]> list = query.list();
		
		 for (Object[] objects : list) {
			 EmployeePaymentDetailBean bean = new EmployeePaymentDetailBean();
			 bean.setFkEmployeeId(Long.parseLong(objects[0].toString()));
			 bean.setEmployeeName(objects[1].toString());
			 empList.add(bean);
		}
		 
		}catch(Exception e){	
			Log.error("Error in getAllMainEmployee",e);
		}
		finally{
			if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return empList;
	}
	
	
public List getEmployeeList(){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<GetEmployeeDetailsBean> empList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT first_name,middle_name,last_name,date_of_birth,id_number,designation,contact_number,alternate_contact_number,email_id,current_address,education,technology,previous_experience,salary,reference_by,interviewed_by,date_of_joining,prev_company_name,pin_code,confirmation_email,comment,employee_condition,adhar_number,pan_number,department,permanent_address FROM employee_details WHERE status='Active'");
		List<Object[]> list = query.list();
		
		empList= new ArrayList<GetEmployeeDetailsBean>(0);

	int i=0;	
	for (Object[] o : list) 
	{
		i++;
		GetEmployeeDetailsBean reports = new GetEmployeeDetailsBean();

		
		reports.setFirstName(o[0].toString());
		reports.setMiddleName(o[1].toString());
		reports.setLastName(o[2].toString());
	
		String d =  o[3].toString();
		String[] dob = d.split("-");
		String dateOfBirth = dob[2]+"-"+dob[1]+"-"+dob[0]; 
		reports.setDob(dateOfBirth);
		
		reports.setIdNumber(o[4].toString());
		reports.setDesignation(o[5].toString());
		reports.setContactNo(Long.parseLong(o[6].toString()));
		reports.setAltContactNo(o[7].toString());
		reports.setEmailId(o[8].toString());
		reports.setCurrentAddress(o[9].toString());
		reports.setEducation(o[10].toString());
		reports.setTechnology(o[11].toString());
		reports.setPreviousExperience(o[12].toString());
		reports.setSalary(Double.parseDouble(o[13].toString()));
		reports.setReferenceBy(o[14].toString());
		reports.setInterviewedBy(o[15].toString());
		
		String d2 =  o[16].toString();
		String[] doj = d2.split("-");
		String dateOfJoining = doj[2]+"-"+doj[1]+"-"+doj[0]; 
		reports.setDateOfJoining(dateOfJoining);
		
		reports.setPrevCompanyName(o[17].toString());
		reports.setZipCode(Long.parseLong(o[18].toString()));
		reports.setConfirmEmail(o[19].toString());
		reports.setComment(o[20].toString());
		reports.setEmployeeCondition(o[21].toString());
		reports.setAdharNo(Long.parseLong(o[22].toString()));
		reports.setPanNumber(o[23].toString());
		reports.setDepartment(o[24].toString());
		reports.setPermenentAddress(o[25].toString());
		
		System.out.println("From Dao Permenent Address : "+o[25]);
		System.out.println("From Dao reports.getPermenentAddress() Permenent Address : "+reports.getPermenentAddress());
	
		reports.setSrNo(i);
		
		empList.add(reports);
	
		
	
	
	}
	}catch(RuntimeException e){	
	
		}
		finally{
	
		hbu.closeSession(session);	
		}
	return empList;
	}


		public List<GetEmployeeDetailsBean> getEmployeeDetail(String fkEmployeeid,String employeeName) 
		{
		
			HibernateUtility hbu = null;
			Session session = null;
			List<GetEmployeeDetailsBean> expenseList = null;
		
			try 
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query2 = session.createSQLQuery("SELECT first_name,middle_name,last_name,date_of_birth,id_number,designation,contact_number,alternate_contact_number,email_id,current_address,education,technology,previous_experience,salary,reference_by,interviewed_by,date_of_joining,prev_company_name,pin_code,confirmation_email,comment,employee_condition,adhar_number,pan_number,department FROM employee_details WHERE concat (first_name,' ',last_name) ='"+employeeName+"' AND pk_empoyee_id='"+fkEmployeeid+"' and status='Active'");
				List<Object[]> list = query2.list();
				expenseList = new ArrayList<GetEmployeeDetailsBean>(0);
		
				for (Object[] object : list) {
		
					GetEmployeeDetailsBean reports = new GetEmployeeDetailsBean();
		
					reports.setFirstName(object[0].toString());
					reports.setMiddleName(object[1].toString());
					reports.setLastName(object[2].toString());
					
					String d1 = object[3].toString();
					String[] edate = d1.split("-");
					String Dob = edate[2]+"-"+edate[1]+"-"+edate[0]; 
					reports.setDob(Dob);
					
					
					reports.setIdNumber(object[4].toString());
					reports.setDesignation(object[5].toString());
					reports.setContactNo(Long.parseLong(object[6].toString()));
					reports.setAltContactNo(object[7].toString());
					reports.setEmailId(object[8].toString());
					reports.setCurrentAddress(object[9].toString());
					reports.setEducation(object[10].toString());
					reports.setTechnology(object[11].toString());
					reports.setPreviousExperience(object[12].toString());
					reports.setSalary(Double.parseDouble(object[13].toString()));
					reports.setReferenceBy(object[14].toString());
					reports.setInterviewedBy(object[15].toString());
					
					String d2 = object[16].toString();
					String[] edate2 = d2.split("-");
					String DateOfJoining = edate2[2]+"-"+edate2[1]+"-"+edate2[0]; 
					reports.setDateOfJoining(DateOfJoining);
					
					
					reports.setPrevCompanyName(object[17].toString());
					reports.setZipCode(Long.parseLong(object[18].toString()));
					reports.setConfirmEmail(object[19].toString());
					reports.setComment(object[20].toString());
					reports.setEmployeeCondition(object[21].toString());
					reports.setAdharNo(Long.parseLong(object[22].toString()));
					reports.setPanNumber(object[23].toString());
					reports.setDepartment(object[24].toString());
		
					expenseList.add(reports);
		
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return expenseList;
		
		}


		public List getAllEmployee(){
			
			HibernateUtility hbu=null;
			Session session=null;
			List empList=null;
		try{	
		
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
		
			Query query=session.createQuery("From EmployeeDetailsHibernate");
			empList = query.list();
	
			}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
		
		return empList;
		}



		
// get Employee Details for edit
public List<GetEmployeeDetailsBean> getEmployeeDetailForEdit(Long fkEmployeeid) 
{

	System.out.println(fkEmployeeid + "    -----------   fkid In dao");
	//System.out.println(employeeName + "     --------   Name In dao");
	HibernateUtility hbu = null;
	Session session = null;
	
	List<GetEmployeeDetailsBean> expenseList = null;
	try {
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		//System.out.println("Name "+employeeName);
		Query query2 = session.createSQLQuery("SELECT first_name,middle_name,last_name,date_of_birth,contact_number, alternate_contact_number, email_id, confirmation_email, current_address, permanent_address, pin_code, adhar_number, pan_number, education, technology, university, id_number, designation, department, date_of_joining, previous_experience, prev_company_name, reference_by, interviewed_by, salary, place_of_posting, comment, employee_condition FROM employee_details WHERE status='Active' and pk_empoyee_id = :fkEmployeeid ");
		query2.setParameter("fkEmployeeid", fkEmployeeid);
		//query2.setParameter("employeeName", employeeName);
		
		List<Object[]> list = query2.list();
		expenseList = new ArrayList<GetEmployeeDetailsBean>(0);
		
		for (Object[] object : list) 
		{

			GetEmployeeDetailsBean reports = new GetEmployeeDetailsBean();

			reports.setFirstName(object[0].toString());
			reports.setMiddleName(object[1].toString());
			reports.setLastName(object[2].toString());
			reports.setDob(object[3].toString());
			reports.setContactNo(Long.parseLong(object[4].toString()));
			reports.setAltContactNo(object[5].toString());
			reports.setEmailId(object[6].toString());
			reports.setConfirmEmail(object[7].toString());
			reports.setCurrentAddress(object[8].toString());
			reports.setPermenentAddress(object[9].toString());
			reports.setZipCode(Long.parseLong(object[10].toString()));
			reports.setAdharNo(Long.parseLong(object[11].toString()));
			reports.setPanNumber(object[12].toString());
			reports.setEducation(object[13].toString());
			reports.setTechnology(object[14].toString());
			reports.setUniversity(object[15].toString());
			reports.setIdNumber(object[16].toString());
			reports.setDesignation(object[17].toString());
			reports.setDepartment(object[18].toString());	
			reports.setDateOfJoining(object[19].toString());
			reports.setPreviousExperience(object[20].toString());
			reports.setPrevCompanyName(object[21].toString());
			reports.setReferenceBy(object[22].toString());
			reports.setInterviewedBy(object[23].toString());
			reports.setSalary(Double.parseDouble(object[24].toString()));
			reports.setPlaceOfPosting(object[25].toString());
			reports.setComment(object[26].toString());
			reports.setEmployeeCondition(object[27].toString());
			
			expenseList.add(reports);

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return expenseList;

}
	// Ex Employee Names
		public List getAllpreviousEmployee()
		{
			
			HibernateUtility hbu=null;
			Session session=null;
			
			List list=null;
			try{
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 Query query = session.createQuery("from EmployeeDetailsHibernate where status='DeActive'");
			 list = query.list();
			}catch(Exception e){	
				Log.error("Error in getAllMainEmployee",e);
			}
			finally{
				if(session!=null){
				hbu.closeSession(session);	
			}
			}
			return list;
		}

		
			// Previous Employee Details
			public List<GetEmployeeDetailsBean> getExEmployeeDetail(String fkEmployeeid,String employeeName) 
			{
			
				HibernateUtility hbu = null;
				Session session = null;
				List<GetEmployeeDetailsBean> expenseList = null;
				try {
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					Query query2 = session.createSQLQuery("SELECT ed.first_name, ed.middle_name, ed.last_name, ed.date_of_birth, ed.id_number, ed.designation, ed.contact_number, ed.alternate_contact_number, ed.email_id, ed.current_address, ed.education, ed.technology, ed.previous_experience, ed.salary, ed.reference_by, ed.interviewed_by, ed.date_of_joining, ed.prev_company_name, ed.pin_code, ed.confirmation_email, ed.comment, ed.employee_condition, ed.adhar_number, ed.pan_number, ed.department, eld.date_of_leaving FROM employee_details ed LEFT JOIN experience_letter_details eld ON ed.pk_empoyee_id = eld.fk_emp_id WHERE concat (first_name,' ',last_name) ='"+employeeName+"' AND pk_empoyee_id='"+fkEmployeeid+"' and status='DeActive'");
					List<Object[]> list = query2.list();
					expenseList = new ArrayList<GetEmployeeDetailsBean>(0);
			
					for (Object[] object : list) 
					{
			
						GetEmployeeDetailsBean reports = new GetEmployeeDetailsBean();
			
						reports.setFirstName(object[0].toString());
						reports.setMiddleName(object[1].toString());
						reports.setLastName(object[2].toString());
						
						String d1 = object[3].toString();
						String[] edate = d1.split("-");
						String Dob = edate[2]+"-"+edate[1]+"-"+edate[0]; 
						reports.setDob(Dob);
						
						
						reports.setIdNumber(object[4].toString());
						reports.setDesignation(object[5].toString());
						reports.setContactNo(Long.parseLong(object[6].toString()));
						reports.setAltContactNo(object[7].toString());
						reports.setEmailId(object[8].toString());
						reports.setAddress(object[9].toString());
						reports.setEducation(object[10].toString());
						reports.setTechnology(object[11].toString());
						reports.setPreviousExperience(object[12].toString());
						reports.setSalary(Double.parseDouble(object[13].toString()));
						reports.setReferenceBy(object[14].toString());
						reports.setInterviewedBy(object[15].toString());
						
						String d2 = object[16].toString();
						String[] edate2 = d2.split("-");
						String DateOfJoining = edate2[2]+"-"+edate2[1]+"-"+edate2[0]; 
						reports.setDateOfJoining(DateOfJoining);
						
						
						reports.setPrevCompanyName(object[17].toString());
						reports.setZipCode(Long.parseLong(object[18].toString()));
						reports.setConfirmEmail(object[19].toString());
						reports.setComment(object[20].toString());
						reports.setEmployeeCondition(object[21].toString());
						reports.setAdharNo(Long.parseLong(object[22].toString()));
						reports.setPanNumber(object[23].toString());
						reports.setDepartment(object[24].toString());
						
						String d3 = object[25].toString();
						String[] edate3 = d3.split("-");
						String DateOfLeaving = edate3[2]+"-"+edate3[1]+"-"+edate3[0]; 
						reports.setDateOfLiving(DateOfLeaving);
			
						expenseList.add(reports);
			
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return expenseList;
			
			}

		// Employee Leave Details
		public void employeeLaveDetails(EmployeeLeaveHibernate eld)
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
			 
			session.save(eld);
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
		
		
		// List of Employee Leave
		public List getEmployeeLeaveList(){
			
			HibernateUtility hbu=null;
			Session session=null;
			List<EmployeeLeaveBean> empList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("select employee_name, leave_date_from, leave_date_to, type, description, approved_by from employee_leave_details");
			List<Object[]> list = query.list();
			
			System.out.println("list Size:======================= ---------   ::   "+list.size());


			empList= new ArrayList<EmployeeLeaveBean>(0);

			
		for (Object[] o : list) 
		{

			EmployeeLeaveBean reports = new EmployeeLeaveBean();

			
			reports.setEmployeeName(o[0].toString());;
		
			String d = o[1].toString();
			String[] fromD = d.split("-");
			String fromDate = fromD[2]+"-"+fromD[1]+"-"+fromD[0];
			reports.setLeaveDateFrom(fromDate);
			
			String d2 = o[2].toString();
			String[] toD = d2.split("-");
			String toDate = toD[2]+"-"+toD[1]+"-"+toD[0];
			reports.setLeaveDateTo(toDate);
			
			reports.setType(o[3].toString());
			reports.setDescription(o[4].toString());
			reports.setApprovedBy(o[5].toString());
			
			
			empList.add(reports);
		
			
		
		
		}
		}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
			System.out.println("list Size:======================= LAST   ::   "+empList.size());
		return empList;
		}

		
		// Employee Name For Leave Report
		public List getAllMainLeaveEmployee()
		{
			
			HibernateUtility hbu=null;
			Session session=null;
			
			List list=null;
			try{
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 Query query = session.createQuery("from EmployeeLeaveHibernate");
			 list = query.list();
			}catch(Exception e){	
				Log.error("Error in getAllMainEmployee",e);
			}
			finally{
				if(session!=null){
				hbu.closeSession(session);	
			}
			}
			return list;
		}

		
		// List of Employee Leave
		public List getEmployeeLeaveListByName(String empId, String empName)
		{
			
			HibernateUtility hbu=null;
			Session session=null;
			List<EmployeeLeaveBean> empList=null;
		try{	

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query=session.createSQLQuery("select employee_name, leave_date_from, leave_date_to, type, description, approved_by FROM employee_leave_details WHERE empLeavePkId = '"+empId+"' AND employee_name='"+empName+"'");
			List<Object[]> list = query.list();
			
			System.out.println("list Size:======================= ---------   ::   "+list.size());


			empList= new ArrayList<EmployeeLeaveBean>(0);

			
		for (Object[] o : list) 
		{

			EmployeeLeaveBean reports = new EmployeeLeaveBean();

			
			reports.setEmployeeName(o[0].toString());;
		
			String d = o[1].toString();
			String[] fromD = d.split("-");
			String fromDate = fromD[2]+"-"+fromD[1]+"-"+fromD[0];
			reports.setLeaveDateFrom(fromDate);
			
			String d2 = o[2].toString();
			String[] toD = d2.split("-");
			String toDate = toD[2]+"-"+toD[1]+"-"+toD[0];
			reports.setLeaveDateTo(toDate);
			
			reports.setType(o[3].toString());
			reports.setDescription(o[4].toString());
			reports.setApprovedBy(o[5].toString());
			
			
			empList.add(reports);
		
			
		
		
		}
		}catch(RuntimeException e){	
		
			}
			finally{
		
			hbu.closeSession(session);	
			}
			System.out.println("list Size:======================= LAST   ::   "+empList.size());
		return empList;
		}

		
		
		
		

}