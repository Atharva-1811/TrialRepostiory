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
<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.embelSoft.bean.QuotationBean"%>
<%@page import="java.util.ArrayList"%>


<%
	response.setContentType("application/pdf");

	String vendorName2 = (String) session.getAttribute("vendorName2");
	String companyname2 = (String) session.getAttribute("companyname2");
	String companyaddress2 = (String) session.getAttribute("companyaddress2");
	String city2 = (String) session.getAttribute("city2");
	String state2 = (String) session.getAttribute("state2");
	String zip2 = (String) session.getAttribute("zip2");
	String phoneno2 = (String) session.getAttribute("phoneno2");

	String totalSubTotalForPDF = (String) session.getAttribute("totalSubTotalForPDF");
	String GSTForPDF = (String) session.getAttribute("GSTForPDF");
	String IGSTForPDF = (String) session.getAttribute("IGSTForPDF");
	String totalTaxAmountForPDF = (String) session.getAttribute("totalTaxAmountForPDF");
 	//String afterGstTotal12 = (String) session.getAttribute("afterGstTotal12"); 
	//String discount2 = (String) session.getAttribute("discount2");
	String grossTotalForPDF = (String) session.getAttribute("grossTotalForPDF");

	String quotationno = (String) session.getAttribute("quotationNo");
	
	
	if(city2=="N/A" || city2=="")
	{
		city2 ="-";	
	}
	
	if(state2=="N/A" || state2=="")
	{
		state2 ="-";	
	}
	
	
	if(zip2=="N/A" || zip2=="")
	{
		zip2 ="-";	
	}
	
	
	if(phoneno2=="N/A" || phoneno2=="")
	{
		phoneno2 ="-";	
	}
	
	
	
	System.out.print(":::::::::::::::::::::::::::::::::::::::::vendorName:-" + vendorName2
			+ "::::::::::::::::::::::::::::");

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
		Font font18BoldRed = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
		Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE,
				BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE,
				BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font10 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font16BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD | Font.UNDERLINE,
				BaseColor.RED);

		Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font Normalfont10 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);

		Font NormalRedfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont16 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.RED);
		
		Font font35RedBold = new Font(Font.FontFamily.TIMES_ROMAN, 35, Font.BOLD, BaseColor.RED);

		Connection conn = null;
		Connection conn1 = null;
		// step 1
		Document document = new Document();

		// step 2
		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();

		HibernateUtility hbu = null;
		Session session1 = null;
		Transaction transaction = null;

		hbu = HibernateUtility.getInstance();
		session1 = hbu.getHibernateSession();

		List<QuotationBean> empList = null;
		Query query = session1.createSQLQuery("select product_name, hsn_sac, unit_price, quantity, CGST, SGST, IGST, tax_amount, total  from client_quotation_details where quotation_no = :quotationno");
		//Query query = session1.createSQLQuery("select product_name, quantity, unit_price, total_sub_total, GST, total_tax_amount, gross_total  from quotation_details where quotation_no = :quotationno");
