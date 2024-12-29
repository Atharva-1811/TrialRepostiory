<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.embelSoft.utility.NumToWord"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="java.util.Formatter"%>
<%@page import="javax.sound.midi.Soundbank"%>
<%@page import="com.itextpdf.text.pdf.codec.Base64.OutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.embelSoft.utility.PDFPath"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import= "java.text.ParseException"%>
<%@page import="java.awt.Desktop"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.util.List"%> import java.math.*;
<%@page import="java.math.BigInteger"%>

<%@ page import="com.itextpdf.text.Element"%>
<%--  <%@page import="com.itextpdf.text.log.SysoLogger"%> --%>
<%@page import="java.util.List"%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.text.DateFormat"%>

<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.PdfGState"%>


<%@page import="org.hibernate.Session"%>


<%@page import="javax.activation.DataSource"%>
<%@page import="javax.mail.util.ByteArrayDataSource"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.Address"%>
<%@page import="com.sun.mail.smtp.SMTPTransport"%>
<%@page import="javax.mail.URLName"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Transport"%>
<%-- <%@page import="javax.mail.Session"%>
 --%>
<%@page import="com.embelSoft.utility.HibernateUtility" %>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.embelSoft.bean.GetVendorDetailsBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.embelSoft.bean.HrBillingBean" %>
<%@page import="com.embelSoft.bean.HrBillingForPDF" %>

<%@ page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>





<%
response.setContentType("application/pdf");

		
		String fkVendorId = (String)session.getAttribute("fkVendorId");
		String billNumber = (String)session.getAttribute("billForPdf");
		System.out.println("TestVenderBillingPDF billForPdf :- " +billNumber);
		String vendorNameBill = (String) session.getAttribute("vendorNameVendorBill");
		
		String descriptionVendorBill = (String) session.getAttribute("descriptionVendorBill");
		String quantityVendorBill = (String) session.getAttribute("quantityVendorBill");
		String unitVendorBill = (String) session.getAttribute("unitVendorBill");
		String amountVendorBill = (String) session.getAttribute("amountVendorBill");
		
		String subTotalVendorBill = (String) session.getAttribute("subTotalVendorBill");
		String gstVendorBill = (String) session.getAttribute("gstVendorBill");
		String vatVendorBill = (String) session.getAttribute("vatVendorBill");
		String gridGstPercent = (String) session.getAttribute("gridGstPercent");
		String gridGstPercentAmount = (String) session.getAttribute("gridGstPercentAmount");
		String grossTotal1VendorBill = (String) session.getAttribute("grossTotal1VendorBill");
		
		



int quantCount = 0;
double finalTotAmountWithoutDis = 0;
double finalTotAmountWithDis = 0;
double finalDiscountAmt = 0;
double finalgross = 0;
double finalDis = 0;

