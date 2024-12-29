<%@page import="com.embelSoft.bean.ExperienceLetterBean"%>
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
<%@page import="com.embelSoft.bean.QuotationBean" %>
<%@page import="java.util.ArrayList" %>

<%

	response.setContentType("application/pdf");
 
	String idNumber = (String) session.getAttribute("idNumber");
	String employeeName = (String) session.getAttribute("employeeNameForExp");
	String dateOfReLieving = (String) session.getAttribute("relievingForExp");
	String designation = (String) session.getAttribute("designationForExp");
	String dateOfJoining = (String) session.getAttribute("dateOfJoiningForExp");
	String dateOfLeaving = (String) session.getAttribute("dateOfLeavingForExp");
	
	String id = request.getParameter("id");
	System.out.println("Id in PDF  -- : "+id);
	
	SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
	Date dateobj = new Date();
	
	String dt = dateobj.toString();

	String[] dt2 = dt.split(" ");
	
	String todayDate = dt2[2]+" "+dt2[1]+" "+dt2[5];
	
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
			
			
			//Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font font18Bold = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
			Font font10BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
			Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
			Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
			Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
			Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
			Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font font10 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
			Font font16BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD | Font.UNDERLINE, BaseColor.RED);
			Font font12BoldUnderlineBlue = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLUE);	
			
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
				
			Connection conn = null;
			Connection conn1 = null;
			// step 1
			Document document = new Document();

			// step 2
			PdfWriter.getInstance(document, response.getOutputStream());

			// step 3
						document.open();
						HibernateUtility hbu=null;
						Session session1=null;
						Transaction transaction=null;


						hbu = HibernateUtility.getInstance();
						session1 = hbu.getHibernateSession();
						
						List<ExperienceLetterBean> empList=null;
						
						Query query=session1.createSQLQuery("select employee_name, designation, date_of_joining, date_of_leaving from experience_letter_details where fk_emp_id=:id");
						query.setParameter("id", id);
						
						List<Object[]> results = query.list();
						

						  
						empList= new ArrayList<ExperienceLetterBean>(0);


					for (Object[] o : results) {	
						
					
						ExperienceLetterBean reports = new ExperienceLetterBean();
						
						reports.setEmployeeName(o[0].toString());
						reports.setDesignation(o[1].toString());
						reports.setDateOfJoining(o[2].toString());
						reports.setDateOfLeaving(o[3].toString());
						
						
						empList.add(reports);
					}
						
						
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

			// Logo start
			
			Image image1;
			try
			{
				 image1 = Image.getInstance("C:/logo.png");
			    
			}catch(Exception e)
			{
				 image1 = Image.getInstance("/var/lib/tomcat9/webapps/embelSoft/jsp/logo.png");
			}
			image1.scaleToFit(250f, 500f);
			Image imageCenter = Image.getInstance(image1);
			imageCenter.setAlignment(Image.MIDDLE);
			
			
			document.add(imageCenter);
			
		// End	logo
			
		//For Heading
		
			PdfPTable table1 = new PdfPTable(1);
			table1.setWidthPercentage(100); 

			float[] columnWidths1 = {20f};
			table1.setWidths(columnWidths1);

			PdfPCell table_cell;
			
		        /* table_cell  = new PdfPCell(new Phrase("EMBEL TECHNOLOGIES PVT. LTD.",font10BoldRed));
				table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell); */
					
				
		        table_cell  = new PdfPCell(new Phrase("",font12BoldUnderline));
				table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell);
				
				
		        table_cell  = new PdfPCell(new Phrase("Vanashree Palace, 2nd floor, Above Chate Classes, Near Tapodham Bus Stop, NDA Road, Warje Naka,\n Pune - 411058.\n\n",Normalfont10));
				table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell);
					
				
		        table_cell  = new PdfPCell(new Phrase("",font12BoldUnderline));
				table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell.setBorder(Rectangle.BOTTOM);
				table1.addCell(table_cell);
				
				
				
		        table_cell  = new PdfPCell(new Phrase("\n",Normalfont10));
				table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell);
									
				table_cell  = new PdfPCell(new Phrase("Place: Pune",Normalfont13));
				table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell);
				
		        table_cell  = new PdfPCell(new Phrase("Date: "+todayDate,Normalfont13));
				table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table_cell.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell);
				
				
				
		        table_cell  = new PdfPCell(new Phrase("",Normalfont10));
				table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell);
					
				
		        table_cell  = new PdfPCell(new Phrase("Experience Certificate \n\n\n",font15BoldUnderline));
				table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table_cell.setBorder(Rectangle.NO_BORDER);
				table1.addCell(table_cell);
				
				

				document.add(table1);
				
			
			//For Name
				
				PdfPTable table2 = new PdfPTable(3);
				table2.setWidthPercentage(100); 

				float[] columnWidths2 = {6,7,7};
				table2.setWidths(columnWidths2);

				PdfPCell table_cell2;
				
					table_cell2  = new PdfPCell(new Phrase("             This is to certify that"));
					table_cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table_cell2.setBorder(Rectangle.NO_BORDER);
					table2.addCell(table_cell2);
						
					
					table_cell2  = new PdfPCell(new Phrase("Mr. /Ms.  "+employeeName,font12Bold));
					table_cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
					table_cell2.setBorder(Rectangle.NO_BORDER);
					table2.addCell(table_cell2);
					
					
					table_cell2  = new PdfPCell(new Phrase("was  an  Employee  of  Embel"));
					table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell2.setBorder(Rectangle.NO_BORDER);
					table2.addCell(table_cell2);

					document.add(table2);
					
					document.add(new Paragraph("Technologies Pvt.Ltd . The details of his employment are as follows."));
					
					document.add(new Paragraph("\n\n"));
					
					
					PdfPTable table3 = new PdfPTable(1);
					table3.setWidthPercentage(100);
					
					float[] columnWidths3 = {5.0f};
					table3.setWidths(columnWidths3);
					
					PdfPCell table_cell3;
					
					table_cell3  = new PdfPCell(new Phrase("Employee ID: "+id,font12Bold));
					table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell3.setBorder(Rectangle.NO_BORDER);
					table3.addCell(table_cell3);
					
					table_cell3  = new PdfPCell(new Phrase("Date Of Joining: "+dateOfJoining,font12Bold));
					table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell3.setBorder(Rectangle.NO_BORDER);
					table3.addCell(table_cell3);
					
					table_cell3  = new PdfPCell(new Phrase("Date Of Releaving: "+dateOfLeaving,font12Bold));
					table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell3.setBorder(Rectangle.NO_BORDER);
					table3.addCell(table_cell3);
					
					/* table_cell3  = new PdfPCell(new Phrase("Date Of Relieving: "+dateOfReLieving,font12Bold));
					table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell3.setBorder(Rectangle.NO_BORDER);
					table3.addCell(table_cell3); */
					
					table_cell3  = new PdfPCell(new Phrase("Designation at the time Of Relieving: "+designation,font12Bold));
					table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell3.setBorder(Rectangle.NO_BORDER);
					table3.addCell(table_cell3);
					
					
					/* table_cell3  = new PdfPCell(new Phrase(employeeName,font12Bold));
					table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell3.setBorder(Rectangle.NO_BORDER);
					table3.addCell(table_cell3);
					
					table_cell3  = new PdfPCell(new Phrase("is released from the services of the organization from closing hours of"+dateOfLeaving,font12Bold));
					table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell3.setBorder(Rectangle.NO_BORDER);
					table3.addCell(table_cell3); */
					
					document.add(table3);
					document.add(new Paragraph("\n"));
					
					/* PdfPTable table4 = new PdfPTable(2);
					table4.setWidthPercentage(100);
					float[] columnWidths4 = {2.4f,8.0f};
					table4.setWidths(columnWidths4);
					
					PdfPCell table_cell4;

						
					
					table_cell4  = new PdfPCell(new Phrase("                 "+employeeName,font12Bold));
					table_cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell4.setBorder(Rectangle.NO_BORDER);
					table4.addCell(table_cell4);
					
					
					table_cell4  = new PdfPCell(new Phrase("is  released  from  the  services  of  the organization  from  closing  hours  of",Normalfont13));
					table_cell4.setHorizontalAlignment(Element.ALIGN_RIGHT);
					table_cell4.setBorder(Rectangle.NO_BORDER);
					table4.addCell(table_cell4); */
					
					/* table_cell4  = new PdfPCell(new Phrase(""+dateOfLeaving,font12Bold));
					table_cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
					table_cell4.setBorder(Rectangle.NO_BORDER);
					table4.addCell(table_cell4); */
					
					//document.add(table4);
				  /* //For Designation And Date
				
					PdfPTable table3 = new PdfPTable(5);
					table3.setWidthPercentage(100); 

					float[] columnWidths3 = {0.9f,3.5f,2.9f,4f,2f};
					table3.setWidths(columnWidths3);

					PdfPCell table_cell3;
					
						table_cell3  = new PdfPCell(new Phrase("from",Normalfont13));
						table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell3.setBorder(Rectangle.NO_BORDER);
						table3.addCell(table_cell3);
							
				
						
						String[] J = dateOfJoining.split("-");
						String[] L = dateOfLeaving.split("-");
						
						//table_cell3  = new PdfPCell(new Phrase(J[2]+"-"+J[1]+"-"+J[0]+"  to "+L[2]+"-"+L[1]+"-"+L[0],font12Bold));
						table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell3.setBorder(Rectangle.NO_BORDER);
						table3.addCell(table_cell3);
						
						
						
						//table_cell3  = new PdfPCell(new Phrase("He/She was holding ",Normalfont13));
						table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell3.setBorder(Rectangle.NO_BORDER);
						table3.addCell(table_cell3);
						
						
						table_cell3  = new PdfPCell(new Phrase(""+designation,font12Bold));
						table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell3.setBorder(Rectangle.NO_BORDER);
						table3.addCell(table_cell3);
						
						table_cell3  = new PdfPCell(new Phrase("position at the",Normalfont13));
						table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
						table_cell3.setBorder(Rectangle.NO_BORDER);
						table3.addCell(table_cell3);
						

						document.add(table3);  */
						
						
						/* document.add(new Paragraph("time of relieving",Normalfont13)); */
						
			 		
					// For Paragraph
					
					document.add(new Paragraph("",Normalfont13));
						/* document.add(new Paragraph(employeeName,Normalfont13)); */
						document.add(new Paragraph(" 							             Mr. /Ms." +employeeName+" is  released  from  the services of the organization from closing",Normalfont13 )); 
						
						
					document.add(new Paragraph("hours  of  "+ dateOfLeaving + "  subject  to  all  clearances  and  settlement  of  all  dues.\n ",Normalfont13)); 
					
					
					document.add(new Paragraph("",Normalfont13));
						document.add(new Paragraph("              We draw attention to the non-disclosure agreement signed by him at time of employment which clearly states  that  he has a continuing obligation  of confidentiality  with respect to any Proprietary and confidential information of the company that he may have had  access to during the course of his employment. Any voilation of these terms would lead to legal action by Embel.\n ",Normalfont13));
						document.add(new Paragraph(" 			  						                      We wish him/her all the very best in his/her future endeavours.\n\n\n\n",Normalfont13));
				
					
				 //For Company Name	
				
						PdfPTable table4 = new PdfPTable(1);
						table4.setWidthPercentage(100); 

						float[] columnWidths4 = {20f};
						table4.setWidths(columnWidths4);

						PdfPCell table_cell4;
						
							table_cell4  = new PdfPCell(new Phrase("Director\n\n"));
							table_cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell4.setBorder(Rectangle.NO_BORDER);
							table4.addCell(table_cell4);
							
							table_cell4  = new PdfPCell(new Phrase("Embel Technologies Pvt Ltd \n\n"));
							table_cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell4.setBorder(Rectangle.NO_BORDER);
							table4.addCell(table_cell4);
							
							
							document.add(table4);
							
					// For Signature				
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
			
			
		} catch (DocumentException de) {
		    throw new IOException(de.getMessage());
		}
		
	

%>

