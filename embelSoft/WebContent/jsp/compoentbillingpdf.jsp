<!-- ClientBillingPDFNew.jsp -->

<%@page import="com.embelSoft.bean.BillOfMaterialBean"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="java.util.Formatter"%>
<%@page import="javax.sound.midi.Soundbank"%>
<%@page import="com.itextpdf.text.pdf.codec.Base64.OutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page trimDirectiveWhitespaces="true"%>
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
<%@page import="java.awt.Desktop"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.util.List"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.PdfGState"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>

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
<%-- <%@page import="javax.mail.Session"%> --%>

<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>

<%@ page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%@page import="com.embelSoft.utility.HibernateUtility" %>
<%@page import="com.embelSoft.utility.HibernateUtility" %>
<%@page import="com.embelSoft.bean.GetVendorDetailsBean" %>
<%@page import="com.embelSoft.bean.HrBillingBean" %>
<%@page import="com.embelSoft.bean.HrBillingBean" %>
<%@page import="com.embelSoft.bean.HrBillingForPDF" %>
<%@page import="com.embelSoft.bean.HrBillingForPDF" %>
<%@page import="com.embelSoft.bean.GetClientEnquiryDetailsBean" %>
<%@page import="com.embelSoft.bean.GetClientEnquiryDetailsBean" %>
<%@page import="com.embelSoft.bean.ProductBillingBean" %>
<%@page import="com.embelSoft.bean.GetVendorDetailsBean" %>

<%@page import="com.embelSoft.bean.ProductBillingBeanNew" %>
<%@page import="com.embelSoft.hibernate.TaxDetailsHibernate" %>
<%@page import="com.embelSoft.dao.TaxDetailsDao" %>


<%@page import="java.util.ArrayList" %>
<%@page import="java.util.ArrayList" %>


<%
	response.setContentType("application/pdf");
