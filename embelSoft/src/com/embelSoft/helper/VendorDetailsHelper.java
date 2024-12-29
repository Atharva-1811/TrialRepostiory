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

import com.embelSoft.bean.GetVendorDetailsBean;
import com.embelSoft.dao.VendorDetailsDao;
import com.embelSoft.hibernate.PurchaseHibernate;
import com.embelSoft.hibernate.VendorDetailsBean;
import com.embelSoft.hibernate.VendorDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class VendorDetailsHelper {
	public void doVendorDetails(HttpServletRequest request,HttpServletResponse response) 
	{
		// TODO Auto-generated method stub
			System.out.println("In helper");

			String vendorName = request.getParameter("vendorName");
			String enquiryDate = request.getParameter("enquiryDate");
			String contactNo = request.getParameter("contactNo");
			String emailId = request.getParameter("emailId");
			String address = request.getParameter("address");
			String zipCode = request.getParameter("zipCode");
			String country = request.getParameter("country");
			String state = request.getParameter("state");
			String PANNum = request.getParameter("PANNum");
			String CIMNo = request.getParameter("CIMNo");
			String gstInNo = request.getParameter("gstInNo");
			
			
			String alternateContactNo = request.getParameter("alternateContactNo");
			String contactPersonName = request.getParameter("contactPersonName");
			String companyName = request.getParameter("companyName");
			String emengencyContactNo = request.getParameter("emengencyContactNo");
			String companyAddress = request.getParameter("companyAddress");
			//String permanentAddress = request.getParameter("permanentAddress");
			String companyNumber = request.getParameter("companyNumber");
			
			VendorDetailsHibernate vdh = new VendorDetailsHibernate();
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				
				Date dateOfBirth = null;
				try{
					dateOfBirth = format.parse(enquiryDate);
					vdh.setEnquiryDate(dateOfBirth);
					System.out.println(" date dateOfBirth parsing" +enquiryDate);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}
				
				
				vdh.setVendorName(vendorName);
				vdh.setContactNo(Long.parseLong(contactNo));
				vdh.setAddress(address);
				vdh.setEmailId(emailId);
				vdh.setContactPersonName(contactPersonName);
				vdh.setCompanyNumber(Long.parseLong(companyNumber));
				vdh.setPANNum(PANNum);
			
				if(!"".equals(PANNum)){
					vdh.setPANNum(PANNum);

				}else{
					vdh.setPANNum("N/A");
				}
				
				
			
				if(!"".equals(companyName)){
					vdh.setCompanyName(companyName);

				}else{
					vdh.setCompanyName("N/A");
				}
				
				
				
				
				if(!"".equals(companyAddress)){
					vdh.setCompanyAddress(companyAddress);

				}else{
					vdh.setCompanyAddress("N/A");
				}
				
				
				if(!"".equals(alternateContactNo)){
					 vdh.setAlternateContactNo(alternateContactNo);

				}else{
					 vdh.setAlternateContactNo("N/A");
				}
				
				if(!"".equals(emengencyContactNo)){
					vdh.setEmengencyContactNo(emengencyContactNo);

				}else{
					vdh.setEmengencyContactNo("N/A");
				}
				
/*				if(!"".equals(permanentAddress)){
					vdh.setPermanentAddress(permanentAddress);

				}else{
					
					vdh.setPermanentAddress("N/A");
				}*/
				
				if(!"".equals(zipCode)){
					vdh.setZipCode(zipCode);

				}else{
					
					vdh.setZipCode("N/A");

				}
				if(!"".equals(country)){
					vdh.setCountry(country);

				}else{
					vdh.setCountry("N/A");

				}
				if(!"".equals(state)){
					vdh.setState(state);

				}else{
					vdh.setState("N/A");
					
				}
				if(!"".equals(CIMNo)){
					vdh.setCIMNo(CIMNo);

				}else{
					
					vdh.setCIMNo("N/A");

				}
				if(!"".equals(gstInNo)){
					vdh.setGstInNo(gstInNo);
				}else{
					
					vdh.setGstInNo("N/A");
				}
		
				
				/*vdh.setAlternateContactNo(Long.parseLong(alternateContactNo));
				vdh.setEmengencyContactNo(Long.parseLong(emengencyContactNo));
				vdh.setPermanentAddress(permanentAddress);
				vdh.setZipCode(Long.parseLong(zipCode));
				vdh.setCountry(country);
				vdh.setState(state);
				vdh.setCIMNo(CIMNo);
				vdh.setGstInNo(gstInNo);*/
				
				VendorDetailsDao cdo = new VendorDetailsDao();
				cdo.valVendorDetail(vdh);
				
	}
	
	
	public List getVendor(HttpServletRequest request,HttpServletResponse response)
	{
			
	
		System.out.println("int Helper of vendor detailas. . . . ");
			
		VendorDetailsDao sdd3 = new VendorDetailsDao();
		
		List sList4 = sdd3.getAllVendorName();
		
		
		System.out.println("size-------------------------------------. . . . "+sList4.size());
	//	VendorDetailBean v1 = new VendorDetailBean();
		
		/*for(VendorDetailBean v : sList4)
		{
		//	String name = v.getVendorName();
			System.out.println("-=-=-=-=-= "+v.getVendorName());
			
			//v.setVendorName(name);
			//System.out.println("-=-=-=-=-= "+name);
		}
		*/
		
		return sList4;
		
	}
	
	//Get Vendor Name fore DropDown
	public Map getVendorName() {
		int count = 1;
		
		VendorDetailsDao dao=new VendorDetailsDao();
		List list= dao.getAllVendorName();

		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);

			VendorDetailsBean bean=new VendorDetailsBean();
			
			bean.setVendorId(o[0].toString());
			bean.setVendorName(o[1].toString());
			bean.setGstNo(o[2].toString());
			
			System.out.println("***************"+o[0]);
			map.put(count,bean);
			count++;
		}
		return map;
	}
	
	public List getAllVendor(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, VendorDetailsHibernate> map = new HashMap<Long, VendorDetailsHibernate>();
		VendorDetailsDao dao = new VendorDetailsDao();
		List<VendorDetailsHibernate> exp1List = dao.getVendorList();
		
		System.out.println("IN HELPER--------------==== :  "+exp1List.size());
		return exp1List;
	}
	
	
	//Vendor Detailas for edit
	
	public List getVendorDetails(Long fk_vendor_id)
	{
		
		Map<Long, GetVendorDetailsBean> map = new HashMap<Long, GetVendorDetailsBean>();

		VendorDetailsDao dao = new VendorDetailsDao();
		List<GetVendorDetailsBean> ven1List = dao.getVendorDetailForEdit(fk_vendor_id);

		System.out.println("Size in Helper------ : "+ven1List.size());
		
		return ven1List;

	}
	
	public void updateVendorDetails(HttpServletRequest request,HttpServletResponse response) 
	{
		
		String fkVendorid = request.getParameter("fkVendorid");
		String vendorName = request.getParameter("vendorName");
		
		String vendorNewName = request.getParameter("vendorNewName"); 
		String enquiryDate = request.getParameter("enquiryDate");
		String contactNo = request.getParameter("contactNo");
		String emailId = request.getParameter("emailId");
		String address = request.getParameter("address");
		String zipCode = request.getParameter("zipCode");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		String PANNum = request.getParameter("PANNum");
		String CIMNo = request.getParameter("CIMNo");
		String gstInNo = request.getParameter("gstInNo");
		String alternateContactNo = request.getParameter("alternateContactNo");
		String contactPersonName = request.getParameter("contactPersonName");
		String companyName = request.getParameter("companyName");
		String emengencyContactNo = request.getParameter("emengencyContactNo");
		String companyAddress = request.getParameter("companyAddress");
		//String permanentAddress = request.getParameter("permanentAddress");
		String companyNumber = request.getParameter("companyNumber");

		System.out.println("Id from JSP  :  "+fkVendorid);
		System.out.println("Name from JSP  :  "+vendorName);
		
		
		VendorDetailsDao dao = new VendorDetailsDao();
		List venList = dao.getAllVendorNames();
		
		System.out.println("SIZE FROM DAO   : "+venList.size());
		
		
		 for(int i=0;i<venList.size();i++)
		 {
			 VendorDetailsHibernate vdh2 = (VendorDetailsHibernate) venList.get(i);
			 
			 Long venPkId = vdh2.getPkVendorDetailsId();
			 String venName = vdh2.getVendorName();
		
			 
			 if(venName.equals(vendorName) && venPkId.equals(Long.parseLong(fkVendorid)))
			 {
				 
				 	HibernateUtility hbu = HibernateUtility.getInstance();
					Session session = hbu.getHibernateSession();
					Transaction transaction = session.beginTransaction();
				 
					VendorDetailsHibernate purchase = (VendorDetailsHibernate) session.get(VendorDetailsHibernate.class,new Long(venPkId));
				 
					
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					
					
					Date dateOfBirth = null;
					try{
						dateOfBirth = format.parse(enquiryDate);
						purchase.setEnquiryDate(dateOfBirth);
						System.out.println(" date dateOfBirth parsing" +enquiryDate);
					}
					catch(Exception e){
						e.printStackTrace();
						System.out.println("Exception in date parsing");
					}
					
					
					purchase.setVendorName(vendorNewName);
					purchase.setContactNo(Long.parseLong(contactNo));
					purchase.setAddress(address);
					purchase.setEmailId(emailId);
					purchase.setCompanyName(companyName);
					purchase.setCompanyAddress(companyAddress);
					purchase.setContactPersonName(contactPersonName);
					purchase.setCompanyNumber(Long.parseLong(companyNumber));
					purchase.setPANNum(PANNum);
					
					
					
					if(!"".equals(alternateContactNo)){
						purchase.setAlternateContactNo(alternateContactNo);

					}else{
						purchase.setAlternateContactNo("N/A");
					}
					
					if(!"".equals(emengencyContactNo)){
						purchase.setEmengencyContactNo(emengencyContactNo);

					}else{
						purchase.setEmengencyContactNo("N/A");
					}
					/*if(!"".equals(permanentAddress)){
						purchase.setPermanentAddress(permanentAddress);

					}else{
						
						purchase.setPermanentAddress("N/A");
					}*/
					
					if(!"".equals(zipCode)){
						purchase.setZipCode(zipCode);

					}else{
						
						purchase.setZipCode("N/A");

					}
					if(!"".equals(country)){
						purchase.setCountry(country);

					}else{
						purchase.setCountry("N/A");

					}
					if(!"".equals(state)){
						purchase.setState(state);

					}else{
						purchase.setState("N/A");
						
					}
					if(!"".equals(CIMNo)){
						purchase.setCIMNo(CIMNo);

					}else{
						
						purchase.setCIMNo("N/A");

					}
					if(!"".equals(gstInNo)){
						purchase.setGstInNo(gstInNo);
					}else{
						
						purchase.setGstInNo("N/A");
					}
			
					session.update(purchase);
					transaction.commit();
				
					break;

				 
					
			 }
			 
		 
		 }
		
	}


	public void getDeleteVendorList(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("In helper");
		
		String pkTempId= request.getParameter("pkTempId");
		
		VendorDetailsDao cdo = new VendorDetailsDao();
		cdo.getDeleteVendorList(pkTempId);
		
	}
		

}
