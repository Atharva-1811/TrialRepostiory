package com.embelSoft.helper;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.GetClientEnquiryDetailsBean;
import com.embelSoft.bean.GetProductDetailsBean;
import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.dao.ClientEnquiryDao;
import com.embelSoft.dao.ProductDetailsDao;
import com.embelSoft.dao.VendorDetailsDao;
import com.embelSoft.hibernate.ClientEnquiryBean;
import com.embelSoft.hibernate.ClientEnquiryHibernate;
import com.embelSoft.hibernate.EnquiryFormHibernate;
import com.embelSoft.hibernate.VendorDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

public class ClientEnquiryHelper {

	public void doClientDetails(HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("In helper");


		String firstName = request.getParameter("firstName");
		//String middleName = request.getParameter("middleName");
		//String lastName = request.getParameter("lastName");
		String enquiryDate = request.getParameter("enquiryDate");
		String contactNo = request.getParameter("contactNo");
		String emailId = request.getParameter("emailId");

		//String referenceBy = request.getParameter("referenceBy");
		//String comment = request.getParameter("comment");
		//String uploadFile = request.getParameter("uploadFile");

		String businessName = request.getParameter("businessName");
		String businessAddress = request.getParameter("businessAddress");
		String alternativeContactNo = request.getParameter("alternativeContactNo");
		//String productName = request.getParameter("productName");

		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");

		String GstNo = request.getParameter("gst");
		/*	
		System.out.println("-------------------------firstName------------------------ ::  "+firstName);
		System.out.println("---------------------------middleName---------------------- ::  "+middleName);
		System.out.println("--------------------------lastName----------------------- ::  "+lastName);
		System.out.println("--------------------------enquiryDate----------------------- ::  "+enquiryDate);
		System.out.println("--------------------------contactNo----------------------- ::  "+contactNo);
		System.out.println("----------------------------emailId--------------------- ::  "+emailId);
		System.out.println("--------------------------referenceBy----------------------- ::  "+referenceBy);
		System.out.println("--------------------------comment----------------------- ::  "+comment);
		System.out.println("-----------------------uploadFile-------------------------- ::  "+uploadFile);
		System.out.println("------------------------businessName------------------------- ::  "+businessName);
		System.out.println("-----------------------businessAddress-------------------------- ::  "+businessAddress);
		System.out.println("----------------------alternativeContactNo--------------------------- ::  "+alternativeContactNo);
		System.out.println("---------------------productName---------------------------- ::  "+productName);
		System.out.println("-----------------------city-------------------------- ::  "+city);
		System.out.println("------------------------state------------------------- ::  "+state);
		System.out.println("------------------------zipcode------------------------- ::  "+zipcode);
		System.out.println("----------------------country--------------------------- ::  "+country);

		 */
		/*
		 * File file = new File(uploadFile); byte[] imageData = new byte[(int)
		 * file.length()];
		 * 
		 * try { FileInputStream fileInputStream = new FileInputStream(file);
		 * fileInputStream.read(imageData); fileInputStream.close(); } catch (Exception
		 * e) { e.printStackTrace(); }
		 */

		ClientEnquiryHibernate ceh = new ClientEnquiryHibernate();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Date dateOfBirth = null;
		try{
			dateOfBirth = format.parse(enquiryDate);
			ceh.setEnquiryDate(dateOfBirth);
			System.out.println(" date dateOfBirth parsing" +enquiryDate);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}


		ceh.setFirstName(firstName);
		ceh.setMiddleName("N/A");
		ceh.setLastName("N/A");
		ceh.setBusinessName(businessName);
		ceh.setBusinessAddress(businessAddress);

		//ceh.setProductName(productName);
		ceh.setEmailId(emailId);

		//		ceh.setTaskPic(imageData);


		if(!"".equals(contactNo)){
			ceh.setContactNo(Long.parseLong(contactNo));

		}else{
			ceh.setContactNo(Long.parseLong("00"));

		}


		if(!"".equals(city)){
			ceh.setCity(city);

		}else{
			ceh.setCity("N/A");

		}

		if(!"".equals(state)){
			ceh.setState(state);

		}else{
			ceh.setState("N/A");

		}

		if(!"".equals(zipcode)){
			ceh.setZipCode(zipcode);

		}else{
			ceh.setZipCode("N/A");

		}

		if(!"".equals(country)){
			ceh.setCountry(country);

		}else{
			ceh.setCountry("N/A");

		}

		if(!"".equals(alternativeContactNo)){
			ceh.setAlternativeContactNo(alternativeContactNo);

		}else{
			ceh.setAlternativeContactNo("00");

		}

		if(!"".equals(GstNo)){
			ceh.setGstNo(GstNo);
		}else{
			ceh.setGstNo("N/A");
		}



		/*
		 * if(!"".equals(middleName)){ ceh.setMiddleName(middleName); }else{
		 * ceh.setMiddleName("N/A"); }
		 * 
		 * if(!"".equals(referenceBy)){ ceh.setReferenceBy(referenceBy);
		 * 
		 * }else{ ceh.setReferenceBy("N/A");
		 * 
		 * }
		 * 
		 * if(!"".equals(comment)){ ceh.setComment(comment);
		 * 
		 * }else{ ceh.setComment("N/A");
		 * 
		 * }
		 */




		/*

				ceh.setCity(city);
				ceh.setState(state);
				ceh.setZipCode(Long.parseLong(zipcode));
				ceh.setCountry(country);
				ceh.setAlternativeContactNo(Long.parseLong(alternativeContactNo));
				ceh.setMiddleName(middleName);
				ceh.setReferenceBy(referenceBy);
				ceh.setComment(comment);

		 */



		ClientEnquiryDao cdo = new ClientEnquiryDao();
		cdo.valClientEnqiry(ceh);

	}

