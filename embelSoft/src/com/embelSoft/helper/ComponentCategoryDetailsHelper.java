package com.embelSoft.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;

import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.embelSoft.bean.CompoentCategoryDetailBean;
import com.embelSoft.dao.ComponentCategoryDetailsDao;
import com.embelSoft.hibernate.CompoentCategoryDetailsHibernate;
import com.embelSoft.hibernate.TaxDetailsHibernate;
import com.embelSoft.utility.HibernateUtility;

import org.apache.poi.ss.usermodel.CellType;

public class ComponentCategoryDetailsHelper {


	public List getTaxDetailsForComponentCategoryDetail(Long fktaxid)
	{
		Map<Long, TaxDetailsHibernate> map = new HashMap<Long, TaxDetailsHibernate>();

		ComponentCategoryDetailsDao Dao = new ComponentCategoryDetailsDao();
		List<TaxDetailsHibernate> userList = Dao.getTaxDetailsForCompoentCategoryDetails(fktaxid);
		return userList;
	}



	public void saveCompoentCategorydetails(HttpServletRequest request,HttpServletResponse response)
	{
		// TODO Auto-generated method stub
			System.out.println("In helper");


			String componentCategory = request.getParameter("componentCategory");
			String componentName = request.getParameter("componentName");
			String componentSubCategory = request.getParameter("componentSubCategory");
			String fksubCategoryId = request.getParameter("pkComponentSubCategoryId");
			String description = request.getParameter("description");
			String componentValue = request.getParameter("componentValue");
			String partNumber=request.getParameter("partNumber");
			String manufractureName=request.getParameter("manufacturerName");
			String type=request.getParameter("type");
			String tovRating=request.getParameter("totalVolt");
			String fkCompTypeId=request.getParameter("pkCompTypeId");

			String unit=request.getParameter("unit");


			String duty=request.getParameter("duty");

			String unitPrice=request.getParameter("unitPrice");
			String packages=request.getParameter("packages");
			String fkTaxTypeId = request.getParameter("fktaxid");
			String taxName = request.getParameter("TaxName");
			System.out.println("Tax name is"+taxName);
			String taxPercentage = request.getParameter("taxPercentage");
			String CGST = request.getParameter("CGST");
			String SGST = request.getParameter("SGST");

			String unitPrice1=request.getParameter("unitPrice1");

			System.out.println("unit price is"+unitPrice1);




			CompoentCategoryDetailsHibernate bean = new CompoentCategoryDetailsHibernate();

			if(!"".equals(componentCategory)){
				bean.setComponentCategory(componentCategory);
			}else{
				bean.setComponentCategory("N/A");
			}
			if(!"".equals(componentName)){
				bean.setComponentName(componentName);
			}else{
				bean.setComponentName("N/A");
			}
			if(!"".equals(description)){
				bean.setDescription(description);
			}else{
				bean.setDescription("N/A");
			}
			if(!"".equals(manufractureName)){
				bean.setManufractureName(manufractureName);
			}else{
				bean.setManufractureName("N/A");
			}
			if(!"".equals(fkTaxTypeId)){
				bean.setFkTaxTypeId(Long.parseLong(fkTaxTypeId));
			}else{
				bean.setFkTaxTypeId(0l);
			}
			if(!"".equals(taxName)){
				bean.setTaxName(taxName);
				System.out.println("Tax name is"+taxName);
			}else{
				bean.setTaxName("N/A");
			}
			if(!"".equals(taxPercentage)){
				bean.setTaxPercentage(Double.parseDouble(taxPercentage));
			}else{
				bean.setTaxPercentage(0d);
			}
			if(!"".equals(CGST)){
				bean.setCGST(Double.parseDouble(CGST));
			}else{
				bean.setCGST(0d);
			}
			if(!"".equals(SGST)){
				bean.setSGST(Double.parseDouble(SGST));
			}else{
				bean.setSGST(0d);
			}

			if(!"".equals(unitPrice)){
				bean.setUnitPrice(Double.parseDouble(unitPrice));
			}else{
				bean.setUnitPrice(0d);
			}

			if(!"".equals(duty)){
				bean.setDuty(Double.parseDouble(duty));
			}else{
				bean.setDuty(0d);
			}

			if(!"".equals(unitPrice1)){
				bean.setUnitPriceWithCustomduty(Double.parseDouble(unitPrice1));
			}else{
				bean.setUnitPriceWithCustomduty(0d);
			}



			if(!"".equals(type)){
				bean.setComponentType(type);
			}else{
				bean.setComponentType("N/A");
			}

			if(!"".equals(tovRating)){
				bean.setTovRating(tovRating);
			}else{
				bean.setTovRating("N/A");
			}

			if(!"".equals(componentValue)){
				bean.setComponentValue(componentValue);
			}else{
				bean.setComponentValue("N/A");
			}
			if(!"".equals(packages)){
				bean.setPackages(packages);
			}else{
				bean.setPackages("N/A");
			}
			if(!"".equals(unit)){
				bean.setUnit(Double.parseDouble(unit));

			}else{
				bean.setUnit(0d);
			}
			if(!"".equals(fkCompTypeId)){
				bean.setFkCompTypeId(Long.parseLong(fkCompTypeId));
			}else{
				bean.setFkCompTypeId(0l);
			}

			if(!"".equals(partNumber)){
				bean.setPartNumber(partNumber);
			}else{
				bean.setPartNumber("N/A");
			}
			
			if (!"".equals(componentSubCategory)) {
				bean.setComponentSubCategory(componentSubCategory);
			} else {
				bean.setComponentSubCategory("N/A");
			}
		
			bean.setFksubCategory(Long.parseLong(fksubCategoryId));
		
			ComponentCategoryDetailsDao dao= new ComponentCategoryDetailsDao();
			dao.saveCompoentCategoryDetail(bean);

	}