double expenseExtra = 0;
double totalAmount = 0;
double vatAmount = 0;
double interGstAmount = 0;
int itemCount = 0;
String totAmountStr = "";
String vatAmountStr = "";
String extraExpence = "";
String paymentMode = "";
double totalBags = 0;
double packingOfBag = 0;
String allItemNames = "";
String AllInOne = "";
double TotalOfTotalAmtWithoutVat = 0;
double TotalOfTotalAmtWithoutVat1 = 0;
double half = 2;
double gsttax = 0;
double GrandTotal = 0.0;
double Total = 0.0;
double TotalTax = 0.0;
double stateTaxTotal = 0.0;
int a = 1;
String discount = "";
Double totalDiscount = 0.0;
String gst1 = "";
Double gstAmt = 0.0;


	try {
		
		DecimalFormat df = new DecimalFormat("#.00");    

		Font font8Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		//Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		Font font35Bold = new Font(Font.FontFamily.TIMES_ROMAN, 35, Font.BOLD, BaseColor.BLACK);
		Font font12Bold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font10Bold = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.BOLD, BaseColor.BLACK);
		Font font11Bold = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.BOLD, BaseColor.BLACK);
		
		Font font12BoldUnderlineBlue = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLUE);
		Font font12BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.RED);
		Font font15BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.RED);
		Font font16BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD, BaseColor.RED);
		
		//Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font18Bold = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
		Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font10 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font16BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD | Font.UNDERLINE, BaseColor.RED);

		Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font Normalfont10 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont15 = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont16 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont17 = new Font(Font.FontFamily.TIMES_ROMAN, 17, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont18 = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.NORMAL, BaseColor.BLACK);
		
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);
		
		Font NormalRedfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont16 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.RED);
			
		Connection conn = null;
		Connection conn1 = null;
		// step 1
		Document document = new Document();

		// step 2
		PdfWriter.getInstance(document, response.getOutputStream());
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, baos);


		// step 3
		document.open();

		
	 	HibernateUtility hbu=null;
		Session session1=null;
		Transaction transaction=null;


		hbu = HibernateUtility.getInstance();
		session1 = hbu.getHibernateSession();
		
		List<GetVendorDetailsBean> venList=null;
		
		Query query=session1.createSQLQuery("SELECT company_name, company_address, address, state, zip_code, country, contact_number, alternate_contact_number,email_id, gst_in_number, PAN_number, CIM_number, vendor_name from vendor_details WHERE pk_vendor_details_id=:fkVendorId AND vendor_name=:vendorNameBill");
		query.setParameter("vendorNameBill", vendorNameBill);
		query.setParameter("fkVendorId", fkVendorId);
		
		//List<PurchaseOrderCreateBean> results = query.list();
		
		List<Object[]> results = query.list();
		venList= new ArrayList<GetVendorDetailsBean>(0);

	for (Object[] o : results) {	

		GetVendorDetailsBean reports = new GetVendorDetailsBean();

		reports.setCompanyName(o[0].toString());
		reports.setCompanyAddress(o[1].toString());
		reports.setAddress(o[2].toString());
		reports.setState(o[3].toString());
		reports.setZipCode(o[4].toString());
		reports.setCountry(o[5].toString());
		reports.setContactNo(Long.parseLong(o[6].toString()));
		reports.setAlternateContactNo(o[7].toString());
		reports.setEmailId(o[8].toString());
		reports.setGstInNo(o[9].toString());
		reports.setPANNum(o[10].toString());
		reports.setCIMNo(o[11].toString());
		reports.setVendorName(o[12].toString());
		
		venList.add(reports);
	}
		
	System.out.println("list Size:--------------------------"+results.size());

		
		
		System.out.println("Query Execute TestVenderBillingPDF");
		Date d1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		//SimpleDateFormat sdf3 = new SimpleDateFormat("dd-MMM-yyyy");
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("E");
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss  ");
		sdf2.setTimeZone(TimeZone.getTimeZone("IST"));

		Date billDate = new Date();
		SimpleDateFormat dateFormater = new SimpleDateFormat("dd-MM-yyyy");
		String StrBillDate = dateFormater.format(billDate);
		
		String stdver1 = (String) sdf.format(d1);
		String dtfinl = stdver1;


		
		// Logo start
		
					Image image1;
						PDFPath path = new PDFPath();
						try
						{
							 image1 = Image.getInstance(path.getLocalPath());
						    
						}catch(Exception e)
						{
							 image1 = Image.getInstance(path.getServerPath());
						}
						image1.scaleToFit(250f, 500f);
						Image imageCenter = Image.getInstance(image1);
						imageCenter.setAlignment(Image.MIDDLE);
						
						
						document.add(imageCenter);
						
					
				// End	logo	
		
		
	//For Company Name
	
		PdfPTable headercn = new PdfPTable(3);
	 	headercn.setWidthPercentage(100); 

		float[] columnWidths11 = {10f,4f,6f};
		headercn.setWidths(columnWidths11);

		PdfPCell table_cell;
		
		
		    table_cell  = new PdfPCell(new Phrase("",font15BoldRED));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
	        table_cell  = new PdfPCell(new Phrase("Bill No",font12Bold));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
		
	        table_cell  = new PdfPCell(new Phrase(""+billNumber,Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
			
			
			table_cell  = new PdfPCell(new Phrase("Vanashree Palace, 2nd floor, Above Chate Classes,",Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
	        table_cell  = new PdfPCell(new Phrase(" Date ",font12Bold));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
			
	        table_cell  = new PdfPCell(new Phrase(""+StrBillDate,Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
			
			
			
			table_cell  = new PdfPCell(new Phrase("Near Tapodham Bus Stop, NDA Road, Warje Naka,",Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
	        table_cell  = new PdfPCell(new Phrase(" GSTIN ",font12Bold));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
			
	        table_cell  = new PdfPCell(new Phrase("27AAECE4252H1ZQ",Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			

			
			table_cell  = new PdfPCell(new Phrase("Pune, Maharashtra 411058.",Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
	        table_cell  = new PdfPCell(new Phrase(" PAN No  ",font12Bold));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
			
	        table_cell  = new PdfPCell(new Phrase("AAECE4252H",Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);

			
			
// 			table_cell  = new PdfPCell(new Phrase("",Normalfont11));
// 			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
// 			table_cell.setBorder(Rectangle.NO_BORDER);
// 			headercn.addCell(table_cell); 
			
			
			table_cell  = new PdfPCell(new Phrase("Phone  +91 8668757349",Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
	        table_cell  = new PdfPCell(new Phrase(" CIN  \n\n",font12Bold));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
			
	        table_cell  = new PdfPCell(new Phrase("U72200PN2016PTC166648\n\n",Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
	
			
			
			document.add(headercn);
			
			
			
		
	// Vendor Details
	
			
	
			PdfPTable table1 = new PdfPTable(1);
			table1.setWidthPercentage(100); 

			float[] columnWidths1 = {20f};
			table1.setWidths(columnWidths1);

			PdfPCell table_cell1;
			
	
				 	
	 List<GetVendorDetailsBean> list12=venList;

			int k=0;
			
	 for(int i=0;i<list12.size();i++)
	{
		 GetVendorDetailsBean sr=(GetVendorDetailsBean)list12.get(i);
	
		 
			table_cell1  = new PdfPCell(new Phrase("Vendor Details",font12Bold));
			table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell1.setBorder(Rectangle.NO_BORDER);
			table1.addCell(table_cell1);
				
			table_cell1  = new PdfPCell(new Phrase("",font12Bold));
			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell1.setBorder(Rectangle.NO_BORDER);
			table1.addCell(table_cell1);
				
				
			table_cell1  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell1.setBorder(Rectangle.NO_BORDER);
			table1.addCell(table_cell1);
				
			
			
			PdfPTable table0 = new PdfPTable(1);
			table0.setWidthPercentage(100); 

			float[] columnWidths0 = {20f};
			table0.setWidths(columnWidths0);

			PdfPCell table_cell0;
			table_cell  = new PdfPCell(new Phrase("",font12BoldUnderline));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.BOTTOM);
			table0.addCell(table_cell);
			document.add(table0);
			document.add(new Paragraph("\n"));
			
		//vendor Company Name 
// 			String vendorName = sr.getVendorName();
			
// 			table_cell1  = new PdfPCell(new Phrase("Vendor Name:"+vendorName,Normalfont11));
// 			table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
// 			table_cell1.setBorder(Rectangle.NO_BORDER);
// 			table1.addCell(table_cell1);
				
// 			table_cell1  = new PdfPCell(new Phrase("",font12Bold));
// 			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
// 			table_cell1.setBorder(Rectangle.NO_BORDER);
// 			table1.addCell(table_cell1);
				
				
// 			table_cell1  = new PdfPCell(new Phrase("",Normalfont11));
// 			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
// 			table_cell1.setBorder(Rectangle.NO_BORDER);
// 			table1.addCell(table_cell1);
			
					
// 			//vendor Company Name
// 			String companyName = sr.getCompanyName();	
			
// 			table_cell1  = new PdfPCell(new Phrase("Company Name:"+companyName,Normalfont11));
// 			table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
// 			table_cell1.setBorder(Rectangle.NO_BORDER);
// 			table1.addCell(table_cell1);
				
// 			table_cell1  = new PdfPCell(new Phrase("",font12Bold));
// 			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
// 			table_cell1.setBorder(Rectangle.NO_BORDER);
// 			table1.addCell(table_cell1);
				
				
// 			table_cell1  = new PdfPCell(new Phrase("",Normalfont11));
// 			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
// 			table_cell1.setBorder(Rectangle.NO_BORDER);
// 			table1.addCell(table_cell1);
			
			
// 			String companyAddress = sr.getCompanyAddress();
			
// 			table_cell1  = new PdfPCell(new Phrase("Add:"+companyAddress,Normalfont11));
// 			table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
// 			table_cell1.setBorder(Rectangle.NO_BORDER);
// 			table1.addCell(table_cell1);
				
// 			table_cell1  = new PdfPCell(new Phrase("",font12Bold));
// 			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
// 			table_cell1.setBorder(Rectangle.NO_BORDER);
// 			table1.addCell(table_cell1);
				
				
// 			table_cell1  = new PdfPCell(new Phrase("",Normalfont11));
// 			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
// 			table_cell1.setBorder(Rectangle.NO_BORDER);
// 			table1.addCell(table_cell1);
		
	
			document.add(table1);
			
			//vendor Company Name address
			// Table 2.1
			
			PdfPTable table3 = new PdfPTable(3);
			table3.setWidthPercentage(100); 

			float[] columnWidths3 = {4f,6f,10f};
			table3.setWidths(columnWidths3);

			PdfPCell table_cell3;
			
			String vendorName = sr.getVendorName();
			
			table_cell3  = new PdfPCell(new Phrase("Vendor Name :",font12Bold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
			table_cell3  = new PdfPCell(new Phrase(""+vendorName,Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
				
			table_cell3  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
			
			
			String companyName = sr.getCompanyName();
			
			table_cell3  = new PdfPCell(new Phrase("Company Name :",font12Bold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
			table_cell3  = new PdfPCell(new Phrase(""+companyName,Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
				
			table_cell3  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
			
			
			String companyAddress = sr.getCompanyAddress();
			
			table_cell3  = new PdfPCell(new Phrase("Address :",font12Bold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
			table_cell3  = new PdfPCell(new Phrase(""+companyAddress,Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
				
			table_cell3  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
			
			
			document.add(table3);
			
	
				
 		// Table 3
			
	 		PdfPTable table2 = new PdfPTable(5);
			table2.setWidthPercentage(100); 

			float[] columnWidths2 = {4f,6f,4f,5f,1f};
			table2.setWidths(columnWidths2);

			PdfPCell table_cell2;
			
			
			
			String city = sr.getAddress();
			
			table_cell2  = new PdfPCell(new Phrase("City :",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase(""+city,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			
			String state = sr.getState();
				
			table_cell2  = new PdfPCell(new Phrase("State :",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
				
			table_cell2  = new PdfPCell(new Phrase(""+state,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
						
			
			String country = sr.getCountry();
			
			table_cell2  = new PdfPCell(new Phrase("Country :",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
				
			table_cell2  = new PdfPCell(new Phrase(""+country,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			String zipCode = sr.getZipCode();
			
			table_cell2  = new PdfPCell(new Phrase("Zip Code :",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase(""+zipCode,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			
			
			Long contactNo = sr.getContactNo();
			
			table_cell2  = new PdfPCell(new Phrase("Mobile No. :",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase(""+contactNo,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			
			String alternateContactNo = sr.getAlternateContactNo();	

			table_cell2  = new PdfPCell(new Phrase("Alternate No. :",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
				
			table_cell2  = new PdfPCell(new Phrase(""+alternateContactNo,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			
			
			String email = sr.getEmailId();
			
			table_cell2  = new PdfPCell(new Phrase("Email ID :",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase(""+email,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
			String gstNo = sr.getGstInNo();	
			
			table_cell2  = new PdfPCell(new Phrase("GSTIN : ",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
			table_cell2  = new PdfPCell(new Phrase(""+gstNo,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
		
			
			
			String panNo = sr.getPANNum();
			table_cell2  = new PdfPCell(new Phrase("PAN No : ",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase(""+panNo,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
			String cinNo = sr.getCIMNo();	
			
			table_cell2  = new PdfPCell(new Phrase("CIN No : ",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
			table_cell2  = new PdfPCell(new Phrase(""+cinNo,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase("\n\n",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			
			
			
			 document.add(table2);
	
			
			
	}	
	 
	 	HibernateUtility hbu2=null;
		Session session2=null;
		Transaction transaction2=null;


		hbu2 = HibernateUtility.getInstance();
		session2 = hbu.getHibernateSession();
		
		List<HrBillingForPDF> billList=null;
		
		Query query2 = session2.createSQLQuery("select description, hsn, quantity, unit_price, amount from hr_billing_details WHERE bill_no = :billNumber");
		query2.setParameter("billNumber", billNumber);
		
		List<Object[]> results2 = query2.list();

		billList= new ArrayList<HrBillingForPDF>(0);

		System.out.println("In PDF------------------======size============     : "+results2.size());
		
		for(Object[] obj : results2)
		{
			HrBillingForPDF bean = new HrBillingForPDF();

			bean.setDescription2(obj[0].toString());
			bean.setHsn2(obj[1].toString());
			bean.setQuantity2(obj[2].toString());
			bean.setUnitPrice2(obj[3].toString());
			bean.setTotal2(obj[4].toString());
			
			billList.add(bean);
		
		}
		
			// Table for table data (Dyanamic)
				
				PdfPTable table11 = new PdfPTable(6);
				table11.setSpacingBefore(6);
				table11.setWidthPercentage(100);
				table11.setSpacingAfter(6);
				
				
				float[] columnWidths111 = { 0.2f, 0.4f, 0.3f, 0.3f, 0.4f, 0.5f };
				table11.setWidths(columnWidths111);
				
				PdfPCell table_cell11;
				
				table_cell11 = new  PdfPCell(new Phrase("Sr. No.", font11Bold));
				table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
				table11.addCell(table_cell11);
				
				
				table_cell11 = new  PdfPCell(new Phrase("DESCRIPTION", font11Bold));
				table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
				table11.addCell(table_cell11);
				
				
				table_cell11 = new  PdfPCell(new Phrase("HSN", font11Bold));
				table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
				table11.addCell(table_cell11);
				
				
				table_cell11 = new  PdfPCell(new Phrase("QUANTITY", font11Bold));
				table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
				table11.addCell(table_cell11);
				
				table_cell11 = new  PdfPCell(new Phrase("UNIT PRICE", font11Bold));
				table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
				table11.addCell(table_cell11);
				
				table_cell11 = new  PdfPCell(new Phrase("TOTAL", font11Bold));
				table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
				table11.addCell(table_cell11);
				
				
				
		 	
				 List<HrBillingForPDF> list122=billList;

		 			int l=0;
		 			
				 for(int i=0;i<list122.size();i++)
				{
					 HrBillingForPDF sr1=(HrBillingForPDF)list122.get(i);
				
			
						// 1
							l++;
						
						table_cell11 = new  PdfPCell(new Phrase(""+l, Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						//table_cell11.setBorder(Rectangle.BOTTOM);
						table11.addCell(table_cell11);
							
						
						// 2 
					String description3 = sr1.getDescription2(); 
					
						table_cell11 = new  PdfPCell(new Phrase(""+description3, Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						
						
						// 3
						String hsn3 = sr1.getHsn2();
						
						table_cell11 = new  PdfPCell(new Phrase(""+hsn3, Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						// 4
						String quantity3 = sr1.getQuantity2();
						
						table_cell11 = new  PdfPCell(new Phrase(""+quantity3, Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
				
						
						// 4 
						String buy_price3 = sr1.getUnitPrice2();
						
						table_cell11 = new  PdfPCell(new Phrase(""+buy_price3, Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						
						
						// 5
						String total3 = sr1.getTotal2(); 
						
						table_cell11 = new  PdfPCell(new Phrase(""+total3, Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
			
				
				}
				
				
				
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);

						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
				 
						document.add(table11);
				
						
						
						
						PdfPTable table111 = new PdfPTable(3);
						table111.setSpacingBefore(3);
						table111.setWidthPercentage(100);
						table111.setSpacingAfter(3);
						
						
						float[] columnWidths1111 = { 1.2f, 0.4f, 0.5f };
						table111.setWidths(columnWidths1111);
						
						PdfPCell table_cell111;
						
					// for Sub Total
						
						//1
						
						table_cell111 = new  PdfPCell(new Phrase("BANK : STATE BANK OF INDIA,TAMSA ", font13Bold));
						table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111);
				
						// 2 
						
						
						table_cell111 = new  PdfPCell(new Phrase("Sub Total (Rs) ", font12Bold));
						table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111);
						
						
						// 3
						
						table_cell111 = new  PdfPCell(new Phrase(""+subTotalVendorBill, Normalfont15));
						table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111); 
						
						
					//for GST
					
						//1
						
						table_cell111 = new  PdfPCell(new Phrase("A/C No. : 62300088676", font13Bold));
						table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111);
				
						// 2 
						
						
						table_cell111 = new  PdfPCell(new Phrase("CGST (%) ", font12Bold));
						table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111);
						
						
						// 3
						double half2 = 2;
						double gst3 = (Double.parseDouble(gstVendorBill));
						double halfgst2 = gst3 / half2;
						table_cell111 = new  PdfPCell(new Phrase(""+halfgst2, Normalfont15));
						table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111); 
						
						
					// for GST Amount
					
						//1
						
						table_cell111 = new  PdfPCell(new Phrase("IFSC Code : SBIN0020307", font13Bold));
						table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111);
				
						
						
						table_cell111 = new  PdfPCell(new Phrase("SGST (%) ", font12Bold));
						table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111);
						
						
						double half1 = 2;
						double gst2 = (Double.parseDouble(gstVendorBill));
						double halfgst = gst2 / half1;
						table_cell111 = new  PdfPCell(new Phrase(String.valueOf(halfgst), Normalfont15));
						table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111);
						
						
						table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
						table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111);
						
						// 2 
						
						
						table_cell111 = new  PdfPCell(new Phrase("GST Amount (Rs) ", font12Bold));
						table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111);
						
						
						
						
						
						// 3
						
						table_cell111 = new  PdfPCell(new Phrase(""+vatVendorBill, Normalfont15));
						table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111); 
					
					
					// for Gross Total	
						//1
						
						table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
						table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111);
				
						// 2 
						
						
						table_cell111 = new  PdfPCell(new Phrase("Gross Total (Rs)\n ", font13Bold));
						table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111);
						
						
						// 3
						
						table_cell111 = new  PdfPCell(new Phrase(""+grossTotal1VendorBill, font16BoldRED));
						table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
						table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
						table111.addCell(table_cell111); 
						
						
						
					// for Gross Total	
						//1
						
						table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
						table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111);
				
						// 2 
						
						
						table_cell111 = new  PdfPCell(new Phrase("\n\n\nSignature  ", Normalfont11));
						table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111);
						
						
						// 3
						
						table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
						table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111); 							
						
						
					// for Gross Total	
						//1
						
						table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
						table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111);
				
						// 2 
						
						
						table_cell111 = new  PdfPCell(new Phrase("Prepared By \n ", Normalfont11));
						table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111);
						
						
						// 3
						
						table_cell111 = new  PdfPCell(new Phrase("Sumeet Bandewar", font13Bold));
						table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell111.setBorder(Rectangle.NO_BORDER);
						table111.addCell(table_cell111); 
						
						
						document.add(table111);
						

					
					
					
			// For Footer	
					
					PdfPTable table12 = new PdfPTable(1);
					table11.setSpacingBefore(1);
					table11.setWidthPercentage(100);
					table11.setSpacingAfter(1);
					
					
					float[] columnWidths112 = {20};
					table12.setWidths(columnWidths112);
					
					PdfPCell table_cell12;

					table_cell12 = new  PdfPCell(new Phrase("\n\nThank you for contributing towards growth of our business", font12Bold));
					table_cell12.setHorizontalAlignment(Element.ALIGN_CENTER);
					//table_cell12.setBorder(Rectangle.LEFT);
					table_cell12.setBorder(Rectangle.NO_BORDER);
					table12.addCell(table_cell12);
					
					document.add(table12);
					
					document.add(new Paragraph(""));
					
					//website and email
					PdfPTable table5 = new PdfPTable(4);
					table5.setWidthPercentage(100); 

					float[] columnWidths5 = {3.8f,6.2f,2.5f,7.5f};
					table5.setWidths(columnWidths5);

					PdfPCell table_cell5;
							
					
					document.add(new Paragraph(
							"---------------------------------------------------------------------------------------------------------------------------------"));
					document.add(new Paragraph("\n"));
					
						table_cell5  = new PdfPCell(new Phrase("Email-id:",font12Bold));
						table_cell5.setHorizontalAlignment(Element.ALIGN_RIGHT);
						table_cell5.setBorder(Rectangle.NO_BORDER);
						table5.addCell(table_cell5);
	
						table_cell5  = new PdfPCell(new Phrase("sumeetbandewar@embel.co.in",font12BoldUnderlineBlue));
						table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell5.setBorder(Rectangle.NO_BORDER);
						table5.addCell(table_cell5);
						
						table_cell5  = new PdfPCell(new Phrase("   Website:",font12Bold));
						table_cell5.setHorizontalAlignment(Element.ALIGN_RIGHT);
						table_cell5.setBorder(Rectangle.NO_BORDER);
						table5.addCell(table_cell5);
						
						table_cell5  = new PdfPCell(new Phrase("www.embel.co.in",font12BoldUnderlineBlue));
						table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell5.setBorder(Rectangle.NO_BORDER);
						table5.addCell(table_cell5);
					
						document.add(table5);
					document.close();
					
			
			try{
				
			 	
				 List<GetVendorDetailsBean> list1222 = venList;
				
				 
				 for(int i=0;i<list1222.size();i++)
				{
					 GetVendorDetailsBean sr=(GetVendorDetailsBean)list1222.get(i);
			
					 String name = sr.getVendorName();
					 String emailId = sr.getEmailId();
				
				
				  javax.mail.Session mailSession = javax.mail.Session.getInstance(System.getProperties());
	              /* Transport transport = new SMTPTransport(mailSession,new URLName("smtp.gmail.com"));
	              transport = mailSession.getTransport("smtps");
	              transport.connect("smtp.gmail.com", 465 ,"sales@embel.co.in","Embel@sales1"); //ClothSoft Embel@sales1
	               */
	               Transport transport = new SMTPTransport(mailSession,new URLName("smtp.gmail.com"));
		              transport = mailSession.getTransport("smtps");
		              transport.connect("smtp.gmail.com", 465 ,"embelmessanger@gmail.com","Embel@123");
	              MimeMessage m = new MimeMessage(mailSession); 
	              m.setFrom(new InternetAddress(emailId));
	              Address[] toAddr = new InternetAddress[] {
	              new InternetAddress(emailId)
	              };
	              m.setRecipients(javax.mail.Message.RecipientType.TO, toAddr );
	              m.setHeader("Content-Type", "multipart/mixed");
	              m.setSubject("Bill");
	              m.setSentDate(new java.util.Date());

	              MimeBodyPart messageBodyPart = new MimeBodyPart();
	              messageBodyPart.setText("Dear,  "+name);
	              Multipart multipart = new MimeMultipart();
	              multipart.addBodyPart(messageBodyPart);

	              messageBodyPart = new MimeBodyPart();

	              DataSource source = new ByteArrayDataSource(baos.toByteArray(), "application/pdf");
	              messageBodyPart.setDataHandler(new DataHandler(source));
	              messageBodyPart.setFileName("Resource Billing.pdf");
	              multipart.addBodyPart(messageBodyPart);

	              m.setContent(multipart);

	              transport.sendMessage(m,m.getAllRecipients());
	              transport.close();
	              out.println("Thanks for sending mail!");
	            }
			}
	            catch(Exception e){
	              out.println(e.getMessage());
	              e.printStackTrace();
	            }
		}
		 catch (DocumentException de)
		{
			throw new IOException(de.getMessage());
		}
	%>
	