<%@page import="com.embelSoft.utility.PDFPath"%>
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
<%@page import="com.embelSoft.utility.HibernateUtility" %>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.embelSoft.bean.PurchaseOrderCreateBean" %>
<%@page import="com.embelSoft.bean.PurchaseOrderCreateBeanNew" %>
<%@page import="java.util.ArrayList" %>


<%

	response.setContentType("application/pdf");

	String vendorName = (String) session.getAttribute("vendorName");
	String vendorCompanyName = (String) session.getAttribute("vendorCompanyName");
	String contactNo = (String) session.getAttribute("contactNo");
	String streetAddress = (String) session.getAttribute("streetAddress");
	String City = (String) session.getAttribute("City");
	String zipCode = (String) session.getAttribute("zipCode");
	
/* 	String Phone = (String) session.getAttribute("Phone");
	String Fax = (String) session.getAttribute("Fax");
 */
	String totalSubTotalForPDF = (String) session.getAttribute("subTotal");
	String GSTForPDF = (String) session.getAttribute("GSTForPDF");
	String IGSTForPDF = (String) session.getAttribute("IGSTForPDF");
	String totalTaxAmountForPDF = (String) session.getAttribute("totalTaxAmount");
	String grossTotalForPDF = (String) session.getAttribute("grossTotalForPDF");
	String billNoForPdf = (String) session.getAttribute("billNoForPdf");
	
	
	
	if(City=="N/A" || City=="")
	{
		City ="-";	
	}
	
	if(zipCode=="N/A" || zipCode=="")
	{
		zipCode ="-";	
	}
	
	
	
	System.out.print(":::::::::::::::::::::::::::::::::::::::::vendorName:-"
			+ vendorName + "::::::::::::::::::::::::::::");
	
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

			Font font18BoldRed = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
			Font font8Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		//	Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
			Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
			Font font12Bold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
			Font font10Bold = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.BOLD, BaseColor.BLACK);
			Font font11Bold = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.BOLD, BaseColor.BLACK);
			Font font14BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD, BaseColor.RED);
			//Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font font18Bold = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
			Font font18Bold1 = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.BLACK);
			
			Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
			Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
			Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
			Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
			Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font font10 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font font16BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD | Font.UNDERLINE, BaseColor.RED);

			Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			//Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
			Font font20Bold = new Font(Font.FontFamily.TIMES_ROMAN, 20, Font.BOLD, BaseColor.BLACK);
			Font Normalfont10 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont15 = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont18 = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont20 = new Font(Font.FontFamily.TIMES_ROMAN, 20, Font.NORMAL, BaseColor.BLACK);
			Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
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

			// step 3
			document.open();

		   PDFPath path = new PDFPath();
			Image image1;
			try
			{
				 image1 = Image.getInstance(path.getLocalPath());
			    
			}catch(Exception e)
			{
				 image1 = Image.getInstance(path.getServerPath());
			}
			image1.scaleToFit(200f, 200f);
			Image imageCenter = Image.getInstance(image1);
			imageCenter.setAlignment(Image.LEFT);
			
			
			document.add(imageCenter);
			
			
			
			HibernateUtility hbu=null;
			Session session1=null;
			Transaction transaction=null;


			hbu = HibernateUtility.getInstance();
			session1 = hbu.getHibernateSession();
			
			List<PurchaseOrderCreateBeanNew> empList=null;
			
			//Query query=session1.createSQLQuery("select product_description, quantity, unit_price, total , sub_total, gst, vat, gross_total  from purchase_order_create where billNo = :billNoForPdf");
			//Query query=session1.createSQLQuery("select product_name, unit_price, quantity, total, total_sub_total, GST, IGST, total_tax_amount, gross_total  from purchase_order_create where billNo = :billNoForPdf");
			Query query = session1.createSQLQuery("select product_name, hsn_sac, unit_price, quantity, GST, IGST, tax_amount, total from purchase_order_create WHERE billNo = :billNoForPdf");
			query.setParameter("billNoForPdf", billNoForPdf);
			
