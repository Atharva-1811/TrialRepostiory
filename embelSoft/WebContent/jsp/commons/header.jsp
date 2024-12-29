<%@page import="net.sf.hibernate.UserType"%>
<%@page import="com.embelSoft.hibernate.AccessControlHibernate"%>
<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- <%@ page contentType="text/html; charset=utf-8" language="java" %>

 --%>
<% 
   String abc = "english";
   if (session != null) {
   
   if (session.getAttribute("lan") != null) {
	   abc = (String) session.getAttribute("lan");
   }}
   else{
	   abc="english";
   }
 %>

<% 
                     String userName = "";
                     String userType = "";
		             if (session != null) {
			
			         if (session.getAttribute("user") != null)
			         {
			        	 userName = (String) session.getAttribute("user");
			        	 userType = (String) session.getAttribute("userType");
			        	 
			        	
			         }else {
							
					     response.sendRedirect("/embelSoft/jsp/login.jsp");
					     out.println("Please Login ");
				        }
			         }else {
							
					     response.sendRedirect("/embelSoft/jsp/login.jsp");
					     out.println("Please Login ");
				        }
	%>

<% String contextPath=request.getContextPath(); %>
<% String path=""; if(isHome)path="JSP\\"; %>
<%@page import="org.hibernate.Session"%>

<%@page import="java.util.List"%>
<%@ page session="true"%>
<html>
<head>
<meta name="viewport" content="width=device-width , initial-scale=1">
<title>Embel Technologies Pvt Ltd.</title>
<script src="/embelSoft/staticContent/js/logout.js"></script>

<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/enterTab.js"></script>

<link rel="stylesheet"
	href="/embelSoft/staticContent/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/embelSoft/staticContent/css/style.css" />

<!----------------------- Offline glyphicons used for footer.jsp-------------------------------------------------------- -->

<link href="/embelSoft/staticContent/css/bootstrap.css" rel="stylesheet">
<link href="/embelSoft/staticContent/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/embelSoft/staticContent/css/bootstrap-theme.css"
	rel="stylesheet">
<link href="/embelSoft/staticContent/css/bootstrap-theme.min.css"
	rel="stylesheet">

<link rel="shortcut icon" sizes="1800x1800"
	href="/embelSoft/staticContent/img/logo.jpg" />

<!-- <img src="/embelSoft/staticContent/img/Embel.jpg"/> -->


<!-- Font awesome (social icon) -->
<link href="/embelSoft/staticContent/css/font-awesome.css"
	rel="stylesheet">
<link href="/embelSoft/staticContent/css/font-awesome.min.css"
	rel="stylesheet">

<script type="text/javascript"
	src="/embelSoft/staticContent/js/bootstrap.js"> </script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/bootstrap.min.js"> </script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery.min.js"> </script>

<!-- this js file is used to shortcut  -->

<script type="text/javascript"
	src="/embelSoft/staticContent/js/shortcut.js"> </script>

<link
	href="/embelSoft/staticContent/fonts/glyphicons-halflings-regular.eot">
<link
	href="/embelSoft/staticContent/fonts/glyphicons-halflings-regular.svg">
<link
	href="/embelSoft/staticContent/fonts/glyphicons-halflings-regular.ttf">
<link
	href="/embelSoft/staticContent/fonts/glyphicons-halflings-regular.woff">
<link
	href="/embelSoft/staticContent/fonts/glyphicons-halflings-regular.woff2">

<!-- Font awesome (social icon) -->
<link href="/embelSoft/staticContent/fonts/fontawesome-webfont.eot">
<link href="/embelSoft/staticContent/fonts/fontawesome-webfont.svg">
<link href="/embelSoft/staticContent/fonts/fontawesome-webfont.ttf">
<link href="/embelSoft/staticContent/fonts/fontawesome-webfont.woff">
<link href="/embelSoft/staticContent/fonts/fontawesome-webfont.woff2">
<link href="/embelSoft/staticContent/fonts/FontAwesome.otf">

