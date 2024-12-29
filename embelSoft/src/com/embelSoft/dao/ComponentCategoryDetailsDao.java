package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.BillOfMaterialBean;
import com.embelSoft.bean.CompoentCategoryDetailBean;
import com.embelSoft.bean.GetProductDetailsBean;
import com.embelSoft.helper.ComponentCategoryDetailsHelper;
import com.embelSoft.hibernate.CompoentCategoryDetailsHibernate;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.hibernate.TaxDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ComponentCategoryDetailsDao {

	
	
	
	public List<TaxDetailsHibernate> getTaxDetailsForCompoentCategoryDetails(Long fktaxid) 
	{
		System.out.println(fktaxid + "    -----------   fkid In dao");
		//System.out.println(employeeName + "     --------   Name In dao");
		HibernateUtility hbu = null;
		Session session = null;
		
		List<TaxDetailsHibernate> expenseList = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//System.out.println("Name "+employeeName);
			Query query2 = session.createSQLQuery("SELECT tax_type, tax_percentage, CGST, SGST FROM tax_details WHERE pk_tax_details_id = :fktaxid ");
			query2.setParameter("fktaxid", fktaxid);
			//query2.setParameter("employeeName", employeeName);
			
			List<Object[]> list = query2.list();
			expenseList = new ArrayList<TaxDetailsHibernate>(0);
			
			for (Object[] object : list) 
			{
				TaxDetailsHibernate reports = new TaxDetailsHibernate();
				
				reports.setTaxType(object[0].toString());
				reports.setTaxPercentage(Double.parseDouble(object[1].toString()));
				reports.setCGST(Double.parseDouble(object[2].toString()));
				reports.setSGST(Double.parseDouble(object[3].toString()));
				
				expenseList.add(reports);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expenseList;
	}





public List getAllCompTypeDetails() {
	
	
	
	HibernateUtility hbu=null;
	Session session=null;
	List list= null;
	
	try 
	{
		hbu=HibernateUtility.getInstance();
		session=hbu.getHibernateSession();
		Query query = session.createQuery("from CompTypeDetailsHibernate");
		 list = query.list();
		
			
	} catch (Exception e) 
	{
		Log.error("Error in getAllCompTypeDetails",e);
	}
	finally
	{
		if(session!=null)
		{
		hbu.closeSession(session);	
	}
	
	}
	
	return list;
	
}



public List getAllCompTnameDetails() {
	
	
	
	HibernateUtility hbu=null;
	Session session=null;
	List list= null;
	
	try 
	{
		hbu=HibernateUtility.getInstance();
		session=hbu.getHibernateSession();
		Query query = session.createQuery("from CompoentCategoryDetailsHibernate");
		 list = query.list();
		
			
	} catch (Exception e) 
	{
		Log.error("Error in getAllCompTypeDetails",e);
	}
	finally
	{
		if(session!=null)
		{
		hbu.closeSession(session);	
	}
	
	}
	
	return list;
	
}


public void saveCompoentCategoryDetail(CompoentCategoryDetailsHibernate edh){
	System.out.println("In DAO");
	
	HibernateUtility hbu=null;
	Session session=null;
	Transaction transaction=null;
	try{
	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	 System.out.println("got session ");
	 transaction = session.beginTransaction();

	 System.out.println("Tx started");
	 
	session.save(edh);
	transaction.commit();
	System.out.println("Successful");
	}
	
	catch(RuntimeException e){
		try{
			transaction.rollback();
		}catch(RuntimeException rbe)
		{
			Log.error("Couldn't roll back tranaction",rbe);
		}	
	}finally{
	hbu.closeSession(session);
	}
	
}

public List CompoentCategoryDetailList()
{
	HibernateUtility hbu=null;
	Session session=null;
	List<CompoentCategoryDetailBean> compList=null;
	
	try 
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query=session.createSQLQuery("SELECT compoent_category,compoent_name,compoent_value,part_number,manufracture_name,descrption,type,packages,tov_rating,unit,unit_price,duty,unit_price_customduty,tax_name,tax_percentage,cgst,sgst,pk_compoent_category_id,fk_comp_type_id,fk_tax_type_id from compoent_category_details");
		List<Object[]> list = query.list();
		System.out.println("list Size:"+list);

		compList= new ArrayList<CompoentCategoryDetailBean>(0);
		int i=0;
		
		for (Object[] o : list)
		{
			System.out.println(Arrays.toString(o));
			i++;
				
			CompoentCategoryDetailBean bean = new CompoentCategoryDetailBean();
			
			bean.setComponentCategory(o[0].toString());
			bean.setComponentName(o[1].toString());
			bean.setComponentValue(o[2].toString());
			bean.setPartNumber(o[3].toString());
			bean.setManufractureName(o[4].toString());
			bean.setDescription(o[5].toString());
			bean.setComponentType(o[6].toString());
			bean.setPackages(o[7].toString());
			bean.setTovRating(o[8].toString());
			bean.setUnit(o[9].toString());
			bean.setUnitPrice(Double.parseDouble(o[10].toString()));
			bean.setDuty(Double.parseDouble(o[11].toString()));
			bean.setUnitPriceWithCustomduty(Double.parseDouble(o[12].toString()));
			bean.setTaxName(o[13].toString());
			bean.setTaxPercentage(Double.parseDouble(o[14].toString()));
			bean.setCGST(Double.parseDouble(o[15].toString()));
			bean.setSGST(Double.parseDouble(o[16].toString()));
			bean.setPkComponentCategoryDetailsId(Long.parseLong(o[17].toString()));
			bean.setFkCompTypeId(Long.parseLong(o[18].toString()));
			bean.setFkTaxTypeId(Long.parseLong(o[19].toString()));

			bean.setSrNo(i);
			
			compList.add(bean);
		}
	}
	catch (Exception e) 
	{ 
		e.printStackTrace();
	}
	finally
	{
		hbu.closeSession(session);
	}
	return compList;
}





	public List<CompoentCategoryDetailBean> getComponetCategoryDetailsByComponetIdPkForEdit(Long componentName_id)
	{
	System.out.println(componentName_id + "    -----------   Compoenent id In dao");
	
	HibernateUtility hbu = null;
	Session session = null;
	
	List<CompoentCategoryDetailBean> venList = null;
	try {
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		//System.out.println("Name "+employeeName);
		Query query2 = session.createSQLQuery("SELECT compoent_category,compoent_name,compoent_value,part_number,manufracture_name,descrption,type,packages,tov_rating,unit,unit_price,tax_name,tax_percentage,cgst,sgst,duty,unit_price_customduty from compoent_category_details WHERE pk_compoent_category_id = :pkComponentCategoryDetailsId");
		query2.setParameter("pkComponentCategoryDetailsId", componentName_id);

		
		List<Object[]> list = query2.list();
		
		venList = new ArrayList<CompoentCategoryDetailBean>(0);

		System.out.println("Size in DAO   : =====================  : "+list.size());
		
		for (Object[] o : list) {
			

			
			CompoentCategoryDetailBean bean = new CompoentCategoryDetailBean();
			
			bean.setComponentCategory(o[0].toString());
			System.out.println("compoent category");
			bean.setComponentName(o[1].toString());
			bean.setComponentValue(o[2].toString());
			bean.setPartNumber(o[3].toString());
			bean.setManufractureName(o[4].toString());
			bean.setDescription(o[5].toString());
			bean.setComponentType(o[6].toString());
			bean.setPackages(o[7].toString());
			bean.setTovRating(o[8].toString());
			bean.setUnit(o[9].toString());
			bean.setUnitPrice(Double.parseDouble(o[10].toString()));
			bean.setTaxName(o[11].toString());
			bean.setTaxPercentage(Double.parseDouble(o[12].toString()));
			bean.setCGST(Double.parseDouble(o[13].toString()));
			bean.setSGST(Double.parseDouble(o[14].toString()));
			bean.setDuty(Double.parseDouble(o[15].toString()));
			bean.setUnitPriceWithCustomduty(Double.parseDouble(o[16].toString()));
			
			venList.add(bean);

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return venList;

}








public List<CompoentCategoryDetailBean> getcompentCategoryDetailForEdit(Long componentName_id) 
{

	System.out.println(componentName_id + "    -----------   Compoenent id In dao");
	
	HibernateUtility hbu = null;
	Session session = null;
	
	List<CompoentCategoryDetailBean> venList = null;
	try {
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		//System.out.println("Name "+employeeName);
		Query query2 = session.createSQLQuery("SELECT compoent_category,compoent_name,compoent_value,part_number,manufracture_name,descrption,type,packages,tov_rating,unit,unit_price,tax_name,tax_percentage,cgst,sgst,duty,unit_price_customduty from compoent_category_details WHERE pk_compoent_category_id = :pkComponentCategoryDetailsId");
		query2.setParameter("pkComponentCategoryDetailsId", componentName_id);

		
		List<Object[]> list = query2.list();
		
		venList = new ArrayList<CompoentCategoryDetailBean>(0);

		System.out.println("Size in DAO   : =====================  : "+list.size());
		
		for (Object[] o : list) {
			

			
			CompoentCategoryDetailBean bean = new CompoentCategoryDetailBean();
			
			bean.setComponentCategory(o[0].toString());
			System.out.println("compoent category");
			bean.setComponentName(o[1].toString());
			bean.setComponentValue(o[2].toString());
			bean.setPartNumber(o[3].toString());
			bean.setManufractureName(o[4].toString());
			bean.setDescription(o[5].toString());
			bean.setComponentType(o[6].toString());
			bean.setPackages(o[7].toString());
			bean.setTovRating(o[8].toString());
			bean.setUnit(o[9].toString());
			bean.setUnitPrice(Double.parseDouble(o[10].toString()));
			bean.setTaxName(o[11].toString());
			bean.setTaxPercentage(Double.parseDouble(o[12].toString()));
			bean.setCGST(Double.parseDouble(o[13].toString()));
			bean.setSGST(Double.parseDouble(o[14].toString()));
			bean.setDuty(Double.parseDouble(o[15].toString()));
			bean.setUnitPriceWithCustomduty(Double.parseDouble(o[16].toString()));
			
			venList.add(bean);

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return venList;

}





public void getDeleteCompCatList(String pkTempId) {

	System.out.println("In getRemoveVendorList Dao...");
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 Transaction transaction = null;
	 
	 try {
		
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		Query query = session.createSQLQuery("delete from compoent_category_details where pk_compoent_category_id="+pkTempId);
		query.executeUpdate();
		transaction.commit();
		System.out.println("Transaction Successful");
		} 
	 catch (Exception e) {
			e.printStackTrace();
		}
					
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }

	}





public void bulkSaveCompoentCategoryDetail(CompoentCategoryDetailsHibernate bean) {
		
		HibernateUtility hbu=null;
		Session session=null;
		Transaction transaction=null;
		try{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		transaction = session.beginTransaction();
		 
		session.save(bean);
		transaction.commit();
		//System.out.println("Successful");
		}
		
		catch (Exception e) {
		e.printStackTrace();
		}

		
	}


// ComponentCategory Bulk Upload by Namrata
public List getcompentCategoryDetailForBulkUpload(String componentCategory, String componentName, String componentValue, String partNumber, String manufractureName, String componentType, String packages, String tovRating,String componentSubCategory) {

	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 
	 Query query = session.createQuery("From CompoentCategoryDetailsHibernate where componentCategory = '"+componentCategory+"' AND componentName = '"+componentName+"' AND componentValue='"+componentValue+"' AND partNumber='"+partNumber+"' AND manufractureName='"+manufractureName+"' AND componentType='"+componentType+"' AND packages='"+packages+"' AND tovRating='"+tovRating+"' AND componentSubCategory='"+componentSubCategory+"' ");
	 list = query.list();
	}
		catch(Exception e){	
			e.printStackTrace();
	}
		finally
		{
				if(session!=null){
				hbu.closeSession(session);
			}
		}
	
return list;
}


public List getAllCompDetailForBulkUpload()
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from CompTypeDetailsHibernate");
	 list = query.list();
	}
		catch(Exception e){	
			e.printStackTrace();
	}
		finally
		{
				if(session!=null){
				hbu.closeSession(session);
			}
		}
	
return list;
}





public void updateCompTypeIdInBulkUpload(String componentName, Long compTypeId) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 Transaction transaction = null;
	 
	 try {
		
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		Query query = session.createSQLQuery("update compoent_category_details set fk_comp_type_id='"+compTypeId+"' where compoent_category="+componentName);
		query.executeUpdate();
		transaction.commit();
		System.out.println("Transaction Successful");
		} 
	 catch (Exception e) {
			e.printStackTrace();
		}
					
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }

	}


