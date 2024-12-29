package com.embelSoft.controller;
//package com.embel.controller;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.nio.file.Files;
//import java.nio.file.Paths;
//import java.nio.file.StandardCopyOption;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Set;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Part;
//
//import org.apache.log4j.Logger;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.FormulaEvaluator;
//import org.apache.poi.xssf.usermodel.XSSFRow;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//
//import com.embelSoft.dao.ComponentCategoryDetailsDao;
//import com.embelSoft.dao.ComponentReceivedPODao;
//import com.embelSoft.dao.ComponentStockDao;
//import com.embelSoft.hibernate.CompTypeDetailsHibernate;
//import com.embelSoft.hibernate.CompoentCategoryDetailsHibernate;
//import com.embelSoft.hibernate.ComponentReceivedPOHibernate;
//import com.embelSoft.hibernate.ComponentStockHibernate;
//import com.embelSoft.hibernate.VendorDetailsHibernate;
//import com.embelSoft.utility.HibernateUtility;
//import org.apache.tomcat.util.*;
//
//
//@MultipartConfig
//public class StockBulkUploadController extends HttpServlet {
//	
//	static Logger logger = Logger.getLogger(StockBulkUploadController.class);
//	
//	private static final long serialVersionUID = 1L;
//	//public final String UPLOAD_DIR= "C:/Users/Public/excelFiles/";	//for localhost and windows Server
//	public final String UPLOAD_DIR= "/home/ubuntu/excelFiles/";		//for ubuntu Server
//
//    public StockBulkUploadController() {
//        super();
//    }
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	//Component Stocks Bulk Upload by Namrata
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    	int icnt1=0,icnt2=0,icnt3=0;
//		List cblist = null;
//		List vendorList = null;
//		List comptypeList = null;
//		List compoentnameList = null;
//
//		ArrayList<Integer>list=new ArrayList<Integer>();
//		ArrayList<Integer>updatedlist=new ArrayList<Integer>();
//		ArrayList<Integer>savedlist=new ArrayList<Integer>();
//    	
//    	response.setContentType("text/html;charset=UTF-8");
//	
//		try(PrintWriter out = response.getWriter()) {
//			
//			Part fln = request.getPart("filename1");
//			
//			String f = fln.getSubmittedFileName();
//			
//			//Create folder if not created
//			File fl = new File(UPLOAD_DIR);
//			if(!fl.exists()) {
//				fl.mkdir();
//				
//				//Permissions
//				fl.setExecutable(true, false);
//				fl.setReadable(true, false);
//				fl.setWritable(true, false);
//			}
//			
//			//System.out.println("**** path :"+fl);
//			//logger.info("**** path :"+fl);
//			
//			Files.copy(fln.getInputStream(), Paths.get(UPLOAD_DIR+f),StandardCopyOption.REPLACE_EXISTING);
//
//			   File file = new File(UPLOAD_DIR+f);
//			   
//			   logger.info("**** File Reads from Path :"+file);
//
//			FileInputStream inputStream = new FileInputStream(file);  
//			
//		        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
//
//				XSSFSheet worksheet = workbook.getSheetAt(0);
//				
//				ComponentReceivedPODao dao= new ComponentReceivedPODao();
//				
//				//System.out.println("worksheet.getPhysicalNumberOfRows()"+worksheet.getPhysicalNumberOfRows());
//				
//				for(int index = 1; index <worksheet.getPhysicalNumberOfRows(); index++)
//				{
//					icnt3++;
//				
//					if (index > 0) {
//						XSSFRow row = worksheet.getRow(index);
//		
//					       FormulaEvaluator formulaEvaluator = workbook.getCreationHelper().createFormulaEvaluator();
//
//					         for (Cell cell : row) {//iterate columns
//					           //cell type
//					           switch (formulaEvaluator.evaluateInCell(cell).getCellType())
//					           {
//					                 case Cell.CELL_TYPE_NUMERIC:
//					                     cell.getNumericCellValue();
//					                     break;
//					                 case Cell.CELL_TYPE_STRING:
//					                     cell.getStringCellValue();
//					                     break;
//					           }
//					         }
//					         
//					    ComponentReceivedPOHibernate bean = new ComponentReceivedPOHibernate();
//						try {
//						//String srNo = row.getCell(0, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String vendorName = row.getCell(1, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						long fkVendorId = (long) row.getCell(2).getNumericCellValue();
//						String billChallanNo = row.getCell(3, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						Date purchaseOrderDate = row.getCell(4).getDateCellValue();
//						Date expectPaymentDate = row.getCell(5).getDateCellValue();
//						String componentType = row.getCell(6, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						long fkCompTypeId = (long) row.getCell(7).getNumericCellValue();
//						String componentName = row.getCell(8, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						long fkCompoentnameid = (long) row.getCell(9).getNumericCellValue();
//						String compValue = row.getCell(10, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String partName = row.getCell(11, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String manufacturarName = row.getCell(12, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String description = row.getCell(13, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String type = row.getCell(14, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String compPackage = row.getCell(15, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String tolerance = row.getCell(16, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String unit = row.getCell(17, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String unitPrice = row.getCell(18, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						long quantity = (long) row.getCell(19).getNumericCellValue();
//						String subTotal = row.getCell(20, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String GST = row.getCell(21, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String IGST = row.getCell(22, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String taxAmount = row.getCell(23, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String total = row.getCell(24, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String totalSubTotal = row.getCell(25, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String totalTaxAmount = row.getCell(26, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						String grossTotal = row.getCell(27, org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).toString();
//						
//					   cblist = dao.getcompentCategoryPODetailForBulkUpload(vendorName, componentType, componentName, compValue, partName, manufacturarName, type, compPackage, tolerance,unitPrice, GST, IGST);
//					   
//					   // for fkVendorId
////					   vendorList = dao.getVendorId(vendorName);
////					   Long fkVendorId=0l;
////					   
////					   for (int i = 0; i < vendorList.size(); i++) {
////						   VendorDetailsHibernate venderhbm = (VendorDetailsHibernate) vendorList.get(i);
////						   fkVendorId=venderhbm.getPkVendorDetailsId();
////					   }
////					   
////					   // for fkCompTypeId
////					   comptypeList = dao.getfkCompTypeId(componentType);
////					   Long fkCompTypeId=0l;
////					   
////					   for (int i = 0; i < comptypeList.size(); i++) {
////						   CompTypeDetailsHibernate comptypehbm = (CompTypeDetailsHibernate) comptypeList.get(i);
////						   fkCompTypeId=comptypehbm.getPkCompTypeId();
////					   }
//					   
//					   //for fkCompoentnameid
////					   compoentnameList = dao.getfkCompNameId(componentName);
////					   Long fkCompoentnameid=0l;
//					   
////					   for (int i = 0; i < compoentnameList.size(); i++) {
////						   ComponentStockDao comptypeNmhbm = (CompTypeDetailsHibernate) compoentnameList.get(i);
////						   fkCompoentnameid=comptypeNmhbm.getPkCompTypeId();
////					   }
//			
//					// if item not exist in CompoentCategoryDetail cblist.size()==0
//					   if(cblist.size()==0) {
//						   
//						   	bean.setVendorName(vendorName);
//							bean.setFkvendorId(fkVendorId);
//							bean.setBillChallanNo(billChallanNo);
//							
//							//Dates Format
//				        	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//							//Calendar cal = Calendar.getInstance();
//							String currentDate =  dateFormat.format(purchaseOrderDate.getTime()).toString();
//							String currentDate1 =  dateFormat.format(expectPaymentDate.getTime()).toString();
//							
//							Date purchaseOrderDate1 = null;
//							Date expectPaymentDate1 = null;
//							try{
//								purchaseOrderDate1 = dateFormat.parse(currentDate);
//								expectPaymentDate1 = dateFormat.parse(currentDate1);
//							}
//							catch(Exception e){
//								e.printStackTrace();
//								System.out.println("Exception in date parsing");
//							}
//							
//							//purchaseOrderDate
//							bean.setPurchaseOrderDate(purchaseOrderDate1);
//							
//							//expectPaymentDate
//							bean.setExpectPaymentDate(expectPaymentDate1);
//
//							bean.setFkCompoentnameid(fkCompoentnameid);
//							bean.setComponentType(componentType);
//							bean.setFkCompTypeId(fkCompTypeId);
//							bean.setComponentName(componentName);
//							bean.setCompValue(compValue);
//							bean.setPartName(partName);
//							bean.setManufacturarName(manufacturarName);
//							bean.setDescription(description);
//							bean.setType(type);
//							bean.setCompPackage(compPackage);
//							bean.setTolerance((tolerance));
//							bean.setUnit(unit);
//							bean.setUnitPrice(Double.parseDouble(unitPrice));
//							bean.setQuantity(quantity);
//							bean.setSubTotal(Double.parseDouble(subTotal));
//							bean.setGST(Double.parseDouble(GST));
//							bean.setIGST(Double.parseDouble(IGST));
//							bean.setTaxAmount(Double.parseDouble(taxAmount));
//							bean.setTotal(Double.parseDouble(total));
//							bean.setTotalSubTotal(Double.parseDouble(totalSubTotal));
//							bean.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
//							bean.setGrossTotal(Double.parseDouble(grossTotal));
//
//							dao.bulkSaveCompGoodReceivedDetailas(bean);
//							
//					icnt1++;
//					savedlist.add(index);
//			        logger.info(index+" No's Record is Saved");
//					//System.out.println("data saved");
//
//					}	
//						
//						else
//					      {
//							// if item already exist in CompoentCategoryDetail
//					    	  for(int j=0; j<cblist.size(); j++) {
//					    		      		  
//					    		  com.embelSoft.hibernate.ComponentReceivedPOHibernate cdh = (com.embelSoft.hibernate.ComponentReceivedPOHibernate)cblist.get(j);  
//					    		  Long pkid = cdh.getPkCompRPOId();
//					    		  Long quan = cdh.getQuantity();
//
//					    			 HibernateUtility hbu = HibernateUtility.getInstance();
//					         		 Session session = hbu.getHibernateSession();
//					         		 Transaction transaction = session.beginTransaction();
// 
//					         		ComponentReceivedPOHibernate up = (ComponentReceivedPOHibernate) session.get(ComponentReceivedPOHibernate.class, new Long(pkid));	 
//					         		 
//					         		up.setVendorName(vendorName);
//									up.setFkvendorId(fkVendorId);
//									up.setBillChallanNo(billChallanNo);
//									
//									//Dates Format
//						        	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//									//Calendar cal = Calendar.getInstance();
//									String currentDate =  dateFormat.format(purchaseOrderDate.getTime()).toString();
//									String currentDate1 =  dateFormat.format(expectPaymentDate.getTime()).toString();
//									
//									Date purchaseOrderDate1 = null;
//									Date expectPaymentDate1 = null;
//									try{
//										purchaseOrderDate1 = dateFormat.parse(currentDate);
//										expectPaymentDate1 = dateFormat.parse(currentDate1);
//									}
//									catch(Exception e){
//										e.printStackTrace();
//									}
//									
//									//purchaseOrderDate
//									up.setPurchaseOrderDate(purchaseOrderDate1);
//								
//									//expectPaymentDate
//									up.setExpectPaymentDate(expectPaymentDate1);
//
//									up.setFkCompoentnameid(fkCompoentnameid);
//									up.setComponentType(componentType);
//									up.setFkCompTypeId(fkCompTypeId);
//									up.setComponentName(componentName);
//									up.setCompValue(compValue);
//									up.setPartName(partName);
//									up.setManufacturarName(manufacturarName);
//									up.setDescription(description);
//									up.setType(type);
//									up.setCompPackage(compPackage);
//									up.setTolerance((tolerance));
//									up.setUnit(unit);
//									up.setUnitPrice(Double.parseDouble(unitPrice));
//									
//									Long updatedQuan = quan+quantity;
//									
//									up.setQuantity(updatedQuan);
//									up.setSubTotal(Double.parseDouble(subTotal));
//									up.setGST(Double.parseDouble(GST));
//									up.setIGST(Double.parseDouble(IGST));
//									up.setTaxAmount(Double.parseDouble(taxAmount));
//									up.setTotal(Double.parseDouble(total));
//									up.setTotalSubTotal(Double.parseDouble(totalSubTotal));
//									up.setTotalTaxAmount(Double.parseDouble(totalTaxAmount));
//									up.setGrossTotal(Double.parseDouble(grossTotal));
//				 
//					         		session.saveOrUpdate(up);
//					         		icnt2++;
//					         		updatedlist.add(index);
//					         		transaction.commit();
//					         		//logger.debug(index);
//							        logger.info(index+" No's Record is Updated");
//					         		//System.out.println("data updated");
//					         	
//					    	 }
//					      }
//					   
//					   
//					   /********************************* ****************** LOAD COMPONENT STOCK ENTRY COMPONENT STOCK *********************************************/
//						
//						//compStockLastUpdateDate
//			        	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//						Calendar cal = Calendar.getInstance();
//						String currentDate =  dateFormat.format(cal.getTime()).toString();
//						Date compStockLastUpdateDate = null;
//						try{
//							compStockLastUpdateDate = dateFormat.parse(currentDate);
//						}
//						catch(Exception e){
//							e.printStackTrace();
//						}
//						
//						ComponentStockDao csDao = new ComponentStockDao();
//						List csList = csDao.getAllLoadComponentStockEntry();
//						
//						/*----------------------------- If Stock Is Empty ------------------------------*/ 
//				        if(csList.size() == 0)
//				        {
//				        	//System.out.println("1ST IF().....\nWhen Stock Details List ======= 0"+csList.size());
//				        	
//				        	ComponentStockHibernate csh = new ComponentStockHibernate();
//				        	csh.setComponentType(componentType);
//				        	csh.setFkCompTypeId(fkCompTypeId);
//				        	csh.setComponentName(componentName);
//				        	
//				        	csh.setFkCompoentnameid(fkCompoentnameid);
//				        	
//				        	csh.setManufacturarName(manufacturarName);
//				        	csh.setType(type);
//				        	csh.setCompPackage(compPackage);
//				        	csh.setUnit(unit);
//				        	csh.setQuantity(quantity);
//				        	csh.setCompStockLastUpdateDate(compStockLastUpdateDate);		
//				        	
//				        	ComponentStockDao csDao1 = new ComponentStockDao();
//				        	csDao1.saveComponentStockDetailas(csh);
//				        }
//				        /*---------------------------------To Update Stock Table If It is Not Empty ---------------------------------------*/
//				        else
//				        {
//				        	  for(int j=0;j<csList.size();j++)
//					    	   {
//					             	//System.out.println("1ST IF's ELSE().....\nwhen Stockdetails is GREATER THAN 0 =====> "+csList.size());
//					             	
//					             	ComponentStockHibernate csh = (ComponentStockHibernate)csList.get(j);
//					             	
//					             	//Long pkCompStockIdOld = csh.getPkCompStockId();
//					             	String componentTypeOld = csh.getComponentType();
//					            	Long fkCompTypeIdOld = csh.getFkCompTypeId();
//					            	String componentNameOld = csh.getComponentName();
//					            	Long FkCompoentnameidOld=csh.getFkCompoentnameid();
//					            	String manufacturarNameOld = csh.getManufacturarName();
//					            	String typeOld = csh.getType();
//					            	String compPackageOld = csh.getCompPackage();
//					            	String unitOld = csh.getUnit();
//					            	Long quantityOld = csh.getQuantity();
//					            	Long pkCompStockIdOld = csh.getPkCompStockId();
//					            	Date compStockLastUpdateDateOld = csh.getCompStockLastUpdateDate();
//					            	
//					            	//String componentType;
//					            	//Long fkCompTypeId;
//					            	
//					            	if(componentTypeOld.equals(componentType) && componentNameOld.equals(componentName))
//					            	{
//					            		System.out.println("IF INSIDE ELSE BLOCK ==== CONDITION TRUE ===== inside If");
//					            		
//					            		Long quantityUpdate =  quantityOld + quantity;
//						        		    	        	
//					    	        	 HibernateUtility hbu = HibernateUtility.getInstance();
//					            		 Session session2 = hbu.getHibernateSession();
//					            		 org.hibernate.Transaction transaction = session2.beginTransaction();
//					            	
//					            		ComponentStockHibernate updateStock = (ComponentStockHibernate) session2.get(ComponentStockHibernate.class, new Long(pkCompStockIdOld));
//
//					            		updateStock.setQuantity(quantityUpdate);
//					            		updateStock.setCompStockLastUpdateDate(compStockLastUpdateDate);
//					            		
//					            		session2.saveOrUpdate(updateStock);
//					            		transaction.commit();
//					            		break;            		
//					            	}
//					            	else
//					            	{
//									  /*-------------------------------- ItemName is Not Exists ---------------------------------------*/
//					            		if(j+1 == csList.size())
//					            		{
//					            			//System.out.println("IF INSIDE ELSE IF ELSE BLOCK VALUE OF J+1 ===================>"+j);
//					            			
//					            			ComponentStockHibernate newEntry = new ComponentStockHibernate();
//					            					            			
//					            			newEntry.setComponentType(componentType);
//					            			newEntry.setFkCompTypeId(fkCompTypeId);
//					            			newEntry.setComponentName(componentName);
//					            			newEntry.setFkCompoentnameid(fkCompoentnameid);
//					            			newEntry.setManufacturarName(manufacturarName);
//					            			newEntry.setType(type);
//					            			newEntry.setCompPackage(compPackage);
//					            			newEntry.setUnit(unit);
//					            			newEntry.setQuantity(quantity);
//					            			newEntry.setCompStockLastUpdateDate(compStockLastUpdateDate);
//					            			
//					            			ComponentStockDao csDao1 = new ComponentStockDao();
//					        	        	csDao1.saveComponentStockDetailas(newEntry);
//					            		}
//					            	}
//					    	   } 	
//				        }
//					   
//						
//						}	
//					catch(Exception e) {
//						e.printStackTrace();
//						list.add(icnt3);
//						//logger.debug(icnt3);
//				        logger.info(icnt3+" No's Record is Wrong");
//						//System.out.println("Exception in list: "+e);
//						}
//					
//					}
//				}
//				
//				workbook.close();
//				
//				
//				HashMap<String,List<Integer>> map=new HashMap<String,List<Integer>>();
//				
//				//map.put("Saved Records", new ArrayList<Integer>(Arrays.asList(icnt1)));
//				//map.put("Updated Records", new ArrayList<Integer>(Arrays.asList(icnt2)));
//				map.put("Saved Records", savedlist);
//				map.put("Updated Records", updatedlist);
//				map.put("Wrong Records", list);
//
//				Set<String> set1 = map.keySet();
//				for(String key : set1) {
//				List<Integer> value=map.get(key);
//				
//				//logger.debug(key+" "+value);
//		        logger.info(key+" "+value);
//				//System.out.println(key+" "+value);
//				out.println(key+" "+value);
//				}
//				
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//
//    }
//
//    
//}