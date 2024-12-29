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
<%@page import="java.util.Formatter"%>
<%@page import="javax.sound.midi.Soundbank"%>
<%@page import="com.itextpdf.text.pdf.codec.Base64.OutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>

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
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.PdfGState"%>

<%
	response.setContentType("application/pdf");
	
	  //	Long srNO=(Long)session.getAttribute("srNO"); 
	  	Long srNO = 1l;
	  	System.out.println("////////////////////////////////////////////////"+srNO);
	 
		Connection conn = null;
		double gsttotal;
		double sgst;
		double cgst;
		double cgst_amt;
		double sgst_amt;
		String Grand_Total="";
		
		String vehicle= "";
		
	 	try {

		// step 1
		Document document = new Document();

		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();
		Image image1 = Image.getInstance("C:/Embel.jpg");

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/embel_soft", "root", "root");
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery("SELECT hr.sr_number, hr.description,hr.quantity,hr.unit_price,hr.amount,vd.vendor_name,vd.contact_number,vd.email_id,vd.address,vd.zip_code,vd.country,vd.state,vd.PAN_number,vd.CIM_number, vd.gst_in_number FROM hr_billing_details hr join vendor_details vd WHERE hr.sr_number ="+srNO);
	
		rs.first();		
		
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

		DecimalFormat df = new DecimalFormat("#.00");    

		Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font16BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD | Font.UNDERLINE, BaseColor.RED);

		Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);
		
		Font NormalRedfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont16 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.RED);

		// step 4
		
		image1.scaleToFit(100f, 200f);
		Image imageCenter = Image.getInstance(image1);
		imageCenter.setAlignment(Image.MIDDLE);
		document.add(imageCenter);
		
		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.9f ,0.3f,0.4f};
		table.setWidths(columnWidths);

		PdfPCell table_cell;
	
			table_cell = new PdfPCell(new Phrase("Embel Technologies Pvt Ltd",font13));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table.addCell(table_cell);
			
			table_cell = new PdfPCell(new Phrase("INVOICE NO:", Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.LEFT | Rectangle.TOP);
			table.addCell(table_cell);

			table_cell = new PdfPCell(new Phrase("INV/HR/18-19/004", Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table.addCell(table_cell);
			
			table_cell = new PdfPCell(new Phrase(""));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
			table.addCell(table_cell);
			
			table_cell = new PdfPCell(new Phrase("", Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.BOTTOM);
			table.addCell(table_cell);
			
			table_cell = new PdfPCell(new Phrase(""));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder( Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			table.addCell(table_cell);
			
			document.add(table);
			
			PdfPTable table2 = new PdfPTable(3);
			table2.setWidthPercentage(100);

			float[] columnWidths2 = { 0.9f,0.3f,0.4f};
			table2.setWidths(columnWidths2);

			PdfPCell table_cell2;
			
			table_cell2 = new PdfPCell(new Phrase("2nd floor, Maks Enterprises, Near JB Complex, Behind Morya Heights, Canal Rd, Warje. ", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT );
			//table_cell2.setBorder(Rectangle.NO_BORDER );
			table2.addCell(table_cell2);
			
			table_cell2 = new PdfPCell(new Phrase("Date:", Normalfont13));
			table_cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell2.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table2.addCell(table_cell2);
			
			table_cell2 = new PdfPCell(new Phrase("30-June-2018", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell2.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table2.addCell(table_cell2);
			
			table_cell2 = new PdfPCell(new Phrase(""));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2 = new PdfPCell(new Phrase(""));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder( Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			table2.addCell(table_cell2);
			
			document.add(table2);
			
			PdfPTable table3 = new PdfPTable(3);
			table3.setWidthPercentage(100);

			float[] columnWidths3 = { 0.9f,0.3f,0.4f};
			table3.setWidths(columnWidths3);

			PdfPCell table_cell3;
			
			table_cell3 = new PdfPCell(new Phrase("Pune, Maharashtra 411052. Web Address : www.embel.co.in, ", Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table3.addCell(table_cell3);
			
			table_cell3 = new PdfPCell(new Phrase("GSTIN:", Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table3.addCell(table_cell3);
			
			table_cell3 = new PdfPCell(new Phrase("123456", Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table3.addCell(table_cell3);
			
			table_cell3 = new PdfPCell(new Phrase(""));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
			table3.addCell(table_cell3);
			
			table_cell3 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.BOTTOM);
			table3.addCell(table_cell3);
			
			table_cell3 = new PdfPCell(new Phrase(""));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder( Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			table3.addCell(table_cell3);
			
			document.add(table3);
			
			PdfPTable table4 = new PdfPTable(3);
			table4.setWidthPercentage(100);

			float[] columnWidths4 = { 0.9f,0.3f,0.4f};
			table4.setWidths(columnWidths4);

			PdfPCell table_cell4;
			
			table_cell4 = new PdfPCell(new Phrase("                                                            ", Normalfont11));
			table_cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell4.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table4.addCell(table_cell4);
			
			table_cell4 = new PdfPCell(new Phrase("PAN No :", Normalfont11));
			table_cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell4.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table4.addCell(table_cell4);
			
			table_cell4 = new PdfPCell(new Phrase("AAECE4252H", Normalfont11));
			table_cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell4.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table4.addCell(table_cell4);
			
			table_cell4 = new PdfPCell(new Phrase(""));
			table_cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell4.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
			table4.addCell(table_cell4);
			
			table_cell4 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell4.setBorder(Rectangle.BOTTOM);
			table4.addCell(table_cell4);
			
			table_cell4 = new PdfPCell(new Phrase(""));
			table_cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell4.setBorder( Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			table4.addCell(table_cell4);
			
			document.add(table4);	

			PdfPTable table5 = new PdfPTable(3);
			table5.setWidthPercentage(100);

			float[] columnWidths5 = {0.9f,0.3f,0.4f};
			table5.setWidths(columnWidths5);

			PdfPCell table_cell5;
		
				table_cell5 = new PdfPCell(new Phrase("Customer Details",font13));
				table_cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell5.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table5.addCell(table_cell5);
				
				table_cell5 = new PdfPCell(new Phrase("CIN:", Normalfont13));
				table_cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell5.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table5.addCell(table_cell5);
				

				table_cell5 = new PdfPCell(new Phrase("U72200PN2016PTC166648", Normalfont11));
				table_cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell5.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);;
				table5.addCell(table_cell5);
				
				table_cell5 = new PdfPCell(new Phrase(""));
				table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell5.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
				table5.addCell(table_cell5);
				
				table_cell5 = new PdfPCell(new Phrase("", Normalfont11));
				table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell5.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table5.addCell(table_cell5);
				
				table_cell5 = new PdfPCell(new Phrase(""));
				table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell5.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table.addCell(table_cell5);
				
				document.add(table5);
				
				PdfPTable table6 = new PdfPTable(3);
				table6.setWidthPercentage(100);

				float[] columnWidths6 = {0.9f,0.3f,0.4f};
				table6.setWidths(columnWidths6);

				PdfPCell table_cell6;
			
					table_cell6 = new PdfPCell(new Phrase("Customer Address:",Normalfont11));
					table_cell6.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table6.addCell(table_cell6);
					
					table_cell6 = new PdfPCell(new Phrase("Billing Period:", Normalfont13));
					table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell6.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table6.addCell(table_cell6);
					
					table_cell6 = new PdfPCell(new Phrase("  ", Normalfont11));
					table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell6.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);;
					table6.addCell(table_cell6);
					
					table_cell6 = new PdfPCell(new Phrase(""));
					table_cell6.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell6.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
					table5.addCell(table_cell6);
					
					table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
					table_cell6.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell6.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table6.addCell(table_cell6);
					
					table_cell6 = new PdfPCell(new Phrase(""));
					table_cell6.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell6.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table6.addCell(table_cell6);
					
					document.add(table6);
					
				PdfPTable table8 = new PdfPTable(3);
				table8.setWidthPercentage(100);

				float[] columnWidths8 = {0.9f,0.3f,0.4f};
				table8.setWidths(columnWidths8);

				PdfPCell table_cell8;
			
					table_cell8 = new PdfPCell(new Phrase("   ",Normalfont11));
					table_cell8.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell8.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table8.addCell(table_cell8);
					
					table_cell8 = new PdfPCell(new Phrase("Start Date:", Normalfont13));
					table_cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell8.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table8.addCell(table_cell8);
					
					table_cell8 = new PdfPCell(new Phrase("  ", Normalfont11));
					table_cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell8.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);;
					table8.addCell(table_cell8);
					
					table_cell8 = new PdfPCell(new Phrase(""));
					table_cell8.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell8.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
					table8.addCell(table_cell8);
					
					table_cell8 = new PdfPCell(new Phrase("", Normalfont11));
					table_cell8.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell8.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table8.addCell(table_cell8);
					
					table_cell8 = new PdfPCell(new Phrase(""));
					table_cell8.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell8.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table8.addCell(table_cell8);
					
					document.add(table8);
							
			PdfPTable table9 = new PdfPTable(6);
			table9.setWidthPercentage(100);

			float[] columnWidths9 = {0.1f,0.3f,0.2f, 0.3f,0.3f,0.4f};
			table9.setWidths(columnWidths9);

			PdfPCell table_cell9;
		
				table_cell9 = new PdfPCell(new Phrase("City:",Normalfont11));
				table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell9.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase("", Normalfont13));
				table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell9.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase("State:", Normalfont11));
				table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell9.setBorder(Rectangle.TOP  | Rectangle.BOTTOM);;
				table9.addCell(table_cell9);

				table_cell9 = new PdfPCell(new Phrase(" ",Normalfont11));
				table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell9.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase("End Date:", Normalfont13));
				table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell9.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase("  ", Normalfont11));
				table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell9.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);;
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase(""));
				table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell9.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase("", Normalfont11));
				table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell9.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase(""));
				table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell9.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase(""));
				table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell9.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase("", Normalfont11));
				table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell9.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				table_cell9 = new PdfPCell(new Phrase(""));
				table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell9.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table9.addCell(table_cell9);
				
				document.add(table9);
				
				PdfPTable table10 = new PdfPTable(4);
				table10.setWidthPercentage(100);

				float[] columnWidths10 = {0.229f,0.285f,0.1f,0.3f};
				table10.setWidths(columnWidths10);

				PdfPCell table_cell10;
			
					table_cell10= new PdfPCell(new Phrase("Zip Code:",Normalfont11));
					table_cell10.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell10.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table10.addCell(table_cell10);
					
					table_cell10 = new PdfPCell(new Phrase("Country:", Normalfont11));
					table_cell10.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell10.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table10.addCell(table_cell10);
					
					table_cell10 = new PdfPCell(new Phrase("", Normalfont13));
					table_cell10.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell10.setBorder(Rectangle.NO_BORDER);
					table10.addCell(table_cell10);
					
					table_cell10 = new PdfPCell(new Phrase("", Normalfont11));
					table_cell10.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell10.setBorder(Rectangle.NO_BORDER);
					table10.addCell(table_cell10);
					
					table_cell10 = new PdfPCell(new Phrase("  ", Normalfont11));
					table_cell10.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell10.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);;
					table10.addCell(table_cell10);
					
					table_cell10 = new PdfPCell(new Phrase(""));
					table_cell10.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell10.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
					table10.addCell(table_cell10);
					
					document.add(table10);
					
					PdfPTable table11 = new PdfPTable(4);
					table11.setWidthPercentage(100);

					float[] columnWidths11 = {0.229f,0.285f,0.1f,0.3f};
					table11.setWidths(columnWidths11);

					PdfPCell table_cell11;
				
						table_cell11= new PdfPCell(new Phrase("Mobile No:",Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
					
						
						table_cell11 = new PdfPCell(new Phrase("Alternate No", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
						table11.addCell(table_cell11);
						
						table_cell11 = new PdfPCell(new Phrase("  ", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell11.setBorder( Rectangle.NO_BORDER);
						table11.addCell(table_cell11);
						
						table_cell11 = new PdfPCell(new Phrase(""));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.NO_BORDER);
						table11.addCell(table_cell11);
						
						table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.RIGHT |Rectangle.TOP );
						table11.addCell(table_cell11);
						
						table_cell11 = new PdfPCell(new Phrase(""));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.RIGHT |Rectangle.TOP  );
						table11.addCell(table_cell11);
						
						table_cell11 = new PdfPCell(new Phrase(""));
						table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell11.setBorder(Rectangle.RIGHT |Rectangle.TOP  );
						table11.addCell(table_cell11);
						
						document.add(table11);
						
						PdfPTable table12 = new PdfPTable(2);
						table12.setWidthPercentage(100);

						float[] columnWidths12 = {0.386f,0.3f};
						table12.setWidths(columnWidths12);

						PdfPCell table_cell12;
					
							table_cell12= new PdfPCell(new Phrase("Email ID:",Normalfont11));
							table_cell12.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell12.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
							table12.addCell(table_cell12);
							
							table_cell12 = new PdfPCell(new Phrase("", Normalfont13));
							table_cell12.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell12.setBorder(Rectangle.NO_BORDER);
							table12.addCell(table_cell12);
					
							document.add(table12);
											
					PdfPTable table13 = new PdfPTable(2);
					table13.setWidthPercentage(100);

					float[] columnWidths13 = {0.386f,0.3f};
					table13.setWidths(columnWidths13);

					PdfPCell table_cell13;
				
				table_cell13= new PdfPCell(new Phrase("GSTIN:",Normalfont11));
				table_cell13.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell13.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
				table13.addCell(table_cell13);
				
				table_cell13 = new PdfPCell(new Phrase("", Normalfont13));
				table_cell13.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell13.setBorder(Rectangle.NO_BORDER);
				
				table13.addCell(table_cell13);
					
			    document.add(table13);
					
					PdfPTable table14 = new PdfPTable(2);
					table14.setWidthPercentage(100);

					float[] columnWidths14 = {0.386f,0.3f};
					table14.setWidths(columnWidths14);

					PdfPCell table_cell14;
				
					table_cell14= new PdfPCell(new Phrase("PAN NO:",Normalfont11));
					table_cell14.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell14.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table14.addCell(table_cell14);
					
					table_cell14 = new PdfPCell(new Phrase("", Normalfont13));
					table_cell14.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell14.setBorder(Rectangle.NO_BORDER);
					table14.addCell(table_cell14);
					
					table_cell14 = new PdfPCell(new Phrase(""));
					table_cell14.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell14.setBorder(Rectangle.NO_BORDER);
					table14.addCell(table_cell14);
					
					document.add(table14);
									
						PdfPTable table15 = new PdfPTable(2);
						table15.setWidthPercentage(100);

						float[] columnWidths15 = {0.386f,0.3f};
						table15.setWidths(columnWidths15);

						PdfPCell table_cell15;
					
					table_cell15= new PdfPCell(new Phrase("CIN:",Normalfont11));
					table_cell15.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell15.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
					table15.addCell(table_cell15);
					
					table_cell15 = new PdfPCell(new Phrase("", Normalfont13));
					table_cell15.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell15.setBorder(Rectangle.NO_BORDER);
					table15.addCell(table_cell15);
					
					table_cell15 = new PdfPCell(new Phrase(""));
					table_cell15.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell15.setBorder(Rectangle.NO_BORDER);
					table15.addCell(table_cell15);
					
					document.add(table15);
		
		    PdfPTable table16 = new PdfPTable(5);
			table16.setWidthPercentage(100);

			float[] columnWidths16 = { 0.2f,0.3f,0.3f,0.2f,0.3f};
			table16.setWidths(columnWidths16);

			PdfPCell table_cell16;
		
			table_cell16 = new PdfPCell(new Phrase("Sr number", Normalfont11));
			table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16);
			
			table_cell16 = new PdfPCell(new Phrase("Description", Normalfont11));
			table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16);

			table_cell16 = new PdfPCell(new Phrase("Quantity", Normalfont11));
			table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16);
			
			table_cell16 = new PdfPCell(new Phrase("Unit Price", Normalfont11));
			table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16);
			
			table_cell16 = new PdfPCell(new Phrase("Amount", Normalfont11));
			table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16);
			
			 //from here the vlaue can be inserted
			 
		   long srNO1 = rs.getLong("sr_number");
		   System.out.println("hi this si sonal*********************************");
			table_cell16 = new PdfPCell(new Phrase(String.valueOf(srNO1), Normalfont11));
			//table_cell6 = new PdfPCell(new Phrase(srNO1+"\n", Normalfont11));
            table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16); 
			
			String description=rs.getString("description");
			table_cell16 = new PdfPCell(new Phrase(description+"\n", Normalfont11));
			table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16);
			
			long quantity=rs.getLong("quantity");
			table_cell16 = new PdfPCell(new Phrase(String.valueOf(quantity), Normalfont11));
			table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16);

			double unit =rs.getDouble("unit_price");
			table_cell16 = new PdfPCell(new Phrase(String.valueOf(unit), Normalfont11));
			table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16);
			
			double amount = rs.getDouble("amount");
			table_cell16 = new PdfPCell(new Phrase(String.valueOf(amount), Normalfont11));
			table_cell16.setBorderWidth(1f);
			table_cell16.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell16.setPaddingBottom(4f);
			table16.addCell(table_cell16);
			  
			  document.add(table16);  
		  
		rs.close();
		stmt.close();
		conn.close();
		document.close();
		
	}
	 catch (DocumentException de)
	{
		throw new IOException(de.getMessage());
	}
%>