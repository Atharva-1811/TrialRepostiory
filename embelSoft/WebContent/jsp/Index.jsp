<!-- Index.jsp -->
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="com.embelSoft.hibernate.UserDetailasHibernate"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@page import="com.embelSoft.dao.ClientResponseDao"%>
<%@page import="com.embelSoft.bean.ClientResponseDetailsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>

<html>
<%
 String type1= "";
 String name1 = "";
 if (session != null)
 {
 	if (session.getAttribute("user") != null)
 	{
 		String  name = (String) session.getAttribute("user");
 		
 		HibernateUtility hbu1=HibernateUtility.getInstance();
 		Session session2=hbu1.getHibernateSession();
 		org.hibernate.Query query1 = session2.createSQLQuery("select * from user_login where UserName =:usr");
 		query1.setParameter("usr", name1);
 		UserDetailasHibernate userDetail1 = (UserDetailasHibernate) query1.uniqueResult();
 	}
 }
 else
 {
	out.println("<script>");
	out.println("alert('Please Enter valid User Name And Password');");
	out.println("location='/embelSoft/jsp/login.jsp;'");
	out.println("</script>");
 }
%>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
<link href="/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
<script type="text/javascript" src="/staticContent/js/bootbox.min.js"></script>
<script type="text/javascript" src="/staticContent/js/bootstrap.js"></script>

<script src="/embelSoft/staticContent/js/employeeDetails.js"></script>

<%
ClientResponseDao cDao = new ClientResponseDao();
List<ClientResponseDetailsBean> sList4 = cDao.getClientName();
int count = 0;
%>
<script type="text/javascript">
	function notifyMe()
	{
		if (Notification.permission !== "granted" && sList4 > 0)
			Notification.requestPermission();
		else
		{ 
			<%
			for(int i=0;i<sList4.size();i++)
			{
				count++;
				ClientResponseDetailsBean sr=(ClientResponseDetailsBean)sList4.get(i);
				if(count==1)
				{			
			%>
			var notification = new Notification('Client FollowUp', 
					{
				        icon: '/embelSoft/staticContent/img/followUp.jpg',   
									      
				      body:" Today Have Follow Up : !",
				      
				    });
			<%}}%>
			 notification.onclick = function () 
			    {
			       	 window.open("/embelSoft/jsp/todayClientResponseList.jsp");        
			    };
		}
	}
</script>
<style>


 .d2 {
	margin-top: 30px;
	padding-left: 30px;
    width: 817px;
	height: 350px; 
	background-image: url('/embelSoft/staticContent/img/logo.png');
	align: middle;
}
 

.d1 {
	margin-top: 30px;
	width: 817px;
	height: 350px;
	background-image: url('/embelSoft/staticContent/img/logo.png');
	align: middle;
	/* padding-left: 10px; */
}

 
 @media(min-width:350px) {

.container-login100 {
    width: 100%;
    min-height: 93vh;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    padding: 15px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    position: relative;
    z-index: 1;
    /* background-image: url('/embelSoft/staticContent/img/bg-01-1.jpg');  */
    
    /* style="background-image: url('/embelSoft/staticContent/img/bg-01-1.jpg');" */
    
}
} 

.container-login100 {
    width: 100%;
    min-height: 93vh;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    padding: 15px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    position: relative;
    z-index: 1; 
      
    background-image: url('/embelSoft/staticContent/img/bg-01-1.jpg'); 
     
    
    /* style="background-image: url('/embelSoft/staticContent/img/bg-01-1.jpg');" */
    
}


 .container-login100 {
    width: 100%;
    min-height: 93vh; 
    
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    padding: 15px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    position: relative;
    z-index: 1;
    /* background-image: url('/embelSoft/staticContent/img/bg-01-1.jpg');  */
} 


.container-login100::before {
    content: "";
    display: block;
    position: absolute;
    z-index: -1;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    background-color: rgba(255,255,255,0.9);
    
}
#date {
    /* float: right !important; */
    position: absolute;
    top: -245px;
    right: -800px;
    font-size: 20px;
    /* color: aliceblue; */
    /* margin-right: 25px; */
}
</style>
</head>
<body onLoad="notifyMe()">
 
	<!--  <div class="container-login100"  style="background-image: url('/embelSoft/staticContent/img/bg-01-1.jpg');"> -->
	
	 <div class="container-login100">
	 
	  
	
	<!-- <div class="container-login100" > -->
	
	<!-- <img src="img_girl.jpg" alt="Girl in a jacket" class="img_"> -->
		<div class="row header_margin_top">
			<div class="form-group" >
				<div class="style_heading col-md-6 control-label">
					<div id="date" >
					<br><br>
						<label id="demo"></label>
						<script>
							   var date = new Date();
							   document.getElementById("demo").innerHTML = date.toDateString();
						</script>
					</div>
				</div>
			</div>
		</div>
		<div class="d1">
		
		</div>
	</div>
	
</body>
</html>
<%@include file="commons/newFooter.jsp"%>