	//CompoentCategoryDetailList

	public List CompoentCategoryDetailList(HttpServletRequest request, HttpServletResponse response)
	{
		Map<Long, CompoentCategoryDetailBean> map = new HashMap<Long, CompoentCategoryDetailBean>();
		ComponentCategoryDetailsDao dao= new ComponentCategoryDetailsDao();
		List<CompoentCategoryDetailBean> list = dao.CompoentCategoryDetailList();

		System.out.println("IN HELPER--------------==== :  "+list.size());



		return list;
	}

	public void getCompoentCategoryDetailsIdPkForEdit(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("in helper 2");

		String componentName_id2 = request.getParameter("componentName_id");
		Long componentName_id = Long.parseLong(componentName_id2);

		HibernateUtility hbu = HibernateUtility.getInstance();
		Session session = hbu.getHibernateSession();

		CompoentCategoryDetailsHibernate bean = (CompoentCategoryDetailsHibernate) session.get(CompoentCategoryDetailsHibernate.class,new Long(componentName_id));

		String compName = bean.getComponentName();
		String compCat = bean.getComponentCategory();
		String compValue = bean.getComponentValue();
		String compPartNo = bean.getPartNumber();
		String compManufacturerName = bean.getManufractureName();
		String compDscrptn = bean.getDescription();
		String compType = bean.getComponentType();
		String compPackage = bean.getPackages();
		String compTovRating = bean.getTovRating();
		String compQuantity = bean.getUnit().toString();
		String compUnitPrice = bean.getUnitPrice().toString();
		String compDuty = bean.getDuty().toString();
		String compUnitCustDuty = bean.getUnitPriceWithCustomduty().toString();
		String compTaxType = bean.getTaxName();
		String compTaxPercnt = bean.getTaxPercentage().toString();
		String compCGST = bean.getCGST().toString();
		String compSGST = bean.getSGST().toString();


		HttpSession session1 = request.getSession(true); // reuse existing

		session1.setAttribute("ComponentName_Id2", componentName_id2);
		session1.setAttribute("compName2", compName);
		session1.setAttribute("compCat2", compCat);
		session1.setAttribute("compValue2", compValue);
		session1.setAttribute("compPartNo2", compPartNo);
		session1.setAttribute("compManufacturerName2", compManufacturerName);
		session1.setAttribute("compDscrptn2", compDscrptn);
		session1.setAttribute("compType2", compType);
		session1.setAttribute("compPackage2", compPackage);
		session1.setAttribute("compTovRating2", compTovRating);
		session1.setAttribute("compQuantity2", compQuantity);
		session1.setAttribute("compUnitPrice2", compUnitPrice);
		session1.setAttribute("compDuty2", compDuty);
		session1.setAttribute("compUnitCustDuty2", compUnitCustDuty);
		session1.setAttribute("compTaxType2", compTaxType);
		session1.setAttribute("compTaxPercnt2", compTaxPercnt);
		session1.setAttribute("compCGST2", compCGST);
		session1.setAttribute("compSGST2", compSGST);

	}

