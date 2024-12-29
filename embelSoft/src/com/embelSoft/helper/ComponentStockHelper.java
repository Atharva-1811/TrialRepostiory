package com.embelSoft.helper;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

import com.embelSoft.bean.ComponentReceivedPOBean;
import com.embelSoft.bean.ComponentStockBean;
import com.embelSoft.bean.GetProductDetailsBean;
import com.embelSoft.dao.ComponentReceivedPODao;
import com.embelSoft.dao.ComponentStockDao;
import com.embelSoft.utility.HibernateUtility;

public class ComponentStockHelper {
	
	//getAllComponentStockReport
	public List getComponentStock(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ComponentStockBean> map = new HashMap<Long, ComponentStockBean>();
		ComponentStockDao dao = new ComponentStockDao();
		List<ComponentStockBean> exp1List = dao.getComponentStock();
		
		System.out.println("IN HELPER-------==== :  "+exp1List.size());
		return exp1List;
	}
	
	//getAllComponentStockReport
	public List getComponentStockReport(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ComponentStockBean> map = new HashMap<Long, ComponentStockBean>();
		ComponentStockDao dao = new ComponentStockDao();
		List<ComponentStockBean> exp1List = dao.getAllComponentStockReport();
		
		System.out.println("IN HELPER--------------==== :  "+exp1List.size());
		return exp1List;
	}

	
	public List getCategoryDetailforCompoentRcvive(HttpServletRequest request, HttpServletResponse response) {
		
		String fkCompenetId = request.getParameter("fkCompenetId");
		String CompoentCategory = request.getParameter("CompoentCategory");
		String fisDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");
		
		Map<Long, ComponentReceivedPOBean> map = new HashMap<Long, ComponentReceivedPOBean>();

		ComponentStockDao dao = new ComponentStockDao();
		List<ComponentReceivedPOBean> exp1List = dao.getCategoryReportByDateAndName(CompoentCategory,fkCompenetId,fisDate, endDate);

		return exp1List;

	}
	
	public List getCategoryDetailforCompoentRcviveandname(HttpServletRequest request, HttpServletResponse response) {
		
		String fkCompoentid = request.getParameter("fkCompoentid");
		String componentName = request.getParameter("componentName");
		
		String fkCompenetId = request.getParameter("fkCompenetId");
		String CompoentCategory = request.getParameter("componentType");
		
		String fisDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");
		
		Map<Long, ComponentReceivedPOBean> map = new HashMap<Long, ComponentReceivedPOBean>();

		ComponentStockDao dao = new ComponentStockDao();
		List<ComponentReceivedPOBean> exp1List = dao.getCategoryReportByDateAndName1(CompoentCategory,fkCompenetId,fisDate, endDate,fkCompoentid,componentName);

		return exp1List;

	}
	
	public List getCategoryDetailforCompoentRcviveandname5(HttpServletRequest request, HttpServletResponse response) {
		
		String fkCompoentid = request.getParameter("fkCompoentid");
		String componentName = request.getParameter("componentName");
		
		String fkCompenetId = request.getParameter("fkCompenetId");
		String CompoentCategory = request.getParameter("componentType");
		
		String fisDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");
		
		Map<Long, ComponentReceivedPOBean> map = new HashMap<Long, ComponentReceivedPOBean>();

		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		List<ComponentReceivedPOBean> exp1List = dao.getCategoryReportBybetweentwodatesandname(CompoentCategory,fkCompenetId,fisDate, endDate,fkCompoentid,componentName);

		return exp1List;

	}
	public List getCompoenetReportByDates(HttpServletRequest request, HttpServletResponse response) 
	{
		String fisDate = request.getParameter("fisDate42");
		String endDate = request.getParameter("endDate42");
		
		Map<Long, ComponentReceivedPOBean> map = new HashMap<Long, ComponentReceivedPOBean>();

		ComponentStockDao dao = new ComponentStockDao();
		List<ComponentReceivedPOBean> exp1List = dao.getstockrepoertbydates(fisDate,endDate);

		return exp1List;

	}
	
public Map fetchproductByCatName(HttpServletRequest request, HttpServletResponse response) {
		
		String categoryName = request.getParameter("categoryName");
		
		Map map = new HashMap<>();

		ComponentStockDao dao = new ComponentStockDao();
		map = dao.getproductByCatName(categoryName);

		return map;

	}
	
	
}