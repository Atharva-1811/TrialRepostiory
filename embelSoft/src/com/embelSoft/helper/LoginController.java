package com.embelSoft.helper;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.embelSoft.hibernate.AccessControlHibernate;
import com.embelSoft.hibernate.UserDetailasHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.utility.HibernateUtility;
import com.embelSoft.utility.RestartTomcat;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.DocumentException;
import java.util.ArrayList;
import java.util.List;
import javax.mail.Transport;
import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Multipart;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.Address;
import com.sun.mail.smtp.SMTPTransport;
import javax.mail.URLName;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 * Servlet implementation class Session
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String userName = request.getParameter("uname");
		String password = request.getParameter("pass");
		
		HibernateUtility hbu = HibernateUtility.getInstance();
		Session session1 = hbu.getHibernateSession();
		
		org.hibernate.Query query = session1.createQuery("from UserDetailasHibernate where UserName = :UserName AND Password = :Password");
		
		query.setParameter("UserName :- ", userName);
		
		UserDetailasHibernate uresult = (UserDetailasHibernate) query.uniqueResult();
		String u = uresult.getUserName();
		String p = uresult.getPassword();
		System.out.println("after query :----**** :- "+u);
		System.out.println("after query :----**** :- "+p);
	
		if(userName.equals(u) && password.equals(p))
		{
			System.out.println("=====================================================IF > :- "+u);
			HttpSession session = request.getSession(true); // reuse existing
			response.sendRedirect("/embelSoft/jsp/EmployeeDetails.jsp");
			session.setAttribute("user", userName);
		} 
		else 
		{
			response.sendRedirect("/embelSoft/jsp/login.jsp");
			System.out.println("=====================================================ELSE"+u);
			out.println("<font color=red>Either user name or password is wrong.</font>");
		}
	}
	
	public void loginUserNew(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String userName = request.getParameter("uname");
		String password = request.getParameter("pass");
	
		//System.out.println("userName :- "+userName);
		//System.out.println("password :- "+password);
		
	
		HibernateUtility hbu = HibernateUtility.getInstance();
		Session session1 = hbu.getHibernateSession();
		
		org.hibernate.Query query = session1.createQuery("from AccessControlHibernate where user_name = :UserName AND password = :Password");
		query.setParameter("UserName", userName);
		query.setParameter("Password", password);
		
		AccessControlHibernate uresult = (AccessControlHibernate) query.uniqueResult();
		
		String u = uresult.getUserName();
		String p = uresult.getPassword();
		String userType = uresult.getUserType();		
		
		if(userName.equals(u) && password.equals(p))
		{
			//System.out.println("after query in if :----**** :- "+name);
			if(userType.equals("admin"))
			{
				System.out.println("===========================Admin==========================IF :- "+u);
				HttpSession session = request.getSession(true); // reuse existing
				response.sendRedirect("/embelSoft/jsp/Index.jsp");
				session.setAttribute("user", userName);
				session.setAttribute("userType", userType);
			}
			else if(userType.equals("accountant"))
			{
				System.out.println("========================Accountant=============================IF :- "+u);
				HttpSession session = request.getSession(true); // reuse existing
				response.sendRedirect("/embelSoft/jsp/Index.jsp");
				session.setAttribute("user", userName);
				session.setAttribute("userType", userType);
			}
			else if(userType.equals("employee"))
			{
				System.out.println("========================Employee=============================IF :- "+u);
				HttpSession session = request.getSession(true); // reuse existing
				response.sendRedirect("/embelSoft/jsp/Index.jsp");
				session.setAttribute("user", userName);
				session.setAttribute("userType", userType);
			}
			else if(userType.equals("electronics"))
			{
				System.out.println("========================Employee=============================IF :- "+u);
				HttpSession session = request.getSession(true); // reuse existing
				response.sendRedirect("/embelSoft/jsp/Index.jsp");
				session.setAttribute("user", userName);
				session.setAttribute("userType", userType);
			}
			else
			{
				System.out.println("========================User Type not defined=============================IF :- "+u);
				//System.out.println("User Type not defined");
			}
			
			if(userType != "" && userType != null)
			{

			}
		}
		else 
		{
			String failRongLogin = "Either user name or password is wrong.";
			HttpSession session = request.getSession(true);
			response.sendRedirect("/embelSoft/jsp/login.jsp");
			session.setAttribute("FailRongLogin", failRongLogin);
			System.out.println("=====================================================ELSE :- "+u);
			out.println("<font color=red>Either user name or password is wrong.</font>");
		}
	}
	
	
	
	public void restartConnnection(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException 
	{
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String userName = request.getParameter("uname");
		String password = request.getParameter("pass");
	
	
		HibernateUtility hbu = HibernateUtility.getInstance();
		Session session1 = hbu.getHibernateSession();
		
		org.hibernate.Query query = session1.createQuery("from AccessControlHibernate where user_name = :UserName AND password = :Password");
		query.setParameter("UserName", userName);
		query.setParameter("Password", password);
		
		
			
			
		
	}
	
}