public Long getfkCompTypeIdForBulkUpload(String componentName) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 Transaction transaction = null;
	 Long fkCompId = null;
	 
	 try {
		
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		Query query = session.createSQLQuery("SELECT ccd.pk_comp_type_id From component_type_details as ccd WHERE component_type='"+componentName+"' ORDER BY pk_comp_type_id DESC LIMIT 1");
		fkCompId =Long.parseLong(query.uniqueResult().toString());
		transaction.commit();
		System.out.println("Transaction Successful");
		} 
	 catch (Exception e) {
			e.printStackTrace();
		}
					
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
	 return fkCompId;

	}





public List getAllTaxDetailForBulkUpload() {
	
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from TaxDetailsHibernate");
	 list = query.list();
	}
		catch(Exception e){	
			e.printStackTrace();
	}
		finally
		{
				if(session!=null){
				hbu.closeSession(session);
			}
		}
	
return list;
}





public void updateCompTaxIdInBulkUpload(Long compTaxId, String taxName) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 Transaction transaction = null;
	 
	 try {
		
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
		Query query = session.createSQLQuery("update compoent_category_details set fk_tax_type_id='"+compTaxId+"' where tax_name="+taxName);
		query.executeUpdate();
		transaction.commit();
		System.out.println("Transaction Successful");
		} 
	 catch (Exception e) {
			e.printStackTrace();
		}
					
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }

	}


public String[] CompoentCategoryListBulkUpload()
{
	HibernateUtility hbu=null;
	Session session=null;
	List<String> compList=null;
	String [] DataMessage = null;
	
	try 
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query=session.createSQLQuery("SELECT compoent_category from compoent_category_details GROUP BY compoent_category");
		compList = query.list();
		System.out.println("list Size:"+compList.size());
		
		String [] DataArray = new String[compList.size()];
		for(int i=0; i<compList.size();i++)
		{
			String category = compList.get(i);
			DataArray [i] = category;
		}
		
		System.out.println(DataArray);
		return DataArray;
	}
	catch (Exception e) 
	{ 
		e.printStackTrace();
	}
	finally
	{
		hbu.closeSession(session);
	}
	return DataMessage;
}




}