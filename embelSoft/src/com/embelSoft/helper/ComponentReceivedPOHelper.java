package com.embelSoft.helper;

import java.io.StringReader;
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
import org.json.JSONArray;

import com.embelSoft.bean.BillOfMaterialBean;
import com.embelSoft.bean.CompTypeDetailsBean;
import com.embelSoft.bean.CompoentCategoryDetailBean;
import com.embelSoft.bean.ComponentReceivedPOBean;
import com.embelSoft.dao.BillOfMaterialDao;
import com.embelSoft.dao.ComponentCategoryDetailsDao;
import com.embelSoft.dao.ComponentReceivedPODao;
import com.embelSoft.dao.ComponentStockDao;
import com.embelSoft.hibernate.CompoentCategoryDetailsHibernate;
import com.embelSoft.hibernate.ComponentReceivedPOHibernate;
import com.embelSoft.hibernate.ComponentStockHibernate;
import com.embelSoft.hibernate.ProductDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;




public class ComponentReceivedPOHelper {
	private String componentCategory="";
	
	private String componentValue="";
	private String partNumber="";
	private String manufractureName="";
	private String description="";
	private String componentType="";
	private String packages="";
	private String tovRating;
	private String unit="";
	private Double unitPriceWithCustomduty=0d;
	private Double taxPercentage=0d;
	private Long fkcompID=0l;
	private Long fkcompNameId=0l;
	
