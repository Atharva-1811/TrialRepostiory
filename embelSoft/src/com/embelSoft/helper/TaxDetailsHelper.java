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
import org.jfree.util.Log;

import com.embelSoft.bean.TaxDetailsBean;
import com.embelSoft.bean.UserDetailsBean;
import com.embelSoft.dao.ComponentStockDao;
import com.embelSoft.dao.TaxDetailsDao;
import com.embelSoft.dao.UserDetailasDao;
import com.embelSoft.hibernate.ComponentStockHibernate;
import com.embelSoft.hibernate.TaxDetailsHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.utility.HibernateUtility;

public class TaxDetailsHelper {
	
	public void saveTaxDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("IN HELPER:");
		
		//Long pkTaxDetailsId;	//pkTaxDetailsId
		
		String taxType = request.getParameter("taxType");
		String taxPercentage = request.getParameter("taxPercentage");
		String CGST = request.getParameter("CGST");
		String SGST = request.getParameter("SGST");
		
		
		TaxDetailsHibernate hibernate = new TaxDetailsHibernate();
		
		hibernate.setTaxType(taxType);
		hibernate.setTaxPercentage(Double.parseDouble(taxPercentage));
		hibernate.setCGST(Double.parseDouble(CGST));
		hibernate.setSGST(Double.parseDouble(SGST));
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String lastUpdateDate1 = simpleDateFormat.format(new Date());
		Date lastUpdateDate = null;
		try
		{			
			lastUpdateDate = simpleDateFormat.parse(lastUpdateDate1);
			hibernate.setLastUpdateDate(lastUpdateDate);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		TaxDetailsDao dao = new TaxDetailsDao();
		dao.saveTaxDetails(hibernate);
		
		
		
		//TaxDetailsDao tddao = new TaxDetailsDao();
		//List taxDetailsList = tddao.getLoadAllTaxDetailsEntry();
		
		
		/*----------------------------- If Stock Is Empty ------------------------------*/ 
        /*if(taxDetailsList.size() == 0)
        {
        	System.out.println("1ST IF().....\nWhen Stock Details List ======= 0"+taxDetailsList.size());
        	
        	TaxDetailsHibernate hibernate = new TaxDetailsHibernate();
    		
    		hibernate.setCGST(Double.parseDouble(CGST));
    		hibernate.setSGST(Double.parseDouble(SGST));
    		hibernate.setIGST(Double.parseDouble(IGST));
    		
    		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    		Date lastUpdateDate1 = null;		
    		try
    		{
    			lastUpdateDate1 = format.parse(lastUpdateDate);
    			hibernate.setLastUpdateDate(lastUpdateDate1);
    		}
    		catch (Exception e) 
    		{
    			e.printStackTrace();
    		}
    		
    		TaxDetailsDao dao = new TaxDetailsDao();
    		dao.saveTaxDetails(hibernate);        	
        }*/
        /*---------------------------------To Update Stock Table If It is Not Empty ---------------------------------------*/
       /* else
        {
        	  for(int j=0;j<taxDetailsList.size();j++)
	    	   {
	             	System.out.println("1ST IF's ELSE().....\nwhen Stockdetails is GREATER THAN 0 =====> "+taxDetailsList.size());
	             	
	             	TaxDetailsHibernate hibernate = (TaxDetailsHibernate)taxDetailsList.get(j);
	             	
	             	Long pkTaxDetailsIdDB = hibernate.getPkTaxDetailsId();
	             	Double CGSTOldDB = hibernate.getCGST();
	             	Double SGSTOldDB = hibernate.getSGST();
	             	Double IGSTOldDB = hibernate.getIGST();
	             	Date lastUpdateDateOld = hibernate.getLastUpdateDate();
	             	
	             	
	             	
	             	Long pkTaxDetailsIdDBUpdate = hibernate.getPkTaxDetailsId();
	             	Double CGSTOldDBUpdate = Double.parseDouble(CGST);
	             	Double SGSTOldDBUpdate = Double.parseDouble(SGST);
	             	Double IGSTOldDBUpdate = Double.parseDouble(IGST);
	             	
	             	Date lastUpdateDateOldUpdate;
	             	
	             	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        		Date lastUpdateDate1 = null;		
	        		try
	        		{
	        			lastUpdateDate1 = format.parse(lastUpdateDate);
	        			//lastUpdateDateOldUpdate = lastUpdateDate1;
	        		}
	        		catch (Exception e) 
	        		{
	        			e.printStackTrace();
	        		}
	        		
	        		lastUpdateDateOldUpdate = lastUpdateDate1;
	        		
	        		HibernateUtility hbu = HibernateUtility.getInstance();
	        		Session session2 = hbu.getHibernateSession();
	        		org.hibernate.Transaction transaction = session2.beginTransaction();
	        		
	        		try
	        		{	           		 	
		        		TaxDetailsHibernate updateTaxDetailsDB = (TaxDetailsHibernate) session2.get(TaxDetailsHibernate.class, new Long(pkTaxDetailsIdDB));
		        		updateTaxDetailsDB.setCGST(CGSTOldDBUpdate);
		        		updateTaxDetailsDB.setSGST(SGSTOldDBUpdate);
		        		updateTaxDetailsDB.setIGST(IGSTOldDBUpdate);
		        		updateTaxDetailsDB.setLastUpdateDate(lastUpdateDateOldUpdate);
		        		
		        		session2.saveOrUpdate(updateTaxDetailsDB);
		        		transaction.commit();
		        		System.out.println("Successful");
		        		break;
	        		}catch(RuntimeException e){
	        			e.printStackTrace();
	        			try{
	        				transaction.rollback();
	        			}catch(RuntimeException rbe)
	        			{
	        				Log.error("Couldn't roll back tranaction",rbe);
	        			}	
	        		}finally{
	        			hbu.closeSession(session2);
	        		}
	        		
	        		break;*/
	            		            	
	            	/*if(componentTypeOld.equals(componentType) && componentNameOld.equals(componentName))
	            	{
	            		System.out.println("IF INSIDE ELSE BLOCK ==== CONDITION TRUE ===== inside If");
	            		
	            		Long quantityUpdate =  quantityOld + Long.parseLong(quantity);
	            		
	            		Double CGSTOldDB = hibernate.getCGST();
		             	Double SGSTOldDB = hibernate.getSGST();
		             	Double IGSTOldDB = hibernate.getIGST();
		             	
		             	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        		Date lastUpdateDate1 = null;		
		        		try
		        		{
		        			lastUpdateDate1 = format.parse(lastUpdateDate);
		        			hibernate.setLastUpdateDate(lastUpdateDate1);
		        		}
		        		catch (Exception e) 
		        		{
		        			e.printStackTrace();
		        		}
		             	
		             	Date lastUpdateDateOld = hibernate.getLastUpdateDate();
		        		
	            				    	        	
	    	        	 HibernateUtility hbu = HibernateUtility.getInstance();
	            		 Session session2 = hbu.getHibernateSession();
	            		 org.hibernate.Transaction transaction = session2.beginTransaction();
	            		 
	            		ComponentStockHibernate updateStock = (ComponentStockHibernate) session2.get(ComponentStockHibernate.class, new Long(pkCompStockIdOld));
	            		updateStock.setQuantity(quantityUpdate);
	            		updateStock.setCompStockLastUpdateDate(compStockLastUpdateDate);
	            		
	            		session2.saveOrUpdate(updateStock);
	            		transaction.commit();
	            		break;            		
	            	}*/
	    	 /*  } 	
        }*/
		
				
	}
	