// 		Query query = session1.createSQLQuery("select description, quantity, unit_price, total,sub_total, gst, gst_amount, discount, discount_amount, gross_total  from quotation_details where quotation_no = :quotationno");
		query.setParameter("quotationno", quotationno);

		//List<PurchaseOrderCreateBean> results = query.list();

		List<Object[]> results = query.list();

		empList = new ArrayList<QuotationBean>(0);

		for (Object[] o : results) {

			QuotationBean bean = new QuotationBean();
			
			bean.setProductName(o[0].toString());
			bean.setHsnSac(o[1].toString());
			bean.setUnitPrice(Double.parseDouble(o[2].toString()));
			bean.setQuantity(Long.parseLong(o[3].toString()));
			bean.setCGST(Double.parseDouble(o[4].toString()));
			bean.setSGST(Double.parseDouble(o[5].toString()));
			//bean.setGST(Double.parseDouble(o[4].toString()));
			bean.setIGST(Double.parseDouble(o[6].toString()));
			bean.setTaxAmount(Double.parseDouble(o[7].toString()));
			bean.setTotal(Double.parseDouble(o[8].toString()));
			empList.add(bean);
		}

		System.out.println("list Size:--------------------------" + results.size());

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
		
		
		//For Form Heading
		
		PdfPTable headercn2 = new PdfPTable(1);
		headercn2.setWidthPercentage(100); 

		float[] columnWidths110 = {10f};
		headercn2.setWidths(columnWidths110);

		PdfPCell table_cell1001;

		
		table_cell1001  = new PdfPCell(new Phrase("QUOTATION \n\n",font35RedBold));
		table_cell1001.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell1001.setBorder(Rectangle.NO_BORDER);
		headercn2.addCell(table_cell1001);
		
		document.add(headercn2);
		

		//For Company Name and Form Heading

	/*	PdfPTable headercn = new PdfPTable(2);
		headercn.setWidthPercentage(100);

		float[] columnWidths11 = { 10f, 10f };
		headercn.setWidths(columnWidths11);

		PdfPCell table_cell;

		table_cell = new PdfPCell(new Phrase("", font15BoldUnderline));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Quotation \n", font35Bold));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("", font15BoldUnderline));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("", font18BoldRed));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("EMBEL TECHNOLOGIES PVT. LTD.  \n", font15BoldUnderline));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("", font18BoldRed));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		document.add(headercn);	*/

		// For For Company Name and Company Detailas 

		PdfPTable tablecd = new PdfPTable(3);
		tablecd.setWidthPercentage(100);

		float[] columnWidths00 = { 10f, 5f, 5f };
		tablecd.setWidths(columnWidths00);

		PdfPCell table_cellcd;

		table_cellcd = new PdfPCell(new Phrase("EMBEL TECHNOLOGIES PVT. LTD. \n", font15BoldUnderline));
		table_cellcd.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cellcd.setBorder(Rectangle.NO_BORDER);
		tablecd.addCell(table_cellcd);

		table_cellcd = new PdfPCell(new Phrase("Date : " , font13Bold));
		table_cellcd.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cellcd.setBorder(Rectangle.NO_BORDER);
		tablecd.addCell(table_cellcd);
		
		table_cellcd = new PdfPCell(new Phrase("" + StrBillDate, font12NoBold));
		table_cellcd.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cellcd.setBorder(Rectangle.NO_BORDER);
		tablecd.addCell(table_cellcd);
		
		
		
		
		table_cellcd = new PdfPCell(new Phrase("Vanashree Palace, 2nd floor, Above  Chate Classes,\nNear Tapodham Bus Stop, NDA Road, Warje Naka,\nPune - 411058.\nPhone - +91 8668757349 \n\n", font12NoBold));
		table_cellcd.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cellcd.setBorder(Rectangle.BOTTOM);
		tablecd.addCell(table_cellcd);
		

		table_cellcd = new PdfPCell(new Phrase("Quotation No : " , font13Bold));
		table_cellcd.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cellcd.setBorder(Rectangle.NO_BORDER);
		tablecd.addCell(table_cellcd);
		
		table_cellcd = new PdfPCell(new Phrase("" + quotationno, font12NoBold));
		table_cellcd.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cellcd.setBorder(Rectangle.NO_BORDER);
		tablecd.addCell(table_cellcd);


		document.add(tablecd);

		// For Vendor Detailas	

		PdfPTable table1 = new PdfPTable(2);
		table1.setWidthPercentage(100);

		float[] columnWidths1 = { 4, 16 };
		table1.setWidths(columnWidths1);

		PdfPCell table_cell1;

		table_cell1 = new PdfPCell(new Phrase("Quotation for:", font15Bold));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("Name                         : ", Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("" + vendorName2, Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("Company Name         : ", Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("" + companyname2, Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("Company Address     : ", Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("" + companyaddress2, Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		/* table_cell1 = new PdfPCell(new Phrase("City                            : ", Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("" + city2, Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);
 */
 
 
		table_cell1 = new PdfPCell(new Phrase("State                           : ", Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("" + state2, Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("Zip                             : ", Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("" + zip2, Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("Phone                         : ", Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		table_cell1 = new PdfPCell(new Phrase("" + phoneno2, Normalfont11));
		table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell1.setBorder(Rectangle.NO_BORDER);
		table1.addCell(table_cell1);

		document.add(table1);

		//End 	

		// Table for table data (Dyanamic)

		PdfPTable table11 = new PdfPTable(9);
		table11.setSpacingBefore(8);
		table11.setWidthPercentage(100);
		table11.setSpacingAfter(8);

		//float[] columnWidths111 = { 0.2f, 0.9f, 0.3f, 0.4f, 0.5f };
		float[] columnWidths111 = { 0.2f, 0.5f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.3f, 0.3f };
		//float[] columnWidths111 = { 0.2f, 0.4f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.3f };
		table11.setWidths(columnWidths111);

		PdfPCell table_cell11;

		table_cell11 = new PdfPCell(new Phrase("Sr. No.", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("DESCRIPTION", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		table_cell11 = new PdfPCell(new Phrase("HSN", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		table_cell11 = new PdfPCell(new Phrase("UNIT PRICE", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("QUANTITY", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		table_cell11 = new PdfPCell(new Phrase("GST", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		table_cell11 = new PdfPCell(new Phrase("IGST", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);
		
		table_cell11 = new PdfPCell(new Phrase("TAX AMT", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("TOTAL", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		List<QuotationBean> list12 = empList;

		int k = 0;

		for (int i = 0; i < list12.size(); i++) {
			QuotationBean sr = (QuotationBean) list12.get(i);

			// 1
			k++;

			table_cell11 = new PdfPCell(new Phrase("" + k, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			//table_cell11.setBorder(Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			// 2 
			String description2 = sr.getProductName();

			table_cell11 = new PdfPCell(new Phrase("" + description2, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			//3
			String hsn = sr.getHsnSac();

			table_cell11 = new PdfPCell(new Phrase("" + hsn, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			// 4
			double unit_price2 = sr.getUnitPrice();

			table_cell11 = new PdfPCell(new Phrase("" + unit_price2, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			// 5
			Long quantity2 = sr.getQuantity();

			table_cell11 = new PdfPCell(new Phrase("" + quantity2, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			//6
			double CGSTDB = sr.getCGST();
			double SGSTDB = sr.getSGST();			
			double GSTDB = 0.00;
			double GSTAmountFormatted = 0.00;
			double GST = 0.00;
			
			GSTDB = CGSTDB + SGSTDB;
			GSTAmountFormatted = Double.parseDouble(String.format("%.2f", GSTDB));  // can be required precision
			GST = GSTAmountFormatted;
			
			table_cell11 = new PdfPCell(new Phrase("" + GST, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			//7
			double IGST = sr.getIGST();

			table_cell11 = new PdfPCell(new Phrase("" + IGST, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
			
			//8
			double taxAmunt = sr.getTaxAmount();

			table_cell11 = new PdfPCell(new Phrase("" + taxAmunt, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			// 5
			double total2 = sr.getTotal();

			table_cell11 = new PdfPCell(new Phrase("" + total2, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

		}

		/* table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
		
		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11); */
		
		document.add(table11);
		
		
		PdfPTable table111 = new PdfPTable(3);
		table111.setSpacingBefore(3);
		table111.setWidthPercentage(100);
		table111.setSpacingAfter(3);

		float[] columnWidths1111 = { 1.4f, 0.4f, 0.5f };
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
		table_cell111 = new PdfPCell(new Phrase("Note : Quotation valid until 30 days of quotation generation.", font12Bold));
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
		
		

		/* // For Sub Total

		//1
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		//2
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 3

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 4

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 5 

		table_cell11 = new PdfPCell(new Phrase("Sub Total  \n ", font13Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		// 6

		table_cell11 = new PdfPCell(new Phrase("" + subTotal12, Normalfont14));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		// For Gst

		//1
		table_cell11 = new PdfPCell(new Phrase("Note :", font12Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		//2
		table_cell11 = new PdfPCell(new Phrase("Quotation valid until 30 days of quotation generation", font12Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 3

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 4

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 5 

		table_cell11 = new PdfPCell(new Phrase("GST(%)   ", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		// 6

		table_cell11 = new PdfPCell(new Phrase("" + gst12, Normalfont14));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		// for Gst Amount

		//1
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		//2
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 3

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 4

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 5 

		table_cell11 = new PdfPCell(new Phrase("GST Amount  \n ", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		// 6

		table_cell11 = new PdfPCell(new Phrase("" + gstAmount2, Normalfont14));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		// for Discount

		//1
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		//2
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 3

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 4

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 5 

		table_cell11 = new PdfPCell(new Phrase("Discount (%) \n ", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		// 6

		table_cell11 = new PdfPCell(new Phrase("" + discount2, Normalfont13));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		// for Discount Amount

		//1
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		//2
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 3

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 4

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 5 

		table_cell11 = new PdfPCell(new Phrase("Discount Amount \n ", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		// 6

		table_cell11 = new PdfPCell(new Phrase("" + discountAmount2, Normalfont14));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		// for Gross Total 

		//1
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		//2
		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 3

		table_cell11 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 4

		table_cell11 = new PdfPCell(new Phrase("", Normalfont13));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.NO_BORDER);
		table11.addCell(table_cell11);

		// 5 

		table_cell11 = new PdfPCell(new Phrase("Gross Total  \n ", font13Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		// 6

		table_cell11 = new PdfPCell(new Phrase("" + grossTotal12, font18Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);
 */
		

		// For Footer	

		PdfPTable table12 = new PdfPTable(1);
		table11.setSpacingBefore(1);
		table11.setWidthPercentage(100);
		table11.setSpacingAfter(1);

		float[] columnWidths112 = { 20 };
		table12.setWidths(columnWidths112);

		PdfPCell table_cell12;

		table_cell12 = new PdfPCell(
				new Phrase(" If you have any questions about this Quatation, please contact", Normalfont11));
		table_cell12.setHorizontalAlignment(Element.ALIGN_CENTER);
		//table_cell12.setBorder(Rectangle.LEFT);
		table_cell12.setBorder(Rectangle.NO_BORDER);
		table12.addCell(table_cell12);

		table_cell12 = new PdfPCell(
				new Phrase("[Embel Technologies, 8668757349, contact@embel.co.in]", font12Bold));
		table_cell12.setHorizontalAlignment(Element.ALIGN_CENTER);
		//table_cell12.setBorder(Rectangle.LEFT);
		table_cell12.setBorder(Rectangle.NO_BORDER);
		table12.addCell(table_cell12);

		document.add(table12);

		document.close();

	} catch (DocumentException de) {
		throw new IOException(de.getMessage());
	}
%>

