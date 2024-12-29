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

import com.embelSoft.bean.CategorySubcategoryBean;
import com.embelSoft.dao.AccessControlDao;
import com.embelSoft.dao.ComponentSubCategoryDao;
import com.embelSoft.dao.ComponentTypesDao;
import com.embelSoft.hibernate.CompTypeDetailsHibernate;
import com.embelSoft.hibernate.SubcategoryHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;

public class ComponentSubcategoryHelper {
	
	
	public void saveCompTypesDetails(HttpServletRequest request,HttpServletResponse response) 
	{
		// TODO Auto-generated method stub
		System.out.println("In helper");
		
		String componentType = request.getParameter("componentType");
		
		String componentSubCategory = request.getParameter("compSubcategory");
		
		SubcategoryHibernate hibernate = new SubcategoryHibernate();
		
		hibernate.setFkCategoryId(Long.parseLong(componentType));
		hibernate.setComponentSubCategory(componentSubCategory);
		hibernate.setStatus("Active");
		
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
		
		ComponentSubCategoryDao dao = new ComponentSubCategoryDao();
		dao.valComponentSubCategoryDetails(hibernate);
	}
	
	//getCompTypeList
		public List getCompTypeList(HttpServletRequest request, HttpServletResponse response) 
		{
			Map<Long, CompTypeDetailsHibernate> map = new HashMap<Long, CompTypeDetailsHibernate>();
			ComponentSubCategoryDao dao = new ComponentSubCategoryDao();
			List<CompTypeDetailsHibernate> compList = dao.getCompTypeList();
			
			System.out.println("IN HELPER LIST SIZE :-  "+compList.size());
			return compList;
		}
		
	
		
		public List getComponentSubcategoryDropDown(HttpServletRequest request, HttpServletResponse response)
		{
			Long categoryId =Long.parseLong(request.getParameter("categoryId"));
			Map<Long, CategorySubcategoryBean> map = new HashMap<Long, CategorySubcategoryBean>();
			
			ComponentSubCategoryDao Dao = new ComponentSubCategoryDao();
			List<CategorySubcategoryBean> userList = Dao.getComponentSubcategoryDropDown(categoryId);
			return userList;
		}
		
		public List getComponentSubcategoryDropDownForComponentBilling(HttpServletRequest request, HttpServletResponse response)
		{
			Long categoryId =Long.parseLong(request.getParameter("categoryId"));
			Map<Long, CategorySubcategoryBean> map = new HashMap<Long, CategorySubcategoryBean>();
			
			ComponentSubCategoryDao Dao = new ComponentSubCategoryDao();
			List<CategorySubcategoryBean> userList = Dao.getComponentSubcategoryDropDownForComponentBilling(categoryId);
			return userList;
		}

		public List getSubcategoryForedit(HttpServletRequest request, HttpServletResponse response) {
			
			Long subCategoryId =Long.parseLong(request.getParameter("subCategoryId"));
			Map<Long, CategorySubcategoryBean> map = new HashMap<Long, CategorySubcategoryBean>();
			
			ComponentSubCategoryDao Dao = new ComponentSubCategoryDao();
			List<CategorySubcategoryBean> userList = Dao.getSubcategoryForedit(subCategoryId);
			return userList;
		}

}
