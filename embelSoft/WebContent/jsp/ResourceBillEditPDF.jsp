
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<%@page import="java.util.List"%>
<!-- import java.math.*; -->
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

<%@page import="com.embelSoft.bean.ResourceBillingBean" %>
<%@page import="com.embelSoft.hibernate.TaxDetailsHibernate" %>
<%@page import="com.embelSoft.dao.TaxDetailsDao" %>



<%
	response.setContentType("application/pdf");
	//response.setHeader("Content-disposition","attachment; filename = ResourceProformabilling.pdf");
		
	String fkVendorId = (String)session.getAttribute("fkVendorId");
	String billNo = (String)session.getAttribute("billNo");
	System.out.println("RESOUCE BILLING PDF resourceBillNoForPdf :- " +billNo);
	String vendorNameForPDF = (String) session.getAttribute("vendorName");
	String totalSubTotal = (String) session.getAttribute("totalSubTotal");
	String GSTForPDF = (String) session.getAttribute("GST");
	String IGSTForPDF = (String) session.getAttribute("IGST");
	String totalTaxAmount = (String) session.getAttribute("totalTaxAmount");
	String grossTotal = (String) session.getAttribute("grossTotal");
	
	String startDate=(String) session.getAttribute("billPeriodStartDate");
	String endDate=(String) session.getAttribute("billPeriodEndDate");
	
	
	String Billdate=(String) session.getAttribute("billDate");
	System.out.println("RESOUCE BILLING PDF statrt and end date :- " +startDate+"===="+endDate);
	
		
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
		Font font18Bold11 = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
		//Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font18Bold = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
		Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font10 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font16BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD | Font.UNDERLINE, BaseColor.RED);
		Font font14BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD, BaseColor.RED);
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
		Font font18Bold1 = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);
		
		Font NormalRedfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont16 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.RED);
			
		Connection conn = null;
		Connection conn1 = null;
		// step 1
		Document document = new Document();
		/* PdfWriter.getInstance(document,
			    new FileOutputStream("E://Resource_Bill_NO-"+resourceBillNoForPdf.replace('/', '-')+".pdf"));

 */
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
		
		Query query=session1.createSQLQuery("SELECT company_name, company_address, address, state, zip_code, country, contact_number, alternate_contact_number,email_id, gst_in_number, PAN_number, CIM_number, vendor_name from vendor_details WHERE pk_vendor_details_id=:fkVendorId AND vendor_name=:vendorNameForPDF");
		query.setParameter("vendorNameForPDF", vendorNameForPDF);
		query.setParameter("fkVendorId", fkVendorId);
		
		//List<PurchaseOrderCreateBean> results = query.list();
		
		List<Object[]> results = query.list();
		venList= new ArrayList<GetVendorDetailsBean>(0);
		
		for (Object[] o : results)
		{
			GetVendorDetailsBean vendorBean = new GetVendorDetailsBean();

			vendorBean.setCompanyName(o[0].toString());
			vendorBean.setCompanyAddress(o[1].toString());
			vendorBean.setAddress(o[2].toString());
			vendorBean.setState(o[3].toString());
			vendorBean.setZipCode(o[4].toString());
			vendorBean.setCountry(o[5].toString());
			vendorBean.setContactNo(Long.parseLong(o[6].toString()));
			vendorBean.setAlternateContactNo(o[7].toString());
			vendorBean.setEmailId(o[8].toString());
			vendorBean.setGstInNo(o[9].toString());
			vendorBean.setPANNum(o[10].toString());
			vendorBean.setCIMNo(o[11].toString());
			vendorBean.setVendorName(o[12].toString());
		
			venList.add(vendorBean);
		}
		
		Date d1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("E");
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss  ");
		sdf2.setTimeZone(TimeZone.getTimeZone("IST"));

		Date billDate = new Date();
		SimpleDateFormat dateFormater = new SimpleDateFormat("dd-MM-yyyy");
		String StrBillDate = dateFormater.format(billDate);
		
		String stdver1 = (String) sdf.format(d1);
		String dtfinl = stdver1;
		
		
		
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
		
			
		    table_cell  = new PdfPCell(new Phrase("",font14BoldRED));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
	        table_cell  = new PdfPCell(new Phrase("Bill No",font12Bold));
			table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell.setBorder(Rectangle.NO_BORDER);
			headercn.addCell(table_cell);
			
	        table_cell  = new PdfPCell(new Phrase(""+billNo,Normalfont11));
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
			
			
	        table_cell  = new PdfPCell(new Phrase(""+Billdate,Normalfont11));
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
			
			
//				table_cell  = new PdfPCell(new Phrase("",Normalfont11));
//				table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
//				table_cell.setBorder(Rectangle.NO_BORDER);
//				headercn.addCell(table_cell);
			
			
			
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
			document.add(new Paragraph(""));
			
			
			PdfPTable headercn2 = new PdfPTable(1);
			headercn2.setWidthPercentage(100); 

			float[] columnWidths110 = {10f};
			headercn2.setWidths(columnWidths110);

			PdfPCell table_cell1001;

			
			table_cell1001  = new PdfPCell(new Phrase("Tax Invoice ",font18Bold1));
			table_cell1001.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell1001.setBorder(Rectangle.NO_BORDER);
			headercn2.addCell(table_cell1001);
			
			document.add(headercn2);
		//VENDER DTEAILS
		
		PdfPTable table1 = new PdfPTable(1);
		table1.setWidthPercentage(100); 

		float[] columnWidths1 = {20f};
		table1.setWidths(columnWidths1);

		PdfPCell table_cell1;
		
		//VENDER DTEAILS GETTING FROM DATABASE
		
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
				
			
			
			/* PdfPTable table0 = new PdfPTable(1);
			table0.setWidthPercentage(100); 

			float[] columnWidths0 = {20f};
			table0.setWidths(columnWidths0);

			PdfPCell table_cell01;
			table_cell  = new PdfPCell(new Phrase("",font12BoldUnderline));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.BOTTOM);
			table0.addCell(table_cell);
			document.add(table0);
			document.add(new Paragraph("\n")); */
			
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
				
				

