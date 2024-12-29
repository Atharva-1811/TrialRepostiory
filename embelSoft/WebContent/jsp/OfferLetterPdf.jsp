<%@page import="com.embelSoft.utility.PDFPath"%>
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








<%
	response.setContentType("application/pdf");
	
	  //	Long srNO=(Long)session.getAttribute("srNO"); 
	  
	  
	
	  String employeeName = (String) session.getAttribute("employeeName");
	  //String idNumber = (String) session.getAttribute("idNumber");
	  String designation = (String) session.getAttribute("designation");
	  String salary = (String) session.getAttribute("salary");
	  
	  String dateOfJoining = (String) session.getAttribute("dateOfJoining");
	  
	 
	  String emailId = (String) session.getAttribute("emailId");
	  String placeOfPosting = (String) session.getAttribute("place");
	  String description1 = (String) session.getAttribute("description1");
	  String description2 = (String) session.getAttribute("description2");
	  
	
/* 	  SimpleDateFormat sdfDestination = new SimpleDateFormat("dd/MM/yyyy");
	  
	  String date1 = sdfDestination.format(dateOfJoining);
	   */
	  
	  	Long idNumber = 1l;
	  	System.out.println("////////////////////////////////////////////////"+idNumber);
	 
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
		

		DecimalFormat df = new DecimalFormat("#.00");    

		Font font8Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		Font font10Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font12Bold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font10 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font16BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD | Font.UNDERLINE, BaseColor.RED);

		Font Normalfont9 = new Font(Font.FontFamily.TIMES_ROMAN, 9, Font.NORMAL, BaseColor.BLACK);
		Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font Normalfont10 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);
		
		Font font10BoldRed = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.RED);
		Font NormalRedfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont16 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.RED);

		// step 4
		
	// Logo start
	   PDFPath path = new PDFPath();
	    Image image1;
			try
			{
				 image1 = Image.getInstance(path.getLocalPath());
			    
			}catch(Exception e)
			{
				 image1 = Image.getInstance(path.getServerPath());
			}
		image1.scaleToFit(100f, 200f);
		Image imageCenter = Image.getInstance(image1);
		imageCenter.setAlignment(Image.LEFT);
		
		
		document.add(imageCenter);
		
		document.add(new Paragraph(
				"                                    EMBEL TECHNOLOGIES PVT. LTD.",font10BoldRed));
	// End	logo
		
	
	// Company Address Start 
	
		PdfPTable table00 = new PdfPTable(1);
		table00.setWidthPercentage(100);

		float[] columnWidths00 = {10f};
		table00.setWidths(columnWidths00);

		PdfPCell table_cell00;
	
            table_cell00  = new PdfPCell(new Phrase("Vanashree Palace, 2nd floor, Above Chate Classes,\n Near Tapodham Bus Stop, NDA Road, Warje Naka, Pune - 411058.\n ",font12NoBold));
			table_cell00.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell00.setBorder(Rectangle.BOTTOM);
			table00.addCell(table_cell00);
			
			document.add(table00);
			
	// End Address	
			
		
	// Heading Start
			
		PdfPTable table = new PdfPTable(1);
		table.setWidthPercentage(100);

		float[] columnWidths = {10f};
		table.setWidths(columnWidths);

		PdfPCell table_cell;
	
            table_cell  = new PdfPCell(new Phrase("Appointment Letter \n",font15BoldUnderline));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(table_cell);
			
			document.add(table);
			
	  // Heading End	
	  
	  
	  
			
			PdfPTable table0 = new PdfPTable(2);
			table0.setWidthPercentage(100);

			float[] columnWidths0 = { 0.9f,0.9f};
			table0.setWidths(columnWidths0);

			PdfPCell table_cell0;
	
	            table_cell0  = new PdfPCell(new Phrase("\n Welcome to EMBEL",font13Bold));
				table_cell0.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell0.setBorder(Rectangle.NO_BORDER);
				table0.addCell(table_cell0);
				
				
	            table_cell0  = new PdfPCell(new Phrase("\n\n\n",font13Bold));
				table_cell0.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell0.setBorder(Rectangle.NO_BORDER);
				table0.addCell(table_cell0);
				
				document.add(table0);
			
				
	// Employe Name Start			
				
			PdfPTable table1 = new PdfPTable(2);
			table1.setWidthPercentage(100);

			float[] columnWidths1 = {10,10};
			table1.setWidths(columnWidths1);

			PdfPCell table_cell1;
		
	            table_cell1  = new PdfPCell(new Phrase("Mr/Mrs  :   "+employeeName,font13Bold));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);
				
				table_cell1  = new PdfPCell(new Phrase("\n\n",Normalfont11));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);

				String[] str = employeeName.split(" ");
				for(int i=0;i<str.length-1;i++)
				{
		            table_cell1  = new PdfPCell(new Phrase("Dear "+str[i]+",",Normalfont13));
					table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell1.setBorder(Rectangle.NO_BORDER);
					table1.addCell(table_cell1);
				}
				
				table_cell1  = new PdfPCell(new Phrase("",Normalfont11));
				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell1.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell1);				
				
				document.add(table1);
				
				
	// Name End
	
	
	// Designation start 
	
				PdfPTable table2 = new PdfPTable(3);
				table2.setWidthPercentage(100);

				float[] columnWidths2 ={9,5,5};
				table2.setWidths(columnWidths2);

				PdfPCell table_cell2;
			
		            table_cell2 = new PdfPCell(new Phrase("          We  are pleased to appoint you as ",Normalfont13));
					table_cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table_cell2.setBorder(Rectangle.NO_BORDER);
					table2.addCell(table_cell2);
					
		            table_cell2 = new PdfPCell(new Phrase(designation,font13Bold));
					table_cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell2.setBorder(Rectangle.NO_BORDER);
					table2.addCell(table_cell2);
					
					
		            table_cell2 = new PdfPCell(new Phrase("or in such other capacity ",Normalfont13));
					table_cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table_cell2.setBorder(Rectangle.NO_BORDER);
					table2.addCell(table_cell2);

					document.add(table2);
					
	// Designation End
	
	
	// Paragraph Start
	
			PdfPTable table3 = new PdfPTable(1);
					table3.setWidthPercentage(100);

					float[] columnWidths3 = {20};
					table3.setWidths(columnWidths3);

					PdfPCell table_cell3;
				
			            table_cell3 = new PdfPCell(new Phrase("as the  Management of Embel Technologies Private Limited, here in after called the company, shall from time to time determine, under following Terms And Conditions:",Normalfont13));
						table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell3.setBorder(Rectangle.NO_BORDER);
						table3.addCell(table_cell3);

						
						document.add(table3);
	
	// // Paragraph End
	
	
	// Appointment Date Start
						
						PdfPTable table5 = new PdfPTable(2);
						table5.setWidthPercentage(100);

						float[] columnWidths5 = {18,2};
						table5.setWidths(columnWidths5);

						PdfPCell table_cell5;
			            					
			            table_cell5 = new PdfPCell(new Phrase("\n 1. Date Of Appointment \n ",font10Bold));
						table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell5.setBorder(Rectangle.NO_BORDER );
						table5.addCell(table_cell5);
						
						table_cell5 = new PdfPCell(new Phrase("",Normalfont13));
						table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell5.setBorder(Rectangle.NO_BORDER );
						table5.addCell(table_cell5);
						
						
						document.add(table5);
						
						PdfPTable table51 = new PdfPTable(2);
						table51.setWidthPercentage(100);

						float[] columnWidths51 = {10.5f,9.5f};
						table51.setWidths(columnWidths51);

						PdfPCell table_cell51;
						
						
						table_cell51 = new PdfPCell(new Phrase("           Your Date of appointment is effective from : ",Normalfont13));
						table_cell51.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell51.setBorder(Rectangle.NO_BORDER );
						table51.addCell(table_cell51);
						
						
						String[] doj = dateOfJoining.split("-");
						/* for(int i=doj.length-1;i<=0;i--)
						{ */
							table_cell51 = new PdfPCell(new Phrase(doj[2]+"-"+doj[1]+"-"+doj[0]+".",Normalfont13));
							table_cell51.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell51.setBorder(Rectangle.NO_BORDER );
							table51.addCell(table_cell51);
						/* } */
						

						document.add(table51);
						
		// End Date	------------			
		
		
						
						PdfPTable table6 = new PdfPTable(1);
						table6.setWidthPercentage(100);

						float[] columnWidths6 = {10};
						table6.setWidths(columnWidths6);

						PdfPCell table_cell6;
					
			            table_cell6 = new PdfPCell(new Phrase("\n 2. Code Of Conduct",font10Bold));
						table_cell6.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell6.setBorder(Rectangle.NO_BORDER);
						table6.addCell(table_cell6);
						document.add(table6);
						
						document.add(new Paragraph("\n        2.1	 Company may require you, at any time, to perform technical and  other functions and you                   will be bound to carry out such functions.\n        2.2	 You  shall  maintain  proper  discipline  and  dignity of your office and  shall  deal  with  all                   matters with sobriety. \n        2.3	 You shall maintain and keep in your safe  custody such books, registers, documents and                    other papers as may be issued to you or may come in your possession  and shall return                   the same when required. \n        2.4	 You  shall  inform  Company of any changes  in  your  personal  data  within 3 days of the                  occurrence of such change. Any notice required to be  given to you shall be deemed to                    have been duly and properly given if delivered to you personally or sent by post to you                     at your address in India as recorded in the Company.  \n        2.5	 You will observe work  timings  and  holidays  as  applicable  to your location and place of                  work.  \n        2.6 	You  shall  be  solely  responsible for  any  issues  that  may  arise  between you and your                  previous employer with regard to your  previous employment and  the  Company is  not                    responsible for the same."));

								
								
						//-------------------------------------Footer in first page------------------------------------
						
						document.bottomMargin();
								
						document.add(new Paragraph(
								"\n"));
						
				document.add(new Paragraph(
								"---------------------------------------------------------------------------------------------------------------------------------"));
				document.add(new Paragraph(
						"                                                 EMBEL Technologies Pvt Ltd.", font15Bold));
							
				document.add(new Paragraph(
						"                                                                                   Sumeet Bandewar - 8275941044 , http://embel.co.in/", Normalfont9));
				
			//-------------------------------------This is second page------------------------------------
						
		document.newPage();

		document.add(new Paragraph(
				"                                                 EMBEL Technologies Pvt Ltd.",font10BoldRed));
		document.add(new Paragraph(
				"                                               Vanashree Palace, 2nd floor, Above Chate Classes,"));
		document.add(new Paragraph(
				"                                     Near Tapodham Bus Stop, NDA Road, Warje Naka, Pune - 411058. "));
		document.add(new Paragraph(
				"---------------------------------------------------------------------------------------------------------------------------------"));
				
			//	rs.first();
			
			
