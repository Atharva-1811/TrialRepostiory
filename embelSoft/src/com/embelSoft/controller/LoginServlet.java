package com.embelSoft.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.embelSoft.dao.TryLoginDao;
import com.embelSoft.hibernate.UserDetailasHibernate;
import com.embelSoft.utility.HibernateUtility;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();

		
		String userName = request.getParameter("uname");
		String password = request.getParameter("pass");
		
		System.out.println("before query------------------------------:"+userName);
		System.out.println("before query------------------------------:"+password);
		
		HibernateUtility hbu = HibernateUtility.getInstance();
		Session session1 = hbu.getHibernateSession();
		
		org.hibernate.Query query = session1.createQuery("from User where userName = :userName AND password = :password");
		
		query.setParameter("userName", userName);
		query.setParameter("password", password);
		
		UserDetailasHibernate uniqueResult = (UserDetailasHibernate) query.uniqueResult();

		String u = uniqueResult.getUserName();
		String p = uniqueResult.getPassword();
		
		System.out.println("after query**************************:"+u);
		System.out.println("after query**************************:"+p);
		
		if(u.equals(userName) && p.equals(password))
		{
			//out.print("Welcome, " + userName);
			HttpSession session = request.getSession(true); // reuse existing
			
			response.sendRedirect("/embelSoft/jsp/EmployeeDetails.jsp");
			session.setAttribute("user", userName);	
		}
		else
		{
			response.sendRedirect("/embelSoft/jsp/login.jsp");
			out.println("<font color=red>Either user name or password is wrong.</font>");	
		}
		
		/*
		if(true)
		{
			HttpSession session = request.getSession(true); 
			response.sendRedirect("/embelSoft/jsp/EmployeeDetails.jsp");
			session.setAttribute("user", userName);
			out.println("<script>");
			out.println("alert('login Successfully. . .')");
			out.println("</script>");
		}
		else
		{
			response.sendRedirect("/embelSoft/jsp/tryLogin.jsp");
			out.println("<script>");
			out.println("alert('login Failed. . .')");
			out.println("</script>");
			
			//out.println("<font color=red>Either user name or password is wrong.</font>");
		}*/
	}

}