	//getGridAsForCompTypeForCompReceivedPO
	public CompoentCategoryDetailBean getGridAsForCompTypeForCompReceivedPO(String fkCompoentid,String componentName)
	{
		CompoentCategoryDetailBean bean = new CompoentCategoryDetailBean();
		
		System.out.println("IN Helper");
		System.out.println(fkCompoentid+componentName+"compoentname and id in helper");
		
		
		Long fkCompoentid1=Long.parseLong(fkCompoentid);
		
		ComponentReceivedPODao dao=new ComponentReceivedPODao();
		List list=dao.getCompoenetCategorydata(fkCompoentid1);
		for (int i = 0; i < list.size(); i++) {
			CompoentCategoryDetailsHibernate hibernate = (CompoentCategoryDetailsHibernate) list.get(i);
			fkcompNameId=hibernate.getPkComponentCategoryDetailsId();
			componentCategory=hibernate.getComponentCategory();
			componentValue=hibernate.getComponentValue();
			partNumber=hibernate.getPartNumber();
			manufractureName=hibernate.getManufractureName();
			description=hibernate.getDescription();
			componentType=hibernate.getComponentType();
			packages=hibernate.getPackages();
			tovRating=hibernate.getTovRating();
			
			unit=hibernate.getUnit().toString();
			//unitPrice=hibernate.getUnitPrice();
			taxPercentage=hibernate.getTaxPercentage();
			System.out.println(hibernate.getTaxPercentage());
			
			fkcompID=hibernate.getFkCompTypeId();
			unitPriceWithCustomduty=hibernate.getUnitPriceWithCustomduty();
		}
		bean.setComponentName(componentName);
		bean.setPkComponentCategoryDetailsId(Long.parseLong(fkCompoentid));
		
		bean.setPkComponentCategoryDetailsId(fkcompNameId);
		bean.setComponentCategory(componentCategory);
		bean.setComponentValue(componentValue);
		bean.setPartNumber(partNumber);
		bean.setManufractureName(manufractureName);
		bean.setDescription(description);
		bean.setPackages(packages);
		bean.setComponentType(componentType);
		bean.setTovRating(tovRating);
		bean.setUnit(unit);
		bean.setUnitPriceWithCustomduty(unitPriceWithCustomduty);
		bean.setFkCompTypeId(fkcompID);
		bean.setIGST(0.0);
		bean.setGST(taxPercentage);
		bean.setQuantity(0.0);
		bean.setTotal(0.0);
		bean.setTaxAmount(0.0);
		bean.setSubTotal(0.0);
		return bean;
	}
	
	
	public void saveComponentReceivedPODetails(HttpServletRequest request,HttpServletResponse response)
	{
		Integer count = Integer.parseInt(request.getParameter("count"));			
		
		for(int i=0;i<count;i++)
		{
			String vendorName = request.getParameter("vendorName");
			String fkvendorId = request.getParameter("vendorId");
			String billChallanNo = request.getParameter("billChalanNo");
			String purchaseOrderDate = request.getParameter("purchaseOrderDate");
			String expectPaymentDate = request.getParameter("expectPaymentDate");
			String fkCompoentnameid=request.getParameter("pkComponentCategoryDetailsId"+ i);
			
			System.out.println("fk compoent name id"+fkCompoentnameid);
			String componentType = request.getParameter("componentCategory"+i);
			String fkCompTypeId = request.getParameter("fkCompTypeId"+i);
			String componentName = request.getParameter("componentName"+i);
			String compValue = request.getParameter("componentValue"+i);
			String partName = request.getParameter("partNumber"+i);
			String manufacturarName = request.getParameter("manufractureName"+i);
			String description = request.getParameter("description"+i);
			String type = request.getParameter("componentType"+i);
			String compPackage = request.getParameter("packages"+i);
			String tolerance = request.getParameter("tovRating"+i);
			String unit = request.getParameter("unit"+i);
			String unitPrice = request.getParameter("unitPriceWithCustomduty"+i);
			String quantity = request.getParameter("quantity"+i);			
			String subTotal = request.getParameter("subTotal"+i);
			String GST = request.getParameter("GST"+i);
			String IGST = request.getParameter("IGST"+i);
			String taxAmount = request.getParameter("taxAmount"+i);
			String total = request.getParameter("total"+i);
			
			String totalSubTotal = request.getParameter("totalSubTotal");
			String totalTaxAmount = request.getParameter("totalTaxAmount");
			System.out.println("HEALPER totalTaxAmount :- "+totalTaxAmount);
			String grossTotal = request.getParameter("grossTotal");//ComponentReceivedPOHibernate
			
			ComponentReceivedPOHibernate hibernate = new ComponentReceivedPOHibernate();
			
			hibernate.setVendorName(vendorName);
			hibernate.setFkvendorId(Long.parseLong(fkvendorId));
			hibernate.setBillChallanNo(billChallanNo);
			
			//purchaseOrderDate
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");		
			Date purchaseOrderDate1 = null;
			try{
				purchaseOrderDate1 = format.parse(purchaseOrderDate);
				hibernate.setPurchaseOrderDate(purchaseOrderDate1);
				//System.out.println(" date purchaseOrderDate parsing" +purchaseOrderDate1);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}			
			//cgrh.setPurchaseOrderDate((Date)(Object)purchaseOrderDate);
			
			//expectPaymentDate
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");		
			Date expectPaymentDate1 = null;
			try{
				expectPaymentDate1 = format1.parse(expectPaymentDate);
				hibernate.setExpectPaymentDate(expectPaymentDate1);
				//System.out.println(" date purchaseOrderDate parsing" +expectPaymentDate1);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			//cgrh.setExpectPaymentDate((Date)(Object)expectPaymentDate);
			
			//reports.setAddingDate((Date)(object[1]));	
			hibernate.setFkCompoentnameid(Long.parseLong(fkCompoentnameid));
			
			System.out.println("compoentname id"+fkCompoentnameid);
			
			hibernate.setComponentType(componentType);
			hibernate.setFkCompTypeId(Long.parseLong(fkCompTypeId));
			System.out.println("id"+fkCompTypeId);
			hibernate.setComponentName(componentName);
			hibernate.setCompValue(compValue);
			hibernate.setPartName(partName);
			hibernate.setManufacturarName(manufacturarName);
			hibernate.setDescription(description);
			hibernate.setType(type);
			hibernate.setCompPackage(compPackage);
			hibernate.setTolerance((tolerance));
			hibernate.setUnit(unit);
			hibernate.setUnitPrice(Double.parseDouble(unitPrice));
			hibernate.setQuantity(Long.parseLong(quantity));
			hibernate.setSubTotal(Double.parseDouble(subTotal));
			hibernate.setGST(Double.parseDouble(GST));
			hibernate.setIGST(Double.parseDouble(IGST));
			hibernate.setTaxAmount(Double.parseDouble(taxAmount));
			hibernate.setTotal(Double.parseDouble(total));
			hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
			hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));

			System.out.println("HEALPER hibernate.setTaxAmount(Double.parseDouble(totalTaxAmount)); :- "+hibernate.getTaxAmount());
			hibernate.setGrossTotal(Double.parseDouble(grossTotal));

			
			ComponentReceivedPODao dao = new ComponentReceivedPODao();
			dao.saveCompGoodReceivedDetailas(hibernate);
			
			
			/********************************* ****************** LOAD COMPONENT STOCK ENTRY COMPONENT STOCK *********************************************/
			
			//compStockLastUpdateDate
        	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			String currentDate =  dateFormat.format(cal.getTime()).toString();
			Date compStockLastUpdateDate = null;
			try{
				compStockLastUpdateDate = dateFormat.parse(currentDate);
				//updateStock.setCompStockLastUpdateDate(compStockLastUpdateDate);
				//System.out.println(" date compStockLastUpdateDate parsing" +compStockLastUpdateDate);
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("Exception in date parsing");
			}
			
			ComponentStockDao csDao = new ComponentStockDao();
			List csList = csDao.getAllLoadComponentStockEntry();
			
			/*----------------------------- If Stock Is Empty ------------------------------*/ 
	        if(csList.size() == 0)
	        {
	        	System.out.println("1ST IF().....\nWhen Stock Details List ======= 0"+csList.size());
	        	
	        	ComponentStockHibernate csh = new ComponentStockHibernate();
	        	csh.setComponentType(componentType);
	        	csh.setFkCompTypeId(Long.parseLong(fkCompTypeId));
	        	csh.setComponentName(componentName);
	        	
	        	csh.setFkCompoentnameid(Long.parseLong(fkCompoentnameid));
	        	
	        	csh.setManufacturarName(manufacturarName);
	        	csh.setType(type);
	        	csh.setCompPackage(compPackage);
	        	csh.setUnit(unit);
	        	csh.setQuantity(Long.parseLong(quantity));
	        	csh.setCompStockLastUpdateDate(compStockLastUpdateDate);		
	        	
	        	ComponentStockDao csDao1 = new ComponentStockDao();
	        	csDao1.saveComponentStockDetailas(csh);
	        }
	        /*---------------------------------To Update Stock Table If It is Not Empty ---------------------------------------*/
	        else
	        {
	        	  for(int j=0;j<csList.size();j++)
		    	   {
		             	System.out.println("1ST IF's ELSE().....\nwhen Stockdetails is GREATER THAN 0 =====> "+csList.size());
		             	
		             	ComponentStockHibernate csh = (ComponentStockHibernate)csList.get(j);
		             	
		             	//Long pkCompStockIdOld = csh.getPkCompStockId();
		             	String componentTypeOld = csh.getComponentType();
		            	Long fkCompTypeIdOld = csh.getFkCompTypeId();
		            	String componentNameOld = csh.getComponentName();
		            	Long FkCompoentnameidOld=csh.getFkCompoentnameid();
		            	String manufacturarNameOld = csh.getManufacturarName();
		            	String typeOld = csh.getType();
		            	String compPackageOld = csh.getCompPackage();
		            	String unitOld = csh.getUnit();
		            	Long quantityOld = csh.getQuantity();
		            	Long pkCompStockIdOld = csh.getPkCompStockId();
		            	Date compStockLastUpdateDateOld = csh.getCompStockLastUpdateDate();
		            	
		            	//String componentType;
		            	//Long fkCompTypeId;
		            	
		            	if(componentTypeOld.equals(componentType) && componentNameOld.equals(componentName))
		            	{
		            		System.out.println("IF INSIDE ELSE BLOCK ==== CONDITION TRUE ===== inside If");
		            		
		            		Long quantityUpdate =  quantityOld + Long.parseLong(quantity);
			        		
		            		//System.out.println("quantityOld : "+quantityOld);
		            		//System.out.println("quantityNew : "+quantity);
		            		//System.out.println("quantityUpdate : "+quantityUpdate);
		            		
		            		//ComponentStockDao csDao2 = new ComponentStockDao();
		    	        	//csDao2.updateComponentStockQuantity(quantityUpdate, componentTypeOld, componentNameOld);
		    	        			    	        	
		    	        	 HibernateUtility hbu = HibernateUtility.getInstance();
		            		 Session session2 = hbu.getHibernateSession();
		            		 org.hibernate.Transaction transaction = session2.beginTransaction();
		            		 
		            		 //DateFormat df1 = new SimpleDateFormat("dd/MM/yyyy");
		            		 //Date compStockLastUpdateDate = new Date();
		            	
		            		ComponentStockHibernate updateStock = (ComponentStockHibernate) session2.get(ComponentStockHibernate.class, new Long(pkCompStockIdOld));
		            		//updateStock.setCompStockLastUpdateDate(compStockLastUpdateDate);
		            		updateStock.setQuantity(quantityUpdate);
		            		updateStock.setCompStockLastUpdateDate(compStockLastUpdateDate);
		            		
		            		session2.saveOrUpdate(updateStock);
		            		transaction.commit();
		            		break;            		
		            	}
		            	else
		            	{
						  /*-------------------------------- ItemName is Not Exists ---------------------------------------*/
		            		if(j+1 == csList.size())
		            		{
		            			System.out.println("IF INSIDE ELSE IF ELSE BLOCK VALUE OF J+1 ===================>"+j);
		            			
		            			ComponentStockHibernate newEntry = new ComponentStockHibernate();
		            					            			
		            			newEntry.setComponentType(componentType);
		            			newEntry.setFkCompTypeId(Long.parseLong(fkCompTypeId));
		            			newEntry.setComponentName(componentName);
		            			newEntry.setFkCompoentnameid(Long.parseLong(fkCompoentnameid));
		            			newEntry.setManufacturarName(manufacturarName);
		            			newEntry.setType(type);
		            			newEntry.setCompPackage(compPackage);
		            			newEntry.setUnit(unit);
		            			newEntry.setQuantity(Long.parseLong(quantity));
		            			newEntry.setCompStockLastUpdateDate(compStockLastUpdateDate);
		            			
		            			ComponentStockDao csDao1 = new ComponentStockDao();
		        	        	csDao1.saveComponentStockDetailas(newEntry);
		            		}
		            	}
		    	   } 	
	        }
		} 
	}
	
