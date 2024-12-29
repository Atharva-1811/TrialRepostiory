package com.embelSoft.helper;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.CategorySubcategoryBean;
import com.embelSoft.dao.ComponentDetailsDao;
import com.embelSoft.dao.ComponentSubCategoryDao;
import com.embelSoft.hibernate.CompTypeDetailsHibernate;
import com.embelSoft.hibernate.ComponentDetailsHibernate;

public class ComponentDetailsHelper {
	
	//CompTypeDetailsHibernate
	public CompTypeDetailsHibernate getGridForComponentPurchase(String componentType)
	{
		CompTypeDetailsHibernate hibernate = new CompTypeDetailsHibernate();
		hibernate.setComponentType(componentType);
		return hibernate;
	}
	
	//doComponentDetails
	public void doComponentDetails(HttpServletRequest request,HttpServletResponse response) 
	{
		// TODO Auto-generated method stub
		System.out.println("In ComponentDetailsDelper helper ");
		
		String componentName = request.getParameter("componentName");
		String addingDate = request.getParameter("addingDate");
		String description = request.getParameter("description");
		String features = request.getParameter("features");
		
		ComponentDetailsHibernate cdh = new ComponentDetailsHibernate();
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");		
		Date addingDate2 = null;
		
		try{
			addingDate2 = format.parse(addingDate);
			cdh.setAddingDate(addingDate2);
			System.out.println(" date dateOfBirth parsing" +addingDate2);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		cdh.setComponentName(componentName);
		cdh.setDescription(description);
		cdh.setFeatures(features);
		
		ComponentDetailsDao cdd = new ComponentDetailsDao();
		cdd.valComponentDetails(cdh);		
	}
	
	//doAllComponentDtlList
	public List doAllComponentDtlList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ComponentDetailsHibernate> map = new HashMap<Long, ComponentDetailsHibernate>();
		ComponentDetailsDao dao = new ComponentDetailsDao();
		List<ComponentDetailsHibernate> exp1List = dao.getComponentDtlList();
		
		System.out.println("IN HELPER--------------==== :  "+exp1List.size());
		return exp1List;
	}
	
	
	public List getComponentDropDown(HttpServletRequest request, HttpServletResponse response)
	{
		Long categoryId =Long.parseLong(request.getParameter("categoryId"));
		Long subCategoryId = Long.parseLong(request.getParameter("subCategoryId"));
		Map<Long, ComponentDetailsHibernate> map = new HashMap<Long, ComponentDetailsHibernate>();
		
		ComponentDetailsDao Dao = new ComponentDetailsDao();
		List<ComponentDetailsHibernate> userList = Dao.getCompontDetailsList(categoryId,subCategoryId);
		return userList;
	}
}
