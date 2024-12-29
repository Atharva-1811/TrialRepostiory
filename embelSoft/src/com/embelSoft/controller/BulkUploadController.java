package com.embelSoft.controller;
/*
 * package com.embel.controller;
 * 
 * import java.io.File; import java.io.FileInputStream; import
 * java.io.IOException; import java.io.PrintWriter; import java.nio.file.Files;
 * import java.nio.file.Paths; import java.nio.file.StandardCopyOption; import
 * java.util.ArrayList; import java.util.HashMap; import java.util.List; import
 * java.util.Set;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.MultipartConfig; import
 * javax.servlet.http.HttpServlet; import javax.servlet.http.HttpServletRequest;
 * import javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.Part;
 * 
 * import org.apache.log4j.Logger; import org.apache.poi.ss.usermodel.Cell;
 * import org.apache.poi.ss.usermodel.FormulaEvaluator; import
 * org.apache.poi.xssf.usermodel.XSSFRow; import
 * org.apache.poi.xssf.usermodel.XSSFSheet; import
 * org.apache.poi.xssf.usermodel.XSSFWorkbook; import org.hibernate.Session;
 * import org.hibernate.Transaction; import
 * org.apache.poi.ss.usermodel.CellType;
 * 
 * import com.embelSoft.dao.ComponentCategoryDetailsDao; import
 * com.embelSoft.dao.TaxDetailsDao; import
 * com.embelSoft.hibernate.CompoentCategoryDetailsHibernate; import
 * com.embelSoft.hibernate.TaxDetailsHibernate; import
 * com.embelSoft.utility.HibernateUtility;
 * 
 * 
 * @MultipartConfig public class BulkUploadController extends HttpServlet {
 * 
 * static Logger logger = Logger.getLogger(BulkUploadController.class);
 * 
 * private static final long serialVersionUID = 1L; public final String
 * UPLOAD_DIR= "C:\\Users\\Atharva Solaskar\\Desktop\\Bulk Upload Template";
 * //for localhost and windows Server //public final String UPLOAD_DIR=
 * "/home/ubuntu/excelFiles/"; //for ubuntu Server
 * 
 * public BulkUploadController() { super(); }
 * 
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * response.getWriter().append("Served at: ").append(request.getContextPath());
 * }
 * 
 * //Component Category Bulk Upload by Namrata
 * 
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * 
 * int icnt1=0,icnt2=0,icnt3=0; List cblist = null;
 * 
 * ArrayList<Integer>list=new ArrayList<Integer>();
 * ArrayList<Integer>updatedlist=new ArrayList<Integer>();
 * ArrayList<Integer>savedlist=new ArrayList<Integer>();
 * 
 * response.setContentType("text/html;charset=UTF-8");
 * 
 * try(PrintWriter out = response.getWriter()) {
 * 
 * Part fln = request.getPart("filename");
 * 
 * String f = fln.getSubmittedFileName();
 * 
 * //Create folder if not created File fl = new File(UPLOAD_DIR);
 * if(!fl.exists()) { fl.mkdir();
 * 
 * //Permissions fl.setExecutable(true, false); fl.setReadable(true, false);
 * fl.setWritable(true, false); }
 * 
 * //System.out.println("**** path :"+fl); //logger.info("**** path :"+fl);
 * 
 * Files.copy(fln.getInputStream(),
 * Paths.get(UPLOAD_DIR+f),StandardCopyOption.REPLACE_EXISTING);
 * 
 * File file = new File(UPLOAD_DIR+f);
 * 
 * logger.info("**** File Reads from Path :"+file);
 * 
 * FileInputStream inputStream = new FileInputStream(file);
 * 
 * XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
 * 
 * XSSFSheet worksheet = workbook.getSheetAt(0);
 * 
 * ComponentCategoryDetailsDao dao= new ComponentCategoryDetailsDao();
 * 
 * //System.out.println("worksheet.getPhysicalNumberOfRows()"+worksheet.
 * getPhysicalNumberOfRows());
 * 
 * for(int index = 1; index <worksheet.getPhysicalNumberOfRows(); index++) {
 * icnt3++;
 * 
 * if (index > 0) { XSSFRow row = worksheet.getRow(index);
 * 
 * FormulaEvaluator formulaEvaluator =
 * workbook.getCreationHelper().createFormulaEvaluator();
 * 
 * // for (Cell cell : row) {//iterate columns // //cell type // switch
 * (formulaEvaluator.evaluateInCell(cell).getCellType()) // { // case
 * Cell.CELL_TYPE_NUMERIC: // cell.getNumericCellValue(); // break; // case
 * Cell.CELL_TYPE_STRING: // cell.getStringCellValue(); // break; // } // }
 * 
 * for (Cell cell : row) { // cell type switch
 * (formulaEvaluator.evaluateInCell(cell).getCellType()) { case NUMERIC: double
 * numericValue = cell.getNumericCellValue(); // Do something with numericValue
 * break; case STRING: String stringValue = cell.getStringCellValue(); // Do
 * something with stringValue break; // Add more cases as needed for other cell
 * types
 * 
 * default: // Handle other cell types if necessary break; } }
 * 
 * CompoentCategoryDetailsHibernate bean = new
 * CompoentCategoryDetailsHibernate(); try { String srNo = row.getCell(0,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String ComponentCategory = row.getCell(1,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); //long FkCompTypeId = (long)
 * row.getCell(2).getNumericCellValue(); ComponentCategoryDetailsDao categoryDao
 * = new ComponentCategoryDetailsDao(); long FkCompTypeId =
 * categoryDao.getfkCompTypeIdForBulkUpload(ComponentCategory); String
 * ComponentName = row.getCell(2,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String ComponentValue = row.getCell(3,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String PartNumber = row.getCell(4,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String ManufractureName = row.getCell(5,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String Description = row.getCell(6,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String ComponentType = row.getCell(7,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String Packages = row.getCell(8,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String TovRating = row.getCell(9,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String Unit = row.getCell(10,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String UnitPrice = row.getCell(11,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String Duty = row.getCell(12,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String UnitPriceWithCustomduty = row.getCell(13,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); //String TaxName = row.getCell(15,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString();
 * 
 * String TaxPercentage = row.getCell(14,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); //long FKTaxTypeId = (long)
 * row.getCell(17).getNumericCellValue(); TaxDetailsDao taxDao = new
 * TaxDetailsDao(); List<TaxDetailsHibernate> taxList =
 * taxDao.getTaxDetailsForBulkUpload(Double.parseDouble(TaxPercentage)); String
 * TaxName=taxList.get(1).getTaxType(); long FKTaxTypeId
 * =taxList.get(1).getPkTaxDetailsId(); String CGST
 * =taxList.get(1).getCGST().toString(); String SGST =
 * taxList.get(1).getTaxType().toString(); // String CGST = row.getCell(18,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); // String SGST = row.getCell(19,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); //String action = row.getCell(20,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString(); String componentSubCategory = row.getCell(2,
 * org.apache.poi.ss.usermodel.Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).
 * toString();
 * 
 * cblist = dao.getcompentCategoryDetailForBulkUpload(ComponentCategory,
 * ComponentName, ComponentValue, PartNumber, ManufractureName, ComponentType,
 * Packages, TovRating,componentSubCategory);
 * 
 * // if item not exist in CompoentCategoryDetail cblist.size()==0
 * if(cblist.size()==0) {
 * //bean.setPkComponentCategoryDetailsId(componentName_id);
 * bean.setComponentCategory(ComponentCategory);
 * bean.setComponentName(ComponentName); bean.setFkCompTypeId(FkCompTypeId);
 * bean.setComponentValue(ComponentValue); bean.setPartNumber(PartNumber);
 * bean.setManufractureName(ManufractureName); bean.setDescription(Description);
 * bean.setComponentType(ComponentType); bean.setPackages(Packages);
 * bean.setTovRating(TovRating); bean.setUnit(Double.parseDouble(Unit));
 * bean.setUnitPrice(Double.parseDouble(UnitPrice));
 * bean.setDuty(Double.parseDouble(Duty));
 * bean.setUnitPriceWithCustomduty(Double.parseDouble(UnitPriceWithCustomduty));
 * bean.setTaxName(TaxName);
 * bean.setTaxPercentage(Double.parseDouble(TaxPercentage));
 * bean.setFkTaxTypeId(FKTaxTypeId); bean.setCGST(Double.parseDouble(CGST));
 * bean.setSGST(Double.parseDouble(SGST));
 * 
 * dao.bulkSaveCompoentCategoryDetail(bean); icnt1++; savedlist.add(index);
 * //logger.debug(index); logger.info(index+" No's Record is Saved");
 * //System.out.println("data saved");
 * 
 * }
 * 
 * else { // if item already exist in CompoentCategoryDetail for(int j=0;
 * j<cblist.size(); j++) {
 * 
 * com.embelSoft.hibernate.CompoentCategoryDetailsHibernate cdh =
 * (com.embelSoft.hibernate.CompoentCategoryDetailsHibernate)cblist.get(j);
 * 
 * Long pkid = cdh.getPkComponentCategoryDetailsId(); String compCat =
 * cdh.getComponentCategory(); String compNm = cdh.getComponentName(); String
 * compVal = cdh.getComponentValue(); String compPartNo = cdh.getPartNumber();
 * String compManuf = cdh.getManufractureName(); String compType =
 * cdh.getComponentType(); String compPkg = cdh.getPackages(); String
 * compTovRate = cdh.getTovRating();
 * 
 * HibernateUtility hbu = HibernateUtility.getInstance(); Session session =
 * hbu.getHibernateSession(); Transaction transaction =
 * session.beginTransaction();
 * 
 * if(compCat.equals(ComponentCategory) && compNm.equals(ComponentName) &&
 * compVal.equals(ComponentValue) && compPartNo.equals(PartNumber) &&
 * compManuf.equals(ManufractureName) && compType.equals(ComponentType) &&
 * compPkg.equals(Packages) && compTovRate.equals(TovRating)) {
 * CompoentCategoryDetailsHibernate up = (CompoentCategoryDetailsHibernate)
 * session.get(CompoentCategoryDetailsHibernate.class, new Long(pkid));
 * 
 * up.setComponentCategory(ComponentCategory);
 * up.setComponentName(ComponentName); up.setFkCompTypeId(FkCompTypeId);
 * up.setComponentValue(ComponentValue); up.setPartNumber(PartNumber);
 * up.setManufractureName(ManufractureName); up.setDescription(Description);
 * up.setComponentType(ComponentType); up.setPackages(Packages);
 * up.setTovRating(TovRating); up.setUnit(Double.parseDouble(Unit));
 * up.setUnitPrice(Double.parseDouble(UnitPrice));
 * up.setDuty(Double.parseDouble(Duty));
 * up.setUnitPriceWithCustomduty(Double.parseDouble(UnitPriceWithCustomduty));
 * up.setTaxName(TaxName);
 * up.setTaxPercentage(Double.parseDouble(TaxPercentage));
 * up.setFkTaxTypeId(FKTaxTypeId); up.setCGST(Double.parseDouble(CGST));
 * up.setSGST(Double.parseDouble(SGST));
 * 
 * session.saveOrUpdate(up); icnt2++; updatedlist.add(index);
 * transaction.commit(); //logger.debug(index);
 * logger.info(index+" No's Record is Updated");
 * //System.out.println("data updated"); } } }
 * 
 * } catch(Exception e) { e.printStackTrace(); list.add(icnt3);
 * //logger.debug(icnt3); logger.info(icnt3+" No's Record is Wrong");
 * //System.out.println("Exception in list: "+e); } } }
 * 
 * workbook.close();
 * 
 * HashMap<String,List<Integer>> map=new HashMap<String,List<Integer>>();
 * 
 * //map.put("Saved Records", new ArrayList<Integer>(Arrays.asList(icnt1)));
 * //map.put("Updated Records", new ArrayList<Integer>(Arrays.asList(icnt2)));
 * map.put("Saved Records", savedlist); map.put("Updated Records", updatedlist);
 * map.put("Wrong Records", list);
 * 
 * Set<String> set1 = map.keySet(); for(String key : set1) { List<Integer>
 * value=map.get(key);
 * 
 * //logger.debug(key+" "+value); logger.info(key+" "+value);
 * //System.out.println(key+" "+value); out.println(key+" "+value); }
 * 
 * } catch(Exception e) { e.printStackTrace(); }
 * 
 * }
 * 
 * 
 * }
 */