	//componentReceivedPOList
	public List componentReceivedPOList(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ComponentReceivedPOBean> map = new HashMap<Long, ComponentReceivedPOBean>();
		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		List<ComponentReceivedPOBean> list = dao.componentReceivedPOList();
		
		System.out.println("IN HELPER--------------==== :  "+list.size());
		return list;
	}
	
	public List componentReceivedPOReport(HttpServletRequest request, HttpServletResponse response) 
	{
		Map<Long, ComponentReceivedPOBean> map = new HashMap<Long, ComponentReceivedPOBean>();
		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		List<ComponentReceivedPOBean> list = dao.componentReceivedPOReport();
		
		System.out.println("IN HELPER--------------==== :  "+list.size());
		return list;
	}
	
	
	
	public List getCompoentnameforselect(Long componentType)
	{
		
		Map<Long, CompoentCategoryDetailBean> map = new HashMap<Long, CompoentCategoryDetailBean>();

		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		List<CompoentCategoryDetailBean> ven1List = dao.getcompentCategoryNameForselect(componentType);

		System.out.println("Size in Helper of compoent recived------ : "+ven1List.size());
		
		return ven1List;
	}
	
	public List getCompoentnameforselect11(Long componentType, Long pksubCategoryId)
	{
		
		Map<Long, CompoentCategoryDetailBean> map = new HashMap<Long, CompoentCategoryDetailBean>();

		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		List<CompoentCategoryDetailBean> ven1List = dao.getcompentCategoryNameForselect11(componentType,pksubCategoryId);

		System.out.println("Size in Helper of compoent recived------ : "+ven1List.size());
		
		return ven1List;
	}
	