// 			document.add(new Paragraph("                responsible for the same.\n "));
				
			document.add(new Paragraph("        2.7	 You will not borrow  or accept any money, gift, reward or compensation for your personal                   gains from or otherwise place yourself under pecuniary obligation to any person / client                    with whom you may be having official dealings. "));
			
			
				PdfPTable table7 = new PdfPTable(1);
				table7.setWidthPercentage(100);

				float[] columnWidths7 = {10};
				table7.setWidths(columnWidths7);

				PdfPCell table_cell7;
			
	            table_cell7 = new PdfPCell(new Phrase("\n  3. Place of Posting : "+placeOfPosting,font8Bold));
				table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell7.setBorder(Rectangle.NO_BORDER);
				table7.addCell(table_cell7);
				
				document.add(table7);
				
				document.add(new Paragraph("              Your initial posting will be at Pune, Maharashtra, India. You  will  be  liable  to  transfer in                   such capacity as  the Company may from  time to time determine to  any  other location,                     departments,  establishment, factory or branch of the Company or subsidiary, associate or                   affiliate  of  the  Company in  India or abroad without claiming any extra remuneration for                  such transfers. ",Normalfont13));
				
				document.add(new Paragraph("\n  4. Leave ",font8Bold));
				document.add(new Paragraph("            You will be entitled to leave and other benefits in accordance with the rules of the Company.",Normalfont13));
					
				document.add(new Paragraph("\n  5. Other Work: ",font8Bold));
				document.add(new Paragraph("            Your position is a fulltime employment with the Company and you shall devote your whole                  time  and attention  to  the  Company’s business entrusted to you. You will not take up any                 other  work  for remuneration  (part-time or otherwise) or  work in advisory  capacity or be                 interested  directly or  indirectly (except as shareholder or debenture holder)  in  any  other                 trade  or business  during  the  employment  with the  Company  without  the  prior written\n              permission of the Director of the Company. ",Normalfont13));

				document.add(new Paragraph("\n  6. Intellectual Property and Confidential Information: ",font8Bold));
				document.add(new Paragraph("\n       6.1	 You must always maintain the highest  degree  of  confidentiality  and keep as confidential                  the records, documents and  other Confidential  Information relating to the business of the                  Company which may be known to you or confided in you by any  means and you will use                   such records, documents and information only in a duly authorized  manner in the interest                   of the Company.",Normalfont13));
				
				
				//-------------------------------------Footer in first page------------------------------------
				
				document.bottomMargin();
						
		
				
		document.add(new Paragraph(
						"---------------------------------------------------------------------------------------------------------------------------------"));
		document.add(new Paragraph(
				"                                                 EMBEL Technologies Pvt Ltd.", font15Bold));
					
		document.add(new Paragraph(
				"                                                                                   Sumeet Bandewar - 8275941044 , http://embel.co.in/", Normalfont9));
				
				//-------------------------------------This is Third page------------------------------------
				
				document.newPage();

		document.add(new Paragraph(
				"                                                 EMBEL Technologies Pvt Ltd.",font10BoldRed));
		document.add(new Paragraph(
				"                                               Vanashree Palace, 2nd floor, Above Chate Classes,"));
		document.add(new Paragraph(
				"                                     Near Tapodham Bus Stop, NDA Road, Warje Naka, Pune - 411058. "));
		document.add(new Paragraph(
				"---------------------------------------------------------------------------------------------------------------------------------"));
		
		
		document.add(new Paragraph("\n            For  the   purposes   of  this  clause  Confidential  Information   means   information about                    the  Company's  business and that  of its customers which  is  not  available  to the general           				     	  public and  which may  be learnt by  you in the course of your employment.",Normalfont13));
		
		document.add(new Paragraph("           This  includes, but  is  not  limited  to, information  relating  to  organization,  its customer           				          lists employment  policies,  personnel, and  information  about  the  Company's products,                 					   processes including ideas, concepts, projections, technology  manuals, drawing, designs,                   					  specifications,  and  all   papers,  resumes, records  and  other documents containing such                 					   confidential information.",Normalfont13));
		
		/* document.add(new Paragraph("                  manuals,   drawing,   designs,   specifications,   and   all   papers,   resumes,   records   and                  other documents containing such Confidential Information.",Normalfont13)); */
		
		
		document.add(new Paragraph("\n      6.2	  At  no  time,  will   you  remove  any   Confidential   Information  from  the   office  without                  permission."));
		
		document.add(new Paragraph("\n      6.3   Your   duty   to   safeguard   and  not  disclose  Confidential  Information  will  survive  the                   expiration or termination of this Agreement and/or your employment with the Company."));
		
		document.add(new Paragraph("\n      6.4	  Breach of the conditions of this clause  will render you liable to summary dismissal under                  clause above in addition to any other remedy the Company may have against you in law."));
		
		document.add(new Paragraph("\n      6.5	  You  shall  irrevocably,  unconditionally  and  free  of  any  cost,  royalty or compensation,                   assign  to  the  Company  all rights, title  and interests  including  the  transfer  rights and                  Intellectual  Property Rights  in all  products,  designs, software,  embedded, electronics,                  intermediary, base software technology which is created or developed by you during the                   course of your employment in  the Company. The Company shall have the right to obtain                 and hold in its own name, copyrights, trade-marks and other applicable registrations and                  seek  such  other protection  as may be appropriate to the work, product and all designs,                  software  created  by  you  and you  shall   also   provide  the    Company  or  any person                 designated by  the Company all assistance as may be required and/or perfect the rights                   defined in this clause."));
		
		//-------------------------------------Footer in first page------------------------------------
		
		document.bottomMargin();
				
		document.add(new Paragraph(
				"\n\n\n\n\n"));
		