	public List getComponetCategoryDetailsByComponetIdPkForEdit(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession(true); // reuse existing

		String componentName_id2 = (String)session.getAttribute("ComponentName_Id2");
		Long componentName_id = Long.parseLong(componentName_id2);

		Map<Long, CompoentCategoryDetailBean> map = new HashMap<Long, CompoentCategoryDetailBean>();

		ComponentCategoryDetailsDao dao = new ComponentCategoryDetailsDao();
		List<CompoentCategoryDetailBean> ven1List = dao.getComponetCategoryDetailsByComponetIdPkForEdit(componentName_id);

		System.out.println("Size in Helper------ : "+ven1List.size());

		return ven1List;
	}

	//edit compenentcategoryDetail
	public List getCompoentCategoryDetails(Long componentName_id)
	{

		Map<Long, CompoentCategoryDetailBean> map = new HashMap<Long, CompoentCategoryDetailBean>();

		ComponentCategoryDetailsDao dao = new ComponentCategoryDetailsDao();
		List<CompoentCategoryDetailBean> ven1List = dao.getcompentCategoryDetailForEdit(componentName_id);

		System.out.println("Size in Helper------ : "+ven1List.size());

		return ven1List;
	}



	public void updateCompoenentCategoryDetails(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("In helper");

		String fkCompoentid= request.getParameter("fkCompoentid");
		String componentCategory = request.getParameter("componentCategory");
		String componentName = request.getParameter("componentName");
		String componentNewName = request.getParameter("componentNewName");
		String description = request.getParameter("description");
		String componentValue = request.getParameter("componentValue");
		String partNumber=request.getParameter("partNumber");
		String manufractureName=request.getParameter("manufacturerName");
		String type=request.getParameter("type");
		String tovRating=request.getParameter("totalVolt");
		String fkCompTypeId=request.getParameter("pkCompTypeId");

		String unit=request.getParameter("unit");
		String unitprice=request.getParameter("unitPrice");
		String unitPrice=request.getParameter("unitPrice1");
		String packages=request.getParameter("packages");
		String fkTaxTypeId = request.getParameter("fktaxid");
		String taxName = request.getParameter("TaxName");
		System.out.println("Tax name is"+taxName);
		String taxPercentage = request.getParameter("taxPercentage");
		String CGST = request.getParameter("CGST");
		String SGST = request.getParameter("SGST");
		String duty = request.getParameter("duty");

		System.out.println("Id from JSP  :  "+fkCompoentid);
		System.out.println("Name from JSP  :  "+componentName);
		System.out.println("compoent category id"+fkCompTypeId);



		ComponentCategoryDetailsDao dao=new ComponentCategoryDetailsDao();

		List list=dao.getAllCompTnameDetails();


		System.out.println("SIZE FROM DAO   : "+list.size());


		for(int i=0;i<list.size();i++)
		 {

		CompoentCategoryDetailsHibernate bean1 = (CompoentCategoryDetailsHibernate) list.get(i);

		Long Compkid=bean1.getPkComponentCategoryDetailsId();
		String Compname=bean1.getComponentName();



		 if(Compname.equals(componentName) && Compkid.equals(Long.parseLong(fkCompoentid)))
		 {
			 	HibernateUtility hbu = HibernateUtility.getInstance();
				Session session = hbu.getHibernateSession();
				Transaction transaction = session.beginTransaction();

				CompoentCategoryDetailsHibernate bean = (CompoentCategoryDetailsHibernate) session.get(CompoentCategoryDetailsHibernate.class,new Long(Compkid));


		if(!"".equals(componentCategory)){
			bean.setComponentCategory(componentCategory);
		}else{
			bean.setComponentCategory("N/A");
		}
		if(!"".equals(componentNewName)){
			bean.setComponentName(componentNewName);

		}else{
			bean.setComponentName("N/A");
		}
		if(!"".equals(description)){
			bean.setDescription(description);
		}else{
			bean.setDescription("N/A");
		}
		if(!"".equals(manufractureName)){
			bean.setManufractureName(manufractureName);
		}else{
			bean.setManufractureName("N/A");
		}
		if(!"".equals(fkTaxTypeId)){
			bean.setFkTaxTypeId(Long.parseLong(fkTaxTypeId));
		}else{
			bean.setFkTaxTypeId(0l);
		}
		if(!"".equals(taxName)){
			bean.setTaxName(taxName);
			System.out.println("Tax name is"+taxName);
		}else{
			bean.setTaxName("N/A");
		}
		if(!"".equals(taxPercentage)){
			bean.setTaxPercentage(Double.parseDouble(taxPercentage));
		}else{
			bean.setTaxPercentage(0d);
		}
		if(!"".equals(CGST)){
			bean.setCGST(Double.parseDouble(CGST));
		}else{
			bean.setCGST(0d);
		}
		if(!"".equals(SGST)){
			bean.setSGST(Double.parseDouble(SGST));
		}else{
			bean.setSGST(0d);
		}

		if(!"".equals(unitPrice)){
			bean.setUnitPriceWithCustomduty(Double.parseDouble(unitPrice));
		}else{
			bean.setUnitPriceWithCustomduty(0d);
		}
		if(!"".equals(unitprice)){
			bean.setUnitPrice(Double.parseDouble(unitprice));
		}else{
			bean.setUnitPrice(0d);
		}

		if(!"".equals(type)){
			bean.setComponentType(type);
		}else{
			bean.setComponentType("N/A");
		}

		if(!"".equals(tovRating)){
			bean.setTovRating(tovRating);
		}else{
			bean.setTovRating("N/A");
		}

		if(!"".equals(componentValue)){
			bean.setComponentValue(componentValue);
		}else{
			bean.setComponentValue("N/A");
		}
		if(!"".equals(packages)){
			bean.setPackages(packages);
		}else{
			bean.setPackages("N/A");
		}
		if(!"".equals(unit)){
			bean.setUnit(Double.parseDouble(unit));

		}else{
			bean.setUnit(0d);
		}


		if(!"".equals(duty)){
			bean.setDuty(Double.parseDouble(duty));
		}else{
			bean.setDuty(0d);
		}

		/*if(!"".equals(fkCompTypeId)){
			bean.setFkCompTypeId(Long.parseLong(fkCompTypeId));
		}else{
			bean.setFkCompTypeId(0l);
		} */

		if(!"".equals(partNumber)){
			bean.setPartNumber(partNumber);
		}else{
			bean.setPartNumber("N/A");
		}
		session.update(bean);
		transaction.commit();

		break;

	}


		 }
	}



