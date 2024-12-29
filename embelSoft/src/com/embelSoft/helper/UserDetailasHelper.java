package com.embelSoft.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.CompTypeDetailsBean;
import com.embelSoft.bean.GetEmployeeDetailsBean;
import com.embelSoft.bean.UserDetailsBean;
import com.embelSoft.dao.ComponentDetailsDao;
import com.embelSoft.dao.ComponentTypesDao;
import com.embelSoft.dao.EmployeeDetailsDao;
import com.embelSoft.dao.ProductDetailsDao;
import com.embelSoft.dao.UserDetailasDao;
import com.embelSoft.hibernate.CompTypeDetailsHibernate;
import com.embelSoft.hibernate.EmployeeDetailsHibernate;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.hibernate.UserDetailasHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.utility.HibernateUtility;

public class UserDetailasHelper 
{
	public void doUserDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("in helper");
		
		String name = request.getParameter("name");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmpassword");
		
		System.out.println("IN HELPER:");
		System.out.println("name-------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+name);
		System.out.println("userName-------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+userName);
		System.out.println("password-------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+password);
		System.out.println("password-------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+confirmPassword);
		
		UserDetailasHibernate u = new UserDetailasHibernate();
		
		u.setName(name);
		u.setUserName(userName);
		u.setPassword(password);
		u.setConfirmPassword(confirmPassword);
		
		UserDetailasDao uDao = new UserDetailasDao();
		uDao.valUserDetails(u);
		
	}
	
	public void saveUserDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("in helper");		
		
		Long pkUserId;	//pk_user_id
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String contactNo = request.getParameter("contactNo");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String pincode = request.getParameter("pincode");
		String emailId = request.getParameter("emailId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("rePassword");
		String panNumber = request.getParameter("panNumber");
		
		System.out.println("IN HELPER:");
		System.out.println("name-------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+firstName +" "+lastName);
		
		UserDetailasNewHibernate udnh = new UserDetailasNewHibernate();
		
		udnh.setFirstName(firstName);
		udnh.setLastName(lastName);
		udnh.setContactNo(Long.parseLong(contactNo));
		udnh.setAddress(address);
		udnh.setCity(city);
		udnh.setPincode(Long.parseLong(pincode));
		udnh.setEmailId(emailId);
		udnh.setUserName(userName);
		udnh.setPassword(rePassword);
		udnh.setRePassword(rePassword);
		udnh.setPanNumber(panNumber);
		
		
		UserDetailasDao Dao = new UserDetailasDao();
		Dao.saveUserDetails(udnh);
	}
	
	//getAllUserDetailsList
	public List getAllUserDetailsList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, UserDetailsBean> map = new HashMap<Long, UserDetailsBean>();
		UserDetailasDao dao = new UserDetailasDao();
		List<UserDetailsBean> userDetailsList = dao.getAllUserDetailsList();
		
		System.out.println("IN HELPER--------------==== :  "+userDetailsList.size());
		return userDetailsList;
	}
	
	//getUserDetailForEdit
	public List getUserDetailForEdit(Long pkUserId)
	{		
		Map<Long, UserDetailsBean> map = new HashMap<Long, UserDetailsBean>();
		UserDetailasDao dao = new UserDetailasDao();
		List<UserDetailsBean> list = dao.getUserDetailForEdit(pkUserId);		
		return list;
	}
	
	//updateUserDetails
	public void updateUserDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("IN HELPER METHOD NAME :- updateUserDetails");	
		
		String fullName = request.getParameter("fullName");
		String pkUserId = request.getParameter("pkUserId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String contactNo = request.getParameter("contactNo");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String pincode = request.getParameter("pincode");
		String emailId = request.getParameter("emailId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("rePassword");
		String panNumber = request.getParameter("panNumber");		
		
		UserDetailasDao dao  =new UserDetailasDao();
		List userlist = dao.getAllUserDetailsForUpdate();
			
		for(int i=0;i<userlist.size();i++)
		{
			UserDetailasNewHibernate hibernate = (UserDetailasNewHibernate) userlist.get(i);
			
			Long pkUserIdList = hibernate.getPkUserId();
			String firstNameList =hibernate.getFirstName();
			String lastNameList =hibernate.getLastName();
			
			String userFullName = firstNameList+" "+lastNameList;
			
			//System.out.println("userFullName :- "+userFullName);
						
			if(fullName.equals(userFullName) && pkUserIdList.equals(Long.parseLong(pkUserId)))
			 {
				 HibernateUtility hbu = HibernateUtility.getInstance();
				 Session session = hbu.getHibernateSession();
				 Transaction transaction = session.beginTransaction();
				 UserDetailasNewHibernate user = (UserDetailasNewHibernate) session.get(UserDetailasNewHibernate.class,new Long(pkUserId));
				 
				 user.setFirstName(firstName);
				 user.setLastName(lastName);
				 user.setContactNo(Long.parseLong(contactNo));
				 user.setAddress(address);
				 user.setCity(city);
				 user.setPincode(Long.parseLong(pincode));
				 user.setEmailId(emailId);
				 user.setUserName(userName);
				 user.setPassword(rePassword);
				 user.setRePassword(rePassword);
				 user.setPanNumber(panNumber);
				 
				 session.update(user);
				 transaction.commit();
				 
				 break;
			}
		 }
	}
	
	
}