document.add(new Paragraph(
				"---------------------------------------------------------------------------------------------------------------------------------"));
document.add(new Paragraph(
		"                                                 EMBEL Technologies Pvt Ltd.", font15Bold));
			
document.add(new Paragraph(
		"                                                                                   Sumeet Bandewar - 8275941044 , http://embel.co.in/", Normalfont9));


//-------------------------------------This is Fourth page------------------------------------

document.newPage();

document.add(new Paragraph(
"                                                 EMBEL Technologies Pvt Ltd.",font10BoldRed));
document.add(new Paragraph(
"                                               Vanashree Palace, 2nd floor, Above Chate Classes,"));
document.add(new Paragraph(
"                                     Near Tapodham Bus Stop, NDA Road, Warje Naka, Pune - 411058. "));
document.add(new Paragraph(
"---------------------------------------------------------------------------------------------------------------------------------"));
		
		
		document.add(new Paragraph("\n  7. Termination ",font8Bold));
		
		document.add(new Paragraph("\n        7.1	  Your  appointment can be terminated by the Company, without any reason, by giving you                   not less  than 1 month prior notice in writing or salary in lieu there of. For the purpose of                   this clause, salary shall mean basic salary."));
		
		document.add(new Paragraph("\n        7.2	  You may  terminate your employment with the Company, without any cause, by giving no                   less than 1 month prior notice in writing."));
		
		document.add(new Paragraph("\n        7.3	  The Company reserves the right to terminate your  employment  summarily  without any                     notice period or termination payment, if it has reasonable ground to believe you are                          guilty of misconduct or negligence, or have committed  any fundamental breach of                            contract or caused any loss to the Company."));
		
		
				 
 
				
		/* //-------------------------------------This is Fourth page------------------------------------
		
		document.newPage();

document.add(new Paragraph(
		"                                                 EMBEL Technologies Pvt Ltd.",font10BoldRed));
document.add(new Paragraph(
		"                                               2nd floor, Maks Enterprises, Near JB Complex,"));
document.add(new Paragraph(
		"                                     Behind Morya Heights, Canal Road, Warje, Pune - 411058 "));
document.add(new Paragraph(
		"---------------------------------------------------------------------------------------------------------------------------------")); */


