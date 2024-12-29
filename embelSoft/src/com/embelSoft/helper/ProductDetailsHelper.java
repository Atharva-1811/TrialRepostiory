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

import com.embelSoft.bean.GetProductDetailsBean;
import com.embelSoft.bean.GetVendorDetailsBean;
import com.embelSoft.bean.ProductBillingBeanNew;
import com.embelSoft.dao.AccessControlDao;
import com.embelSoft.dao.ProductDetailsDao;
import com.embelSoft.dao.VendorDetailsDao;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.hibernate.TaxDetailsHibernate;
import com.embelSoft.hibernate.UserDetailasNewHibernate;
import com.embelSoft.hibernate.VendorDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ProductDetailsHelper {
	
	public List getTaxDetailsForProductDetails(Long fkEmployeeid)
	{
		Map<Long, TaxDetailsHibernate> map = new HashMap<Long, TaxDetailsHibernate>();
		
		ProductDetailsDao Dao = new ProductDetailsDao();
		List<TaxDetailsHibernate> userList = Dao.getTaxDetailsForProductDetails(fkEmployeeid);
		return userList;
	}
	
	public void saveProductDetails(HttpServletRequest request,HttpServletResponse response) 
	{
		// TODO Auto-generated method stub
			System.out.println("In helper");
			
						
			String productName = request.getParameter("productName");
			String productCost = request.getParameter("productCost");
			String description = request.getParameter("description");
			String features = request.getParameter("features");
			String fkTaxTypeId = request.getParameter("fkEmployeeid");
			String taxType = request.getParameter("taxType");
			String taxPercentage = request.getParameter("taxPercentage");
			String CGST = request.getParameter("CGST");
			String SGST = request.getParameter("SGST");
			
			String hsnsac = request.getParameter("hsnsac");
			ProductDetailsHibernate hibernate = new ProductDetailsHibernate();				
			
			if(!"".equals(productName)){
				hibernate.setProductName(productName);
			}else{
				hibernate.setProductName("N/A");
			}
			if(!"".equals(productCost)){
				hibernate.setProductCost(Double.parseDouble(productCost));
			}else{
				hibernate.setProductCost(0d);
			}
			if(!"".equals(description)){
				hibernate.setDescription(description);
			}else{
				hibernate.setDescription("N/A");
			}
			if(!"".equals(features)){
				hibernate.setFeatures(features);
			}else{
				hibernate.setFeatures("N/A");
			}
			if(!"".equals(fkTaxTypeId)){
				hibernate.setFkTaxTypeId(Long.parseLong(fkTaxTypeId));
			}else{
				hibernate.setFkTaxTypeId(0l);
			}
			if(!"".equals(taxType)){
				hibernate.setTaxType(taxType);
			}else{
				hibernate.setTaxType("N/A");
			}
			
			if(!"".equals(hsnsac)){
				hibernate.setHsnsac(hsnsac);
			}else{
				hibernate.setHsnsac("0");
			}
			if(!"".equals(taxPercentage)){
				hibernate.setTaxPercentage(Double.parseDouble(taxPercentage));
			}else{
				hibernate.setTaxPercentage(0d);
			}
			if(!"".equals(CGST)){
				hibernate.setCGST(Double.parseDouble(CGST));
			}else{
				hibernate.setCGST(0d);
			}
			if(!"".equals(SGST)){
				hibernate.setSGST(Double.parseDouble(SGST));
			}else{
				hibernate.setSGST(0d);
			}
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
				
			ProductDetailsDao dao = new ProductDetailsDao();
			dao.saveProductDetails(hibernate);
				
	}
	
	//Product Details for edit
	public List getProductDetails(Long fk_product_id)
	{
		
		Map<Long, GetProductDetailsBean> map = new HashMap<Long, GetProductDetailsBean>();

		ProductDetailsDao dao = new ProductDetailsDao();
		List<GetProductDetailsBean> ven1List = dao.getProductDetailForEdit(fk_product_id);

		System.out.println("Size in Helper------ : "+ven1List.size());
		
		return ven1List;
	}
	
	//Product Details for quotation	
	public List getProductDetailsForQuotation(Long fk_product_id)
	{
		
		Map<Long, GetProductDetailsBean> map = new HashMap<Long, GetProductDetailsBean>();

		ProductDetailsDao dao = new ProductDetailsDao();
		List<GetProductDetailsBean> ven1List = dao.getProductDetailForQuotation(fk_product_id);

		System.out.println("Size in Helper------ : "+ven1List.size());
		
		return ven1List;
	}	
	
	//updateProductDetails
	public void updateProductDetails(HttpServletRequest request,HttpServletResponse response) 
	{		
		String fkProductid = request.getParameter("fkProductid");
		String productName = request.getParameter("productName");		
		String productNewName = request.getParameter("productNewName"); 
		//String enquiryDate = request.getParameter("enquiryDate");
		String hsnsac = request.getParameter("hsnsac");
		String productCost = request.getParameter("cost");
		String description = request.getParameter("description");
		String features = request.getParameter("features");		
		String fkTaxTypeId = request.getParameter("fkTaxTypeId");
		String taxType = request.getParameter("taxType");
		String taxPercentage = request.getParameter("taxPercentage");
		String CGST = request.getParameter("CGST");
		String SGST = request.getParameter("SGST");
		
		System.out.println("Id from JSP  :  "+fkProductid);
		System.out.println("Name from JSP  :  "+productName);		
		
		ProductDetailsDao dao = new ProductDetailsDao();
		List venList = dao.getAllProductNames();
		
		System.out.println("SIZE FROM DAO   : "+venList.size());		
		
		 for(int i=0;i<venList.size();i++)
		 {
			 ProductDetailsHibernate vdh2 = (ProductDetailsHibernate) venList.get(i);
			 
			 Long venPkId = vdh2.getPkProductDetailsId();
			 String venName = vdh2.getProductName();
			 
			 if(venName.equals(productName) && venPkId.equals(Long.parseLong(fkProductid)))
			 {
				 	HibernateUtility hbu = HibernateUtility.getInstance();
					Session session = hbu.getHibernateSession();
					Transaction transaction = session.beginTransaction();
				 
					ProductDetailsHibernate hibernate = (ProductDetailsHibernate) session.get(ProductDetailsHibernate.class,new Long(venPkId));					
					
					
					if(!"".equals(productNewName)){
						hibernate.setProductName(productNewName);
					}else{
						hibernate.setProductName("N/A");
					}
					if(!"".equals(productCost)){
						hibernate.setProductCost(Double.parseDouble(productCost));
					}else{
						hibernate.setProductCost(0d);
					}
					if(!"".equals(description)){
						hibernate.setDescription(description);
					}else{
						hibernate.setDescription("N/A");
					}
					if(!"".equals(features)){
						hibernate.setFeatures(features);
					}else{
						hibernate.setFeatures("N/A");
					}
					if(!"".equals(fkTaxTypeId)){
						hibernate.setFkTaxTypeId(Long.parseLong(fkTaxTypeId));
					}else{
						hibernate.setFkTaxTypeId(0l);
					}
					if(!"".equals(taxType)){
						hibernate.setTaxType(taxType);
					}else{
						hibernate.setTaxType("N/A");
					}
					if(!"".equals(taxPercentage)){
						hibernate.setTaxPercentage(Double.parseDouble(taxPercentage));
					}else{
						hibernate.setTaxPercentage(0d);
					}
					if(!"".equals(CGST)){
						hibernate.setCGST(Double.parseDouble(CGST));
					}else{
						hibernate.setCGST(0d);
					}
					if(!"".equals(SGST)){
						hibernate.setSGST(Double.parseDouble(SGST));
					}else{
						hibernate.setSGST(0d);
					}
					if(!"".equals(hsnsac)){
						hibernate.setHsnsac(hsnsac);
					}else{
						hibernate.setHsnsac("0");
					}
					
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
					
					session.saveOrUpdate(hibernate);
					transaction.commit();
				
					break;
			 }
		 }	
	}
		
	public List getAllProduct(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ProductDetailsHibernate> map = new HashMap<Long, ProductDetailsHibernate>();
		ProductDetailsDao dao = new ProductDetailsDao();
		List<ProductDetailsHibernate> exp1List = dao.getProductList();
		
		System.out.println("IN HELPER--------------==== :  "+exp1List.size());
		return exp1List;
	}
	
	
	public Map getAllSupplerBillNo(String fkClientId) {
		int count = 1;

		ProductDetailsDao dao = new ProductDetailsDao();
		List list= dao.getAllBillNoAgaintsSupller(fkClientId);

		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			
			ProductBillingBeanNew bean=new ProductBillingBeanNew();
			bean.setBillNo(o[1].toString());
			bean.setPkProductBillId(Long.parseLong(o[0].toString()));
			bean.setAddress(o[2].toString());
			bean.setCuriorNo(o[3].toString());
			bean.setCuriorName(o[4].toString());
			
			System.out.println("***************"+o[0]);
			map.put(count,bean);
			count++;
		}
		return map;
	}
	
	
	
}
