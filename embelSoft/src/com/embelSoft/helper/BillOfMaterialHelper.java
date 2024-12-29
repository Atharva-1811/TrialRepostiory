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

import com.embelSoft.bean.BillOfMaterialBean;
import com.embelSoft.bean.BillOfMaterialDetailsBean;
import com.embelSoft.bean.ComponentStockBean;
import com.embelSoft.dao.BillOfMaterialDao;
import com.embelSoft.dao.ComponentStockDao;
import com.embelSoft.hibernate.BillOfMaterialHibernate;
import com.embelSoft.utility.HibernateUtility;

public class BillOfMaterialHelper {

//get grid for bill of material
	
	
	
	public List getGridForBillOfMaterial(String componentType, String pkCompTypeId, String ComponentName)
	{
		ComponentStockDao dao = new ComponentStockDao();
		List list= dao.getproductDetailsForGrid(ComponentName);
//		BillOfMaterialDetailsBean bean=new BillOfMaterialDetailsBean();
//		bean.setPkCompTypeId(Long.parseLong(pkCompTypeId));
//		bean.setComponentType(componentType);
//		bean.setComponentName(ComponentName);
//		bean.setBoardCost(0d);
//		bean.setOneBoardQty(0d);
//		bean.setUnitPrice(0d);
		
		return list;
		
	}
	
	
	public Map getGridForBillOfMaterial1(String projectname)
	{
		long k = 0l;
		BillOfMaterialDao dao=new BillOfMaterialDao();
		List productList = dao.getTotalItemByVoucherNoForEditGRDao(projectname);
		Map map = new HashMap();
		BillOfMaterialBean cs = null;
		
		for (int i = 0; i < productList.size(); i++)
		{
			k++;
			Object[] o = (Object[]) productList.get(i);
			BillOfMaterialBean reports= new BillOfMaterialBean();
			reports.setProjectName(o[0].toString());
			reports.setBoardName(o[1].toString());
			reports.setComponentType(o[2].toString());
			reports.setComponentName(o[3].toString());
			reports.setRef_Designator(o[5].toString());
			reports.setPart_Number(o[6].toString());
			reports.setPackages(o[7].toString());
			reports.setTolvRating(o[8].toString());
			reports.setValue(o[9].toString());
			reports.setManufactureName(o[10].toString());
			reports.setDescription(o[11].toString());
			reports.setOneBoardQty(Double.parseDouble(o[12].toString()));
			reports.setUnitPrice(Double.parseDouble(o[13].toString()));
			reports.setBoardCost(Double.parseDouble(o[14].toString()));
			reports.setRemark(o[15].toString());
			reports.setVendorName(o[16].toString());
			reports.setFkCompTypeId(Long.parseLong(o[4].toString()));
			reports.setPkCompBomId(Long.parseLong(o[17].toString()));
			
			map.put(reports.getPkCompBomId(), reports);
		}
		return map;
	
	}
	
//save Bill Of material 
	