//response.setHeader("Content-disposition","attachment; filename = Productbilling.pdf");
	

	String fkClientId = (String)session.getAttribute("fkClientId");
	String productBillNo = (String)session.getAttribute("productBillNo");
	System.out.println("PRODUCT BILLING PDF productBillNo :- "+productBillNo);
	String clientNameClientBill = (String) session.getAttribute("clientName");

	String ProjectName = (String) session.getAttribute("ProjectName");
	String BoardName = (String) session.getAttribute("BoardName");

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
			Font font13BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.RED);
			Font font14BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD, BaseColor.RED);
			Font font15BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.RED);
			
			//Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font font18Bold = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
			Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
			Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
			Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
			Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
			Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font font10 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font font16BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD | Font.UNDERLINE, BaseColor.RED);
			Font font18Bold1 = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.BLACK);
			Font font18Bold11 = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
			Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font Normalfont10 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont15 = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont16 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.BLACK);
			
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
				    new FileOutputStream("E://Product_Bill_NO-"+productBillNo.replace('/', '-')+".pdf")); */

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
			
			List<GetClientEnquiryDetailsBean> venList=null;
			
			Query query=session1.createSQLQuery("select ce.business_name, ce.business_address, ce.city, ce.state, ce.zipCode, ce.Country, ce.contact_number, ce.alternate_contact_no, ce.email_id, ce.first_name ,ce.Gst_No FROM client_enquiry_details ce WHERE ce.pk_client_enquiry_id=:fkClientId AND first_name= :clientNameClientBill GROUP BY ce.pk_client_enquiry_id");
			
			
			query.setParameter("clientNameClientBill", clientNameClientBill);
			query.setParameter("fkClientId", fkClientId);
			
			
			//List<PurchaseOrderCreateBean> results = query.list();
			
			List<Object[]> results = query.list();
			venList= new ArrayList<GetClientEnquiryDetailsBean>(0);

		for (Object[] o : results)
		{	

			
			GetClientEnquiryDetailsBean reports = new GetClientEnquiryDetailsBean();

			reports.setBusinessName(o[0].toString());
			reports.setBusinessAddress(o[1].toString());
			reports.setCity(o[2].toString());
			reports.setState(o[3].toString());
			reports.setZipCode(o[4].toString());
			reports.setCountry(o[5].toString());
			reports.setContactNo(Long.parseLong(o[6].toString()));
			reports.setAlternateContactNo(o[7].toString());
			reports.setEmailId(o[8].toString());
			reports.setFirstName(o[9].toString());
			reports.setGstNo(o[10].toString());
			
			
			
			System.out.println(o[10].toString());
			System.out.println("contact number----"+o[6].toString());
			venList.add(reports);
		}
			
			System.out.println("Query Execute Query Execute ClientBillPDF ");
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
			
			Image image1 = Image.getInstance("C:/logo.png");
			image1.scaleToFit(200f, 200f);
			Image imageCenter = Image.getInstance(image1);
			imageCenter.setAlignment(Image.LEFT);
			
			
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
				
		        table_cell  = new PdfPCell(new Phrase(""+productBillNo,Normalfont11));
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
				
				
// 				table_cell  = new PdfPCell(new Phrase("",Normalfont11));
// 				table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
// 				table_cell.setBorder(Rectangle.NO_BORDER);
// 				headercn.addCell(table_cell);
				
				
				
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

				
				table_cell1001  = new PdfPCell(new Phrase("Material Challan ",font18Bold1));
				table_cell1001.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell1001.setBorder(Rectangle.NO_BORDER);
				headercn2.addCell(table_cell1001);
				
				document.add(headercn2);
				
				
		// Vendor Details
		
				
		
				PdfPTable table1 = new PdfPTable(1);
				table1.setWidthPercentage(100); 

				float[] columnWidths1 = {20f};
				table1.setWidths(columnWidths1);

				PdfPCell table_cell1;
		 	
		 List<GetClientEnquiryDetailsBean> list12=venList;

 			int k=0;
 			
		 for(int i=0;i<list12.size();i++)
		{
			 GetClientEnquiryDetailsBean sr=(GetClientEnquiryDetailsBean)list12.get(i);
		
			 String businessName = sr.getBusinessName();
			
			  table_cell1  = new PdfPCell(new Phrase("Client Details   :-      "+clientNameClientBill,font12Bold));
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
	
		
				document.add(table1);
				
				
				
								
	 		// Table 3
				
		 		PdfPTable table2 = new PdfPTable(5);
				table2.setWidthPercentage(100); 

				float[] columnWidths2 = {4f,6f,4f,5f,1f};
				table2.setWidths(columnWidths2);

				PdfPCell table_cell2;
				
				
				
//String businessAddress = sr.getBusinessAddress();
				
				table_cell2  = new PdfPCell(new Phrase("Name                :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
					
				table_cell2  = new PdfPCell(new Phrase(""+businessName,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
					
					
				

				String GstNo = sr.getGstNo();
				
				
				table_cell2  = new PdfPCell(new Phrase("GST No                 :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
					
					
				table_cell2  = new PdfPCell(new Phrase(""+GstNo,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				
				
				
				
String businessAddress = sr.getBusinessAddress();
				
				table_cell2  = new PdfPCell(new Phrase("Address            :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
					
				table_cell2  = new PdfPCell(new Phrase(""+businessAddress,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
					
					
				

				String state1 = sr.getShipAddress();
					
				table_cell2  = new PdfPCell(new Phrase("",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
					
					
				table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				
				
				String email = sr.getEmailId();
				
				String city = sr.getCity();
				 
				table_cell2  = new PdfPCell(new Phrase("Email Id           :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				table_cell2  = new PdfPCell(new Phrase(""+email,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				
				//String state = sr.getShipAddress();
					
				table_cell2  = new PdfPCell(new Phrase("City                        :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
					
					
				table_cell2  = new PdfPCell(new Phrase(""+city,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
								
				String zipCode = sr.getZipCode();
				
				table_cell2  = new PdfPCell(new Phrase("Zip Code          :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
					
					
				table_cell2  = new PdfPCell(new Phrase(""+zipCode,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				String country = sr.getCountry();
				
				 
				table_cell2  = new PdfPCell(new Phrase("Country                 :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				table_cell2  = new PdfPCell(new Phrase(""+country,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				
				table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				
				
				Long contactNo = sr.getContactNo();
				
				table_cell2  = new PdfPCell(new Phrase("Mobile No.       :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				table_cell2  = new PdfPCell(new Phrase(""+contactNo,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);				
				
				String alternateContactNo = sr.getAlternateContactNo();	
				
				table_cell2  = new PdfPCell(new Phrase("Alternate No.        :",font12Bold));
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
				
				
				
			/* 	PdfPTable table01 = new PdfPTable(1);
				table01.setWidthPercentage(100); 

				float[] columnWidths01= {20f};
				table01.setWidths(columnWidths0);

				PdfPCell table_cell01;
				table_cell  = new PdfPCell(new Phrase("",font12BoldUnderline));
				table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell.setBorder(Rectangle.BOTTOM);
				table01.addCell(table_cell);
				document.add(table01);
				document.add(new Paragraph("")); */
				
	
				table_cell2  = new PdfPCell(new Phrase("Project Name. :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				table_cell2  = new PdfPCell(new Phrase(""+ProjectName,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);				
				
			
				
				table_cell2  = new PdfPCell(new Phrase("Board Name.         :",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);					
					
				table_cell2  = new PdfPCell(new Phrase(""+BoardName,Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
				table_cell2  = new PdfPCell(new Phrase("",Normalfont11));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
					
					 document.add(table2);
				 
				 
		}	
		

 		//	int k=0;
 			
		
		 
			HibernateUtility hbu2=null;
			Session session2=null;
			Transaction transaction2=null;


			hbu2 = HibernateUtility.getInstance();
			session2 = hbu.getHibernateSession();
			
			Query query2 = session2.createSQLQuery("SELECT part_Number,package,compoenent_category,compoenent_name,quantity,Comp_value,manufracture_Name from compoenent_billing  WHERE bill_no=:productBillNo");
			query2.setParameter("productBillNo", productBillNo);
			List<Object[]> results2 = query2.list();
			
			List<BillOfMaterialBean> billList=null;
			billList= new ArrayList<BillOfMaterialBean>(0);

			for(Object[] o : results2)
			{
				BillOfMaterialBean bean = new BillOfMaterialBean();
				
				bean.setPart_Number(o[0].toString());
				bean.setPackages(o[1].toString());
				bean.setComponentType((o[2].toString()));
				bean.setComponentName((o[3].toString()));
				bean.setUnitPrice(Double.parseDouble(o[4].toString()));
				bean.setValue((o[5].toString()));
				bean.setManufactureName((o[6].toString()));
				
				billList.add(bean);
			
			}
			 
			// Table for table data (Dyanamic)
			
			PdfPTable table11 = new PdfPTable(8);
			table11.setSpacingBefore(8);
			table11.setWidthPercentage(100);
			table11.setSpacingAfter(8);
			
			
			float[] columnWidths111 = { 0.1f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.3f, 0.2f};
			table11.setWidths(columnWidths111);
			
			PdfPCell table_cell11;
			
			table_cell11 = new  PdfPCell(new Phrase("Sr No", font11Bold));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table11.addCell(table_cell11);
			
			
			table_cell11 = new  PdfPCell(new Phrase("Component Category", font11Bold));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table11.addCell(table_cell11);

			
			table_cell11 = new  PdfPCell(new Phrase("Component Name", font11Bold));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table11.addCell(table_cell11);
			
			table_cell11 = new  PdfPCell(new Phrase("Part Number", font11Bold));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table11.addCell(table_cell11);
						
			table_cell11 = new  PdfPCell(new Phrase("Component Package", font11Bold));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table11.addCell(table_cell11);
			
			table_cell11 = new  PdfPCell(new Phrase("Component Value", font11Bold));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table11.addCell(table_cell11);
			
			table_cell11 = new  PdfPCell(new Phrase("Manufacturer  Name", font11Bold));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table11.addCell(table_cell11);
			table_cell11 = new  PdfPCell(new Phrase("Quantity", font11Bold));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table11.addCell(table_cell11);
			
			
			

			List<BillOfMaterialBean> list1222 = billList;

	 			int l=0;
	 			
			 for(int i=0;i<list1222.size();i++)
			{
				 BillOfMaterialBean sr1=(BillOfMaterialBean)list1222.get(i);
				 
					// 1
					l++;
					
					table_cell11 = new  PdfPCell(new Phrase(""+l, Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					//table_cell11.setBorder(Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					// 2 
					
					String buy_price4 = sr1.getComponentType();
					table_cell11 = new  PdfPCell(new Phrase(""+buy_price4, Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					
					// 3
					String hsn4 = sr1.getComponentName();
					
					table_cell11 = new PdfPCell(new Phrase(""+hsn4, Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					//4
					
					String partnumber = sr1.getPart_Number();
					table_cell11 = new  PdfPCell(new Phrase(""+partnumber, Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					// 5
					String quantity4 = sr1.getPackages();
					
					table_cell11 = new  PdfPCell(new Phrase(""+quantity4, Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);			
					
					// 5
					String value = sr1.getValue();
					
					table_cell11 = new  PdfPCell(new Phrase(""+value, Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);	
					// 5
					String mfgname = sr1.getManufactureName();
					
					table_cell11 = new  PdfPCell(new Phrase(""+mfgname, Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);	
					//6
					Double CGST = sr1.getUnitPrice();
					
					table_cell11 = new  PdfPCell(new Phrase(""+CGST, Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					
			}
			
					table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);

					
					table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
					table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					table11.addCell(table_cell11);
					
					
			 
					document.add(table11);
// 					document.add(new Paragraph("\n"));
								
		/* 					PdfPTable table111 = new PdfPTable(3);
							table111.setSpacingBefore(3);
							table111.setWidthPercentage(100);
							table111.setSpacingAfter(3);							
							
							float[] columnWidths1111 = { 1.0f, 0.6f, 0.5f };
							table111.setWidths(columnWidths1111);
							
							PdfPCell table_cell111;
							
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
		
		table_cell111 = new  PdfPCell(new Phrase(" ", Normalfont12));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);		
		
		table_cell111 = new  PdfPCell(new Phrase(" ", Normalfont12));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		
		
		table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);		
		
		table_cell111 = new  PdfPCell(new Phrase("Prepared ", Normalfont12));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);		
		
		table_cell111 = new  PdfPCell(new Phrase("By:- Sumeet Bandewar\n\n", Normalfont12));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		
		
		
		
		
							
							
							//ADDING TABLE TO DOCUMENT
							document.add(table111); */
							
							
							
					
				// For Footer	
						
						PdfPTable table12 = new PdfPTable(1);
						table11.setSpacingBefore(1);
						table11.setWidthPercentage(100);
						table11.setSpacingAfter(1);
						
						
						float[] columnWidths112 = {20};
						table12.setWidths(columnWidths112);
						
						PdfPCell table_cell12;

						table_cell12 = new  PdfPCell(new Phrase("Thank You for Contributing Towards Growth of Our Business\n", font12Bold));
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
								"---------------------------------------------------------------------------------------------------------------------------------\n"));
						
						
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

							
							
							PdfPTable table13 = new PdfPTable(1);
							table11.setSpacingBefore(1);
							table11.setWidthPercentage(100);
							table11.setSpacingAfter(1);
							
							
							float[] columnWidths113 = {20};
							table12.setWidths(columnWidths112);
							
							PdfPCell table_cell13;

							table_cell13 = new  PdfPCell(new Phrase("\n\nComputer Generated Copy", font12BoldUnderline));
							table_cell13.setHorizontalAlignment(Element.ALIGN_CENTER);
							//table_cell12.setBorder(Rectangle.LEFT);
							table_cell13.setBorder(Rectangle.NO_BORDER);
							table13.addCell(table_cell13);
							
							document.add(table13);
							
							
							
							
							
						document.close();
						
/* 						try{						 	
							 List<GetClientEnquiryDetailsBean> list122 = venList;
					 				
							 for(int i=0;i<list122.size();i++)
							{
								 GetClientEnquiryDetailsBean sr=(GetClientEnquiryDetailsBean)list122.get(i);
							
								String emailId = sr.getEmailId();
						 	
								String fName = sr.getFirstName();
								String lName = sr.getLastName();
							
								String fullName = fName+" "+lName;								
								
							  javax.mail.Session mailSession = javax.mail.Session.getInstance(System.getProperties());
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
				              messageBodyPart.setText("Dear,  "+fullName);
				              Multipart multipart = new MimeMultipart();
				              multipart.addBodyPart(messageBodyPart);

				              messageBodyPart = new MimeBodyPart();
				              
				              DataSource source = new ByteArrayDataSource(baos.toByteArray(), "application/pdf");
				              messageBodyPart.setDataHandler(new DataHandler(source));
				              messageBodyPart.setFileName("Product Billing.pdf");
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
				            }  */
			
		} catch (DocumentException de) {
		    throw new IOException(de.getMessage());
		}
	
%>




