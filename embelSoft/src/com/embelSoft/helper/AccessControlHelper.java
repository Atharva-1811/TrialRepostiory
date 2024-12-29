package com.embelSoft.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.AccessControlBean;
import com.embelSoft.bean.UserDetailsBean;
import com.embelSoft.dao.AccessControlDao;
import com.embelSoft.dao.UserDetailasDao;
import com.embelSoft.hibernate.AccessControlHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.utility.HibernateUtility;

public class AccessControlHelper {
	
	//getUserDtlForAccessControl
	public List getUserDtlForAccessControl(Long fkEmployeeid)
	{
		Map<Long, UserDetailasNewHibernate> map = new HashMap<Long, UserDetailasNewHibernate>();
		
		AccessControlDao Dao = new AccessControlDao();
		List<UserDetailasNewHibernate> userList = Dao.getUserDtlForAccessControl(fkEmployeeid);
		return userList;
	}
	
	//getUserDtlForAccessControl
	public void doAccessControlDetails(HttpServletRequest request,HttpServletResponse response)
	{
		Long pkACUserId;	//pkACUserId
		String name = request.getParameter("name");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");
		
		AccessControlHibernate ach = new AccessControlHibernate();
		
		ach.setName(name);
		ach.setUserName(userName);
		ach.setPassword(password);
		ach.setUserType(userType);
				
		AccessControlDao acDao = new AccessControlDao();
		acDao.valAccessControlDetails(ach);
	}
	
	//getAccessControlList
	public List getAccessControlList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, UserDetailsBean> map = new HashMap<Long, UserDetailsBean>();
		AccessControlDao dao = new AccessControlDao();
		List<UserDetailsBean> userDetailsList = dao.getAccessControlList();		
		System.out.println("IN HELPER--------------==== :  "+userDetailsList.size());
		return userDetailsList;
	}
	
	//getUserDetailForEdit
	public List getAccessControlDtlForEdit(Long pkACUserId)
	{		
		Map<Long, AccessControlBean> map = new HashMap<Long, AccessControlBean>();
		AccessControlDao dao = new AccessControlDao();
		List<AccessControlBean> list = dao.getAccessControlDtlForEdit(pkACUserId);
		return list;
	}
	
	//updateAccessControlDetails
	public void updateAccessControlDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("IN HELPER METHOD NAME :- AccessControlHelper");
		
		String name = request.getParameter("name");
		String pkACUserId = request.getParameter("pkACUserId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");
		
		
		AccessControlDao dao  =new AccessControlDao();
		List userlist = dao.getAllAccessControlDetailsForUpdate();
			
		for(int i=0;i<userlist.size();i++)
		{
			AccessControlHibernate hibernate = (AccessControlHibernate) userlist.get(i);
			
			Long pkACUserIdList = hibernate.getPkACUserId();
			String nameList =hibernate.getName();
			String userNameList =hibernate.getUserName();
			String userTypeList =hibernate.getUserType();
						
			if(name.equals(nameList) && pkACUserIdList.equals(Long.parseLong(pkACUserId)))
			 {
				 HibernateUtility hbu = HibernateUtility.getInstance();
				 Session session = hbu.getHibernateSession();
				 Transaction transaction = session.beginTransaction();
				 AccessControlHibernate user = (AccessControlHibernate) session.get(AccessControlHibernate.class,new Long(pkACUserId));
				 
				 user.setName(name);
				 user.setUserName(userName);
				 user.setPassword(password);
				 user.setUserType(userType);
				 
				 session.update(user);
				 transaction.commit();
				 
				 break;
			}
		 }
	}
	

}