	public List getClientDetail(HttpServletRequest request, HttpServletResponse response) {
		String clientName = request.getParameter("clientName");
		String fisDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");

		Map<Long, GetClientEnquiryDetailsBean> map = new HashMap<Long, GetClientEnquiryDetailsBean>();

		ClientEnquiryDao dao = new ClientEnquiryDao();
		List<GetClientEnquiryDetailsBean> exp1List = dao.getClientDetail(fisDate, endDate, clientName);

		return exp1List;

	}


	public List getClient(HttpServletRequest request,HttpServletResponse response)
	{
		ClientEnquiryDao sdd3 = new ClientEnquiryDao();
		List sList4 = sdd3.getAllClientName();

		return sList4;
	}


	public Map getClientName() {
		int count = 1;

		ClientEnquiryDao dao=new ClientEnquiryDao();
		List list= dao.getAllClientName();

		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);

			ClientEnquiryBean bean=new ClientEnquiryBean();
			bean.setClientId(o[0].toString());
			bean.setFirstName(o[1].toString());
			bean.setLastName(o[2].toString());
			map.put(count,bean);
			count++;
		}
		return map;
	}


	public List getAllClient(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ClientEnquiryHibernate> map = new HashMap<Long, ClientEnquiryHibernate>();
		ClientEnquiryDao dao = new ClientEnquiryDao();
		List<ClientEnquiryHibernate> exp1List = dao.getClientEnquiryList();

		return exp1List;
	}

	//Vendor Details for edit

	public List getClientDetails(Long fk_Client_id)
	{

		Map<Long, GetClientEnquiryDetailsBean> map = new HashMap<Long, GetClientEnquiryDetailsBean>();

		ClientEnquiryDao dao = new ClientEnquiryDao();
		List<GetClientEnquiryDetailsBean> cli1List = dao.getClientDetailForEdit(fk_Client_id);

		System.out.println("Size in Helper------ : "+cli1List.size());

		return cli1List;

	}


	// Updsate Client Details
	public void updateClientDetails(HttpServletRequest request,HttpServletResponse response) 
	{

		String clientId = request.getParameter("fkClientid");
		String clientFullName = request.getParameter("clientFullName");

		String firstName = request.getParameter("firstName");
		//String middleName = request.getParameter("middleName");
		//String lastName = request.getParameter("lastName");
		String enquiryDate = request.getParameter("enquiryDate");
		String contactNo = request.getParameter("contactNo");
		String emailId = request.getParameter("emailId");
		String address = request.getParameter("address");
		//	String referenceBy = request.getParameter("referenceBy");
		//String comment = request.getParameter("comment");
		//String uploadFile = request.getParameter("uploadFile");

		String businessName = request.getParameter("businessName");
		String businessAddress = request.getParameter("businessAddress");
		String alternativeContactNo = request.getParameter("alternativeContactNo");
		//String productName = request.getParameter("productName");

		String GstNo = request.getParameter("gst");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");

		/*
		  File file = new File(uploadFile);
			byte[] imageData = new byte[(int) file.length()];

			try {
			    FileInputStream fileInputStream = new FileInputStream(file);
			    fileInputStream.read(imageData);
			    fileInputStream.close();
			} catch (Exception e) {
			    e.printStackTrace();
			}

		 */

		ClientEnquiryDao dao = new ClientEnquiryDao();
		List cliList = dao.getAllClient();


		for(int i=0;i<cliList.size();i++)
		{
			ClientEnquiryHibernate bean =  (ClientEnquiryHibernate) cliList.get(i);

			Long pk_Client_Id = bean.getPkClientEnquiryId();
			String fName = bean.getFirstName();
			//String lname = bean.getLastName();

			String fillClientNameFromDB = fName;

			if(fillClientNameFromDB.equals(clientFullName) && pk_Client_Id.equals(Long.parseLong(clientId)))
			{

				HibernateUtility hbu = HibernateUtility.getInstance();
				Session session = hbu.getHibernateSession();
				Transaction transaction = session.beginTransaction();


				ClientEnquiryHibernate ch = (ClientEnquiryHibernate) session.get(ClientEnquiryHibernate.class,new Long(pk_Client_Id));

				/*
				 * File file = new File(uploadFile); byte[] imageData = new byte[(int)
				 * file.length()];
				 * 
				 * try { FileInputStream fileInputStream = new FileInputStream(file);
				 * fileInputStream.read(imageData); fileInputStream.close(); } catch (Exception
				 * e) { e.printStackTrace(); }
				 */

				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

				Date dateOfBirth = null;
				try{
					dateOfBirth = format.parse(enquiryDate);
					ch.setEnquiryDate(dateOfBirth);
					System.out.println(" date dateOfBirth parsing" +enquiryDate);
				}
				catch(Exception e){
					e.printStackTrace();
					System.out.println("Exception in date parsing");
				}


				ch.setFirstName(firstName);
				//ch.setLastName(lastName);
				ch.setBusinessName(businessName);

				System.out.println("businessName"+ch.getBusinessName());

				ch.setBusinessAddress(businessAddress);
				ch.setContactNo(Long.parseLong(contactNo));
				//ch.setProductName(productName);
				ch.setEmailId(emailId);
				ch.setAddress(address);
				//ch.setTaskPic(imageData);


				if(!"".equals(GstNo)){
					ch.setGstNo(GstNo);;

				}else{
					ch.setGstNo("N/A");

				}

				if(!"".equals(city)){
					ch.setCity(city);

				}else{
					ch.setCity("N/A");

				}

				if(!"".equals(state)){
					ch.setState(state);

				}else{
					ch.setState("N/A");

				}

				if(!"".equals(zipcode)){
					ch.setZipCode(zipcode);

				}else{
					ch.setZipCode("N/A");

				}

				if(!"".equals(country)){
					ch.setCountry(country);

				}else{
					ch.setCountry("N/A");

				}

				if(!"".equals(alternativeContactNo)){
					ch.setAlternativeContactNo(alternativeContactNo);

				}else{
					ch.setAlternativeContactNo("N/A");

				}


				/*
				 * if(!"".equals(middleName)){ ch.setMiddleName(middleName); }else{
				 * ch.setMiddleName("N/A"); }
				 * 
				 * 
				 * 
				 * if(!"".equals(referenceBy)){ ch.setReferenceBy(referenceBy);
				 * 
				 * }else{ ch.setReferenceBy("N/A");
				 * 
				 * }
				 * 
				 * if(!"".equals(comment)){ ch.setComment(comment);
				 * 
				 * }else{ ch.setComment("N/A");
				 * 
				 * }
				 */

				session.saveOrUpdate(ch);
				transaction.commit();

				break;


			}
		}

	}



	public void addEnquiryFormDetails(HttpServletRequest request,HttpServletResponse response) {

		System.out.println("In ClientEnquiryHelper, addEnquiryFormDetails()");

		String prsnName = request.getParameter("prsnName");
		String enquiryDate = request.getParameter("enquiryDate");
		String contactNo = request.getParameter("contactNo");
		String alternativeContactNo = request.getParameter("alternativeContactNo");
		String businessName = request.getParameter("businessName");
		String businessAddress = request.getParameter("businessAddress");
		String emailId = request.getParameter("emailId");
		String enqrdFor = request.getParameter("enqrdFor");
		String description = request.getParameter("description");

		EnquiryFormHibernate ceh = new EnquiryFormHibernate();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Date dateOfBirth = null;
		try{
			dateOfBirth = format.parse(enquiryDate);
			ceh.setEnquiryDate(dateOfBirth);
			System.out.println("enquiryDate parsing" +enquiryDate);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}


		ceh.setPrsnName(prsnName);
		ceh.setBusinessName(businessName);
		ceh.setBusinessAddress(businessAddress);
		ceh.setEmailId(emailId);


		if(!"".equals(contactNo)){
			ceh.setContactNo(Long.parseLong(contactNo));

		}else{
			ceh.setContactNo(Long.parseLong("00"));

		}

		if(!"".equals(alternativeContactNo)){
			ceh.setAlternativeContactNo(Long.parseLong(alternativeContactNo));

		}else{
			ceh.setAlternativeContactNo(Long.parseLong("00"));

		}

		if(!"".equals(enqrdFor)){
			ceh.setEnqrdFor(enqrdFor);

		}else{
			ceh.setEnqrdFor("NA");

		}

		if(!"".equals(description)){
			ceh.setDescription(description);

		}else{
			ceh.setDescription("NA");

		}



		ClientEnquiryDao cdo = new ClientEnquiryDao();
		cdo.addEnquiryFormDetails(ceh);

	}



	public List getAllEnquiryListDateWise(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ClientEnquiryHibernate> map = new HashMap<Long, ClientEnquiryHibernate>();
		ClientEnquiryDao dao = new ClientEnquiryDao();
		String startDate = request.getParameter("firstDate");
		String endDate = request.getParameter("endDate");
		List<ClientEnquiryHibernate> exp1List = dao.getAllEnquiryFormListDateWise(startDate, endDate);

		return exp1List;
	}
	
	public List getAllEnquiryList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ClientEnquiryHibernate> map = new HashMap<Long, ClientEnquiryHibernate>();
		ClientEnquiryDao dao = new ClientEnquiryDao();
		List<ClientEnquiryHibernate> exp1List = dao.getAllEnquiryFormList();

		return exp1List;
	}



	//Product Details for edit
	public List fetchPersonInfo(Long fkprsnid)
	{

		Map<Long, EnquiryFormHibernate> map = new HashMap<Long, EnquiryFormHibernate>();

		ClientEnquiryDao dao = new ClientEnquiryDao();
		List<EnquiryFormHibernate> ven1List = dao.fetchPersonInfo(fkprsnid);

		System.out.println("Result Size in Helper------ : "+ven1List.size());

		return ven1List;
	}

	public void updateEnquiryFormDetails(HttpServletRequest request, HttpServletResponse response) {

		String pkid = request.getParameter("pkid");
		System.out.println("Id from JSP  :  "+pkid);

		String prsnName = request.getParameter("prsnName");
		String enquiryDate = request.getParameter("enquiryDate");
		String contactNo = request.getParameter("contactNo"); 
		String alternativeContactNo = request.getParameter("alternativeContactNo");
		String businessName = request.getParameter("businessName");
		String businessAddress = request.getParameter("businessAddress");
		String emailId = request.getParameter("emailId");
		String enqrdFor = request.getParameter("enqrdFor");
		String description = request.getParameter("description");


		HibernateUtility hbu = HibernateUtility.getInstance();
		Session session = hbu.getHibernateSession();
		Transaction transaction = session.beginTransaction();

		Long pkid1 = Long.parseLong(pkid);

		EnquiryFormHibernate eqf = (EnquiryFormHibernate) session.get(EnquiryFormHibernate.class,new Long(pkid1));

		Date updtdate = new Date();
		eqf.setUpdatedDate(updtdate);
		System.out.println(" updtdate parsing" +updtdate);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Date dateOfBirth = null;
		try{
			dateOfBirth = format.parse(enquiryDate);
			eqf.setEnquiryDate(dateOfBirth);
			System.out.println("enquiryDate parsing" +enquiryDate);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}

		eqf.setPrsnName(prsnName);

		if(!"".equals(contactNo)){
			eqf.setContactNo(Long.parseLong(contactNo));

		}else{
			eqf.setContactNo(Long.parseLong("0"));
		}

		if(!"".equals(alternativeContactNo)){
			eqf.setAlternativeContactNo(Long.parseLong(alternativeContactNo));

		}else{
			eqf.setAlternativeContactNo(Long.parseLong("0"));
		}

		if(!"".equals(businessName)){
			eqf.setBusinessName(businessName);

		}else{
			eqf.setBusinessName("NA");
		}

		if(!"".equals(businessAddress)){
			eqf.setBusinessAddress(businessAddress);

		}else{
			eqf.setBusinessAddress("NA");
		}

		if(!"".equals(emailId)){
			eqf.setEmailId(emailId);

		}else{
			eqf.setEmailId("NA");
		}

		if(!"".equals(enqrdFor)){
			eqf.setEnqrdFor(enqrdFor);

		}else{
			eqf.setEnqrdFor("NA");
		}

		if(!"".equals(description)){
			eqf.setDescription(description);

		}else{
			eqf.setDescription("NA");
		}

		session.update(eqf);
		transaction.commit();

	}


}