// 			table1.addCell(table_cell1);
		
			//ADDING TABLE TO DOCUMENT
			document.add(table1);
			
			//vendor Company Name address
			// Table 2.1
			
			PdfPTable table3 = new PdfPTable(4);
			table3.setWidthPercentage(100); 

			float[] columnWidths3 = {4f,7f,4f,7f};
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
				
				
			String companyName = sr.getCompanyName();
			
			table_cell3  = new PdfPCell(new Phrase("Company Name :",font12Bold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
			table_cell3  = new PdfPCell(new Phrase(""+companyName,Normalfont11));
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
				
				
			String city = sr.getAddress();
			
			table_cell3  = new PdfPCell(new Phrase("City :",font12Bold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
			
			table_cell3  = new PdfPCell(new Phrase(""+city,Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
			
			//ADDING TABLE TO DOCUMENT
			document.add(table3);			
	
				
 			//Table 3
			
	 		PdfPTable table2 = new PdfPTable(4);
			table2.setWidthPercentage(100); 

			float[] columnWidths2 = {4f,7f,4f,7f};
			table2.setWidths(columnWidths2);

			PdfPCell table_cell2;
			
			
			String state = sr.getState();
				
			table_cell2  = new PdfPCell(new Phrase("State :",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
				
			table_cell2  = new PdfPCell(new Phrase(""+state,Normalfont11));
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
			
			table_cell2  = new PdfPCell(new Phrase("",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
			table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			
			table_cell2  = new PdfPCell(new Phrase("Start Date : ",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase(""+startDate,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
				
			
			table_cell2  = new PdfPCell(new Phrase("End Date: ",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
			table_cell2  = new PdfPCell(new Phrase(""+endDate,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase("\n",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase("\n",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			
			
			
			

			//ADDING TABLE TO DOCUMENT
			document.add(table2);
		}
	 	
	 	
	 	
	 	
	 	//GETTING PRODUCT DATA FROM DATABASE
	 	HibernateUtility hbu2=null;
		Session session2=null;
		Transaction transaction2=null;

		hbu2 = HibernateUtility.getInstance();
		session2 = hbu.getHibernateSession();
		
		List<ResourceBillingBean> billList=null;
		
		Query query2 = session2.createSQLQuery("select product_name, hsn_sac, unit_price, quantity, GST, IGST, tax_amount, total from resource_billing WHERE bill_no = :billNo");
		query2.setParameter("billNo", billNo);
		
		List<Object[]> results2 = query2.list();
		billList= new ArrayList<ResourceBillingBean>(0);
		
		for(Object[] o : results2)
		{
			ResourceBillingBean bean = new ResourceBillingBean();
			
			bean.setProductName(o[0].toString());
			bean.setHsnSac(o[1].toString());
			bean.setUnitPrice(Double.parseDouble(o[2].toString()));
			bean.setQuantity(Long.parseLong(o[3].toString()));
			//bean.setCGST(Double.parseDouble(o[4].toString()));
			//bean.setSGST(Double.parseDouble(o[5].toString()));
			bean.setGST(Double.parseDouble(o[4].toString()));
			bean.setIGST(Double.parseDouble(o[5].toString()));
			bean.setTaxAmount(Double.parseDouble(o[6].toString()));
			bean.setTotal(Double.parseDouble(o[7].toString()));
			
			billList.add(bean);		
		}
		
		
		// TABLE FOR PRODUCT/RESOUCE DATA WHICH COMMING DYNAMICALLY FROM DATAVASE
		
		PdfPTable table11 = new PdfPTable(9);
		table11.setSpacingBefore(9);
		table11.setWidthPercentage(100);
		table11.setSpacingAfter(9);

		float[] columnWidths111 = { 0.2f, 0.5f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.3f, 0.3f };
		//float[] columnWidths111 = { 0.2f, 0.4f, 0.3f, 0.3f, 0.4f, 0.5f };
		//float[] columnWidths111 = { 0.2f, 0.4f, 0.2f, 0.3f, 0.2f, 0.2f, 0.2f, 0.2f, 0.3f };
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
		
		table_cell11 = new  PdfPCell(new Phrase("UNIT PRICE", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		table_cell11 = new  PdfPCell(new Phrase("QTY", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		table_cell11 = new  PdfPCell(new Phrase("GST %", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		/*table_cell11 = new  PdfPCell(new Phrase("SGST %", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);*/
		
		table_cell11 = new  PdfPCell(new Phrase("IGST %", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		table_cell11 = new  PdfPCell(new Phrase("TAX AMT", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		table_cell11 = new  PdfPCell(new Phrase("TOTAL", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		
		
		List<ResourceBillingBean> list122=billList;
		
		int l=0;
		
		for(int i=0;i<list122.size();i++)
		{
			ResourceBillingBean sr1=(ResourceBillingBean)list122.get(i);
			
			//COLUMN 1
			l++;
			
			table_cell11 = new  PdfPCell(new Phrase(""+l, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			//table_cell11.setBorder(Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			//2
			String description3 = sr1.getProductName(); 
			
			table_cell11 = new  PdfPCell(new Phrase(""+description3, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			//3
			String hsn3 = sr1.getHsnSac();
			
			table_cell11 = new  PdfPCell(new Phrase(""+hsn3, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			
			// 4 
			String buy_price3 = sr1.getUnitPrice().toString();
			
			table_cell11 = new  PdfPCell(new Phrase(""+buy_price3, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			// 4
			String quantity3 = sr1.getQuantity().toString();
			
			table_cell11 = new  PdfPCell(new Phrase(""+quantity3, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			//Double GST = sr1.getGST();
			//devide GST between CGST(50%) and SGST(50%)
			//Double devideGST = GST/2;
			//Double CGST = devideGST;
			Double GST = sr1.getGST();
			
			table_cell11 = new  PdfPCell(new Phrase(""+GST, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			//Double SGST = devideGST;
			/*Double SGST = sr1.getSGST();
			
			table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);*/
			
			
			Double IGST = sr1.getIGST();
			
			table_cell11 = new  PdfPCell(new Phrase(""+IGST, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			
			Double taxAmount = sr1.getTaxAmount();
			
			table_cell11 = new  PdfPCell(new Phrase(""+taxAmount, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			
			// 5
			String total3 = sr1.getTotal().toString(); 
			
			table_cell11 = new  PdfPCell(new Phrase(""+total3, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);	
		}
		
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
			
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
		
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
	
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
		
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
	
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
			
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
		
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
		
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
		
		table_cell11 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
		
 		// ADDING TABLE TO DOCUMENT
		document.add(table11);
 		
 		
 		//TABLE FOR TOTAL
 		
		PdfPTable table111 = new PdfPTable(3);
		table111.setSpacingBefore(3);
		table111.setWidthPercentage(100);
		table111.setSpacingAfter(3);
		
		
		float[] columnWidths1111 = { 1.0f, 0.6f, 0.5f };
		table111.setWidths(columnWidths1111);
		
		PdfPCell table_cell111;
		
		// for Sub Total
		
		//ROW NO 1
		//1
		table_cell111 = new  PdfPCell(new Phrase("BANK DETAILS : Embel Technologies Pvt \n                                   Ltd , Indusind Bank", Normalfont13));
		//table_cell111 = new  PdfPCell(new Phrase("BANK : STATE BANK OF INDIA,TAMSA ", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		// 2 
		table_cell111 = new  PdfPCell(new Phrase("Sub Total (Before Tax) (Rs) ", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		// 3
		table_cell111 = new  PdfPCell(new Phrase(""+totalSubTotal, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111); 
		
		
		//ROW NO 2
		// 1
		table_cell111 = new  PdfPCell(new Phrase("ACCOUNT NO    : 201001007672", Normalfont13));
		//table_cell111 = new  PdfPCell(new Phrase("A/C No. : 62300088676", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		//2
		table_cell111 = new  PdfPCell(new Phrase("CGST (Rs) ", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		//3
// 		double CGSTForPDF1 = Double.parseDouble(CGSTForPDF);
// 		double CGSTPercentOldDBForPdf1 = CGSTPercentDBForPdf;
// 		double SGSTPercentOldDBForPdf1 = SGSTPercentDBForPdf;
// 		double IGSTPercentOldDBForPdf1 = IGSTPercentDBForPdf;
		
		
// 		double CGSTAmount = (totalTaxAmountMain/100)*CGSTPercentOldDBForPdf1;
// 		double CGSTAmountFormatted = Double.parseDouble(String.format("%.2f", CGSTAmount));  // can be required precision		
// 		double SGSTAmount = (totalTaxAmountMain/100)*SGSTPercentOldDBForPdf1;
// 		double SGSTAmountFormatted = Double.parseDouble(String.format("%.2f", SGSTAmount));  // can be required precision		
// 		double IGSTAmount = (totalTaxAmountMain/100)*IGSTPercentOldDBForPdf1;
// 		double IGSTAmountFormatted = Double.parseDouble(String.format("%.2f", IGSTAmount));  // can be required precision
		
		/*Double d = Math.PI;
        d = Double.parseDouble(String.format("%.3f", d));  // can be required precision
        System.out.println(d);*/
				
		//double myDouble = 42.99; String formatted = String.format("%.2f", myDouble);
		
		double GSTForPDF1 = Double.parseDouble(GSTForPDF);
		double totalTaxAmountMain = (Double.parseDouble(totalTaxAmount));
		
		double half1 = 2;
		double halfGST = 0.0;
		double halfGSTAmountFormatted = 0.0;
		
		double CGST = 0.00;
		double SGST = 0.00;
		if(GSTForPDF1 > 0)
		{	
			halfGST = totalTaxAmountMain / half1;
			halfGSTAmountFormatted = Double.parseDouble(String.format("%.2f", halfGST));  // can be required precision
			CGST = halfGSTAmountFormatted;
			SGST = halfGSTAmountFormatted;
		}
		
		table_cell111 = new  PdfPCell(new Phrase(""+CGST, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		
		//ROW NO 3
		// 1
		table_cell111 = new  PdfPCell(new Phrase("IFSC CODE          : INDB0000746", Normalfont13));
		//table_cell111 = new  PdfPCell(new Phrase("IFSC Code : SBIN0020307", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		//2
 		table_cell111 = new  PdfPCell(new Phrase("SGST (Rs) ", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		//3
		/*double SGSTForPDF1 = Double.parseDouble(SGSTForPDF);
		double SGST = 0.00;				
		if(SGSTForPDF1 > 0)
		{
			SGST = SGSTAmountFormatted;
		}*/
		
		table_cell111 = new  PdfPCell(new Phrase(""+SGST, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
	
		//ROW NO 4
		// 1
		table_cell111 = new  PdfPCell(new Phrase("", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		//3
		/*double IGSTForPDF1 = Double.parseDouble(IGSTForPDF);
		double IGST = 0.00;
		if(IGSTForPDF1 > 0)
		{
			IGST = IGSTAmountFormatted;
			
			
			double half1 = 2;
			double gst2 = (Double.parseDouble(GSTForPDF));
			double halfgst = IGSTForPDF1 / half1;
		}*/
		

		double IGSTForPDF1 = Double.parseDouble(IGSTForPDF);
		double IGST = 0.00;
		double IGSTAmountFormatted = 0.0;
		if(IGSTForPDF1 > 0)
		{	
			IGSTAmountFormatted = totalTaxAmountMain;
			IGSTAmountFormatted = Double.parseDouble(String.format("%.2f", totalTaxAmountMain));  // can be required precision
			IGST = IGSTAmountFormatted;
		}
		
		table_cell111 = new  PdfPCell(new Phrase("IGST (Rs) ", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		table_cell111 = new  PdfPCell(new Phrase(""+IGST, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		
		
		//ROW NO 5
		table_cell111 = new  PdfPCell(new Phrase("", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		
		table_cell111 = new  PdfPCell(new Phrase("Gross Total (Rs)\n ", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		table_cell111 = new  PdfPCell(new Phrase(""+grossTotal, font15Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		/* table_cell111 = new  PdfPCell(new Phrase("SGST (%) ", font12Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		double half1 = 2;
		double gst2 = (Double.parseDouble(GSTForPDF));
		double halfgst = gst2 / half1;
		table_cell111 = new  PdfPCell(new Phrase(String.valueOf(halfgst), Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111); */
		
		
		/* table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
	
		//2
		table_cell111 = new  PdfPCell(new Phrase("GST Amount (Rs) ", font12Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		// 3
		table_cell111 = new  PdfPCell(new Phrase(""+totalTaxAmount, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111); */
		
		// for Gross Total	
		//1		
		/* table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		
		//2
		table_cell111 = new  PdfPCell(new Phrase("Gross Total (Rs)\n ", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		
		// 3
		table_cell111 = new  PdfPCell(new Phrase(""+grossTotal, font16BoldRED));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111); */
		
		
		// for Gross Total	
		//1
		table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);		
		
		table_cell111 = new  PdfPCell(new Phrase(" ", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);		
		
		table_cell111 = new  PdfPCell(new Phrase(" ", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		
		table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		
		table_cell111 = new  PdfPCell(new Phrase(" ", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);		
		
		table_cell111 = new  PdfPCell(new Phrase(" ", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		

		table_cell111 = new  PdfPCell(new Phrase("                          AUTHORIZED ", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);		
		
		table_cell111 = new  PdfPCell(new Phrase(" SIGNATORY", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		
		/* table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);		
		
		table_cell111 = new  PdfPCell(new Phrase("AUTHORIZED ", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);		
		
		table_cell111 = new  PdfPCell(new Phrase("SIGNATORY", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		 */
		//ADDING TO DOCUMENT
		document.add(table111);
		
		
		// For Footer	
		
		PdfPTable table12 = new PdfPTable(1);
		table11.setSpacingBefore(1);
		table11.setWidthPercentage(100);
		table11.setSpacingAfter(1);
		
		
		float[] columnWidths112 = {20};
		table12.setWidths(columnWidths112);
		
		PdfPCell table_cell12;

		table_cell12 = new  PdfPCell(new Phrase("\nThank you for contributing towards growth of our business", font12Bold));
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
		
		//ADDING TABLE TO DOCUMENT
		document.add(table5);

		document.close();
		
		/* try
		{
			List<GetVendorDetailsBean> list1222 = venList;
			
			for(int i=0;i<list1222.size();i++)
			{
				 GetVendorDetailsBean sr=(GetVendorDetailsBean)list1222.get(i);
				 
				 String name = sr.getVendorName();
				 String emailId = sr.getEmailId();
				 
				 javax.mail.Session mailSession = javax.mail.Session.getInstance(System.getProperties());
	            /*  Transport transport = new SMTPTransport(mailSession,new URLName("smtp.gmail.com"));
	             transport = mailSession.getTransport("smtps");
	             transport.connect("smtp.gmail.com", 465 ,"sales@embel.co.in","Embel@sales1"); //ClothSoft 
	             Transport transport = new SMTPTransport(mailSession,new URLName("smtp.gmail.com"));
	              transport = mailSession.getTransport("smtps");
	              transport.connect("smtp.gmail.com", 465 ,"embelmessanger@gmail.com","Embel@123");
	             MimeMessage m = new MimeMessage(mailSession); 
	             m.setFrom(new InternetAddress(emailId));
	             Address[] toAddr = new InternetAddress[] {new InternetAddress(emailId)};
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
		}catch(Exception e){
	              out.println(e.getMessage());
	              e.printStackTrace();
	    } */
	}catch (DocumentException de){
			throw new IOException(de.getMessage());
	}
	
	%>
	