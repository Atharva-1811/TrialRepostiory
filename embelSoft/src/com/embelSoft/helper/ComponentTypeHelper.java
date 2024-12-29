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

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.CompTypeDetailsBean;
import com.embelSoft.dao.ComponentTypesDao;
import com.embelSoft.hibernate.CompTypeDetailsHibernate;
import com.embelSoft.hibernate.SubcategoryHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ComponentTypeHelper {

	//saveCompTypesDetails
	public void saveCompTypesDetails(HttpServletRequest request,HttpServletResponse response)
	{
		// TODO Auto-generated method stub
		System.out.println("In helper");

		String componentType = request.getParameter("componentType");

		CompTypeDetailsHibernate hibernate = new CompTypeDetailsHibernate();

		hibernate.setComponentType(componentType);

		//compStockLastUpdateDate
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Calendar cal = Calendar.getInstance();
//		String currentDate =  dateFormat.format(cal.getTime()).toString();
    	Date date = new Date();
		Date lastUpdateDate = null;
		try{
			lastUpdateDate = date;
			hibernate.setLastUpdateDate(lastUpdateDate);
			//System.out.println(" date compStockLastUpdateDate parsing" +lastUpdateDate);
		}
		catch(Exception e){
			e.printStackTrace();
			//System.out.println("Exception in date parsing");
		}

		ComponentTypesDao dao = new ComponentTypesDao();
		dao.valComponentTypeDetails(hibernate);
	}

	//getCompTypeList
	public List getCompTypeList(HttpServletRequest request, HttpServletResponse response)
	{
		Map<Long, CompTypeDetailsHibernate> map = new HashMap<Long, CompTypeDetailsHibernate>();
		ComponentTypesDao dao = new ComponentTypesDao();
		List<CompTypeDetailsHibernate> compList = dao.getCompTypeList();

		System.out.println("IN HELPER LIST SIZE :-  "+compList.size());
		return compList;
	}

	//getCompTypeForEdit
	public List getCompTypeForEdit(Long pkCompTypeId)
	{
		Map<Long, CompTypeDetailsBean> map = new HashMap<Long, CompTypeDetailsBean>();
		ComponentTypesDao dao = new ComponentTypesDao();
		List<CompTypeDetailsBean> ven1List = dao.getCompTypeDetailsForEdit(pkCompTypeId);
		System.out.println("Size in Helper------ : "+ven1List.size());
		return ven1List;
	}
	
	//Get Subcategoy For Edit
	public List getSubcategoyForEdit(Long pkCompTypeId)
	{
		Map<Long, CompTypeDetailsBean> map = new HashMap<Long, CompTypeDetailsBean>();
		ComponentTypesDao dao = new ComponentTypesDao();
		List<CompTypeDetailsBean> ven1List = dao.getSubcategoyForEdit(pkCompTypeId);
		System.out.println("Size in Helper------ : "+ven1List.size());
		return ven1List;
	}
	
	

	//updateCompTypeDetails
	public void updateCompTypeDetails(HttpServletRequest request,HttpServletResponse response)
	{

		String pkCompTypeId = request.getParameter("pkCompTypeId");
		String componentTypeName = request.getParameter("componentTypeName");
	
		System.out.println("pkCompTypeId from JSP  :  "+pkCompTypeId);
		System.out.println("componentTypeName from JSP  :  "+componentTypeName);
		
		ComponentTypesDao dao1 = new ComponentTypesDao();
		List compTypeList = dao1.getAllComponentTypes();

		System.out.println("SIZE FROM DAO   : "+compTypeList.size());

		for(int i=0;i<compTypeList.size();i++)
		 {
			CompTypeDetailsHibernate ctdh = (CompTypeDetailsHibernate) compTypeList.get(i);
			Long pkCompTypeIdOldDB = ctdh.getPkCompTypeId();
			String componentTypeOldDB = ctdh.getComponentType();

			 if(pkCompTypeIdOldDB.equals(Long.parseLong(pkCompTypeId)))
			 {

				 HibernateUtility hbu = HibernateUtility.getInstance();
				 Session session = hbu.getHibernateSession();
				 Transaction transaction = session.beginTransaction();

				 CompTypeDetailsHibernate hibernate = (CompTypeDetailsHibernate) session.get(CompTypeDetailsHibernate.class,new Long(pkCompTypeIdOldDB));

				 hibernate.setPkCompTypeId(Long.parseLong(pkCompTypeId));
				 hibernate.setComponentType(componentTypeName);

				//compStockLastUpdateDate
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Calendar cal = Calendar.getInstance();
					String currentDate =  dateFormat.format(cal.getTime()).toString();
					Date lastUpdateDate = null;
					try{
						lastUpdateDate = dateFormat.parse(currentDate);
						hibernate.setLastUpdateDate(lastUpdateDate);
						//System.out.println(" date compStockLastUpdateDate parsing" +lastUpdateDate);
					}
					catch(Exception e){
						e.printStackTrace();
						System.out.println("Exception in date parsing");
					}

				 session.saveOrUpdate(hibernate);
				 transaction.commit();

				 break;
			 }
		 }
	}
	
	
	public void updateSubCategory(HttpServletRequest request,HttpServletResponse response)
	{
		String pkCompTypeId = request.getParameter("pkSubCompTypeId");
		String subCategory = request.getParameter("updatedSubCategory");
		System.out.println("pkCompTypeId from JSP  :  " + pkCompTypeId);
		System.out.println("subCategory from JSP  :  " + subCategory);

		ComponentTypesDao dao1 = new ComponentTypesDao();
		List compTypeList = dao1.getSubcategory();

		System.out.println("SIZE FROM DAO   : " + compTypeList.size());

		for (int i = 0; i < compTypeList.size(); i++) {
			SubcategoryHibernate ctdh = (SubcategoryHibernate) compTypeList.get(i);

			Long pkCompTypeIdOldDB = ctdh.getPksubCategoryId();
		
			if (pkCompTypeIdOldDB.equals(Long.parseLong(pkCompTypeId))) {
				HibernateUtility hbu = HibernateUtility.getInstance();
				Session session = hbu.getHibernateSession();
				Transaction transaction = session.beginTransaction();
				
				SubcategoryHibernate hibernate = (SubcategoryHibernate) session.get(SubcategoryHibernate.class, new Long(pkCompTypeIdOldDB));
			
				hibernate.setPksubCategoryId(Long.parseLong(pkCompTypeId));
				hibernate.setComponentSubCategory(subCategory);

				// compStockLastUpdateDate
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal = Calendar.getInstance();
				String currentDate = dateFormat.format(cal.getTime()).toString();
				Date lastUpdateDate = null;
				try {
					lastUpdateDate = dateFormat.parse(currentDate);
					hibernate.setLastUpdateDate(lastUpdateDate);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}

				session.saveOrUpdate(hibernate);
				transaction.commit();

				break;
			}
		}
	}

}
