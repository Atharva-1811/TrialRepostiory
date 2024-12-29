/*
 componentStockDetails.js
 */


//componentStock




function componentStock()
{
	var params= {};

	params["methodName"] = "getComponentStock";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchaseOrderCreatelist').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#purchaseOrderCreatelist').DataTable( {

				"bPaginate": false,

				
				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};

					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},
				
				destroy: true,
				searching: true,
				"scrollX": true,
				"scrollY": true,
				columns: [
				        
					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "componentType" , "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
			           {"data": "compPackage", "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "unit", "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			          {"data": "compStockLastUpdateDate" , "width": "5%" ,"defaultContent": ""},
				          ],
				          
				      
					} );
				});

		
		var mydata = catmap;
		$('#purchaseOrderCreatelist').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}
//componentStockReport
function componentStockReport()
{
	var params= {};

	params["methodName"] = "getAllComponentStockReport";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchaseOrderCreatelist').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#purchaseOrderCreatelist').DataTable({

				"bPaginate": false,
				
				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};

					// Total over this page
					pageTotal = api
					.column( 6 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 6 ).footer() ).html(

							''+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "componentType" , "width": "5%" ,"defaultContent": ""},
//				          {"data": "fkCompTypeId", "width": "5%" ,"defaultContent": ""},
				          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
				          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "compPackage", "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "compStockLastUpdateDate" , "width": "5%" ,"defaultContent": ""},
				         				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		var mydata = catmap;
		$('#purchaseOrderCreatelist').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


function compoentstockreport()
{
	var CompoenentCategory= $('#componentCategory_id').val();
	//alert(CompoenentCategory);
	var startDate = $("#fisDate4").val();
	//alert(startDate);
	var endDate = $("#endDate4").val();
	
	if(CompoenentCategory=="" || CompoenentCategory==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Component Category !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Compoenet Category");
		$("#componentCategory_id").focus();
		return false;
	}
	if(startDate=="" || startDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select start Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select start Date");
		$("#fisDate4").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select End Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select end Date");
		$("#endDate4").focus();
		return false;
	}
	
	getCompoentCategoryBetTwoDays();
}

function getCompoentCategoryBetTwoDays () 
{
	var params= {};
	var CompoentCategory= $('#componentCategory_id').val();
	var fisDate = $("#fisDate4").val();
	var endDate = $("#endDate4").val();

	var input1 = document.getElementById('componentCategory_id'),
	list = document.getElementById('cli_drop'),
	i,fkCompenetId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkCompenetId = list.options[i].getAttribute('data-value');
		}
	}
	params["fkCompenetId"]= fkCompenetId;
	params["CompoentCategory"]= CompoentCategory;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getCompoentCategoryForstockReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#clientBetweenTwoDatesAndName').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap=="" || catmap<=0 || catmap==null) 
		{
			swal({
			     title: "Warning!",
			     text: "No data Available for "+CompoentCategory+" \nFrom "+fisDate+" To "+endDate+"..!",
			     icon: 'warning',
			     timer: 2500,
			     button:false
			     });
			return false;
		}

		$(document).ready(function() {
			$('#clientBetweenTwoDatesAndName').DataTable( {

				"bPaginate": false,

				
				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};

					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
					

					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "componentType" , "width": "5%" ,"defaultContent": ""},
//			          {"data": "fkCompTypeId", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "compPackage", "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			          {"data": "compStockLastUpdateDate" , "width": "5%" ,"defaultContent": ""}, 
				          
				          
				          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#clientBetweenTwoDatesAndName').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}



function stockbetweentwodate()
{
	var startDate = $("#fisDate42").val();
	var endDate = $("#endDate42").val();
	
	if(startDate=="" || startDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please  Select Start Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select start Date");
		$("#fisDate42").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please  Select End Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select end Date");
		$("#endDate42").focus();
		return false;
	}
	getCompoentDetailsByDate();	
}

//Client Payment Report Date Wise
function getCompoentDetailsByDate()
{
	var fisDate42 = $("#fisDate42").val();
	var endDate42 = $("#endDate42").val();
	
	var params= {};
	
	params["fisDate42"] = fisDate42;
	params["endDate42"] = endDate42;
	
	params["methodName"] = "getstockReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#clientBetweenTwoDate').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap=="" || catmap<=0 || catmap==null) 
		{
			swal({
			     title: "Warning!",
			     text: "No data Available for Dates \nFrom "+fisDate42+" To "+endDate42+"..!",
			     icon: 'warning',
			     timer: 2500,
			     button:false
			     });
			return false;
		}
		
		$(document).ready(function() {
			
			$('#clientBetweenTwoDate').DataTable( {

				"bPaginate": false,

				
				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};

					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},
				
				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
				        

					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "componentType" , "width": "5%" ,"defaultContent": ""},
//			          {"data": "fkCompTypeId", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "compPackage", "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			          {"data": "compStockLastUpdateDate" , "width": "5%" ,"defaultContent": ""},   
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});
		
		
		var mydata = catmap;
		$('#clientBetweenTwoDate').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	

}
function GetCompoentNameagainestCategory() {

	//$("#componentType").append($("<input/>").attr("value","").text());
	
	var componentType = $('#componentType').val();
	
	var input1 = document.getElementById('componentType'), 
	list = document.getElementById('componentNameList'),
		   i, pkcompoentNameid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
	pkcompoentNameid = list.options[i].getAttribute('data-value');
		}
	}

	$("#componentName_id").empty();
	$("#componentName_id").append($("<option></option>").attr("value","").text("Select Component Name"));
	var params = {};
	
	params["componentType"] = pkcompoentNameid;
	
	params["methodName"] = "GetCompoentnametoselectReport";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,
		function(data)
		{
		//alert(data);
		var count = 1;
		
		var jsonData = $.parseJSON(data);
		//var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			
			$("#componentName_id").append(
					$("<option></option>").attr("value", count).text(v.pkComponentCategoryDetailsId+","+v.componentName));
			count++;
			 
			
			//$("#compoentCategoryNamelist").append($("<option></option>").attr("value",count).text(v.pkComponentCategoryDetailsId+","+v.componentName)); 
			//count++;
			
			//$("#componentName_id").append($("<option></option>").attr("value", count).text(v.componentName));
			//count++;
			//document.getElementById("componentName_id").value = v.componentName;
			
				});
			}).error(function(jqXHR, textStatus, errorThrown){
	 			if(textStatus==="timeout") {

				}
			});	    	
}