// 			session3.setAttribute("subTotal",totalSubTotal);
// 			session3.setAttribute("gst",gst);GST
// 			session3.setAttribute("vat",totalTaxAmount);
			
			//List<PurchaseOrderCreateBean> results = query.list();
			
			List<Object[]> results = query.list();
			

  
			empList= new ArrayList<PurchaseOrderCreateBeanNew>(0);


		for (Object[] o : results) {
			
			
// 			PurchaseOrderCreateBean reports = new PurchaseOrderCreateBean();
			
			
// 			reports.setProductDescription(o[0].toString());
// 			reports.setUnitPrice(Double.parseDouble(o[1].toString()));
// 			reports.setQuantity(Integer.parseInt(o[2].toString()));
// 			reports.setTotal(Double.parseDouble(o[3].toString()));
// 			reports.setSubTotal(Double.parseDouble(o[4].toString()));
// 			reports.setGst(Integer.parseInt(o[5].toString()));
// 			reports.setVat(Double.parseDouble(o[6].toString()));
// 			reports.setGrossTotal(Double.parseDouble(o[7].toString()));
		
// 			empList.add(reports);
			
			
			PurchaseOrderCreateBeanNew reports = new PurchaseOrderCreateBeanNew();
			
			reports.setProductName(o[0].toString());
			reports.setHsnSac(o[1].toString());
			reports.setUnitPrice(Double.parseDouble(o[2].toString()));
			reports.setQuantity(Long.parseLong(o[3].toString()));
			//bean.setCGST(Double.parseDouble(o[4].toString()));
			//bean.setSGST(Double.parseDouble(o[5].toString()));
			reports.setGST(Double.parseDouble(o[4].toString()));
			reports.setIGST(Double.parseDouble(o[5].toString()));
			reports.setTaxAmount(Double.parseDouble(o[6].toString()));
			reports.setTotal(Double.parseDouble(o[7].toString()));
			
// 			reports.setProductName(o[0].toString());
// 			reports.setUnitPrice(Double.parseDouble(o[1].toString()));
// 			reports.setQuantity(Long.parseLong(o[2].toString()));
// 			reports.setTotal(Double.parseDouble(o[3].toString()));
// 			reports.setTotalSubTotal(Double.parseDouble(o[4].toString()));
// 			reports.setGST(Double.parseDouble(o[5].toString()));
// 			reports.setIGST(Double.parseDouble(o[6].toString()));
// 			reports.setTotalTaxAmount(Double.parseDouble(o[7].toString()));
// 			reports.setGrossTotal(Double.parseDouble(o[8].toString()));
			
			
// 			reports.setProductDescription(o[0].toString());
// 			reports.setUnitPrice(Double.parseDouble(o[1].toString()));
// 			reports.setQuantity(Integer.parseInt(o[2].toString()));
// 			reports.setTotal(Double.parseDouble(o[3].toString()));
// 			reports.setSubTotal(Double.parseDouble(o[4].toString()));
// 			reports.setGst(Integer.parseInt(o[5].toString()));
// 			reports.setVat(Double.parseDouble(o[6].toString()));
// 			reports.setGrossTotal(Double.parseDouble(o[7].toString()));
		
			empList.add(reports);
			
		
// 			PurchaseOrderCreateBean reports = new PurchaseOrderCreateBean();
			
			
// 			reports.setProductDescription(o[0].toString());
// 			reports.setQuantity(Integer.parseInt(o[1].toString()));
// 			reports.setUnitPrice(Double.parseDouble(o[2].toString()));
// 			reports.setTotal(Double.parseDouble(o[3].toString()));
// 			reports.setSubTotal(Double.parseDouble(o[4].toString()));
// 			reports.setGst(Integer.parseInt(o[5].toString()));
// 			reports.setVat(Double.parseDouble(o[6].toString()));
// 			reports.setGrossTotal(Double.parseDouble(o[7].toString()));
		
// 			empList.add(reports);
		}
			
		System.out.println("list Size:--------------------------"+results.size());

			
			
			System.out.println("Query Execute");
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

			
		
			
 
			
		//For Company Name and Form Heading
		
			PdfPTable headercn = new PdfPTable(3);
		 	headercn.setWidthPercentage(100); 

			float[] columnWidths11 = {10f,4f,6f};
			headercn.setWidths(columnWidths11);

			PdfPCell table_cell;
			
				
			    table_cell  = new PdfPCell(new Phrase("Embel Tehnologies Pvt.Ltd",font15Bold));
				table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell.setBorder(Rectangle.NO_BORDER);
				headercn.addCell(table_cell);
				
		        table_cell  = new PdfPCell(new Phrase("Bill No",font12Bold));
				table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				table_cell.setBorder(Rectangle.NO_BORDER);
				headercn.addCell(table_cell);
				
		        table_cell  = new PdfPCell(new Phrase(""+billNoForPdf,Normalfont11));
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
				document.add(new Paragraph("\n"));
			
				//End 	
		
				
				//For Form Heading
			
			PdfPTable headercn2 = new PdfPTable(1);
			headercn2.setWidthPercentage(100); 

			float[] columnWidths110 = {10f};
			headercn2.setWidths(columnWidths110);

			PdfPCell table_cell1001;

			
			table_cell1001  = new PdfPCell(new Phrase("PURCHASE ORDER \n",font18Bold1));
			table_cell1001.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell1001.setBorder(Rectangle.NO_BORDER);
			headercn2.addCell(table_cell1001);
			
			document.add(headercn2);
				
				
				
			// For Vendor Detailas	
								
			PdfPTable table2 = new PdfPTable(2);
			table2.setWidthPercentage(100);

			float[] columnWidths1 = {4,16};
			table2.setWidths(columnWidths1);

			PdfPCell table_cell2;
		
	            table_cell2  = new PdfPCell(new Phrase("Vendor Name  ",font12Bold));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
			
				
 			    table_cell2 = new  PdfPCell(new Phrase(":   "+vendorName, Normalfont11 ));
				table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell2.setBorder(Rectangle.NO_BORDER);
				table2.addCell(table_cell2);
				
			
				document.add(table2);
				
				
				PdfPTable table1 = new PdfPTable(5);
				table1.setWidthPercentage(100);

				float[] columnWidths2 = {4f,6f,4f,5f,1f};
				table1.setWidths(columnWidths2);

				PdfPCell table_cell1;
				
				
				table_cell1 = new  PdfPCell(new Phrase("Company Name    ", Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
			    table_cell1 = new  PdfPCell(new Phrase(":   "+vendorCompanyName, Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
				
				
				
				
				table_cell1 = new  PdfPCell(new Phrase("Contact No      ", Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
			    table_cell1 = new  PdfPCell(new Phrase(":   "+contactNo, Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
				table_cell1  = new PdfPCell(new Phrase("",Normalfont11));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
				
				
				
				table_cell1 = new  PdfPCell(new Phrase("Street Address  ", Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
			    table_cell1 = new  PdfPCell(new Phrase(":   "+streetAddress, Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
				table_cell1 = new  PdfPCell(new Phrase("State            ",Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
			    table_cell1 = new  PdfPCell(new Phrase(":   "+City, Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
				
				
				table_cell1  = new PdfPCell(new Phrase("",Normalfont11));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
				document.add(table1);
				
				PdfPTable table3 = new PdfPTable(2);
				table3.setWidthPercentage(100);

				float[] columnWidths3 = {4,16};
				table3.setWidths(columnWidths3);

				PdfPCell table_cell3;
				
				
				table_cell3 = new  PdfPCell(new Phrase("Zip             ",Normalfont11 ));
				table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell3.setBorder(Rectangle.NO_BORDER);
				table3.addCell(table_cell3);
				
				table_cell3 = new  PdfPCell(new Phrase(":   "+zipCode,Normalfont11 ));
				table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell3.setBorder(Rectangle.NO_BORDER);
				table3.addCell(table_cell3);
				
			
				
				
/* 				
				table_cell1 = new  PdfPCell(new Phrase("Phone          : ", Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
			    table_cell1 = new  PdfPCell(new Phrase(""+Phone, Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
				table_cell1 = new  PdfPCell(new Phrase("Fax            : ", Normalfont11));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
			    table_cell1 = new  PdfPCell(new Phrase(""+Fax, Normalfont11 ));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1); */
				
				
				table_cell3 = new  PdfPCell(new Phrase("\n", Normalfont11));
				table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell3.setBorder(Rectangle.BOTTOM);
				table3.addCell(table_cell3);
				
				table_cell3 = new  PdfPCell(new Phrase("\n", Normalfont11 ));
				table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell3.setBorder(Rectangle.BOTTOM);
				table3.addCell(table_cell3);
				
				
				document.add(table3);
				// Table Heading
				
				
					
					
					//End table Heading
					
					// new table start 0
					
					// Table for table data (Dyanamic)
					
					PdfPTable table11 = new PdfPTable(9);
					table11.setSpacingBefore(5);
					table11.setWidthPercentage(100);
					table11.setSpacingAfter(5);
					
					
					//float[] columnWidths111 = {0.2f, 0.6f, 0.3f, 0.3f, 0.2f, 0.4f };
					float[] columnWidths111 = { 0.2f, 0.5f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.3f, 0.3f };
					table11.setWidths(columnWidths111);
					
					PdfPCell table_cell11;
					
					
					table_cell11 = new  PdfPCell(new Phrase("Sr No.", font12Bold));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("DESCRIPTION", font12Bold));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("HSN", font12Bold));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("UNIT PRICE", font12Bold));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("QTY", font12Bold));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("GST%", font12Bold));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("IGST%", font12Bold));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("TAX AMT", font12Bold));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
					table11.addCell(table_cell11);
					
					table_cell11 = new  PdfPCell(new Phrase("TOTAL", font12Bold));
					table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
					table11.addCell(table_cell11);
					
					
					
					
					
					 List<PurchaseOrderCreateBeanNew> list12=empList;

 		 			int k=0;
 		 			
					 for(int i=0;i<list12.size();i++)
					{
						 PurchaseOrderCreateBeanNew sr=(PurchaseOrderCreateBeanNew)list12.get(i);
					
						
					
							// 1
								k++;
							
							table_cell11 = new  PdfPCell(new Phrase(""+k, Normalfont11));
							table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
							
							table11.addCell(table_cell11);
								
							// 2 
							String description = sr.getProductName(); 
							
							table_cell11 = new  PdfPCell(new Phrase(""+description, Normalfont11));
							table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
							table11.addCell(table_cell11);							
							
							// 3 
							String hsnSac = sr.getHsnSac();
							
							table_cell11 = new  PdfPCell(new Phrase(""+hsnSac, Normalfont11));
							table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
							table11.addCell(table_cell11);
					
							// 3 
							double unit_price = sr.getUnitPrice();
							
							table_cell11 = new  PdfPCell(new Phrase(""+unit_price, Normalfont11));
							table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
							table11.addCell(table_cell11);
							
							// 4
							long quantity = sr.getQuantity();
							
							table_cell11 = new  PdfPCell(new Phrase(""+quantity, Normalfont11));
							table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
							table11.addCell(table_cell11);
														
							// 5							
							double GST = sr.getGST();
							
							table_cell11 = new  PdfPCell(new Phrase(""+GST, Normalfont11));
							table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
							table11.addCell(table_cell11);
							
							// 5							
							double IGST = sr.getIGST();
							
							table_cell11 = new  PdfPCell(new Phrase(""+IGST, Normalfont11));
							table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
							table11.addCell(table_cell11);
							
							// 5							
							double taxAmount = sr.getTaxAmount();
							
							table_cell11 = new  PdfPCell(new Phrase(""+taxAmount, Normalfont11));
							table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
							table11.addCell(table_cell11);
							
							
							// 6							
							double total = sr.getTotal(); 
							
							table_cell11 = new  PdfPCell(new Phrase(""+total, Normalfont11));
							table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell11.setPaddingBottom(5);
							table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
							table11.addCell(table_cell11);
				
					
					}
					 
						/* table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);

						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new  PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
						table11.addCell(table_cell11); */
						
						document.add(table11);
						// new table end 1
						
						//new total 0
						
		PdfPTable table111 = new PdfPTable(3);
		table111.setSpacingBefore(3);
		table111.setWidthPercentage(100);
		table111.setSpacingAfter(3);

		float[] columnWidths1111 = { 1.1f, 0.6f, 0.6f };
		table111.setWidths(columnWidths1111);

		PdfPCell table_cell111;
		
	//for subTotal   
    
	// 1
		table_cell111 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
	
	//2
		table_cell111 = new PdfPCell(new Phrase("Total Sub Total  \n ", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
	//3
		table_cell111 = new PdfPCell(new Phrase( "" + totalSubTotalForPDF, Normalfont14));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		
		// For Discount(%)
		 //1
// 			table_cell111 = new PdfPCell(new Phrase("", Normalfont11));
// 			table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
// 			table_cell111.setBorder(Rectangle.NO_BORDER);
// 			table111.addCell(table_cell111);
	    //2
// 			table_cell111 = new PdfPCell(new Phrase("CGST (Rs) \n ", font11Bold));
// 			table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
// 			table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
// 			table111.addCell(table_cell111);
	    //3
// 			table_cell111 = new PdfPCell(new Phrase( "" + discount2, Normalfont14));
// 			table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
// 			table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
// 			table111.addCell(table_cell111);
					

		// For Discount Amount
		 //1
			table_cell111 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell111.setBorder(Rectangle.NO_BORDER);
			table111.addCell(table_cell111);
	    //2
			table_cell111 = new PdfPCell(new Phrase("CGST (Rs) \n ", font11Bold));
			table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table111.addCell(table_cell111);
	    	//3
	    	
	    	
	    	double GSTForPDF1 = Double.parseDouble(GSTForPDF);
		double totalTaxAmountMain = (Double.parseDouble(totalTaxAmountForPDF));
		
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
	    	
			table_cell111 = new PdfPCell(new Phrase("" + CGST, Normalfont14));
			table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
			table111.addCell(table_cell111);
		
	// For Gst (%)
	 //1
		table_cell111 = new PdfPCell(new Phrase("", font12Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
    //2
		table_cell111 = new PdfPCell(new Phrase("SGST (Rs) \n  ", font11Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
    //3
		table_cell111 = new PdfPCell(new Phrase(""+ SGST, Normalfont14));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
	// For Gst Amount
	 //1
		table_cell111 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
    //2
		table_cell111 = new PdfPCell(new Phrase("IGST (Rs)  \n ", font11Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		
    	//3
    	
    	double IGSTForPDF1 = Double.parseDouble(IGSTForPDF);
		double IGST = 0.00;
		double IGSTAmountFormatted = 0.0;
		if(IGSTForPDF1 > 0)
		{	
			IGSTAmountFormatted = Double.parseDouble(String.format("%.2f", totalTaxAmountMain));  // can be required precision
			IGST = IGSTAmountFormatted;
		}
    	
		table_cell111 = new PdfPCell(new Phrase("" + IGST, Normalfont14));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

	
	// For Gross Total
	 //1
		table_cell111 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
    //2
		table_cell111 = new PdfPCell(new Phrase("Gross Total  \n ", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
    //3
		table_cell111 = new PdfPCell(new Phrase("" + grossTotalForPDF, font18BoldRed));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		
		
		
		document.add(table111);
						
						//new total 1
						
				// For Footer	
						
						PdfPTable table12 = new PdfPTable(1);
						table11.setSpacingBefore(1);
						table11.setWidthPercentage(100);
						table11.setSpacingAfter(1);
						
						
						float[] columnWidths112 = {20};
						table12.setWidths(columnWidths112);
						
						PdfPCell table_cell12;
						
						table_cell12 = new  PdfPCell(new Phrase("\n If you have any questions about this purchase order, please contact", Normalfont11));
						table_cell12.setHorizontalAlignment(Element.ALIGN_CENTER);
						//table_cell12.setBorder(Rectangle.LEFT);
						table_cell12.setBorder(Rectangle.NO_BORDER);
						table12.addCell(table_cell12);
						
						table_cell12 = new  PdfPCell(new Phrase("[Embel Technologies, 8668757349, contact@embel.co.in]", font12Bold));
						table_cell12.setHorizontalAlignment(Element.ALIGN_CENTER);
						//table_cell12.setBorder(Rectangle.LEFT);
						table_cell12.setBorder(Rectangle.NO_BORDER);
						table12.addCell(table_cell12);
						
						document.add(table12);
						

						PdfPTable table13 = new PdfPTable(1);
						table11.setSpacingBefore(1);
						table11.setWidthPercentage(100);
						table11.setSpacingAfter(1);
						
						
						float[] columnWidths113 = {20};
						table12.setWidths(columnWidths112);
						
						PdfPCell table_cell13;

						table_cell13 = new  PdfPCell(new Phrase("\nThank You for Contributing Towards Growth Of Our Business", font12BoldUnderline));
						table_cell13.setHorizontalAlignment(Element.ALIGN_CENTER);
						//table_cell12.setBorder(Rectangle.LEFT);
						table_cell13.setBorder(Rectangle.NO_BORDER);
						table13.addCell(table_cell13);
						
						document.add(table13);
						
					
						document.close();
			
			
		} catch (DocumentException de) {
		    throw new IOException(de.getMessage());
		}
		
	

%>


