<!-- ComponentReceivedPOList.jsp -->

<%@page import="com.embelSoft.dao.ComponentReceivedPODao"%>
<%@page import="com.embelSoft.bean.ComponentReceivedPOBean"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>

<html>
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"
	src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript"
	src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>

<!-- 	<!-- For datatable to pdf,print,excel etc conversion -->
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/jszip.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/pdfmake.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/vfs_fonts.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/buttons.print.min.js"></script>
<link rel="stylesheet"
	href="/embelSoft/staticContent/cssForReport/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="/embelSoft/staticContent/cssForReport/buttons.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

<link href="/embelSoft/staticContent/css/StyleValidation.css"
	rel="stylesheet" type="text/css" />
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<script src="/embelSoft/staticContent/js/compoentCategorydetails.js"></script>

<link rel="stylesheet"
	href="/embelSoft/staticContent/css/venderlist.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/style2.css">
<script>
	$(document).ready(function() {
		compoentCategoryDetaillist();
	});
</script>


<script type="text/javascript">
	function Back() {
		window.location = "ComponentCategoryDetails.jsp";
	}
</script>
<style type="text/css">
td {
	color: black;
}
</style>
</head>
<body>

	<div class="container">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Component Category Detail
					List</h2>
			</div>
		</div>
		<div class="row">
			<div class="form-group" align="right">
				<div class="col-sm-offset-6 col-md-5 control-label">
					<div id="date">
						<label id="demo"></label>
						<script>
							var date = new Date();
							document.getElementById("demo").innerHTML = date
									.toDateString();
						</script>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>

		<div id="date">
			<label id="demo"></label>
			<script>
				var date = new Date();
				document.getElementById("demo").innerHTML = date.toDateString();
			</script>
		</div>


		<div class="container">
			<div class="table-responsive">
				<div id="demo_jui">

					<table
						class="table table-bordered table-striped table-condensed cf"
						id="Compoentcategorylist" class="display"
						style="border: 1px solid white; border-collapse: collapse;">
						<thead>
							<tr>
								<th>Sr No</th>

								<th>Component Category</th>
								<th>Component Name</th>
								<th>Component Value</th>
								<th>Part Name</th>
								<th>Manufacturer Name</th>
								<th>Description</th>
								<th>Type</th>
								<th>Package</th>
								<th>Tol/Va Rating</th>
								<th>Quantity</th>
								<th>Unit Price</th>
								<th>Custom Duty %</th>
								<th>Unit Price<br>(incl)Custom Duty
								</th>
								<th>Tax Name</th>
								<th>Tax Percentage</th>
								<th>CGST</th>
								<th>SGST</th>
								<!-- 	<th Style="display:none;">compCategoryId</th>
					<th Style="display:none;">compTypeId</th>
					<th Style="display:none;">taxTypeId</th> -->
								<th>Action</th>

							</tr>
						</thead>
						<tfoot>

						</tfoot>
					</table>
				</div>
			</div>



			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Delete</h4>
						</div>
						<div class="modal-body">
							<h5>.....</h5>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="No"
								data-dismiss="modal">No</button>
							<button type="button" class="btn btn-primary" id="Ok">Yes</button>
						</div>
					</div>
				</div>
			</div>



		</div>
		<div class="wrapper" align="center">
			<input type="button" style="font-size: 25" value="Back" id="listBtn"
				class="btn btn-primary btn-lg btnn" onclick="Back()" />
		</div>


		<%@include file="commons/newFooter.jsp"%>
	</div>

	<script type="text/javascript">
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').trigger('focus')
		})
	</script>

</body>
</html>