<!------------------------------------------ Shortcut.jsp styles -------------------------------------------------->

<script type="text/javascript"
	src="/embelSoft/staticContent/js/bootstrap.js"> </script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/bootstrap.min.js"> </script>
<link href="/embelSoft/staticContent/css/bootstrap.css" rel="stylesheet">
<link href="/embelSoft/staticContent/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/embelSoft/staticContent/css/bootstrap-theme.css"
	rel="stylesheet">
<link href="/embelSoft/staticContent/css/bootstrap-theme.min.css"
	rel="stylesheet">

<!-------------------------------- header style -------------------------------------------------------------------------------------------------------->

<link rel="stylesheet"
	href="/embelSoft/staticContent/css/font-awesome.min.css">
<script src="/embelSoft/staticContent/js/prefixfree.min.js"></script>

<script src="/embelSoft/staticContent/js/logout.js"></script>
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style>
@import
	url(http://fonts.googleapis.com/css?family=roboto:400,400italic,600,700,800)
	;

*, html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	form, label, fieldset, input, p, blockquote, th, td {
	margin: 0;
	padding: 0;
}

article, aside, figure, footer, header, hgroup, nav, section {
	display: block;
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

html {
	-webkit-font-smoothing: antialiased;
}

a {
	color: #BA0707;
	text-decoration: none;
}

a:hover {
	color: #BA0707;
}

body {
	color: #E95546;
	font: 14px "roboto", Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	line-height: 1;
	width: 100%;
	margin-bottom: 50px;
}

nav {
	display: block;
	background: /* #8c7674 */ #36487d;
}

.navbar-fixed-top {
	border-width: 0 0 0px !important;
}
/* .menu {
	display: block;
} */
.menu {
	display: flex;
}

.menu li {
	display: inline-block;
	position: relative;
	z-index: 100;
}

.menu li:first-child {
	margin-left: 0;
}

.menu li a {
	font-weight: 500;
	text-decoration: none;
	padding: 20px 15px;
	display: block;
	color: #fff;
	transition: all 0.2s ease-in-out 0s;
}

.sub-menu li a {
	padding: 12px 15px;
}

.menu li a:hover, .menu li:hover>a {
	color: #fff;
	background: /* cadetblue */ #182c66;
}

.menu ul {
	visibility: hidden;
	opacity: 0;
	margin: 0;
	padding: 0;
	width: 170px;
	position: absolute;
	left: 0px;
	background: #fff;
	z-index: 99;
	transform: translate(0, 20px);
	transition: all 0.2s ease-out;
}

.menu ul:after {
	bottom: 100%;
	left: 20%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(255, 255, 255, 0);
	border-bottom-color: #fff;
	border-width: 6px;
	margin-left: -6px;
}

.menu ul li {
	display: block;
	float: none;
	background: none;
	margin: 0;
	padding: 0;
}

.menu ul li a {
	font-size: 15px;
	font-weight: bold;
	display: block;
	color: #797979;
	background: #fff;
}

.menu ul li a:hover, .menu ul li:hover>a {
	background: /*  #FC6D58 */ #f1671e;
	color: #fff;
}

.menu li:hover>ul {
	visibility: visible;
	opacity: 1;
	transform: translate(0, 0);
}

.menu ul ul {
	left: 169px;
	top: 0px;
	visibility: hidden;
	opacity: 0;
	transform: translate(20px, 20px);
	transition: all 0.2s ease-out;
}

.menu ul ul:after {
	left: -6px;
	top: 10%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(255, 255, 255, 0);
	border-right-color: #fff;
	border-width: 6px;
	margin-top: -6px;
}

.menu li>ul ul:hover {
	visibility: visible;
	opacity: 1;
	transform: translate(0, 0);
}

.responsive-menu {
	display: none;
	width: 100%;
	padding: 20px 15px;
	background: #E95546;
	color: #fff;
	text-transform: uppercase;
	font-weight: 600;
}

.responsive-menu:hover {
	background: #E95546;
	color: #fff;
	text-decoration: none;
}

a.homer {
	background: /*  #ab8da0 */ #e87136;
}

.las {
	font-size: 20px;
	margin-right: 5px;
}

@media ( min-width : 768px) and (max-width: 979px) {
	.mainWrap {
		width: 768px;
	}
	.menu ul {
		top: 37px;
	}
	/* .menu li a {
	    font-size: 12px;
	} */
	.menu li a {
		font-size: 10px;
	}
	a.homer {
		background: #E95546;
	}
}

@media ( min-width : 767px) and (max-width: 1295px) {
	.menu li a {
		font-weight: 700;
		text-decoration: none;
		padding: 15px 12px;
		display: block;
		color: #fff;
		transition: all 0.2s ease-in-out 0s;
	}
}

@media ( max-width : 767px) {
	.mainWrap {
		width: auto;
		padding: 50px 20px;
	}
	.menu {
		display: none;
	}
	.responsive-menu {
		display: block;
	}
	nav {
		margin: 0;
		background: none;
	}
	.menu li {
		display: block;
		margin: 0;
	}
	.menu li a {
		background: #fff;
		color: #797979;
	}
	.menu li a:hover, .menu li:hover>a {
		background: #8c7674;
		color: #fff;
	}
	.menu ul {
		visibility: hidden;
		opacity: 0;
		top: 0;
		left: 0;
		width: 100%;
		transform: initial;
	}
	.menu li:hover>ul {
		visibility: visible;
		opacity: 1;
		position: relative;
		transform: initial;
	}
	.menu ul ul {
		left: 0;
		transform: initial;
	}
	.menu li>ul ul:hover {
		transform: initial;
	}
}

tr.odd {
	color: #000;
}

tr.even {
	color: #000;
}
</style>
</head>


<body>

	<nav class="navbar navbar-fixed-top"> <a id="resp-menu"
		class="responsive-menu" href="#"><i class="fa fa-reorder"></i></a>
	<ul class="menu">

		<li><a class="homer" href="Index.jsp"><i class="las la-home"></i>HOME</a></li>

		<li><a href="<%=path%>ProductDetails.jsp"><i
				class="las la-users-cog"></i>Administration</a>
			<ul class="sub-menu">

				<li><a href="<%=path%>EnquiryForm.jsp" accesskey="t">Enquiry Form</a></li>
				<%
			if(userType.equals("admin")){
			%>
				<li><a href="<%=path%>VendorDetails.jsp" accesskey="t">Vendor
						Details</a></li>
				<li><a href="<%=path%>ClientEnquiry.jsp" accesskey="t">Client
						Details</a></li>
				<li><a href="<%=path%>ProductDetails.jsp" accesskey="t">Product
						Details</a></li>
				<li><a href="<%=path%>expenditureDetails.jsp" accesskey="t">Expenditure
						Details</a></li>
				<li><a href="<%=path%>TaxDetails.jsp" accesskey="t">Tax
						Detail</a></li>
						<%
			if(userType.equals("admin") || userType.equals("hr")){
			%>
				<li><a href="<%=path%>EmployeeDetails.jsp" accesskey="t">Employee
						Details</a></li>
			<%} %>
				<li><a href="<%=path%>EmployeeLeave.jsp" accesskey="t">Employee
						Leave</a></li>
			</ul></li>
		<%} %>

		<%
			if(userType.equals("admin") || userType.equals("accountant")){
		%>
		<li><a href="<%=path%>BillingAll.jsp"><i
				class="las la-file-invoice-dollar"></i>Purchase</a>
			<ul class="sub-menu">
				<li><a href="<%=path%>PurchaseOrderCreate.jsp" accesskey="t">Purchase
						Order</a></li>
				<li><a href="<%=path%>PurchaseOrderRecive.jsp" accesskey="t">Received
						PO</a></li>
				<%-- <li><a href="<%=path%>PurchaseRecord.jsp" accesskey="t">Purchase Record</a></li> --%>

			</ul></li>
		<%} %>

		<%
			if(userType.equals("admin") || userType.equals("accountant")){
		%>
		<li><a href="<%=path%>BillingAll.jsp"><i
				class="las la-file-invoice-dollar"></i>Invoice</a>
			<ul class="sub-menu">
				<li><a href="<%=path%>BillingAll.jsp" accesskey="t">Tax
						Invoice</a></li>
				<li><a href="<%=path%>profroma.jsp" accesskey="t">Proforma
						Invoice</a></li>
				<li><a href="<%=path%>Quotation.jsp" accesskey="t">Quotation
						Details</a></li>
				
			</ul></li>
		<%} %>


		<%
			if(userType.equals("admin")){
		%>
		<li><a href="<%=path%>CahBankBook.jsp"><i class="las la-book"></i>Cash
				Book</a> <%-- <ul class="sub-menu">
				<li><a href="<%=path%>CahBankBook.jsp" accesskey="t">CashBook Details</a></li>
				
			</ul> --%></li>

		<li><a href="<%=path%>OfferLetter.jsp"><i
				class="las la-certificate"></i>Certificates</a>
			<ul class="sub-menu">
				<li><a href="<%=path%>OfferLetter.jsp" accesskey="t">Employee
						Offer Letter</a></li>
				<li><a href="<%=path%>ExperienceLetter.jsp" accesskey="t">Employee
						Experience Letter</a></li>
				<%-- <li><a href="<%=path%>SalarySlips.jsp" accesskey="t">Employee
						Salary Slips</a></li> --%>
			</ul></li>
		<%} %>

		<%
			if(userType.equals("admin") ||  userType.equals("employee")  ||  userType.equals("electronics")){
		%>
		<li><a href="<%=path%>ComponentTypesDetails.jsp"><i
				class="las la-microchip"></i>Electronic</a>
			<ul class="sub-menu">

				<%--component type details change to componet category details --%>
				<li><a href="<%=path%>ComponentTypesDetails.jsp" accesskey="t">Component
						Category</a></li>
				<li><a href="<%=path%>SubCatDetails.jsp" accesskey="t">Component
						SubCategory</a></li>
				<li><a href="<%=path%>ComponentCategoryDetails.jsp"
					accesskey="t">Component Details</a></li>
				<li><a href="<%=path%>ComponentReceivedPO.jsp" accesskey="t">Component
						Received</a></li>
				<li><a href="<%=path%>ComponentBilling.jsp" accesskey="t">Component
						Stock Outward</a></li>
			</ul></li>
		<%} %>

		<%
			if(userType.equals("admin") ||  userType.equals("employee")){
		%>
		<li><a href="<%=path%>ComponentStock.jsp"><i
				class="las la-file-alt"></i>Inventory</a>
			<ul class="sub-menu">
				<li><a href="<%=path%>ComponentStock.jsp" accesskey="t">Component
						Stock</a></li>
				<li><a href="<%=path%>BillOfMaterial.jsp" accesskey="t">Bill
						Of Material</a></li>
				<li><a href="<%=path%>ComponentBillingReports.jsp"
					accesskey="t">Component Billing Reports</a></li>
				<!--	<li><a style="padding: 10px 15px;" href="<%=path%>ComponentReceivedPOReport.jsp" accesskey="t">Component Received PO Report</a></li>  
				<li><a style="padding: 10px 15px;" href="<%=path%>ComponentStockReport.jsp" accesskey="t">Component Stock Report</a></li>-->
				<li><a href="<%=path%>BillofMaterialReports.jsp" accesskey="t">Bill
						Of material Report</a></li>
				<li><a href="<%=path%>CompoenetrecvieReport.jsp" accesskey="t">Component
						Received Report</a></li>
				<li><a href="<%=path%>CompoenetStockreportNew.jsp"
					accesskey="t">Component Stock Report</a></li>
			</ul></li>
		<%
			}
		%>

		<%
			if (userType.equals("admin") || userType.equals("hr")) {
		%>
		<li><a href="<%=path%>OfferLetter.jsp"><i
				class="las la-users"></i>HR</a>
			<ul class="sub-menu">
				<li><a href="<%=path%>UserDetail.jsp" accesskey="t">User
						Details</a></li>
				<li><a href="<%=path%>AccessControl.jsp" accesskey="t">Access
						Control</a></li>
			</ul></li>
<%
if (userType.equals("ca") || userType.equals("hr") || userType.equals("admin")) {
		%>
		<li><a href="<%=path%>EmployeeDetailsReport.jsp"><i
				class="las la-clipboard"></i>Reports</a>
			<ul class="sub-menu">
				<li><a href="<%=path%>EmployeeDetailsReport.jsp" accesskey="t">Employee
						Details Report</a></li>
				<li><a href="<%=path%>ClientReport.jsp" accesskey="t">Client
						Reports</a></li>
				<li><a href="<%=path%>AllPaymentReport.jsp" accesskey="t">Cashbook
						Report</a></li>
				<%-- 			    <li><a style="padding: 10px 15px;" href="<%=path%>BillingReport.jsp" accesskey="t">Billing Report</a></li> --%>
				<%
			if (userType.equals("ca") || userType.equals("hr") || userType.equals("admin")) {
		%>
				<li><a href="<%=path%>BillingReportNew.jsp" accesskey="t">Billing
						Report</a></li>
			<%} %>
				<li><a href="<%=path%>PurchaseOrderCreateReport.jsp"
					accesskey="t">Purchase Order Report</a></li>
				<li><a href="<%=path%>PurchaseOrderReceiveReport.jsp"
					accesskey="t">Received PO Report</a></li>

				<li><a href="<%=path%>QuotationReport.jsp" accesskey="t">Vender
						Quotation Report</a></li>
				<li><a href="<%=path%>ClientQuotationReport.jsp" accesskey="t">Client
						Quotation Report</a></li>
				<li><a href="<%=path%>PreviousEmployeeDetailsReport.jsp"
					accesskey="t">Previous Employee Details Report</a></li>
				<li><a href="<%=path%>EmployeeLeaveReport.jsp" accesskey="t">Employee
						Leave Report</a></li>
			</ul></li>
			<%} %>
		<%
			}
		%>
		<%
			if (userType.equals("admin") || userType.equals("accountant")) {
		%>
		<li><a href="<%=path%>productBillingreprint.jsp"><i
				class="las la-print"></i>Invoice Reprint</a>
			<ul class="sub-menu">
				<li><a href="<%=path%>productBillingreprint.jsp" accesskey="t">Product
						Billing Reprint </a></li>
				<li><a href="<%=path%>ResoruseBillingCopy.jsp" accesskey="t">Service
						Billing Reprint</a></li>

			</ul></li>
		<%
			}
		%>
		<li><a href="#" onclick="Logout()"><i
				class="las la-sign-out-alt"></i>Logout</a></li>

	</ul>
	</nav>

	<script src="/embelSoft/staticContent/js/jquery-2.1.3.min.js"></script>
	<script>
		$(document).ready(function() {
			var touch = $('#resp-menu');
			var menu = $('.menu');

			$(touch).on('click', function(e) {
				e.preventDefault();
				menu.slideToggle();
			});

			$(window).resize(function() {
				var w = $(window).width();
				if (w > 767 && menu.is(':hidden')) {
					menu.removeAttr('style');
				}
			});

		});
	</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>

	<!-- header end -->