// document.add(new Paragraph("\n                caused any loss to the Company."));

document.add(new Paragraph("\n        7.4	  On the  termination  of  your  employment  for  whatever  reason,  you  will   return  to the                   Company all property; documents and paper, both original and copies thereof, including "));

				
		document.add(new Paragraph("                 any samples, literature, contracts, records, lists, drawings, blueprints, letters, notes,                          data and  the  like;  and  Confidential  Information, in  your  possession or under  your                       control  relating to your employment or to clients’ business affairs."));
		
		document.add(new Paragraph("\n        7.5	  Company may not terminate Trainee Engineer when under training period mention in the\n                 training clause 8.1. But can initiate termination if trainee engineer falls into clause 7.3."));
		
		document.add(new Paragraph("\n        7.6	  You may not be able terminate  your  employment with the company when under training\n                 period if appointed as Trainee Engineer."));
		
		document.add(new Paragraph("\n        7.7	  Trainee engineer can be terminated after training period if the performance criteria by the                   trainee  is not met as set by his  reporting  supervisors  or in case company don't  have                    position for the one Trainee was given training."));
	
		
				
		//-------------------------------------Footer in first page------------------------------------
		
				document.bottomMargin();
						
				document.add(new Paragraph(
						"\n\n\n"));
				
		document.add(new Paragraph(
						"---------------------------------------------------------------------------------------------------------------------------------"));
		document.add(new Paragraph(
				"                                                 EMBEL Technologies Pvt Ltd.", font15Bold));
					
		document.add(new Paragraph(
				"                                                                                   Sumeet Bandewar - 8275941044 , http://embel.co.in/", Normalfont9));


		//-------------------------------------This is Fifth page------------------------------------

		document.newPage();

		document.add(new Paragraph(
		"                                                 EMBEL Technologies Pvt Ltd.",font10BoldRed));
		document.add(new Paragraph(
		"                                               Vanashree Palace, 2nd floor, Above Chate Classes,"));
		document.add(new Paragraph(
		"                                     Near Tapodham Bus Stop, NDA Road, Warje Naka, Pune - 411058. "));
		document.add(new Paragraph(
		"---------------------------------------------------------------------------------------------------------------------------------"));
				
				
		document.add(new Paragraph("\n  8. 	Salary: \n ",font8Bold));
		
    // Table fro 8.2
		
		PdfPTable table9 = new PdfPTable(2);
		table9.setWidthPercentage(100);

		float[] columnWidths9 = {2,18};
		table9.setWidths(columnWidths9);

		PdfPCell table_cell9;
	
		table_cell9 = new PdfPCell(new Phrase("        8.1",Normalfont13));
		table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell9.setBorder(Rectangle.NO_BORDER);
		table9.addCell(table_cell9);
		
		table_cell9 = new PdfPCell(new Phrase(description1+"\n\n",Normalfont13));
		table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell9.setBorder(Rectangle.NO_BORDER);
		table9.addCell(table_cell9);
		
		table_cell9 = new PdfPCell(new Phrase("        8.2",Normalfont13));
		table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell9.setBorder(Rectangle.NO_BORDER);
		table9.addCell(table_cell9);
		
		table_cell9 = new PdfPCell(new Phrase(""+description2,Normalfont13));
		table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell9.setBorder(Rectangle.NO_BORDER);
		table9.addCell(table_cell9);
		
		
		document.add(table9);
		
		
		document.add(new Paragraph("\n  9. 	Applicability of Company Policy: ",font8Bold));
		
		document.add(new Paragraph("\n             The  Company shall be entitled to make policy declarations from time to time pertaining to                  matters like  leave entitlement,  maternity  leave,  employees'   benefits,  working hours,                   transfer  policies, etc., and may alter the same from time to time at its sole  discretion. All                 such policy decisions of  the Company  shall be  binding on  you  and  shall override this                  Agreement to that extent."));
		
		
		
		//-------------------------------------Footer in Sixth page------------------------------------
		
		document.bottomMargin();
				
		document.add(new Paragraph(
				"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"));
		
