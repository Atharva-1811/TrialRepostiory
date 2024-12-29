package com.embelSoft.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.embelSoft.bean.OfferLetterBean;
import com.embelSoft.dao.OfferLetterDao;
import com.embelSoft.hibernate.OfferLetterHibernate;

public class OfferLetterHelper {
	public void doOfferLetterDetails(HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
System.out.println("In helper");
		
		HttpSession session3 = request.getSession();
		
		String employeeName = request.getParameter("employeeName");
		//String fk_employee_id = request.getParameter("fk_employee_id");
		String idNumber = request.getParameter("idNumber");
		String designation = request.getParameter("designation");
		String salary = request.getParameter("salary");
		String dateOfJoining = request.getParameter("dateOfJoining");
		String emailId = request.getParameter("emailId");
		String place = request.getParameter("place");
		String description1 = request.getParameter("description1");
		String description2 = request.getParameter("description2");
		
		OfferLetterHibernate olh = new OfferLetterHibernate();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date joiningDate = null;
		try{
			joiningDate = format.parse(dateOfJoining);
			olh.setDateOfJoining(joiningDate);
			System.out.println(" date dateOfBirth parsing" +dateOfJoining);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		olh.setDescription1(description1);
		olh.setDescription2(description2);
		
		olh.setEmployeeName(employeeName);
		olh.setIdNumber(idNumber);
		olh.setDesignation(designation);
		olh.setSalary(Double.parseDouble(salary));
		olh.setPlace(place);
		olh.setEmailId(emailId);
		
		
		session3.setAttribute("employeeName", employeeName);
		session3.setAttribute("idNumber", idNumber);
		session3.setAttribute("designation", designation);
		session3.setAttribute("salary", salary);
		session3.setAttribute("dateOfJoining", dateOfJoining);
		session3.setAttribute("emailId", emailId);
		session3.setAttribute("place", place);
		session3.setAttribute("description1", description1);
		session3.setAttribute("description2", description2);
		
		
		OfferLetterDao odo = new OfferLetterDao();
		odo.valOfferLetterDetails(olh);
		
}
	// get Employee Detailas For Offer Letter PDF
	public Map getEmployeeDetailas(Long pk_item_details_id) {

	 	System.out.println("into helper class");
	 	OfferLetterDao dao1 = new OfferLetterDao();
		List catList = dao1.getEmployeeDetailas(pk_item_details_id);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			OfferLetterBean b = new OfferLetterBean();
			
			System.out.println("in for loop----------------- : "+catList.size());
			
			b.setEmployeeId(Long.parseLong(o[0].toString()));
			b.setIdNumber((o[1].toString()));
			b.setDesignation(o[2].toString());
  		    b.setSalary(Double.parseDouble(o[3].toString()));
  		    b.setDateOfJoining(o[4].toString());
  		    System.out.println("date -------------------"+b.getDateOfJoining());
  		    
			b.setPlaceOfposting(o[5].toString());
			b.setEmail(o[6].toString());

			map.put(b.getEmployeeId(),b);
		}
		System.out.println("out of helper return map : "+map.size());
		return map;
	
	}	
}
