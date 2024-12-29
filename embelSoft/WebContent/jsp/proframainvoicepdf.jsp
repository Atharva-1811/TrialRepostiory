<!-- ClientBillingPDFNew.jsp -->

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

<%@ page
	import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*"%>

<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@page import="com.embelSoft.bean.GetVendorDetailsBean"%>
<%@page import="com.embelSoft.bean.HrBillingBean"%>
<%@page import="com.embelSoft.bean.HrBillingBean"%>
<%@page import="com.embelSoft.bean.HrBillingForPDF"%>
<%@page import="com.embelSoft.bean.HrBillingForPDF"%>
<%@page import="com.embelSoft.bean.GetClientEnquiryDetailsBean"%>
<%@page import="com.embelSoft.bean.GetClientEnquiryDetailsBean"%>
<%@page import="com.embelSoft.bean.ProductBillingBean"%>
<%@page import="com.embelSoft.bean.GetVendorDetailsBean"%>

<%@page import="com.embelSoft.bean.ProductBillingBeanNew"%>
<%@page import="com.embelSoft.hibernate.TaxDetailsHibernate"%>
<%@page import="com.embelSoft.dao.TaxDetailsDao"%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>


<%
	response.setContentType("application/pdf");
	//response.setHeader("Content-disposition", "attachment; filename = proframaInvoice.pdf");

	String fkClientId = (String) session.getAttribute("fkClientId");
	String productBillNo = (String) session.getAttribute("productBillNo");
	System.out.println("PRODUCT BILLING PDF productBillNo :- " + productBillNo);
	String clientNameClientBill = (String) session.getAttribute("clientName");

	System.out.println("PRODUCT BILLING PDF clientname :- " + clientNameClientBill);
	String totalSubTotal = (String) session.getAttribute("totalSubTotal");
	String CGSTForPDF = (String) session.getAttribute("CGSTForPDF");
	String SGSTForPDF = (String) session.getAttribute("SGSTForPDF");
	String IGSTForPDF = (String) session.getAttribute("IGSTForPDF");
	String totalTaxAmount = (String) session.getAttribute("totalTaxAmountForPDF");
	System.out.println("CLIENT PDF totalTaxAmount :-  " + totalTaxAmount);
	String grossTotalForPDF = (String) session.getAttribute("grossTotalForPDF");

	// 	Double CGSTPercentDBForPdf = 0.00;
	//  	Double SGSTPercentDBForPdf = 0.00;
	//  	Double IGSTPercentDBForPdf = 0.00;

	//  	TaxDetailsDao tddao = new TaxDetailsDao();
	// 	List taxDetailsList = tddao.getLoadAllTaxDetailsEntry();

	// 	for(int j=0;j<taxDetailsList.size();j++)
	// 	{
	//         System.out.println("TAX DETAILS LIST SIZE =====> "+taxDetailsList.size());

	//        	TaxDetailsHibernate taxDetailshibernate = (TaxDetailsHibernate)taxDetailsList.get(j);

	//        	Long pkTaxDetailsIdDB = taxDetailshibernate.getPkTaxDetailsId();
	//        	CGSTPercentDBForPdf = taxDetailshibernate.getCGST();
	//        	SGSTPercentDBForPdf = taxDetailshibernate.getSGST();
	//        	IGSTPercentDBForPdf = taxDetailshibernate.getIGST();	        		
	// 	}

	//String gst12 = gst1ClientBill*0.5;
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
		Font font12BoldUnderlineBlue = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE,
				BaseColor.BLUE);
		Font font12BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.RED);
		Font font13BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.RED);
		Font font14BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD, BaseColor.RED);
		Font font15BoldRED = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.RED);

		//Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font18Bold = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD, BaseColor.RED);
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

		HibernateUtility hbu = null;
		Session session1 = null;
		Transaction transaction = null;

		hbu = HibernateUtility.getInstance();
		session1 = hbu.getHibernateSession();

		List<GetClientEnquiryDetailsBean> venList = null;

		//Query query=session1.createSQLQuery("select business_name, business_address, city, state, zipCode, Country, contact_number, alternate_contact_no, email_id, first_name, last_name  FROM client_enquiry_details WHERE pk_client_enquiry_id=:fkClientId AND concat(first_name,' ',last_name)=:clientNameClientBill");

		Query query = session1.createSQLQuery(
				"select ce.business_name, ce.business_address, ce.city, ce.state, ce.zipCode, ce.Country, ce.contact_number, ce.alternate_contact_no, ce.email_id, ce.first_name, ce.last_name ,pr.Ship_Address,pr.Courier_Name,pr.Courier_number,ce.Gst_No FROM client_enquiry_details ce LEFT JOIN perfroma_billing pr ON ce.pk_client_enquiry_id=pr.fk_client_id WHERE ce.pk_client_enquiry_id=:fkClientId AND first_name= :clientNameClientBill and bill_no=:billno ");

		query.setParameter("clientNameClientBill", clientNameClientBill);
		query.setParameter("fkClientId", fkClientId);
		query.setParameter("billno", productBillNo);

		//List<PurchaseOrderCreateBean> results = query.list();

		List<Object[]> results = query.list();
		venList = new ArrayList<GetClientEnquiryDetailsBean>(0);

		for (Object[] o : results) {

			GetClientEnquiryDetailsBean reports = new GetClientEnquiryDetailsBean();

			reports.setBusinessName(o[0].toString());
			reports.setBusinessAddress(o[1].toString());
			reports.setCity(o[2].toString());
			reports.setState(o[3].toString());
			reports.setZipCode(o[4].toString());
			reports.setCountry(o[5].toString());
			reports.setContactNo(Long.parseLong(o[6].toString()));

			if (o[7] == null) {
				reports.setAlternateContactNo("NA");
			} else {
				reports.setAlternateContactNo(o[7].toString());
			}
			if (o[8] == null) {
				reports.setEmailId("NA");
			} else {
				reports.setEmailId(o[8].toString());
			}

			if (o[9] == null) {
				reports.setFirstName("NA");
			} else {
				reports.setFirstName(o[9].toString());
			}

			if (o[10] == null) {
				reports.setLastName("NA");
			} else {
				reports.setLastName(o[10].toString());
			}

			if (o[11] == null) {
				reports.setShipAddress("NA");
			} else {
				reports.setShipAddress(o[11].toString());
			}

			if (o[12] == null) {
				reports.setCourierName("NA");
			} else {
				reports.setCourierName(o[12].toString());
			}

			if (o[13] == null) {
				reports.setCourierNumber("0");
			} else {
				reports.setCourierNumber(o[13].toString());
			}

			if (o[14] == null) {
				reports.setGstNo("0");
			} else {
				reports.setGstNo(o[14].toString());
			}

			System.out.println(o[11].toString());
			System.out.println("contact number----" + o[6].toString());
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

		// End	logo

		//For Company Name

		PdfPTable headercn = new PdfPTable(3);
		headercn.setWidthPercentage(100);

		float[] columnWidths11 = { 10f, 4f, 6f };
		headercn.setWidths(columnWidths11);

		PdfPCell table_cell;

		table_cell = new PdfPCell(new Phrase("Embel Technologies Pvt.Ltd.", font15Bold));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Bill No", font12Bold));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("" + productBillNo, Normalfont11));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(
				new Phrase("Vanashree Palace, 2nd floor, Above Chate Classes,", Normalfont11));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(" Date ", font12Bold));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("" + StrBillDate, Normalfont11));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Near Tapodham Bus Stop, NDA Road, Warje Naka,", Normalfont11));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(" GSTIN ", font12Bold));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("27AAECE4252H1ZQ", Normalfont11));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Pune, Maharashtra 411058.", Normalfont11));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(" PAN No  ", font12Bold));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("AAECE4252H", Normalfont11));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		// 				table_cell  = new PdfPCell(new Phrase("",Normalfont11));
		// 				table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		// 				table_cell.setBorder(Rectangle.NO_BORDER);
		// 				headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Phone  +91 8668757349", Normalfont11));
		table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(" CIN  \n\n", font12Bold));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("U72200PN2016PTC166648\n\n", Normalfont11));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setBorder(Rectangle.NO_BORDER);
		headercn.addCell(table_cell);

		document.add(headercn);

		PdfPTable table0 = new PdfPTable(1);
		table0.setWidthPercentage(100);

		float[] columnWidths0 = { 20f };
		table0.setWidths(columnWidths0);

		PdfPCell table_cell0;
		table_cell = new PdfPCell(new Phrase("", font12BoldUnderline));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell.setBorder(Rectangle.BOTTOM);
		table0.addCell(table_cell);
		document.add(table0);
		document.add(new Paragraph(""));

		PdfPTable headercn2 = new PdfPTable(1);
		headercn2.setWidthPercentage(100);

		float[] columnWidths110 = { 10f };
		headercn2.setWidths(columnWidths110);

		PdfPCell table_cell1001;

		table_cell1001 = new PdfPCell(new Phrase("Proforma Invoice ", font18Bold1));
		table_cell1001.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell1001.setBorder(Rectangle.NO_BORDER);
		headercn2.addCell(table_cell1001);

		document.add(headercn2);

		// Vendor Details

		PdfPTable table1 = new PdfPTable(1);
		table1.setWidthPercentage(100);

		float[] columnWidths1 = { 20f };
		table1.setWidths(columnWidths1);

		PdfPCell table_cell1;

		List<GetClientEnquiryDetailsBean> list12 = venList;

		int k = 0;

		//for (int i = 0; i < list12.size(); i++) {
			GetClientEnquiryDetailsBean sr = (GetClientEnquiryDetailsBean) list12.get(k);

			String businessName = sr.getBusinessName();

			/* table_cell1  = new PdfPCell(new Phrase("Client Details   :-      ",font12Bold));
			table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell1.setBorder(Rectangle.NO_BORDER);
			table1.addCell(table_cell1);
				
			table_cell1  = new PdfPCell(new Phrase(""+businessName,Normalfont11));
			table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell1.setBorder(Rectangle.NO_BORDER);
			table1.addCell(table_cell1);
			*/
			table_cell1 = new PdfPCell(
					new Phrase("Client Details   :-      " + clientNameClientBill, font12Bold));
			table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell1.setBorder(Rectangle.NO_BORDER);
			table1.addCell(table_cell1);

			table_cell1 = new PdfPCell(new Phrase("", font12Bold));
			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell1.setBorder(Rectangle.NO_BORDER);
			table1.addCell(table_cell1);

			table_cell1 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell1.setBorder(Rectangle.NO_BORDER);
			table1.addCell(table_cell1);

			// 				table_cell1  = new PdfPCell(new Phrase("Name:    " +clientNameClientBill,font12Bold));
			// 				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			// 				table_cell1.setBorder(Rectangle.NO_BORDER);
			// 				table1.addCell(table_cell1);

			// 				table_cell1  = new PdfPCell(new Phrase("",font12Bold));
			// 				table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			// 				table_cell1.setBorder(Rectangle.NO_BORDER);
			// 				table1.addCell(table_cell1);

			// 				table_cell1  = new PdfPCell(new Phrase("",Normalfont11));
			// 				table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			// 				table_cell1.setBorder(Rectangle.NO_BORDER);
			// 				table1.addCell(table_cell1);

			// 				String businessAddress = sr.getBusinessAddress();

			// 				table_cell1  = new PdfPCell(new Phrase("Add:       " +businessAddress,font12Bold));
			// 				table_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			// 				table_cell1.setBorder(Rectangle.NO_BORDER);
			// 				table1.addCell(table_cell1);

			// 				table_cell1  = new PdfPCell(new Phrase("",font12Bold));
			// 				table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			// 				table_cell1.setBorder(Rectangle.NO_BORDER);
			// 				table1.addCell(table_cell1);

			// 				table_cell1  = new PdfPCell(new Phrase("",Normalfont11));
			// 				table_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			// 				table_cell1.setBorder(Rectangle.NO_BORDER);
			// 				table1.addCell(table_cell1);

			document.add(table1);

			//Client Company Name address
			// Table 2.1

			/* PdfPTable table3 = new PdfPTable(3);
			table3.setWidthPercentage(100); 
			
			float[] columnWidths3 = {4f,6f,10f};
			table3.setWidths(columnWidths3);
			
			PdfPCell table_cell3;
			
			
			
			
			
			table_cell3  = new PdfPCell(new Phrase("Name                :",font12Bold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
			table_cell3  = new PdfPCell(new Phrase(""+clientNameClientBill,Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
				
			
			
			String GstNo = sr.getGstNo();
				
			table_cell3  = new PdfPCell(new Phrase("Gst No                   :",font12Bold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
				
			table_cell3  = new PdfPCell(new Phrase(""+GstNo,Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
			
			table_cell3  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
			
			
			document.add(table3);
			*/

			/* 				table_cell3  = new PdfPCell(new Phrase("Name                :",font12Bold));
							table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell3.setBorder(Rectangle.NO_BORDER);
							table3.addCell(table_cell3);
								
							table_cell3  = new PdfPCell(new Phrase(""+clientNameClientBill,Normalfont11));
							table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell3.setBorder(Rectangle.NO_BORDER);
							table3.addCell(table_cell3);
								
								
						
							
			String GstNo = sr.getGstNo();
							
							table_cell3  = new PdfPCell(new Phrase("Gst No                   :",font12Bold));
							table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell3.setBorder(Rectangle.NO_BORDER);
							table3.addCell(table_cell3);
								
							table_cell3  = new PdfPCell(new Phrase(""+GstNo,Normalfont11));
							table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell3.setBorder(Rectangle.NO_BORDER);
							table3.addCell(table_cell3);
							
							
							table_cell3  = new PdfPCell(new Phrase("",Normalfont11));
							table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell3.setBorder(Rectangle.NO_BORDER);
							table3.addCell(table_cell3); */

			/* String businessAddress = sr.getBusinessAddress();
			
			table_cell3  = new PdfPCell(new Phrase("Address :",font12Bold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
			table_cell3  = new PdfPCell(new Phrase(""+businessAddress,Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3);
				
			*/

			/*
							String state1 = sr.getShipAddress();
								
							table_cell3  = new PdfPCell(new Phrase("Shipping Address :",font12Bold));
							table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell3.setBorder(Rectangle.NO_BORDER);
							table3.addCell(table_cell3);
								
								
							table_cell3  = new PdfPCell(new Phrase(""+state1,Normalfont11));
							table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell3.setBorder(Rectangle.NO_BORDER);
							table3.addCell(table_cell3);
							
							table_cell3  = new PdfPCell(new Phrase("",Normalfont11));
							table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
							table_cell3.setBorder(Rectangle.NO_BORDER);
							table3.addCell(table_cell3);
							 */

			/* table_cell3  = new PdfPCell(new Phrase("",Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.NO_BORDER);
			table3.addCell(table_cell3); */

			// Table 3

			PdfPTable table2 = new PdfPTable(5);
			table2.setWidthPercentage(100);

			float[] columnWidths2 = { 4f, 6f, 4f, 5f, 1f };
			table2.setWidths(columnWidths2);

			PdfPCell table_cell2;

			//String businessAddress = sr.getBusinessAddress();

			table_cell2 = new PdfPCell(new Phrase("Name                :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + businessName, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			String GstNo = sr.getGstNo();

			table_cell2 = new PdfPCell(new Phrase("GST No                 :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + GstNo, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			String businessAddress = sr.getBusinessAddress();

			table_cell2 = new PdfPCell(new Phrase("Address            :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + businessAddress, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			String state1 = sr.getShipAddress();

			table_cell2 = new PdfPCell(new Phrase("Shipping Address :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + state1, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			String email = sr.getEmailId();

			String city = sr.getCity();

			table_cell2 = new PdfPCell(new Phrase("Email Id           :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + email, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			//String state = sr.getShipAddress();

			table_cell2 = new PdfPCell(new Phrase("City                        :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + city, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			String zipCode = sr.getZipCode();

			table_cell2 = new PdfPCell(new Phrase("Zip Code          :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + zipCode, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			String country = sr.getCountry();

			table_cell2 = new PdfPCell(new Phrase("Country                 :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + country, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			Long contactNo = sr.getContactNo();

			table_cell2 = new PdfPCell(new Phrase("Mobile No.       :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + contactNo, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			String alternateContactNo = sr.getAlternateContactNo();

			table_cell2 = new PdfPCell(new Phrase("Alternate No.        :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + alternateContactNo, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			String curioerName = sr.getCourierName();

			table_cell2 = new PdfPCell(new Phrase("Courier Name :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + curioerName, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			String curioerid = sr.getCourierNumber();
			table_cell2 = new PdfPCell(new Phrase("Tracking Number :", font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("" + curioerid, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			table_cell2 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);

			/* String email = sr.getEmailId();
			
			table_cell2  = new PdfPCell(new Phrase("Email ID :",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase(""+email,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
					
				
			table_cell2  = new PdfPCell(new Phrase("\n\n",font12Bold));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
				
				
			table_cell2  = new PdfPCell(new Phrase("\n\n",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2);
			
			table_cell2  = new PdfPCell(new Phrase("\n\n",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.NO_BORDER);
			table2.addCell(table_cell2); */

			document.add(table2);

		//}

		HibernateUtility hbu2 = null;
		Session session2 = null;
		Transaction transaction2 = null;

		hbu2 = HibernateUtility.getInstance();
		session2 = hbu.getHibernateSession();

		Query query2 = session2.createSQLQuery(
				"select product_name, hsn_sac, unit_price, quantity, CGST, SGST, IGST, tax_amount, total from perfroma_billing where bill_no=:productBillNo");
		query2.setParameter("productBillNo", productBillNo);
		List<Object[]> results2 = query2.list();

		List<ProductBillingBeanNew> billList = null;
		billList = new ArrayList<ProductBillingBeanNew>(0);

		for (Object[] o : results2) {
			ProductBillingBeanNew bean = new ProductBillingBeanNew();

			bean.setProductName(o[0].toString());
			bean.setHsnSac(o[1].toString());
			bean.setUnitPrice(Double.parseDouble(o[2].toString()));
			bean.setQuantity(Long.parseLong(o[3].toString()));
			bean.setCGST(Double.parseDouble(o[4].toString()));
			bean.setSGST(Double.parseDouble(o[5].toString()));
			bean.setIGST(Double.parseDouble(o[6].toString()));
			bean.setTaxAmount(Double.parseDouble(o[7].toString()));
			bean.setTotal(Double.parseDouble(o[8].toString()));

			billList.add(bean);

		}

		// Table for table data (Dyanamic)

		PdfPTable table11 = new PdfPTable(10);
		table11.setSpacingBefore(10);
		table11.setWidthPercentage(100);
		table11.setSpacingAfter(10);

		float[] columnWidths111 = { 0.2f, 0.4f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.3f };
		table11.setWidths(columnWidths111);

		PdfPCell table_cell11;

		table_cell11 = new PdfPCell(new Phrase("Sr No", font11Bold));
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

		table_cell11 = new PdfPCell(new Phrase("QTY", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("CGST %", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("SGST %", font11Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("IGST %", font11Bold));
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

		List<ProductBillingBeanNew> list1222 = billList;

		int l = 0;

		for (int i = 0; i < list1222.size(); i++) {
			ProductBillingBeanNew sr1 = (ProductBillingBeanNew) list1222.get(i);

			// 1
			l++;

			table_cell11 = new PdfPCell(new Phrase("" + l, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			//table_cell11.setBorder(Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			// 2 
			String description4 = sr1.getProductName();

			table_cell11 = new PdfPCell(new Phrase("" + description4, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			// 3
			String hsn4 = sr1.getHsnSac();

			table_cell11 = new PdfPCell(new Phrase("" + hsn4, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			//4
			Double buy_price4 = sr1.getUnitPrice();

			table_cell11 = new PdfPCell(new Phrase("" + buy_price4, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			// 5
			Long quantity4 = sr1.getQuantity();

			table_cell11 = new PdfPCell(new Phrase("" + quantity4, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			//6
			Double CGST = sr1.getCGST();

			table_cell11 = new PdfPCell(new Phrase("" + CGST, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			//7
			Double SGST = sr1.getSGST();

			table_cell11 = new PdfPCell(new Phrase("" + SGST, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			Double IGST = sr1.getIGST();

			table_cell11 = new PdfPCell(new Phrase("" + IGST, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			Double taxAmount = sr1.getTaxAmount();

			table_cell11 = new PdfPCell(new Phrase("" + taxAmount, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);

			//8
			Double total4 = sr1.getTotal();

			table_cell11 = new PdfPCell(new Phrase("" + total4, Normalfont11));
			table_cell11.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table11.addCell(table_cell11);
		}

		/* table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11);

		table_cell11 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell11.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell11.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table11.addCell(table_cell11); */

		document.add(table11);
		// 					document.add(new Paragraph("\n"));

		PdfPTable table111 = new PdfPTable(3);
		table111.setSpacingBefore(3);
		table111.setWidthPercentage(100);
		table111.setSpacingAfter(3);

		float[] columnWidths1111 = { 1.0f, 0.6f, 0.5f };
		table111.setWidths(columnWidths1111);

		PdfPCell table_cell111;

		//ROW NO 1
		// for Sub Total
		//1
		table_cell111 = new PdfPCell(new Phrase(
				"BANK DETAILS : Embel Technologies Pvt \n                                   Ltd , Indusind Bank",
				Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		// 2
		table_cell111 = new PdfPCell(new Phrase("Sub Total (Before Tax) (Rs) ", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		// 3
		table_cell111 = new PdfPCell(new Phrase("" + totalSubTotal, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		//ROW NO 2
		//for CGST
		//1
		/*table_cell111 = new  PdfPCell(new Phrase("A/C No. : 62300088676", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);*/

		// 2
		/*table_cell111 = new  PdfPCell(new Phrase("CGST  (%) ", font12Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);*/

		/*//2
		table_cell111 = new  PdfPCell(new Phrase("CGST (Rs) ", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);
		
		//3
		table_cell111 = new  PdfPCell(new Phrase(""+totalTaxAmount, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);*/

		/*// 3							
		double half2 = 2;
		double gst3 = (Double.parseDouble(gst1ClientBill));
		double halfgst2 = gst3 / half2;
		table_cell111 = new  PdfPCell(new Phrase(String.valueOf(halfgst2), Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111); */

		//ROW NO 2
		// for CGST
		//1
		table_cell111 = new PdfPCell(new Phrase("ACCOUNT NO    : 201001007672", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		// 2
		table_cell111 = new PdfPCell(new Phrase("CGST (Rs) ", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		// 3
		//double CGSTForPDF1 = Double.parseDouble(CGSTForPDF);
		// 							double CGSTPercentOldDBForPdf1 = CGSTPercentDBForPdf;
		// 							double SGSTPercentOldDBForPdf1 = SGSTPercentDBForPdf;
		// 							double IGSTPercentOldDBForPdf1 = IGSTPercentDBForPdf;
		//double totalTaxAmountMain = (Double.parseDouble(totalTaxAmount));

		// Remove More than 2 precision
		//double CGSTAmount = Double.parseDouble(String.format("%.2f", (totalTaxAmountMain/100)*CGSTPercentOldDBForPdf1));  // can be required precision
		//double SGSTAmount = Double.parseDouble(String.format("%.2f", (totalTaxAmountMain/100)*SGSTPercentOldDBForPdf1));  // can be required precision
		//double IGSTAmount = Double.parseDouble(String.format("%.2f", (totalTaxAmountMain/100)*IGSTPercentOldDBForPdf1));  // can be required precision

		/* double CGSTAmount = (totalTaxAmountMain/100)*CGSTPercentOldDBForPdf1;
		double CGSTAmountFormatted = Double.parseDouble(String.format("%.2f", CGSTAmount));  // can be required precision							
		double SGSTAmount = (totalTaxAmountMain/100)*SGSTPercentOldDBForPdf1;
		double SGSTAmountFormatted = Double.parseDouble(String.format("%.2f", SGSTAmount));  // can be required precision						
		double IGSTAmount = (totalTaxAmountMain/100)*IGSTPercentOldDBForPdf1;
		double IGSTAmountFormatted = Double.parseDouble(String.format("%.2f", IGSTAmount));  // can be required precision */

		// 							var CGST = rowData['CGST']; 		        	
		//         		        	var CGSTAmount = (subTotal * CGST) / 100;
		//         		        	var SGST = rowData['SGST']; 		        	
		//         		        	var SGSTAmount = (subTotal * SGST) / 100;
		//         		        	var IGST = rowData['IGST']; 		        	
		//         		        	var IGSTAmount = (subTotal * IGST) / 100;
		//         		        	var taxAmount = (CGSTAmount + SGSTAmount + IGSTAmount);

		double CGSTForPDF1 = Double.parseDouble(CGSTForPDF);
		double SGSTForPDF1 = Double.parseDouble(SGSTForPDF);
		double IGSTForPDF1 = Double.parseDouble(IGSTForPDF);
		double totalSubTotalMain = (Double.parseDouble(totalSubTotal));
		double totalTaxAmountMain = (Double.parseDouble(totalTaxAmount));
		//System.out.println("TABLE PDF totalTaxAmountMain :-  "+totalTaxAmountMain);
		// 							System.out.println("TABLE PDF totalSubTotalMain :-  "+totalSubTotalMain);
		// 							System.out.println("TABLE PDF CGSTForPDF1 :-  "+CGSTForPDF1);
		// 							System.out.println("TABLE PDF SGSTForPDF1 :-  "+SGSTForPDF1);
		// 							System.out.println("TABLE PDF IGSTForPDF1 :-  "+IGSTForPDF1);
		double CGST = 0.00;
		double CGSTAmount = 0.00;
		if (CGSTForPDF1 > 0) {
			CGSTAmount = (totalSubTotalMain * CGSTForPDF1) / 100;
			//CGSTAmount = ((totalTaxAmountMain/100)*CGSTForPDF1);
			//CGSTAmount = Double.parseDouble(String.format("%.2f", (totalTaxAmountMain/100)*CGSTForPDF1));  // can be required precision
			CGST = Double.parseDouble(String.format("%.2f", CGSTAmount))

			;
		}

		//System.out.println("TABLE PDF CGST by totalSubTotalMain :-  "+CGST);
		//System.out.println("TABLE PDF CGST :-  "+CGST5);
		table_cell111 = new PdfPCell(new Phrase("" + CGST, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		//ROW NO 3
		// for SGST
		//1
		table_cell111 = new PdfPCell(new Phrase("IFSC CODE          : INDB0000746", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		// 2
		table_cell111 = new PdfPCell(new Phrase("SGST (Rs) ", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		// 3
		double SGST = 0.00;
		double SGSTAmount = 0.00;
		if (SGSTForPDF1 > 0) {
			SGSTAmount = (totalSubTotalMain * SGSTForPDF1) / 100;
			//SGSTAmount = (totalTaxAmountMain/100)*SGSTForPDF1;
			//SGSTAmount = Double.parseDouble(String.format("%.2f", (totalTaxAmountMain/100)*SGSTForPDF1));  // can be required precision
			SGST = Double.parseDouble(String.format("%.2f", SGSTAmount))

			;
		}
		// 							double SGSTForPDF1 = Double.parseDouble(SGSTForPDF);
		// 							double SGST = 0.00;		
		// 							if(SGSTForPDF1 > 0)
		// 							{
		// 								SGST = SGSTAmount;
		// 							}
		//System.out.println("TABLE PDF SGST 1 :-  "+SGST);

		table_cell111 = new PdfPCell(new Phrase("" + SGST, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		//ROW NO 4
		// for IGST
		//1
		table_cell111 = new PdfPCell(new Phrase("", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		// 2
		table_cell111 = new PdfPCell(new Phrase("IGST (Rs) ", Normalfont13));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		// 3
		double IGST = 0.00;
		double IGSTAmount = 0.00;
		if (IGSTForPDF1 > 0) {
			//IGSTAmount = (totalSubTotalMain*IGSTForPDF1)/100;
			IGSTAmount = totalTaxAmountMain;
			//IGSTAmount = Double.parseDouble(String.format("%.2f", (totalTaxAmountMain/100)*IGSTForPDF1));  // can be required precision
			IGST = IGSTAmount;
		}
		//System.out.println("TABLE PDF IGST :-  "+IGST);
		// 							double IGSTForPDF1 = Double.parseDouble(IGSTForPDF);
		// 							double IGST = 0.00;
		// 							if(IGSTForPDF1 > 0)
		// 							{
		// 								IGST = IGSTAmount;
		// 							}
		System.out.println("TABLE PDF IGSTForPDF1 :-  " + IGSTForPDF1);
		System.out.println("TABLE PDF totalTaxAmountMain :-  " + totalTaxAmountMain);
		System.out.println("TABLE PDF IGST :-  " + IGST);
		table_cell111 = new PdfPCell(new Phrase("" + IGST, Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		//ROW NO 5
		// for Gross Total					
		//1
		table_cell111 = new PdfPCell(new Phrase("", font13Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		/* table_cell111 = new  PdfPCell(new Phrase("SGST  (%) ", font12Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111); */

		table_cell111 = new PdfPCell(new Phrase("Gross Total  (Rs)\n ", font12Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		table_cell111 = new PdfPCell(new Phrase("" + grossTotalForPDF, font15Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);

		/* // 3
		double half1 = 2;
		double gst2 = (Double.parseDouble(gst1ClientBill));
		double halfgst = gst2 / half1;
		table_cell111 = new  PdfPCell(new Phrase(String.valueOf(halfgst), Normalfont15));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111); */

		/* //1
		table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);
		
		// 2 
		table_cell111 = new  PdfPCell(new Phrase("Tax Amount  (Rs) ", font13Bold));
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
		table111.addCell(table_cell111); */

		/* // 2
		table_cell111 = new  PdfPCell(new Phrase("Gross Total  (Rs)\n ", font12Bold));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111);							
		
		// 3							
		table_cell111 = new  PdfPCell(new Phrase(""+grossTotal, font15BoldRED));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
		table111.addCell(table_cell111); */

		// for Gross Total	
		//1							
		/* table_cell111 = new  PdfPCell(new Phrase("", Normalfont11));
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
		table111.addCell(table_cell111); */

		//COPY
		table_cell111 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		table_cell111 = new PdfPCell(new Phrase(" ", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		table_cell111 = new PdfPCell(new Phrase(" ", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		table_cell111 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		table_cell111 = new PdfPCell(new Phrase(" ", Normalfont12));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		table_cell111 = new PdfPCell(new Phrase(" ", Normalfont12));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		table_cell111 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		table_cell111 = new PdfPCell(new Phrase("Prepared ", Normalfont12));
		table_cell111.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		table_cell111 = new PdfPCell(new Phrase("By:- Sumeet Bandewar\n\n", Normalfont12));
		table_cell111.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell111.setBorder(Rectangle.NO_BORDER);
		table111.addCell(table_cell111);

		//ADDING TABLE TO DOCUMENT
		document.add(table111);

		// For Footer	

		PdfPTable table12 = new PdfPTable(1);
		table11.setSpacingBefore(1);
		table11.setWidthPercentage(100);
		table11.setSpacingAfter(1);

		float[] columnWidths112 = { 20 };
		table12.setWidths(columnWidths112);

		PdfPCell table_cell12;

		table_cell12 = new PdfPCell(
				new Phrase("Thank You for Contributing Towards Growth of Our Business\n", font12Bold));
		table_cell12.setHorizontalAlignment(Element.ALIGN_CENTER);
		//table_cell12.setBorder(Rectangle.LEFT);
		table_cell12.setBorder(Rectangle.NO_BORDER);
		table12.addCell(table_cell12);

		document.add(table12);

		document.add(new Paragraph(""));

		//website and email
		PdfPTable table5 = new PdfPTable(4);
		table5.setWidthPercentage(100);

		float[] columnWidths5 = { 3.8f, 6.2f, 2.5f, 7.5f };
		table5.setWidths(columnWidths5);

		PdfPCell table_cell5;

		document.add(new Paragraph(
				"---------------------------------------------------------------------------------------------------------------------------------\n"));

		table_cell5 = new PdfPCell(new Phrase("Email-id:", font12Bold));
		table_cell5.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell5.setBorder(Rectangle.NO_BORDER);
		table5.addCell(table_cell5);

		table_cell5 = new PdfPCell(new Phrase("contact@embel.co.in", font12BoldUnderlineBlue));
		table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell5.setBorder(Rectangle.NO_BORDER);
		table5.addCell(table_cell5);

		table_cell5 = new PdfPCell(new Phrase("   Website:", font12Bold));
		table_cell5.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell5.setBorder(Rectangle.NO_BORDER);
		table5.addCell(table_cell5);

		table_cell5 = new PdfPCell(new Phrase("www.embel.co.in", font12BoldUnderlineBlue));
		table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell5.setBorder(Rectangle.NO_BORDER);
		table5.addCell(table_cell5);

		document.add(table5);

		PdfPTable table13 = new PdfPTable(1);
		table11.setSpacingBefore(1);
		table11.setWidthPercentage(100);
		table11.setSpacingAfter(1);
		

		float[] columnWidths113 = { 20 };
		table12.setWidths(columnWidths112);

		PdfPCell table_cell13;

		table_cell13 = new PdfPCell(new Phrase("\n Computer Generated Copy", font12BoldUnderline));
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