	public List getAllTaxDetailsList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, TaxDetailsBean> map = new HashMap<Long, TaxDetailsBean>();
		TaxDetailsDao dao = new TaxDetailsDao();
		List<TaxDetailsBean> taxDetailsList = dao.getTaxDetailsList();
		
		System.out.println("IN HELPER--------------==== :  "+taxDetailsList.size());
		return taxDetailsList;
	}
	
	public List getTaxDetailsForEdit(Long pkTaxDetailsId)
	{		
		Map<Long, TaxDetailsBean> map = new HashMap<Long, TaxDetailsBean>();
		TaxDetailsDao dao = new TaxDetailsDao();
		List<TaxDetailsBean> list = dao.getTaxDetailsForEdit(pkTaxDetailsId);
		return list;
	}
	
	
	public void updateTaxDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("IN HELPER METHOD NAME :- updateTaxDetails");	
		
		String pkTaxDetailsId = request.getParameter("pkTaxDetailsId");
		String taxTypeOldName = request.getParameter("taxTypeOldName");
		
		String taxType = request.getParameter("taxType");
		String taxPercentage = request.getParameter("taxPercentage");
		String CGST = request.getParameter("CGST");
		String SGST = request.getParameter("SGST");
		
		TaxDetailsDao dao  =new TaxDetailsDao();
		List userlist = dao.getAllTaxDetailsForUpdate();
			
		for(int i=0;i<userlist.size();i++)
		{
			TaxDetailsHibernate hibernate = (TaxDetailsHibernate) userlist.get(i);
			
			Long pkTaxDetailsIdList = hibernate.getPkTaxDetailsId();
			String taxTypeOldNameList =hibernate.getTaxType();
			
									
			if(taxTypeOldNameList.equals(taxTypeOldName) && pkTaxDetailsIdList.equals(Long.parseLong(pkTaxDetailsId)))
			 {
				 HibernateUtility hbu = HibernateUtility.getInstance();
				 Session session = hbu.getHibernateSession();
				 Transaction transaction = session.beginTransaction();
				 
				 TaxDetailsHibernate taxHibernate = (TaxDetailsHibernate) session.get(TaxDetailsHibernate.class,new Long(pkTaxDetailsId));
				 
				 taxHibernate.setTaxType(taxType);
				 taxHibernate.setTaxPercentage(Double.parseDouble(taxPercentage));
				 taxHibernate.setCGST(Double.parseDouble(CGST));
				 taxHibernate.setSGST(Double.parseDouble(SGST));
				 
				 session.update(taxHibernate);
				 transaction.commit();
				 
				 break;
			}
		 }
	}

}