document.add(new Paragraph(
				"---------------------------------------------------------------------------------------------------------------------------------"));
document.add(new Paragraph(
		"                                                 EMBEL Technologies Pvt Ltd.", font15Bold));
			
document.add(new Paragraph(
		"                                                                                   Sumeet Bandewar - 8275941044 , http://embel.co.in/", Normalfont9));


		//-------------------------------------This is Fifth page------------------------------------
		
				document.newPage();

		document.add(new Paragraph(
				"                                                 EMBEL Technologies Pvt Ltd.",font10BoldRed));
		document.add(new Paragraph(
				"                                               Vanashree Palace, 2nd floor, Above Chate Classes,"));
		document.add(new Paragraph(
				"                                     Near Tapodham Bus Stop, NDA Road, Warje Naka, Pune - 411058. "));
		document.add(new Paragraph(
				"---------------------------------------------------------------------------------------------------------------------------------"));
		
		document.add(new Paragraph("\n               We take pleasure in welcoming you to our  Organization  and  look  forward to a mutually                 beneficial association."));
		
		document.add(new Paragraph("\n               We wish you all the best in your career."));
		
		document.add(new Paragraph(
				"\n                                                                                        Yours Sincerely,",font10Bold));
		
		document.add(new Paragraph(
				"\n                                                                                                Director,",font10Bold));
		
		document.add(new Paragraph(
				"                                                                                              EMBEL Technologies Pvt Ltd.",Normalfont13));
		
		
		
		PdfPTable table8 = new PdfPTable(1);
		table8.setWidthPercentage(100);

		float[] columnWidths8 = {10f};
		table8.setWidths(columnWidths8);

		PdfPCell table_cell8;
	
            table_cell8  = new PdfPCell(new Phrase("\n Declaration",font15BoldUnderline));
			table_cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell8.setBorder(Rectangle.NO_BORDER);
			table8.addCell(table_cell8);
			
			document.add(table8);
			
			document.add(new Paragraph("\n               I  have  read  and  understood the  above terms and  conditions of  employment and I am                 accepting  the  same. I will be  reporting for  duty  as  mentioned  in Date of  Appointment                 clause."));
					
			document.add(new Paragraph("\n               Date of Acceptance: "));
			
			document.add(new Paragraph("\n               Name: ",font10Bold));
			
			document.add(new Paragraph("\n               Signature: ",font10Bold));
			
			document.add(new Paragraph("\n\n\n\n\n\n\n\n\n\n\n               "));

			
			// For Footer	
			
			PdfPTable table10 = new PdfPTable(1);
			table8.setSpacingBefore(1);
			table8.setWidthPercentage(100);
			table8.setSpacingAfter(1);
			
			
			float[] columnWidths112 = {20};
			table10.setWidths(columnWidths112);
			
			PdfPCell table_cell10;
			
			
			table_cell10 = new  PdfPCell(new Phrase("", font12Bold));
			table_cell10.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell10.setBorder(Rectangle.TOP);
			table10.addCell(table_cell10);
		
			
			table_cell10 = new  PdfPCell(new Phrase("EMBEL Technologies Pvt Ltd.", font15Bold));
			table_cell10.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell10.setBorder(Rectangle.NO_BORDER);
			table10.addCell(table_cell10);
			
			table_cell10 = new  PdfPCell(new Phrase("Sumeet Bandewar - 8275941044 , http://embel.co.in/", Normalfont9));
			table_cell10.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell10.setBorder(Rectangle.NO_BORDER);
			table10.addCell(table_cell10);
			
			document.add(table10);

		document.close();	
			
			
		}
		 catch (DocumentException de)
		{
			throw new IOException(de.getMessage());
		}
	%>
	