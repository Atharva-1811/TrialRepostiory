package com.embelSoft.helper;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.GetEmployeeDetailsBean;
import com.embelSoft.dao.EmployeeDetailsDao;
import com.embelSoft.hibernate.EmployeeDetailsHibernate;
import com.embelSoft.hibernate.EmployeeLeaveHibernate;
//import com.embelSoft.quartz.Mailer;
import com.embelSoft.utility.HibernateUtility;

public class EmployeeDetailsHelper 
{
	public void doEmpDetails(HttpServletRequest request,HttpServletResponse response) 
	{
		// TODO Auto-generated method stub
		System.out.println("In helper");
		
		HttpSession session3 = request.getSession();
		

		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String dob = request.getParameter("dob");
		String idNumber = request.getParameter("idNumber");
		String designation = request.getParameter("designation");
		String contactNo = request.getParameter("contactNo");
		String altContactNo = request.getParameter("altContactNo");
		String adharNumber = request.getParameter("adharNumber");
		String panNumber = request.getParameter("panNumber");				
		String emailId = request.getParameter("emailId");
		//String address = request.getParameter("address");
		String education = request.getParameter("education");
		String technology = request.getParameter("technology");
		String previousExperience = request.getParameter("previousExperience");
		String salary = request.getParameter("salary");
		String referenceBy = request.getParameter("referenceBy");
		String interviewedBy = request.getParameter("interviewedBy");
		String dateOfJoining = request.getParameter("dateOfJoining");
		String department = request.getParameter("department");
		String prevCompanyName = request.getParameter("prevCompanyName");
		String zipCode = request.getParameter("zipCode");
		String confirmEmail = request.getParameter("confirmEmail");
		String comment = request.getParameter("comment");
		String employeeCondition = request.getParameter("employeecondition");
		String placeofposting = request.getParameter("placeofposting");
		String university = request.getParameter("university");
		
		String description1 = request.getParameter("description1");
		String description2 = request.getParameter("description2");
		
		String currentAddress = request.getParameter("currentAddress");
		String permanentAddress = request.getParameter("permanentAddress");
		
		String empFullName = firstName+" "+lastName;
		
		EmployeeDetailsHibernate edh = new EmployeeDetailsHibernate();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date dateOfBirth = null;
		try{
			dateOfBirth = format.parse(dob);
			edh.setDob(dateOfBirth);
			System.out.println(" date dateOfBirth parsing" +dob);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		Date joiningDate = null;
		try{
			joiningDate = format.parse(dateOfJoining);
			edh.setDateOfJoining(joiningDate);
			System.out.println(" date dateOfBirth parsing" +dateOfJoining);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
/*		Date leavingDate = null;
		try{
			leavingDate = format.parse(dateOfLiving);
			edh.setDateOfLiving(leavingDate);
			System.out.println(" date dateOfBirth parsing" +dateOfLiving);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}*/
		
		// validate fields 
		
				edh.setFirstName(firstName);
				edh.setLastName(lastName);
				edh.setDesignation(designation);
				edh.setContactNo(Long.parseLong(contactNo));
				edh.setEmailId(emailId);
				//edh.setAddress(address);
				edh.setEducation(education);
				edh.setSalary(Double.parseDouble(salary));
				edh.setZipCode(Long.parseLong(zipCode));
				

				edh.setStatus("Active");
				
				
				if(!"".equals(adharNumber)){
					edh.setAdharNumber(Long.parseLong(adharNumber));
					
				}else{
					edh.setAdharNumber(Long.parseLong("00"));
				}
				
				if(!"".equals(panNumber)){
					edh.setPanNumber(panNumber);
					
				}else{
					edh.setPanNumber("N/A");
				}

				if(!"".equals(university)){
					edh.setUniversity(university);
					
				}else{
					edh.setUniversity("N/A");
				}				
				
				if(!"".equals(placeofposting)){
					edh.setPlaceOfPosting(placeofposting);
					
				}else{
					edh.setPlaceOfPosting("N/A");
				}				
				
				if(!"".equals(technology)){
					edh.setTechnology(technology);
					
				}else{
					edh.setTechnology("N/A");
				}
								
				if(!"".equals(middleName)){
					edh.setMiddleName(middleName);
					
				}else{
					edh.setMiddleName("N/A");
				}				
				
				if(!"".equals(idNumber)){
                    edh.setIdNumber(idNumber);
                    
				}else{
                    edh.setIdNumber("N/A");
				}
								
				if(!"".equals(altContactNo)){
					edh.setAltContactNo(altContactNo);
					
				}else{
					edh.setAltContactNo("N/A");					
				}
				
				if(!"".equals(previousExperience)){
					edh.setPreviousExperience(previousExperience);
					
				}else{
					edh.setPreviousExperience("N/A");
				}				
				
				if(!"".equals(referenceBy)){
					edh.setReferenceBy(referenceBy);
					
				}else{
					edh.setReferenceBy("N/A");
				}
												
				if(!"".equals(interviewedBy)){
					edh.setInterviewedBy(interviewedBy);
					
				}else{
					edh.setInterviewedBy("N/A");
					
				}								
				
				if(!"".equals(prevCompanyName)){
					edh.setPrevCompanyName(prevCompanyName);					
				}else{
					edh.setPrevCompanyName("N/A");					
				}
				
				if(!"".equals(confirmEmail)){
					edh.setConfirmEmail(confirmEmail);
					
				}else{
					edh.setConfirmEmail("N/A");
				}
				
				if(!"".equals(comment)){
					edh.setComment(comment);
					
				}else{
					edh.setComment("N/A");
				}
				
				if(!"".equals(employeeCondition)){
					edh.setEmployeeCondition(employeeCondition);
				
				}else{
					edh.setEmployeeCondition("N/A");
				}
				
				if(!"".equals(department)){
					edh.setDepartment(department);
					
				}else{
					edh.setDepartment("N/A");
				}
				
				if(!"".equals(currentAddress)){
					edh.setCurrentAddress(currentAddress);
					
				}else{
					edh.setCurrentAddress("N/A");
				}
							
				if(!"".equals(permanentAddress)){
					edh.setPermanentAddress(permanentAddress);
					
				}else{
					edh.setPermanentAddress("N/A");
				}				
				
		/*		
				
				edh.setIdNumber(idNumber);
				edh.setAltContactNo(Long.parseLong(altContactNo));
				edh.setPreviousExperience(previousExperience);
				edh.setReferenceBy(referenceBy);
				edh.setInterviewedBy(interviewedBy);
				edh.setPrevCompanyName(prevCompanyName);
				edh.setConfirmEmail(confirmEmail);
				edh.setComment(comment);
				edh.setEmployeeCondition(employeeCondition);
				edh.setDepartment(department);
				
	*/			
				
				session3.setAttribute("employeeName", empFullName);
				session3.setAttribute("idNumber", idNumber);
				session3.setAttribute("designation", designation);
				session3.setAttribute("salary", salary);
				session3.setAttribute("dateOfJoining", dateOfJoining);
				session3.setAttribute("emailId", emailId);
				session3.setAttribute("place", placeofposting);
				session3.setAttribute("description1", description1);
				session3.setAttribute("description2", description2);
				session3.setAttribute("emailId", emailId);
				session3.setAttribute("placeofposting", placeofposting);

				//com.embelSoft.quartz.Mailer  m1=new com.embelSoft.quartz.Mailer();
				//Mailer m1 = new Mailer();
				//m1.sendDayClosureFile("idealaadarsh1@gmail.com");
				System.out.println("Mail Done------");
				System.out.println("Mail Send successfully");
				//out.println("thank you!!, Your are successfully logged out!!");
				//HttpSession session=request.getSession(false);  
				//response.sendRedirect("/embelSoft/jsp/login.jsp");
				//session.setAttribute("user", null);
				//session.removeAttribute("user");
				
				EmployeeDetailsDao edo = new EmployeeDetailsDao();
				edo.valEmployeeDetails(edh);
				
	}
	
	
	//get previous employee details report
	public List getEmpDetail(HttpServletRequest request, HttpServletResponse response)
	{
		String fkEmployeeid = request.getParameter("fkEmployeeid");
		String employeeName = request.getParameter("employeeName");
		
		Map<Long, GetEmployeeDetailsBean> map = new HashMap<Long, GetEmployeeDetailsBean>();

		EmployeeDetailsDao dao = new EmployeeDetailsDao();
		List<GetEmployeeDetailsBean> exp1List = dao.getEmployeeDetail(fkEmployeeid,employeeName);

		return exp1List;

	}
	
	//employee Detailas for edit
	public List getEmployeeDetails(Long fkEmployeeid)
	{
		
		Map<Long, GetEmployeeDetailsBean> map = new HashMap<Long, GetEmployeeDetailsBean>();

		EmployeeDetailsDao dao = new EmployeeDetailsDao();
		List<GetEmployeeDetailsBean> exp1List = dao.getEmployeeDetailForEdit(fkEmployeeid);
		
		return exp1List;

	}
	
	
	public void updateEmployeeDetails(HttpServletRequest request,HttpServletResponse response)
	{
		String empId = request.getParameter("fkEmployeeid");

		String employeeNameFullName = request.getParameter("employeeNameFullName");
		
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String dob = request.getParameter("dob");
		String contactNo = request.getParameter("contactNo");
		String altContactNo = request.getParameter("altContactNo");
		String emailId = request.getParameter("emailId");
		String confirmEmail = request.getParameter("confirmEmail");
		String currentAddress = request.getParameter("currentAddress");
		String permanentAddress = request.getParameter("permanentAddress");
		String zipCode = request.getParameter("zipCode");
		String adharNumber = request.getParameter("adharNumber");
		String panNumber = request.getParameter("panNumber");				
		String education = request.getParameter("education");
		String technology = request.getParameter("technology");
		String university = request.getParameter("university");
		String idNumber = request.getParameter("idNumber");
		String designation = request.getParameter("designation");
		String previousExperience = request.getParameter("previousExperience");
		String salary = request.getParameter("salary");
		String referenceBy = request.getParameter("referenceBy");
		String interviewedBy = request.getParameter("interviewedBy");
		String dateOfJoining = request.getParameter("dateOfJoining");
		String department = request.getParameter("department");
		String prevCompanyName = request.getParameter("prevCompanyName");
		String comment = request.getParameter("comment");
		String employeeCondition = request.getParameter("employeecondition");
		String placeofposting = request.getParameter("placeofposting");
		
		EmployeeDetailsDao dao  =new EmployeeDetailsDao();
		List list22 = dao.getAllEmployee();
			
		for(int i=0;i<list22.size();i++)
		{
			 EmployeeDetailsHibernate edh = (EmployeeDetailsHibernate) list22.get(i);
			 
			 Long empPkId = edh.getPkEmpId();
			 String fName = edh.getFirstName();
			 String lName = edh.getLastName();		 
		
			 String empFullName = fName+" "+lName;
	
			 if(empFullName.equals(employeeNameFullName) && empPkId.equals(Long.parseLong(empId)))
			 {
				 HibernateUtility hbu = HibernateUtility.getInstance();
				Session session = hbu.getHibernateSession();
				Transaction transaction = session.beginTransaction();
									
				EmployeeDetailsHibernate purchase = (EmployeeDetailsHibernate) session.get(EmployeeDetailsHibernate.class,new Long(empPkId));
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				
				Date dateOfBirth = null;
				try{
					dateOfBirth = format.parse(dob);
					purchase.setDob(dateOfBirth);
					System.out.println(" date dateOfBirth parsing" +dob);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				
				Date joiningDate = null;
				try{
					joiningDate = format.parse(dateOfJoining);
					purchase.setDateOfJoining(joiningDate);
					System.out.println(" date dateOfBirth parsing" +dateOfJoining);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				
				purchase.setFirstName(firstName);
				purchase.setLastName(lastName);
				purchase.setDesignation(designation);
				purchase.setContactNo(Long.parseLong(contactNo));
				purchase.setAdharNumber(Long.parseLong(adharNumber));
				purchase.setPanNumber(panNumber);
				purchase.setEmailId(emailId);
				purchase.setCurrentAddress(currentAddress);
				purchase.setPermanentAddress(permanentAddress);
				purchase.setEducation(education);
				purchase.setTechnology(technology);
				purchase.setSalary(Double.parseDouble(salary));
				purchase.setZipCode(Long.parseLong(zipCode));
				purchase.setPlaceOfPosting(placeofposting);
				purchase.setUniversity(university);
				purchase.setSalary(Double.parseDouble(salary));
				
				if(!"".equals(middleName)){
					purchase.setMiddleName(middleName);
				}else{
					purchase.setMiddleName("N/A");
				}
				
				if(!"".equals(idNumber)){
					purchase.setIdNumber(idNumber);
				}else{
					purchase.setIdNumber("N/A");
				}
				
				if(!"".equals(altContactNo)){
					purchase.setAltContactNo(altContactNo);
				}else{
					purchase.setAltContactNo("N/A");
				}
				
				if(!"".equals(previousExperience)){
					purchase.setPreviousExperience(previousExperience);
				}else{
					purchase.setPreviousExperience("N/A");
				}
				
				if(!"".equals(referenceBy)){
					purchase.setReferenceBy(referenceBy);
				}else{
					purchase.setReferenceBy("N/A");
				}
				
				if(!"".equals(interviewedBy)){
					purchase.setInterviewedBy(interviewedBy);
				}else{
					purchase.setInterviewedBy("N/A");
				}
					
				if(!"".equals(prevCompanyName)){
					purchase.setPrevCompanyName(prevCompanyName);
				}else{
					purchase.setPrevCompanyName("N/A");
				}
				
				if(!"".equals(confirmEmail)){
					purchase.setConfirmEmail(confirmEmail);
				}else{
					purchase.setConfirmEmail("N/A");
				}
				
				if(!"".equals(comment)){
					purchase.setComment(comment);
				}else{
					purchase.setComment("N/A");
				}
				
				if(!"".equals(employeeCondition)){
					purchase.setEmployeeCondition(employeeCondition);
				}else{
					purchase.setEmployeeCondition("N/A");
				}
				
				if(!"".equals(department)){
					purchase.setDepartment(department);
				}else{
					purchase.setDepartment("N/A");
				}
				
				session.update(purchase);
				transaction.commit();
				
				break;
			}		 
		 }
	}
	
	
	// Previous Employee Details For Reports
	public List getExEmpDetail(HttpServletRequest request, HttpServletResponse response)
	{
		String fkEmployeeid = request.getParameter("fkEmployeeid");
		String employeeName = request.getParameter("employeeName");
		Map<Long, GetEmployeeDetailsBean> map = new HashMap<Long, GetEmployeeDetailsBean>();

		EmployeeDetailsDao dao = new EmployeeDetailsDao();
		List<GetEmployeeDetailsBean> exp1List = dao.getExEmployeeDetail(fkEmployeeid,employeeName);

		return exp1List;

	}
	
	
	public void doEmpDetailLeaveDetails(HttpServletRequest request,HttpServletResponse response) 
	{
		
		String fkEmployeeid = request.getParameter("fkEmployeeid");
		String employeeName = request.getParameter("employeeName");
		String leaveDateFrom = request.getParameter("leaveDateFrom");
		String type = request.getParameter("type");
		String leaveDateTo = request.getParameter("leaveDateTo");
		String description = request.getParameter("description");
		String approvedBy = request.getParameter("approvedBy");
		
	/*	System.out.println("-----------------fkEmployeeid-------------------  :::  "+fkEmployeeid);
		System.out.println("----------------employeeName--------------------  :::  "+employeeName);
		System.out.println("------------------leaveDateFrom------------------  :::  "+leaveDateFrom);
		System.out.println("-----------------type-------------------  :::  "+type);
		System.out.println("-----------------leaveDateTo-------------------  :::  "+leaveDateTo);
		System.out.println("------------------description------------------  :::  "+description);
		System.out.println("-----------------approvedBy-------------------  :::  "+approvedBy);
	*/	
		EmployeeLeaveHibernate elh = new EmployeeLeaveHibernate();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date leaveFrom = null;
		try{
			leaveFrom = format.parse(leaveDateFrom);
			elh.setLeaveDateFrom(leaveFrom);
			System.out.println(" date leaveFrom parsing" +leaveFrom);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		
		
		
		Date leaveTo = null;
		try{
			leaveTo = format.parse(leaveDateTo);
			elh.setLeaveDateTo(leaveTo);
			System.out.println(" date leaveTo parsing" +leaveTo);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		
		
		elh.setEmpFkId(Long.parseLong(fkEmployeeid));;
		elh.setEmpName(employeeName);
		elh.setType(type);
		
	
		if(!"".equals(description)){
			elh.setDescription(description);
			
		}else{
			elh.setDescription("N/A");
		}

		
		if(!"".equals(approvedBy)){
			elh.setApprovedBy(approvedBy);
			
		}else{
			elh.setApprovedBy("N/A");
		}

		EmployeeDetailsDao edo = new EmployeeDetailsDao();
		edo.employeeLaveDetails(elh);
		
		
		
		
	}
	

}