	public void getDeleteCompCatList(HttpServletRequest request, HttpServletResponse response) {

			System.out.println("In helper");

			String pkTempId= request.getParameter("pkTempId");

			ComponentCategoryDetailsDao cdo = new ComponentCategoryDetailsDao();
			cdo.getDeleteCompCatList(pkTempId);

	}



//	public void uploadBulkCompoentCategoryDetail(HttpServletRequest request, HttpServletResponse response) {
//
//	            String jdbcURL = "jdbc:mysql://localhost:3306/embel_soft";
//	            String username = "root";
//	            String password = "root";
//
//	            String filename =request.getParameter("filename");
//
//	            File file = new File(filename);
//
//	            String path = file.getAbsolutePath();
//
//	            //int batchSize = 20;
//
//	            Connection connection = null;
//
//	            try {
//	                long start = System.currentTimeMillis();
//
//		        	FileInputStream inputStream = new FileInputStream(path);
//
//		            XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
//
//		            XSSFSheet firstSheet = workbook.getSheetAt(0);
//
//	                connection = DriverManager.getConnection(jdbcURL, username, password);
//	                connection.setAutoCommit(false);
//
//	   String sql = "INSERT INTO compoent_category_details(pk_compoent_category_id,compoent_category,compoent_name,compoent_value,part_number,manufracture_name,descrption,type,packages,tov_rating,unit,unit_price,duty,unit_price_customduty,tax_name,tax_percentage,cgst,sgst) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" ;
//
//	        PreparedStatement statement = connection.prepareStatement(sql);
//
//            //int count = 0;
//	        Iterator<Row> rowIterator = firstSheet.iterator();
//            rowIterator.next(); // skip the header row
//
//            while (rowIterator.hasNext()) {
//                Row nextRow = rowIterator.next();
//                Iterator<Cell> cellIterator = nextRow.cellIterator();
//
//                while (cellIterator.hasNext()) {
//                    Cell nextCell = cellIterator.next();
//
//                    int columnIndex = nextCell.getColumnIndex();
//
//                    switch (columnIndex) {
//
//                    case 0:
//                    	long pk_compoent_category_id = (long) nextCell.getNumericCellValue();
//                    	statement.setLong(1, pk_compoent_category_id);
//                    	break;
//
//                    case 1:
//                    	String compoent_category = nextCell.getStringCellValue();
//                        statement.setString(2, compoent_category);
//                        break;
//                    case 2:
//                    	String compoent_name = nextCell.getStringCellValue();
//                        statement.setString(3, compoent_name);
//                        break;
//                    case 3:
//                    	String compoent_value = nextCell.getStringCellValue();
//                    	statement.setString(4, compoent_value);
//                    	break;
//
//                    case 4:
//                    	String part_number = nextCell.getStringCellValue();
//                    	statement.setString(5, part_number);
//                    	break;
//
//                    case 5:
//                    	String manufracture_name = nextCell.getStringCellValue();
//                    	statement.setString(6, manufracture_name);
//                    	break;
//
//                    case 6:
//                    	String descrption = nextCell.getStringCellValue();
//                    	statement.setString(7, descrption);
//                    	break;
//
//                    case 7:
//                    	String type = nextCell.getStringCellValue();
//                    	statement.setString(8, type);
//                    	break;
//
//                    case 8:
//                    	String packages = nextCell.getStringCellValue();
//                    	statement.setString(9, packages);
//                    	break;
//
//                    case 9:
//                    	String tov_rating = nextCell.getStringCellValue();
//                    	statement.setString(10, tov_rating);
//                    	break;
//
//                    case 10:
//                    	double unit =(double) nextCell.getNumericCellValue();
//                    	String unit1 = String.valueOf(unit);
//                    	statement.setString(11, unit1);
//                    	break;
//
//                    case 11:
//                    	double unit_price =(double) nextCell.getNumericCellValue();
//                    	String unit_price1 = String.valueOf(unit_price);
//                    	statement.setString(12, unit_price1);
//                    	break;
//
//                    case 12:
//                    	double duty =(double) nextCell.getNumericCellValue();
//                    	String duty1 = String.valueOf(duty);
//                    	statement.setString(13, duty1);
//                    	break;
//
//                    case 13:
//                    	double unit_price_customduty = (double) nextCell.getNumericCellValue();
//                    	String unit_price_customduty1 = String.valueOf(unit_price_customduty);
//                    	statement.setString(14, unit_price_customduty1);
//                    	break;
//
//                    case 14:
//                    	String tax_name = nextCell.getStringCellValue();
//                    	statement.setString(15, tax_name);
//                    	break;
//
//                    case 15:
//                    	double tax_percentage =(double) nextCell.getNumericCellValue();
//                    	String tax_percentage1 = String.valueOf(tax_percentage);
//                    	statement.setString(16, tax_percentage1);
//                    	break;
//
//                    case 16:
//                    	double cgst =(double) nextCell.getNumericCellValue();
//                    	String cgst1 = String.valueOf(cgst);
//                    	statement.setString(17, cgst1);
//                    	break;
//
//                    case 17:
//                    	double sgst =(double) nextCell.getNumericCellValue();
//                    	String sgst1 = String.valueOf(sgst);
//                    	statement.setString(18, sgst1);
//                    	break;
//
//                    case 18:
//                    	String action = nextCell.getStringCellValue();
//                      	break;
//
//                    }
//
//                }
//
//                statement.addBatch();
//
////                if (count % batchSize == 0) {
////                    statement.executeBatch();
////                }
//
//            }
//
//            workbook.close();
//
//            // execute the remaining queries
//            statement.executeBatch();
//
//            connection.commit();
//            connection.close();
//
//            long end = System.currentTimeMillis();
//            System.out.printf("Import done in %d ms\n", (end - start));
//
//        } catch (IOException ex1) {
//            System.out.println("Error reading file");
//            ex1.printStackTrace();
//
//        } catch (SQLException ex2) {
//            System.out.println("Database error");
//            ex2.printStackTrace();
//        }
//
//    }