function compoentstockreport1()
{
	var CompoenentCategory= $('#componentType').val();
	var ComponentName_id= $('#componentName_id').val();
	//alert(CompoenentCategory);
	var startDate = $("#fisDate10").val();
	//alert(startDate);
	var endDate = $("#endDate10").val();
	//alert(endDate);
	if(CompoenentCategory=="" || CompoenentCategory==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Component Category !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		
		//alert("Please Select Compoenet Category");
		$("#componentType").focus();
		return false;
	}
	if(ComponentName_id=="" || CompoenentCategory==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Component Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		
		//alert("Please Select Compoenet Category");
		$("#componentName_id").focus();
		return false;
	}
	if(startDate=="" || startDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Start Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select start Date");
		$("#fisDate10").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select End Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select end Date");
		$("#endDate10").focus();
		return false;
	}
	
	getCompoentCategoryBetTwoDays1();
}

function getCompoentCategoryBetTwoDays1 () 
{
	var params= {};
	var componentType= $('#componentType').val();
	
	//alert(componentType);
	
	var fisDate = $("#fisDate10").val();
	var endDate = $("#endDate10").val();

	var input1 = document.getElementById('componentType'),
	list = document.getElementById('componentNameList'),
	i,fkCompenetId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkCompenetId = list.options[i].getAttribute('data-value');
		}
	}
	
	var componentName1 = $('#componentName_id').val();

	$("#componentName_id option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var fkCompoentid = splitText[0];
	
	$("#componentName_id option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var componentName = splitText[1];
	
	params["fkCompoentid"] = fkCompoentid;
	params["componentName"] = componentName;
	
	params["fkCompenetId"]= fkCompenetId;
	params["componentType"]= componentType;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getCompoentCategoryForstockReportBetweenTwoDatesandname";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#categoryBetweenTwoDatesAndName1').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap=="" || catmap<=0 || catmap==null) 
		{
			swal({
			     title: "Warning!",
			     text: "No data Available for \nComponent Name: "+componentName+",\nFrom "+fisDate+" To "+endDate+"..!",
			     icon: 'warning',
			     timer: 2500,
			     button:false
			     });
			return false;
		}

		$(document).ready(function() {
			$('#categoryBetweenTwoDatesAndName1').DataTable( {

				"bPaginate": false,

				
				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};

					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
					

					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "componentType" , "width": "5%" ,"defaultContent": ""},
//			          {"data": "fkCompTypeId", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "compPackage", "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			          {"data": "compStockLastUpdateDate" , "width": "5%" ,"defaultContent": ""}, 
				          
				          
				          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Stock Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#categoryBetweenTwoDatesAndName1').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

