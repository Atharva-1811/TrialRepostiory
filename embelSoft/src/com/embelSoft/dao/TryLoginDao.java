package com.embelSoft.dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.embelSoft.hibernate.UserDetailasHibernate;
import com.embelSoft.utility.HibernateUtility;

/**
 * Servlet implementation class Session
 */
public class TryLoginDao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserDetailasHibernate loginUser(UserDetailasHibernate u) 
	{
		try
		{
		
		
		HibernateUtility hbu = HibernateUtility.getInstance();
		Session session1 = hbu.getHibernateSession();
		
		org.hibernate.Query query = session1.createQuery("from User where userName = :userName AND password = :password");
		
		query.setParameter("userName", u.getUserName());
		query.setParameter("password", u.getPassword());
		
		UserDetailasHibernate uniqueResult = (UserDetailasHibernate) query.uniqueResult();

		return uniqueResult;

		}
		
		catch (RuntimeException e) 
		{
			e.printStackTrace();

		}		
		
		return null;
	}
}