	public HashMap<String, List<Integer>> addExcelFileDataToDatabase2(HttpServletRequest request, HttpServletResponse response)
			throws IOException, InvalidFormatException, EncryptedDocumentException, ParseException {

		
		
		   String filename = request.getParameter("filename");
		 //  String filename = "C:\\bulkUpload\\compoent_category_details.xlsx";
		   File file = new File(filename);
		   
		   String filepath = file.getAbsolutePath();

		   FileInputStream inputStream = new FileInputStream(filepath);

	        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);

			XSSFSheet worksheet = workbook.getSheetAt(0);
			
			ComponentCategoryDetailsDao dao= new ComponentCategoryDetailsDao();
			int icnt1=0,icnt2=0,icnt3=0;
			List cblist = null;

			ArrayList<Integer>list=new ArrayList<Integer>();
			ArrayList<Integer>updatedlist=new ArrayList<Integer>();
			ArrayList<Integer>savedlist=new ArrayList<Integer>();

			System.out.println("worksheet.getPhysicalNumberOfRows() "+worksheet.getPhysicalNumberOfRows());

			for(int index = 1; index <worksheet.getPhysicalNumberOfRows(); index++)
			{
				icnt3++;

				if (index > 0) {
					XSSFRow row = worksheet.getRow(index);

				       FormulaEvaluator formulaEvaluator = workbook.getCreationHelper().createFormulaEvaluator();

//				         for (Cell cell : row) {//iterate columns
//				           //cell type
//				           switch (formulaEvaluator.evaluateInCell(cell).getCellType())
//				           {
//				                 case Cell.CELL_TYPE_NUMERIC:
//				                     cell.getNumericCellValue();
//				                     break;
//				                 case Cell.CELL_TYPE_STRING:
//				                     cell.getStringCellValue();
//				                     break;
//				           }
//				         }
			         
				       // New code for cell and row 
				         for (Cell cell : row) {
				        	    // cell type
				        	    switch (formulaEvaluator.evaluateInCell(cell).getCellType()) {
				        	        case NUMERIC:
				        	            double numericValue = cell.getNumericCellValue();
				        	            // Do something with numericValue
				        	            break;
				        	        case STRING:
				        	            String stringValue = cell.getStringCellValue();
				        	            // Do something with stringValue
				        	            break;
				        	        // Add more cases as needed for other cell types

				        	        default:
				        	            // Handle other cell types if necessary
				        	            break;
				        	    }
				        	}

				 

					CompoentCategoryDetailsHibernate bean = new CompoentCategoryDetailsHibernate();
					try {
					String srNo = row.getCell(0, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String ComponentCategory = row.getCell(1, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					long FkCompTypeId = (long) row.getCell(2).getNumericCellValue();
					String ComponentName = row.getCell(3, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String ComponentValue = row.getCell(4, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String PartNumber = row.getCell(5, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String ManufractureName = row.getCell(6, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String Description = row.getCell(7, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String ComponentType = row.getCell(8, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String Packages = row.getCell(9, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String TovRating = row.getCell(10, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String Unit = row.getCell(11, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String TaxName = row.getCell(12, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String TaxPercentage = row.getCell(13, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					long FKTaxTypeId = (long) row.getCell(14).getNumericCellValue();
					String CGST = row.getCell(15, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String SGST = row.getCell(16, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String UnitPrice = row.getCell(17, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();					
					String UnitPriceWithCustomduty = row.getCell(18, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String Duty = row.getCell(19, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					String componentSubCategory = row.getCell(20, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
					long fksubCategory = (long) row.getCell(21).getNumericCellValue();
					
					//String action = row.getCell(20, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();


				   cblist = dao.getcompentCategoryDetailForBulkUpload(ComponentCategory, ComponentName, ComponentValue, PartNumber, ManufractureName, ComponentType, Packages, TovRating,componentSubCategory);

					if(cblist.size()==0) {

						System.out.println("if size()==0 in CompoentCategoryDetail - -  - - - ");

						//bean.setPkComponentCategoryDetailsId(componentName_id);
	                	bean.setComponentCategory(ComponentCategory);
	                	bean.setComponentName(ComponentName);
	                	bean.setFkCompTypeId(FkCompTypeId);
	                	bean.setComponentValue(ComponentValue);
	                	bean.setPartNumber(PartNumber);
	                	bean.setManufractureName(ManufractureName);
	                	bean.setDescription(Description);
	                	bean.setComponentType(ComponentType);
	                	bean.setPackages(Packages);
	                	bean.setTovRating(TovRating);
	                	bean.setUnit(Double.parseDouble(Unit));
	                	bean.setUnitPrice(Double.parseDouble(UnitPrice));
	                	bean.setDuty(Double.parseDouble(Duty));
	                	bean.setUnitPriceWithCustomduty(Double.parseDouble(UnitPriceWithCustomduty));
	                	bean.setTaxName(TaxName);
	                	bean.setTaxPercentage(Double.parseDouble(TaxPercentage));
	                	bean.setFkTaxTypeId(FKTaxTypeId);
	                	bean.setCGST(Double.parseDouble(CGST));
	                	bean.setSGST(Double.parseDouble(SGST));
	                	bean.setComponentSubCategory(componentSubCategory);
	                	bean.setFksubCategory(fksubCategory);

				dao.bulkSaveCompoentCategoryDetail(bean);
				icnt1++;
				savedlist.add(index);
				System.out.println("data saved");

				}

					else
				      {
				    	  for(int j=0; j<cblist.size(); j++) {

				    		  com.embelSoft.hibernate.CompoentCategoryDetailsHibernate cdh = (com.embelSoft.hibernate.CompoentCategoryDetailsHibernate)cblist.get(j);

				    		  System.out.println("if item exist in CompoentCategoryDetail - -  - - - ");

				    		  Long pkid = cdh.getPkComponentCategoryDetailsId();

				    		  String compCat = cdh.getComponentCategory();
				    		  String compNm = cdh.getComponentName();
				    		  String compVal = cdh.getComponentValue();
				    		  String compPartNo = cdh.getPartNumber();
				    		  String compManuf = cdh.getManufractureName();
				    		  String compType = cdh.getComponentType();
				    		  String compPkg = cdh.getPackages();
				    		  String compTovRate = cdh.getTovRating();

				    			 HibernateUtility hbu = HibernateUtility.getInstance();
				         		 Session session = hbu.getHibernateSession();
				         		 Transaction transaction = session.beginTransaction();

				         if(compCat.equals(ComponentCategory) && compNm.equals(ComponentName) && compVal.equals(ComponentValue) && compPartNo.equals(PartNumber) && compManuf.equals(ManufractureName) && compType.equals(ComponentType) && compPkg.equals(Packages) && compTovRate.equals(TovRating))
				         {
				         		CompoentCategoryDetailsHibernate up = (CompoentCategoryDetailsHibernate) session.get(CompoentCategoryDetailsHibernate.class, new Long(pkid));

			                	up.setComponentCategory(ComponentCategory);
			                	up.setComponentName(ComponentName);
			                	up.setFkCompTypeId(FkCompTypeId);
			                	up.setComponentValue(ComponentValue);
			                	up.setPartNumber(PartNumber);
			                	up.setManufractureName(ManufractureName);
			                	up.setDescription(Description);
			                	up.setComponentType(ComponentType);
			                	up.setPackages(Packages);
			                	up.setTovRating(TovRating);
			                	up.setUnit(Double.parseDouble(Unit));
			                	up.setUnitPrice(Double.parseDouble(UnitPrice));
			                	up.setDuty(Double.parseDouble(Duty));
			                	up.setUnitPriceWithCustomduty(Double.parseDouble(UnitPriceWithCustomduty));
			                	up.setTaxName(TaxName);
			                	up.setTaxPercentage(Double.parseDouble(TaxPercentage));
			                	up.setFkTaxTypeId(FKTaxTypeId);
			                	up.setCGST(Double.parseDouble(CGST));
			                	up.setSGST(Double.parseDouble(SGST));

				         		session.saveOrUpdate(up);
				         		icnt2++;
				         		updatedlist.add(index);
				         		transaction.commit();
				         		System.out.println("data updated");
				         	}
				    	 }
				      }
					}

					catch(Exception e) {
						e.printStackTrace();
						list.add(icnt3);
						System.out.println("Exception in list: "+e);
					}
				}

			}

			HashMap<String,List<Integer>> map=new HashMap<String,List<Integer>>();

			//map.put("Saved Records", new ArrayList<Integer>(Arrays.asList(icnt1)));
			//map.put("Updated Records", new ArrayList<Integer>(Arrays.asList(icnt2)));
			map.put("Saved Records", savedlist);
			map.put("Updated Records", updatedlist);
			map.put("Wrong Records", list);

			Set<String> set1 = map.keySet();
			for(String key : set1) {
			List<Integer> value=map.get(key);
			System.out.println(key+" "+value);

			}

			return map;

	}






}