	public void saveBillOfMaterial(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		Integer count = Integer.parseInt(request.getParameter("count"));			
		
		for(int i=0;i<count;i++)
		{
			String projectName=request.getParameter("projectName");
			System.out.println("project name:::----"+projectName);
			String boardName=request.getParameter("boardName");
			System.out.println("board name:::----"+boardName);
			String componentType = request.getParameter("componentType"+i);
			String fkCompTypeId = request.getParameter("pkCompTypeId"+i);
			String componentName=request.getParameter("componentName"+i);
			String ref_Designator=request.getParameter("Ref_Designator" + i);
			String value=request.getParameter("Value" + i);
			String part_Number=request.getParameter("Part_Number" + i);
			String manufactureName=request.getParameter("Mfg_Name" + i);
			System.out.println("manufracture:::----"+manufactureName);
			
			String description=request.getParameter("description" + i);
			
			String packages=request.getParameter("Package" + i);
			String tolvRating=request.getParameter("TolvRating" + i);
			String boardCost=request.getParameter("BoardCost" + i);
			String unitPrice=request.getParameter("unitPrice" + i);
			String oneBoardQty=request.getParameter("OneBoardQty" + i);
			String remark=request.getParameter("Remark" + i);
			String vendorName=request.getParameter("vendorName"+i);	
			System.out.println("IN HEALPER :- ");
			
			BillOfMaterialHibernate hibernate= new BillOfMaterialHibernate();
			
			
			
			
			if( componentType == null || componentType == "undefined" || componentType == "" || componentType == " ")
			{
				
				hibernate.setComponentType("N/A");
			}else{
				hibernate.setComponentType(componentType);
			}
			
			if( fkCompTypeId == null || fkCompTypeId == "undefined" || fkCompTypeId == "" || fkCompTypeId == " ")
			{
				hibernate.setFkCompTypeId(Long.parseLong("0"));
			}else{
				hibernate.setFkCompTypeId(Long.parseLong(fkCompTypeId));
			}
			
			if( boardCost == null || boardCost == "undefined" || boardCost == "" || boardCost == " ")
			{
				hibernate.setBoardCost(Double.parseDouble("0"));
			}else{
				hibernate.setBoardCost(Double.parseDouble(boardCost));
			}
			
			if( description == null || description == "undefined" || description == "" || description == " ")
			{
				hibernate.setDescription("N/A");
			}else{
				hibernate.setDescription(description);
			}
			
			if( oneBoardQty == null || oneBoardQty == "undefined" || oneBoardQty == "" || oneBoardQty == " ")
			{
				hibernate.setOneBoardQty(Double.parseDouble("0"));
			}else{
				hibernate.setOneBoardQty(Double.parseDouble(oneBoardQty));
			}
			
			if( ref_Designator == null || ref_Designator == "undefined" || ref_Designator == "" || ref_Designator == " ")
			{
				hibernate.setRef_Designator("N/A");
			}else{
				
				hibernate.setRef_Designator(ref_Designator);
			}
			
			if( packages == null || packages == "undefined" || packages == "" || packages == " ")
			{
				hibernate.setPackages("N/A");
			}else{
				hibernate.setPackages(packages);
			}
			
			if( boardName == null || boardName == "undefined" || boardName == "" || boardName == " ")
			{
				hibernate.setBoardName("N/A");
			}else{
				hibernate.setBoardName(boardName);
			}
			
			if( projectName == null || projectName == "undefined" || projectName == "" || projectName == " ")
			{
				hibernate.setProjectName("N/A");
			}else{
				hibernate.setProjectName(projectName);
			}
			
			if( componentName == null || componentName == "undefined" || componentName == "" || componentName == " ")
			{
				hibernate.setComponentName("N/A");
			}else{
				hibernate.setComponentName(componentName);
			}

			if( manufactureName == null || manufactureName == "undefined" || manufactureName == "" || manufactureName == " ")
			{
				hibernate.setmanufactureName("N/A");
			}else{
				hibernate.setmanufactureName(manufactureName);
			}
			
			if( part_Number == null || part_Number == "undefined" || part_Number == "" || part_Number == " ")
			{
				hibernate.setPart_Number("N/A");
			}else{
				hibernate.setPart_Number(part_Number);
			}
			
			if( value == null || value == "undefined" || value == "" || value == " ")
			{
				hibernate.setValue("N/A");
			}else{
				hibernate.setValue(value);
			}
			
			if( tolvRating == null || tolvRating == "undefined" || tolvRating == "" || tolvRating == " ")
			{
				hibernate.setTolvRating(("N/A"));
			}else{
				hibernate.setTolvRating((tolvRating));
			}
			
			if( unitPrice == null || unitPrice == "undefined" || unitPrice == "" || unitPrice == " ")
			{
				hibernate.setUnitPrice(Double.parseDouble("0"));
				
			}else{
				
				hibernate.setUnitPrice(Double.parseDouble(unitPrice));
			}
			
			if( remark == null || remark == "undefined" || remark == "" || remark == " ")
			{
				
				hibernate.setRemark("N/A");
			}else{
				hibernate.setRemark(remark);
			}
			
			if( vendorName == null || vendorName == "undefined" || vendorName == "" || vendorName == " ")
			{
				hibernate.setVendorName("N/A");
			}else{
				
				hibernate.setVendorName(vendorName);
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
			BillOfMaterialDao dao= new BillOfMaterialDao();
			
			dao.saveBillofmaterial(hibernate);
			
			
	
		}
	}





//Bill of material list

public List BillOfMaterialList(HttpServletRequest request, HttpServletResponse response) 
{
	Map<Long, BillOfMaterialBean> map = new HashMap<Long, BillOfMaterialBean>();
	BillOfMaterialDao dao = new BillOfMaterialDao();
	List<BillOfMaterialBean> list = dao.BillofmaterialList();
	
	System.out.println("IN HELPER--------------==== :  "+list.size());
	return list;
}

public List getCompoentNameDetailforBom(HttpServletRequest request, HttpServletResponse response) {
	
	String fkCompenetId = request.getParameter("fkCompenetId");
	String CompoenentName = request.getParameter("CompoenentName");
	String fisDate = request.getParameter("fisDate");
	String endDate = request.getParameter("endDate");
	
	Map<Long, BillOfMaterialBean> map = new HashMap<Long, BillOfMaterialBean>();

	BillOfMaterialDao dao = new BillOfMaterialDao();
	List<BillOfMaterialBean> exp1List = dao.getCompoentNameDetail(fisDate, endDate, CompoenentName,fkCompenetId);

	return exp1List;

}


public List getbillofmaterialReportByDates(HttpServletRequest request, HttpServletResponse response) 
{
	String fisDate = request.getParameter("fisDate42");
	String endDate = request.getParameter("endDate42");
	
	Map<Long, BillOfMaterialBean> map = new HashMap<Long, BillOfMaterialBean>();

	BillOfMaterialDao dao = new BillOfMaterialDao();
	List<BillOfMaterialBean> exp1List = dao.getClientReportByDates1(fisDate,endDate);

	return exp1List;

}


public List getCategoryDetail(HttpServletRequest request, HttpServletResponse response) {
	
	String fkCompenetId = request.getParameter("fkCompenetId");
	String CompoentCategory = request.getParameter("CompoentCategory");
	String fisDate = request.getParameter("fisDate");
	String endDate = request.getParameter("endDate");
	
	Map<Long, BillOfMaterialBean> map = new HashMap<Long, BillOfMaterialBean>();

	BillOfMaterialDao dao = new BillOfMaterialDao();
	List<BillOfMaterialBean> exp1List = dao.getClientDetail(fisDate, endDate, CompoentCategory,fkCompenetId);

	return exp1List;

}


public List getClientReportByDateAndName1(HttpServletRequest request, HttpServletResponse response) 
{
	//String fkClientId2 = request.getParameter("fkClientId2");
	String projectName = request.getParameter("projectName");
	String fisDate4 = request.getParameter("fisDate4");
	String endDate4 = request.getParameter("endDate4");
	
	Map<Long, BillOfMaterialBean> map = new HashMap<Long, BillOfMaterialBean>();

	BillOfMaterialDao dao = new BillOfMaterialDao();
	List<BillOfMaterialBean> exp1List = dao.getClientReportByDateAndName(projectName,fisDate4,endDate4);

	return exp1List;

}
public void updateBillOfMaterial(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub

	
	HibernateUtility hbu = null;
	Session session = null;
	Transaction transaction = null;
	
	
	Integer count = Integer.parseInt(request.getParameter("count"));			
	

	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		transaction = session.beginTransaction();
		
		
	
	System.out.println("c111111" + count);	
	
	for(int i=0;i<count;i++)
	{
		
		String pkCompBomId = request.getParameter("pkCompBomId" + i);
		BillOfMaterialHibernate hibernate = (BillOfMaterialHibernate) session.get(BillOfMaterialHibernate.class, Long.parseLong(pkCompBomId));
		String projectName=request.getParameter("projectName");
		String projectName1=request.getParameter("projectName"+i);
		System.out.println("project name:::----"+projectName);
		String boardName=request.getParameter("boardName"+i);
		System.out.println("board name:::----"+boardName);
		String componentType = request.getParameter("componentType"+i);
		String fkCompTypeId = request.getParameter("fkCompTypeId"+i);
		String componentName=request.getParameter("componentName"+i);
		String ref_Designator=request.getParameter("ref_Designator" + i);
		String value=request.getParameter("value" + i);
		String part_Number=request.getParameter("part_Number" + i);
		String manufactureName=request.getParameter("manufactureName" + i);
		System.out.println("manufracture:::----"+manufactureName);
		
		String description=request.getParameter("description" + i);
		
		String packages=request.getParameter("packages" + i);
		String tolvRating=request.getParameter("tolvRating" + i);
		String boardCost=request.getParameter("boardCost" + i);
		String unitPrice=request.getParameter("unitPrice" + i);
		String oneBoardQty=request.getParameter("oneBoardQty" + i);
		String remark=request.getParameter("remark" + i);
		String vendorName=request.getParameter("vendorName"+i);	
		System.out.println("IN HEALPER :- ");
		
		
		
		
		
		
		if( componentType == null || componentType == "undefined" || componentType == "" || componentType == " ")
		{
			
			hibernate.setComponentType("N/A");
		}else{
			hibernate.setComponentType(componentType);
		}
		
		if( fkCompTypeId == null || fkCompTypeId == "undefined" || fkCompTypeId == "" || fkCompTypeId == " ")
		{
			hibernate.setFkCompTypeId(Long.parseLong("0"));
		}else{
			hibernate.setFkCompTypeId(Long.parseLong(fkCompTypeId));
		}
		
		if( boardCost == null || boardCost == "undefined" || boardCost == "" || boardCost == " ")
		{
			hibernate.setBoardCost(Double.parseDouble("0"));
		}else{
			hibernate.setBoardCost(Double.parseDouble(boardCost));
		}
		
		if( description == null || description == "undefined" || description == "" || description == " ")
		{
			hibernate.setDescription("N/A");
		}else{
			hibernate.setDescription(description);
		}
		
		if( oneBoardQty == null || oneBoardQty == "undefined" || oneBoardQty == "" || oneBoardQty == " ")
		{
			hibernate.setOneBoardQty(Double.parseDouble("0"));
		}else{
			hibernate.setOneBoardQty(Double.parseDouble(oneBoardQty));
		}
		
		if( ref_Designator == null || ref_Designator == "undefined" || ref_Designator == "" || ref_Designator == " ")
		{
			hibernate.setRef_Designator("N/A");
		}else{
			
			hibernate.setRef_Designator(ref_Designator);
		}
		
		if( packages == null || packages == "undefined" || packages == "" || packages == " ")
		{
			hibernate.setPackages("N/A");
		}else{
			hibernate.setPackages(packages);
		}
		
		if( boardName == null || boardName == "undefined" || boardName == "" || boardName == " ")
		{
			hibernate.setBoardName("N/A");
		}else{
			hibernate.setBoardName(boardName);
		}
		
		if( projectName == null || projectName == "undefined" || projectName == "" || projectName == " ")
		{
			hibernate.setProjectName("N/A");
		}else{
			hibernate.setProjectName(projectName);
		}
		
		if( componentName == null || componentName == "undefined" || componentName == "" || componentName == " ")
		{
			hibernate.setComponentName("N/A");
		}else{
			hibernate.setComponentName(componentName);
		}

		if( manufactureName == null || manufactureName == "undefined" || manufactureName == "" || manufactureName == " ")
		{
			hibernate.setmanufactureName("N/A");
		}else{
			hibernate.setmanufactureName(manufactureName);
		}
		
		if( part_Number == null || part_Number == "undefined" || part_Number == "" || part_Number == " ")
		{
			hibernate.setPart_Number("N/A");
		}else{
			hibernate.setPart_Number(part_Number);
		}
		
		if( value == null || value == "undefined" || value == "" || value == " ")
		{
			hibernate.setValue("N/A");
		}else{
			hibernate.setValue(value);
		}
		
		if( tolvRating == null || tolvRating == "undefined" || tolvRating == "" || tolvRating == " ")
		{
			hibernate.setTolvRating(("N/A"));
		}else{
			hibernate.setTolvRating((tolvRating));
		}
		
		if( unitPrice == null || unitPrice == "undefined" || unitPrice == "" || unitPrice == " ")
		{
			hibernate.setUnitPrice(Double.parseDouble("0"));
			
		}else{
			
			hibernate.setUnitPrice(Double.parseDouble(unitPrice));
		}
		
		if( remark == null || remark == "undefined" || remark == "" || remark == " ")
		{
			
			hibernate.setRemark("N/A");
		}else{
			hibernate.setRemark(remark);
		}
		
		if( vendorName == null || vendorName == "undefined" || vendorName == "" || vendorName == " ")
		{
			hibernate.setVendorName("N/A");
		}else{
			
			hibernate.setVendorName(vendorName);
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
		BillOfMaterialDao dao= new BillOfMaterialDao();
		
		dao.updateBillOfMaterial(hibernate);
		
		

	}
	}catch (Exception e)
	{
		// TODO: handle exception
		System.out.println("UPDATE Billof material  EXCEPTION ");
		e.printStackTrace();
	}
}

}