	public List getCompoentnameforselectreport(Long componentType)
	{
		
		Map<Long, CompoentCategoryDetailBean> map = new HashMap<Long, CompoentCategoryDetailBean>();

		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		List<CompoentCategoryDetailBean> ven1List = dao.getcompentCategoryNameForselect1(componentType);

		System.out.println("Size in Helper------ : "+ven1List.size());
		
		return ven1List;
	}
	
	public List getCompoentnameforselectreport1(Long componentType)
	{
		
		Map<Long, CompoentCategoryDetailBean> map = new HashMap<Long, CompoentCategoryDetailBean>();

		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		List<CompoentCategoryDetailBean> ven1List = dao.getcompentCategoryNameForselect2(componentType);

		System.out.println("Size in Helper------ : "+ven1List.size());
		
		return ven1List;
	}
	
	
	public List getCompoentnameforselectreport2(Long componentType)
	{
		
		Map<Long, CompoentCategoryDetailBean> map = new HashMap<Long, CompoentCategoryDetailBean>();

		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		List<CompoentCategoryDetailBean> ven1List = dao.getcompentCategoryNameForselect3(componentType);

		System.out.println("Size in Helper------ : "+ven1List.size());
		
		return ven1List;
	}
	
	public List getvendorReportByDateAndName1(HttpServletRequest request, HttpServletResponse response) 
	{
		String fkClientId2 = request.getParameter("fkClientId2");
		String VendorName = request.getParameter("VendorName");
		String fisDate4 = request.getParameter("fisDate4");
		String endDate4 = request.getParameter("endDate4");
		
		Map<Long, ComponentReceivedPOBean> map = new HashMap<Long, ComponentReceivedPOBean>();

		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		List<ComponentReceivedPOBean> exp1List = dao.getvendorReportByDateAndName(fkClientId2,VendorName,fisDate4,endDate4);

		return exp1List;

	}


public List getCategoryDetailforCompoentRcvive(HttpServletRequest request, HttpServletResponse response) {
	
	String fkCompenetId = request.getParameter("fkCompenetId");
	String CompoentCategory = request.getParameter("CompoentCategory");
	String fisDate = request.getParameter("fisDate");
	String endDate = request.getParameter("endDate");
	
	Map<Long, ComponentReceivedPOBean> map = new HashMap<Long, ComponentReceivedPOBean>();

	ComponentReceivedPODao dao = new ComponentReceivedPODao();
	List<ComponentReceivedPOBean> exp1List = dao.getCategoryReportByDateAndName(CompoentCategory,fkCompenetId,fisDate, endDate);

	return exp1List;

}


public List getCompoenetReportByDates(HttpServletRequest request, HttpServletResponse response) 
{
	String fisDate = request.getParameter("fisDate42");
	String endDate = request.getParameter("endDate42");
	
	Map<Long, ComponentReceivedPOBean> map = new HashMap<Long, ComponentReceivedPOBean>();

	ComponentReceivedPODao dao = new ComponentReceivedPODao();
	List<ComponentReceivedPOBean> exp1List = dao.getCategoryReportBybetweentwodates(fisDate,endDate);

	return exp1List;

}


public void saveComponentReceivedPODetailsExcel(HttpServletRequest request, HttpServletResponse response) {
	Integer count = Integer.parseInt(request.getParameter("count"));			
	
	for(int i=1;i<count;i++)
	{
		String vendorName = request.getParameter("vendorName"+i);
		String fkvendorId = request.getParameter("vendorId"+i);
		String billChallanNo = request.getParameter("billChalanNo"+i);
		String purchaseOrderDate = request.getParameter("purchaseOrderDate"+i);
		String expectPaymentDate = request.getParameter("expectPaymentDate"+i);
		String fkCompoentnameid=request.getParameter("pkComponentCategoryDetailsId"+ i);
		
		System.out.println("fk compoent name id"+fkCompoentnameid);
		String componentType = request.getParameter("componentCategory"+i);
		String fkCompTypeId = request.getParameter("fkCompTypeId"+i);
		String componentName = request.getParameter("componentName"+i);
		String compValue = request.getParameter("componentValue"+i);
		String partName = request.getParameter("partNumber"+i);
		String manufacturarName = request.getParameter("manufractureName"+i);
		String description = request.getParameter("description"+i);
		String type = request.getParameter("componentType"+i);
		String compPackage = request.getParameter("packages"+i);
		String tolerance = request.getParameter("tolerance"+i);
		String unit = request.getParameter("unit"+i);
		String unitPrice = request.getParameter("unitPriceWithCustomduty"+i);
		String quantity = request.getParameter("quantity"+i);			
		String subTotal = request.getParameter("subTotal"+i);
		String GST = request.getParameter("gst"+i);
		String IGST = request.getParameter("igst"+i);
		String taxAmount = request.getParameter("taxAmount"+i);
		String total = request.getParameter("total"+i);
		
		String totalSubTotal = request.getParameter("totalSubTotal"+i);
		String totalTaxAmount = request.getParameter("totalTaxAmount"+i);
		System.out.println("HEALPER totalTaxAmount :- "+totalTaxAmount);
		String grossTotal = request.getParameter("grossTotal"+i);//ComponentReceivedPOHibernate
		
		ComponentReceivedPOHibernate hibernate = new ComponentReceivedPOHibernate();
		
		hibernate.setVendorName(vendorName);
		hibernate.setFkvendorId(Long.parseLong(fkvendorId));
		hibernate.setBillChallanNo(billChallanNo);
		
		//purchaseOrderDate
		
		
	    Date pDate = null;
		try {
			SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yy");
		      
		    SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
		    Date date = inputFormat.parse(purchaseOrderDate);
		    
		    String formattedDate = outputFormat.format(date);
            System.out.println(formattedDate); 
            pDate=outputFormat.parse(formattedDate);
            hibernate.setPurchaseOrderDate(pDate);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		//expectPaymentDate		
		Date expectPaymentDate1 = null;
		try{
			SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yy");
		      
		    SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
		    Date date2 = inputFormat.parse(expectPaymentDate);
		    String formattedPaymentDate = outputFormat.format(date2);
            System.out.println(formattedPaymentDate); 
            expectPaymentDate1=outputFormat.parse(formattedPaymentDate);
			hibernate.setExpectPaymentDate(expectPaymentDate1);
			
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		hibernate.setFkCompoentnameid(Long.parseLong(fkCompoentnameid));
		
		System.out.println("compoentname id"+fkCompoentnameid);
		
		hibernate.setComponentType(componentType);
		hibernate.setFkCompTypeId(Long.parseLong(fkCompTypeId));
		System.out.println("id"+fkCompTypeId);
		hibernate.setComponentName(componentName);
		hibernate.setCompValue(compValue);
		hibernate.setPartName(partName);
		hibernate.setManufacturarName(manufacturarName);
		hibernate.setDescription(description);
		hibernate.setType(type);
		hibernate.setCompPackage(compPackage);
		hibernate.setTolerance((tolerance));
		hibernate.setUnit(unit);
		hibernate.setUnitPrice(Double.parseDouble(unitPrice));
		hibernate.setQuantity(Long.parseLong(quantity));
		hibernate.setSubTotal(Double.parseDouble(subTotal));
		hibernate.setGST(Double.parseDouble(GST));
		hibernate.setIGST(Double.parseDouble(IGST));
		hibernate.setTaxAmount(Double.parseDouble(taxAmount));
		hibernate.setTotal(Double.parseDouble(total));
		hibernate.setTotalSubTotal(Double.parseDouble(totalSubTotal));
		hibernate.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));

		System.out.println("HEALPER hibernate.setTaxAmount(Double.parseDouble(totalTaxAmount)); :- "+hibernate.getTaxAmount());
		hibernate.setGrossTotal(Double.parseDouble(grossTotal));

		
		ComponentReceivedPODao dao = new ComponentReceivedPODao();
		dao.saveCompGoodReceivedDetailas(hibernate);
		
		
		/********************************* ****************** LOAD COMPONENT STOCK ENTRY COMPONENT STOCK *********************************************/
		
		//compStockLastUpdateDate
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String currentDate =  dateFormat.format(cal.getTime()).toString();
		Date compStockLastUpdateDate = null;
		try{
			compStockLastUpdateDate = dateFormat.parse(currentDate);
			
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception in date parsing");
		}
		
		ComponentStockDao csDao = new ComponentStockDao();
		List csList = csDao.getAllLoadComponentStockEntry();
		
		/*----------------------------- If Stock Is Empty ------------------------------*/ 
        if(csList.size() == 0)
        {
        	System.out.println("1ST IF().....\nWhen Stock Details List ======= 0"+csList.size());
        	
        	ComponentStockHibernate csh = new ComponentStockHibernate();
        	csh.setComponentType(componentType);
        	csh.setFkCompTypeId(Long.parseLong(fkCompTypeId));
        	csh.setComponentName(componentName);
        	
        	csh.setFkCompoentnameid(Long.parseLong(fkCompoentnameid));
        	
        	csh.setManufacturarName(manufacturarName);
        	csh.setType(type);
        	csh.setCompPackage(compPackage);
        	csh.setUnit(unit);
        	csh.setQuantity(Long.parseLong(quantity));
        	csh.setCompStockLastUpdateDate(compStockLastUpdateDate);		
        	
        	ComponentStockDao csDao1 = new ComponentStockDao();
        	csDao1.saveComponentStockDetailas(csh);
        }
        /*---------------------------------To Update Stock Table If It is Not Empty ---------------------------------------*/
        else
        {
        	  for(int j=0;j<csList.size();j++)
	    	   {
	             	System.out.println("1ST IF's ELSE().....\nwhen Stockdetails is GREATER THAN 0 =====> "+csList.size());
	             	
	             	ComponentStockHibernate csh = (ComponentStockHibernate)csList.get(j);	             		             	
	             	String componentTypeOld = csh.getComponentType();
	            	
	            	String componentNameOld = csh.getComponentName();	            		            		            		            		            	
	            	Long quantityOld = csh.getQuantity();
	            	Long pkCompStockIdOld = csh.getPkCompStockId();	       	            		            	            	
	            	if(componentTypeOld.equals(componentType) && componentNameOld.equals(componentName))
	            	{
	            		System.out.println("IF INSIDE ELSE BLOCK ==== CONDITION TRUE ===== inside If");
	            		
	            		Long quantityUpdate =  quantityOld + Long.parseLong(quantity);
		        			            			    	        			    	        	
	    	        	 HibernateUtility hbu = HibernateUtility.getInstance();
	            		 Session session2 = hbu.getHibernateSession();
	            		 org.hibernate.Transaction transaction = session2.beginTransaction();	            		 	            			            	
	            		ComponentStockHibernate updateStock = (ComponentStockHibernate) session2.get(ComponentStockHibernate.class, new Long(pkCompStockIdOld));	            		
	            		updateStock.setQuantity(quantityUpdate);
	            		updateStock.setCompStockLastUpdateDate(compStockLastUpdateDate);
	            		
	            		session2.saveOrUpdate(updateStock);
	            		transaction.commit();
	            		break;            		
	            	}
	            	else
	            	{
					  /*-------------------------------- ItemName is Not Exists ---------------------------------------*/
	            		if(j+1 == csList.size())
	            		{
	            			System.out.println("IF INSIDE ELSE IF ELSE BLOCK VALUE OF J+1 ===================>"+j);
	            			
	            			ComponentStockHibernate newEntry = new ComponentStockHibernate();
	            					            			
	            			newEntry.setComponentType(componentType);
	            			newEntry.setFkCompTypeId(Long.parseLong(fkCompTypeId));
	            			newEntry.setComponentName(componentName);
	            			newEntry.setFkCompoentnameid(Long.parseLong(fkCompoentnameid));
	            			newEntry.setManufacturarName(manufacturarName);
	            			newEntry.setType(type);
	            			newEntry.setCompPackage(compPackage);
	            			newEntry.setUnit(unit);
	            			newEntry.setQuantity(Long.parseLong(quantity));
	            			newEntry.setCompStockLastUpdateDate(compStockLastUpdateDate);
	            			
	            			ComponentStockDao csDao1 = new ComponentStockDao();
	        	        	csDao1.saveComponentStockDetailas(newEntry);
	            		}
	            	}
	    	   } 	
        }
	} 
}
}


