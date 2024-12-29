

function GetCompoentNameagainestCategoryForCompoentbilling() {

	//$("#componentType").append($("<input/>").attr("value","").text());
	
	var componentType = $('#componentType').val();
	
	var input1 = document.getElementById('componentType'),
	list = document.getElementById('componentNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}

	$("#componentNameList").empty();
	$("#componentNameList").append($("<option></option>").attr("value","").text("Select Component Name"));
	var params = {};
	
	params["componentType"] = fkEmployeeid;
	
	params["methodName"] = "getCompoentnameforselectForCompenentBilling";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,
		function(data)
		{
		//alert(data);
		var count = 1;
		
		var jsonData = $.parseJSON(data);
		//var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			
			$("#componentNameList").append(
					$("<option></option>").attr("value", count).text(v.fkCompoentnameid+","+v.componentName+","+v.quantity));
			count++;
			 
			
				});
			}).error(function(jqXHR, textStatus, errorThrown){
	 			if(textStatus==="timeout") {

				}
			});
 	    	
}



function CompoenetBillGrid()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
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
	
	$("#componentName_id option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var Quantity1 = splitText[2];
	
	params["fkCompoentid"] = fkCompoentid;
	params["componentName"] = componentName;
	
	
	
	params["methodName"] = "getGridForCompoenentBilling";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
		//alert(data);	
		var jsonData = $.parseJSON(data);
			
		
			
			$.each(jsonData,function(i,v)
			{
				//document.getElementById("productName").value = "";
		    	count = jQuery("#CompoenetGrid").jqGrid('getGridParam', 'records'); 
			    var rowdata =$("#CompoenetGrid").jqGrid('getGridParam','data');
			    var ids = jQuery("#CompoenetGrid").jqGrid('getDataIDs');
			    
			    var productName,com,packing,unit;
				
			    for (var j = 0; j < count; j++) 
			    {
			    	
			    	
			    	var rowId = ids[j];
					var rowData = jQuery('#CompoenetGrid').jqGrid ('getRowData', rowId);
					
						newrow = true;
					
				}
			    
			    if(newrow == true)
				 {
				  //$("#productGrid").addRowData(i,jsonData[i]);
				  $("#CompoenetGrid").addRowData(count,jsonData.offer);					
				 }
			    	
		$("#CompoenetGrid").jqGrid({
			datatype: "local",
			
			colNames:['Comp.CategoryID','Comp.Category','Compoenent Name','Compoenent Name id','Part No.','Package','Value','Mfg_Name','HSN/SAC','Unit Price','Quantity','Amount','Discount%','Discount Amt','SubTotal(Excl)','GST%','IGST%','TAX AMT','Total','avalquantity'],
			colModel:[ 
				
				{
					name : 'fkComptypeId',
					width : 20,
					editable : true,
					hidden:true
				},
				{
					name : 'compoenentCategory',
					width : 30,
					editable : false
					
				},
			    {	name:'CompoenentName',
			    	 width:42,
			    	 editable: false	
				},
				
				{
					name : 'fkCompoentnameid',
					//width : 20,
					editable : true,
					hidden:true
				},
				{
					name : 'partNumber',
					width : 30,
					editable : true,
					//hidden:true
				},
				{
					name : 'packages',
					width : 30,
					editable : true,
					//hidden:true
				},
				{
					name : 'values',
					width : 30,
					editable : true,
					//hidden:true
				},
				{
					name : 'mfgName',
					width : 30,
					editable : true,
					//hidden:true
				},
				{	name:'hsn',
					width:30,
					editable: true						
				},					   					
				{	name:'unitPrice',
			    	 width:30,
			    	 editable: true
				},
				{	name:'quantity',
					width:28,
					editable: true						
				},
				{	name:'amount',
			    	 width:30,
			    	 editable: false
				},
				{	name:'discountPercentage',
			    	 width:35,
			    	 editable: true
				},
				{	name:'discountAmount',
			    	 width:40,
			    	 editable: false
				},
				{	name:'subTotal',
			    	 width:30,
			    	 editable: false
				},
				{	name:'gst',
			    	 width:24,
			    	 editable: true
				},
				
				{	name:'IGST',
			    	 width:22,
			    	 editable: true
				},
				{	name:'taxAmount',
			    	 width:35,
			    	 editable: false
				},					
				{	name:'total',
					width:40,
				},
				{	name:'quantity1',
					width : 20,
					hidden:true,
				}
				
				
			],
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 1500,
			//height: 350,
			shrinkToFit:true,
            rowheight: 300,
            hoverrows: true,
	        rownumbers: true,
            rowNum: 10,
            'cellEdit':true,
         	 afterSaveCell: function  grossTotal() {
			    
         		 
         		//var count = jQuery("#CompoenetGrid").jqGrid('getGridParam', 'records');
	        	//var allRowsInGrid1 = $('#CompoenetGrid').getGridParam('data');
	        	//var AllRows=JSON.stringify(allRowsInGrid1);           
         		// var rowId =$("#CompoenetGrid").jqGrid('getGridParam','selrow');  
                // var rowData = jQuery("#CompoenetGrid").getRowData(rowId);
                
                  
         		
         		 
         		 
         		 
         		 
         		 
         		 /* 	Calculation of total after editing quantity*/
			        	   
			        	   // $(this).trigger('reloadGrid');
			        	    var rowId =$("#CompoenetGrid").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#CompoenetGrid").getRowData(rowId);
	                    
	                        
	                        var quantity = rowData['quantity'];
	                 		
	                 		
	                 		var count = jQuery("#CompoenetGrid").jqGrid('getGridParam','records');
	        	        	var allRowsInGrid1 = $('#CompoenetGrid').getGridParam('data');
	        	        	var AllRows=JSON.stringify(allRowsInGrid1);           
	        	        	var quan;		
	        	        	for (var j = 0; j <count; j++) 
	        				  		{
	        	        		quan =  allRowsInGrid1[j].quantity;
	        	        		quan1 =  allRowsInGrid1[j].quantity1;
	        	        		if(Number(quan) > Number(quan1)){
	                      		 alert("please enter quantity less than stock");
	                      		 var setZero = 0;
	                       		 $("#CompoenetGrid").jqGrid("setCell", rowId, "quantity", setZero);
	                       		 return false;
	        			    			}
	        				  		}
	                        var unitPrice = rowData['unitPrice'];
	                    	var quantity = rowData['quantity'];
	                    	
	                    	/* 	Calculation of Amount after editing quantity*/
	                    	var amount = (unitPrice * quantity);
	                    	$("#CompoenetGrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
	                    	
	                    	/* 	Calculation of discountAmount after editing discountPercent*/
	                    	var discountPercent = rowData['discountPercentage'];	        		        	
        		        	var discountAmount = (amount * discountPercent) / 100;
        		        	$("#CompoenetGrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
        		        	var subTotal = amount-discountAmount;
        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
        		        	$("#CompoenetGrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
        		        	
        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
        		        	var GST = rowData['gst']; 		        	
        		        	var GSTAmount = (subTotal * GST) / 100;
        		        	//var SGST = rowData['SGST']; 		        	
        		        	//var SGSTAmount = (subTotal * SGST) / 100;
        		        	var IGST = rowData['IGST']; 		        	
        		        	var IGSTAmount = (subTotal * IGST) / 100;
        		        	var taxAmount = (GSTAmount + IGSTAmount);
        		        	
	                    	//var GST = rowData['GST'];
	                    	//var IGST = rowData['IGST'];
        		        	//var taxAmount = ((subTotal * GST) / 100) + ((subTotal * IGST) / 100);
        		        	$("#CompoenetGrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of Total after editing CGST and SGST or IGST% */        		        	
	                    	var total = subTotal + taxAmount; 
                    		$("#CompoenetGrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
                    		
                    		var grossTotal = 0;
                    		var totalSubTotal = 0;
                    		var totalTaxAmount = 0;
                    		var count = jQuery("#CompoenetGrid").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#CompoenetGrid').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		var grossTotal1 = allRowsInGrid1[k].total;
        		        		grossTotal = +grossTotal + +grossTotal1;
        		        		
        		        		var totalSubTotal1 = allRowsInGrid1[k].subTotal;
        		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
        		        		
        		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
        		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
        		        	}
        		        	document.getElementById("totalSubTotalProduct").value = totalSubTotal.toFixed(2);
	     		        	document.getElementById("totalTaxAmountProduct").value = totalTaxAmount.toFixed(2);
	     		        	document.getElementById("grossTotalProduct").value = grossTotal.toFixed(2);
	        	},		        	
           
			pager: "#jqGridPager1",
		});
				
		//$("#productGrid").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#productGrid").addRowData(i,jsonData[i]);
			  $("#CompoenetGrid").addRowData(0,jsonData.offer);
		}
		     
		 $('#CompoenetGrid').navGrid('#jqGridPager1',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#CompoenetGrid"),
						  intervalId = setInterval(
							 function() {
							         grid.trigger("reloadGrid",[{current:true}]);
							   },
							   500);		                       		                      
						},
						
						 recreateForm: true,
						 checkOnUpdate : true,
						 checkOnSubmit : true,
		                 closeAfterEdit: true,
						
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    }
	                },
	                {
	                    closeAfterAdd: true,
	                    recreateForm: true,
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    }
	                },
	                {
	                	closeAfterdel:true,
	                	checkOnUpdate : true,
						checkOnSubmit : true,
						recreateForm: true,
	                	
						reloadAftersubmit:true,	
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText	                        		                        
	                    },
		                    afterComplete: function() {
		                    	
		                    	// $(this).trigger('reloadGrid');
				        	    var rowId =$("#CompoenetGrid").jqGrid('getGridParam','selrow');  
		                        var rowData = jQuery("#CompoenetGrid").getRowData(rowId);
		                    	var unitPrice = rowData['unitPrice'];
		                    	var quantity = rowData['quantity'];
		                    	
		                    	if(quantity > Quantity1){
		                    		 alert("please enter quantity less than the avaliabe stock");
		                    		 var setZero = 0;
                             		 $("#credit").jqGrid("setCell", rowId, "quantity", setZero);
                             		 return false;
		                    	 }
		                    	
		                    	
		                    	
		                    	
		                    	/* 	Calculation of Amount after editing quantity*/
		                    	var amount = (unitPrice * quantity);
		                    	$("#CompoenetGrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
		                    	
		                    	/* 	Calculation of discountAmount after editing discountPercent*/
		                    	var discountPercent = rowData['discountPercentage'];	        		        	
	        		        	var discountAmount = (amount * discountPercent) / 100;
	        		        	$("#CompoenetGrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
	        		        	var subTotal = amount-discountAmount;
	        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
	        		        	$("#CompoenetGrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
	        		        	
	        		      
	        		        	
	        		        	
	        		        	var GST = rowData['gst']; 		        	
	        		        	var GSTAmount = (subTotal * GST) / 100;
	        		        	//var SGST = rowData['SGST']; 		        	
	        		        	//var SGSTAmount = (subTotal * SGST) / 100;
	        		        	var IGST = rowData['IGST']; 		        	
	        		        	var IGSTAmount = (subTotal * IGST) / 100;
	        		        	var taxAmount = (GSTAmount + IGSTAmount);
	        		        	
	        		        	
	        		        	$("#CompoenetGrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of Total after editing GST or IGST% */        		        	
		                    	var total = subTotal + taxAmount;
	                    		$("#CompoenetGrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
	                    		
	                    		var grossTotal = 0;
	                    		var totalSubTotal = 0;
	                    		var totalTaxAmount = 0;
	                    		var count = jQuery("#CompoenetGrid").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#CompoenetGrid').getGridParam('data');
	        		        	var AllRows=JSON.stringify(allRowsInGrid1);
	        		        	for (var k = 0; k < count; k++) {
	        		        		var grossTotal1 = allRowsInGrid1[k].total;
	        		        		grossTotal = +grossTotal + +grossTotal1;
	        		        		
	        		        		var totalSubTotal1 = allRowsInGrid1[k].subTotal;
	        		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
	        		        		
	        		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
	        		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
	        		        	}
	        		        	document.getElementById("totalSubTotalProduct").value = totalSubTotal.toFixed(2);
		     		        	document.getElementById("totalTaxAmountProduct").value = totalTaxAmount.toFixed(2);
		     		        	document.getElementById("grossTotalProduct").value = grossTotal.toFixed(2);		        	
	                  }
	                });			 
			});				
		})	
}


function Compoentbillingvalidation10() {
	
	if(document.CompBilling.fkClientId.value==""){
		swal({
		     title: "Alert!",
		     text: "Please Select Client Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Client Name");
		document.getElementById("fkClientId").focus();
		return false;
	 }
	if(document.CompBilling.productBillDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Bill Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Bill Date");
		document.getElementById("productBillDate").focus();
		return false;
	}
	
	var cilentName=$('#fkClientId').val();
	var billingDate = $('#productBillDate').val();
	
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	if(count <= 0)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Component Category And Component Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		
		 document.getElementById("componentName_id").focus();
		 return false;
	} 
	if(document.CompBilling.totalSubTotalProduct.value==""){
		swal({
		     title: "Alert!",
		     text: "Please Enter Total Sub Total !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		
		document.getElementById("totalSubTotalProduct").focus();
		return false;
	 }
	if(document.CompBilling.totalTaxAmountProduct.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Total Tax Amount !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Total Tax Amount");
		document.getElementById("totalTaxAmountProduct").focus();
		return false;
	}	
	if(document.CompBilling.grossTotalProduct.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Gross Total !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		
		document.getElementById("grossTotalProduct").focus();
		return false;
	}
	
	CompoenentBollDetails123();
	
}

function CompoenentBollDetails123() 
{
	var params = {};

	var clientName = $('#fkClientId').val();

	var input1 = document.getElementById('fkClientId'), list = document
			.getElementById('clientNamesList'), i, fkClientId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}

	var productBillDate = $('#productBillDate').val();

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');
																	
																	
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		console.log("the vale of I "+i);
		
		var fkCompTypeId = allRowsInGrid[i].fkCompTypeId;
		params["fkCompTypeId" + i] = fkCompTypeId;

		var componentCategory = allRowsInGrid[i].componentCategory;
		params["compoenentCategory" + i] = componentCategory;

		var componentName = allRowsInGrid[i].componentName;
		params["CompoenentName" + i] = componentName;

		var pkComponentCategoryDetailsId = allRowsInGrid[i].pkComponentCategoryDetailsId;
		params["pkComponentCategoryDetailsId" + i] = pkComponentCategoryDetailsId;

		var hsn = allRowsInGrid[i].hsn;
		params["hsn" + i] = hsn;

		var unitPrice = allRowsInGrid[i].unitPriceWithCustomduty;
		params["unitPrice" + i] = unitPrice;

		var quantity = allRowsInGrid[i].quantity;
		params["quantity" + i] = quantity;

		var amount = allRowsInGrid[i].amount;
		params["amount" + i] = amount;

		var discountPercentage = allRowsInGrid[i].discountPercentage;
		params["discountPercentage" + i] = discountPercentage;

		var discountAmount = allRowsInGrid[i].discountAmount;
		params["discountAmount" + i] = discountAmount;

		var subTotal = allRowsInGrid[i].subTotal;
		params["subTotal" + i] = subTotal;

		var gst = allRowsInGrid[i].GST;
		params["gst" + i] = gst;

		var IGST = allRowsInGrid[i].IGST;
		params["IGST" + i] = IGST;

		var taxAmount = allRowsInGrid[i].taxAmount;
		params["taxAmount" + i] = taxAmount;

		var total = allRowsInGrid[i].total;
		params["total" + i] = total;

		var packages = allRowsInGrid[i].packages;
		params["packages" + i] = packages;

		var partNumber = allRowsInGrid[i].partNumber;
		params["partNumber" + i] = partNumber;

		var values = allRowsInGrid[i].componentValue;
		params["values" + i] = values;

		var mfgName = allRowsInGrid[i].manufractureName;
		params["mfgName" + i] = mfgName;
	}

	var ProjectName = $('#ProjectName').val();
	var description = $('#description').val();
	var BoardName = $('#BoardName').val();
	var totalSubTotalProduct = $('#totalSubTotalProduct').val();
	var totalTaxAmountProduct = $('#totalTaxAmountProduct').val();
	var grossTotalProduct = $('#grossTotalProduct').val();

	params["count"] = count;
	params["fkClientId"] = fkClientId;
	params["clientName"] = clientName;
	params["productBillDate"] = productBillDate;
	params["totalSubTotalProduct"] = totalSubTotalProduct;
	params["totalTaxAmountProduct"] = totalTaxAmountProduct;
	params["grossTotalProduct"] = grossTotalProduct;
	params["description"] = description;
	params["ProjectName"] = ProjectName;
	params["BoardName"] = BoardName;
	params["methodName"] = "saveCompoenentBillingDetails123";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) {

		window.open("compoentbillingpdf.jsp");

		location.reload();
		// alert(data);

	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}
	
	
	


function getCompoentCategoryRepoert()
{
	var CompoenentCategory= $('#componentCategory_id').val();
	//alert(CompoenentCategory);
	var startDate = $("#fisDate5").val();
	//alert(startDate);
	var endDate = $("#endDate5").val();
	
	if(CompoenentCategory=="" || CompoenentCategory==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Compoenet Category !",
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
		     text: "Please Select Start Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select start Date");
		$("#fisDate5").focus();
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
		$("#endDate5").focus();
		return false;
	}
	
	getCompoentCategory();
}



function getCompoentCategory(){
	var params= {};
	var CompoentCategory= $('#componentCategory_id').val();
	var fisDate = $("#fisDate5").val();
	var endDate = $("#endDate5").val();

	var input1 = document.getElementById('componentCategory_id'),
	list = document.getElementById('compoentCategorylist'),
	i,fkClientId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkCompenetId1 = list.options[i].getAttribute('data-value');
		}
	}
	params["fkCompenetId1"]= fkCompenetId1 ;
	params["CompoentCategory"]= CompoentCategory;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getCompoentCategoryReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#categoryBetweenTwoDatesAndName').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#categoryBetweenTwoDatesAndName').DataTable( {

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
					
					{"data": "srNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "billNo", "width": "5%" ,"defaultContent": ""},	
				      {"data": "billingDate", "width": "5%" ,"defaultContent": ""},	
				      {"data": "clientName", "width": "5%" ,"defaultContent": ""},
				      {"data": "compoenentCategory", "width": "5%" ,"defaultContent": ""},
				      {"data": "CompoenentName", "width": "5%" ,"defaultContent": ""},
				     
				      {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
				      {"data": "quantity", "width": "5%" ,"defaultContent": ""},
				      {"data": "amount", "width": "5%" ,"defaultContent": ""},
				      {"data": "discountPercentage", "width": "5%" ,"defaultContent": ""},
				      {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
				      {"data": "subTotal", "width": "5%" ,"defaultContent": ""},					
				      {"data": "gst", "width": "5%" ,"defaultContent": ""},
			          {"data": "IGST" , "width": "5%" ,"defaultContent": ""}, 
			          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#categoryBetweenTwoDatesAndName').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

function ok()
{
	var vendorName = $("#clientName").val();
	var startDate = $("#fisDate4").val();
	var endDate = $("#endDate4").val();
	
	if(vendorName=="" || vendorName==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Client Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Client Name");
		$("#clientName").focus();
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
	getClientPaymentDetailsByName();	
}

//Client Payment Report Date And NameWise
function getClientPaymentDetailsByName()
{

	var clientName = $("#clientName").val();
	var fisDate4 = $("#fisDate4").val();
	var endDate4 = $("#endDate4").val();
	
	var input1 = document.getElementById('clientName'), list = document
	.getElementById('cli_drop'), i, fkClientId2;
    for (i = 0; i < list.options.length; ++i)
    {
	    if (list.options[i].value === input1.value) 
	    {
	    	fkClientId2 = list.options[i].getAttribute('data-value');
	    }
    }
	
  	var params= {};
	
	params["fkClientId2"] = fkClientId2;
	params["clientName"] = clientName;
	params["fisDate4"] = fisDate4;
	params["endDate4"] = endDate4;
	
	params["methodName"] = "getCompoentReportbycilentName";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#clientBetweenTwoDatesAndName').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		
		
		$(document).ready(function() {
			
			$('#clientBetweenTwoDatesAndName').DataTable( {

				"bPaginate": true,

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
				        
					  {"data": "srNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "billNo", "width": "5%" ,"defaultContent": ""},	
				      {"data": "billingDate", "width": "5%" ,"defaultContent": ""},	
				      {"data": "clientName", "width": "5%" ,"defaultContent": ""},
				      {"data": "compoenentCategory", "width": "5%" ,"defaultContent": ""},
				      {"data": "CompoenentName", "width": "5%" ,"defaultContent": ""},
				     
				      {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
				      {"data": "quantity", "width": "5%" ,"defaultContent": ""},
				      {"data": "amount", "width": "5%" ,"defaultContent": ""},
				      {"data": "discountPercentage", "width": "5%" ,"defaultContent": ""},
				      {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
				      {"data": "subTotal", "width": "5%" ,"defaultContent": ""},					
				      {"data": "gst", "width": "5%" ,"defaultContent": ""},
			          {"data": "IGST" , "width": "5%" ,"defaultContent": ""}, 
			          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          
				          ],
				          
				          
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});		
		var mydata = catmap;
		$('#clientBetweenTwoDatesAndName').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}
//Client Payment Report Date Wise Validation
function getCompoenentBillingDetailsByDateValidation()
{
	var startDate = $("#fisDate42").val();
	var endDate = $("#endDate42").val();
	
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
		$("#fisDate42").focus();
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
	
	params["methodName"] = "getCompoenetBillingReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#clientBetweenTwoDate').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
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
				"scrollY": true,
				
				columns: [
				        
					{"data": "srNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "billNo", "width": "5%" ,"defaultContent": ""},	
				      {"data": "billingDate", "width": "5%" ,"defaultContent": ""},	
				      {"data": "clientName", "width": "5%" ,"defaultContent": ""},
				      {"data": "compoenentCategory", "width": "5%" ,"defaultContent": ""},
				      {"data": "CompoenentName", "width": "5%" ,"defaultContent": ""},
				      
				      {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
				      {"data": "quantity", "width": "5%" ,"defaultContent": ""},
				      {"data": "amount", "width": "5%" ,"defaultContent": ""},
				      {"data": "discountPercentage", "width": "5%" ,"defaultContent": ""},
				      {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
				      {"data": "subTotal", "width": "5%" ,"defaultContent": ""},					
				      {"data": "gst", "width": "5%" ,"defaultContent": ""},
			          {"data": "IGST" , "width": "5%" ,"defaultContent": ""}, 
			          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
					        
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
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

function getCompoentnameBetTwoDaysvalidation()
{
	var CompoenentCategory= $('#CompoenentName').val();
	//alert(CompoenentCategory);
	var startDate = $("#fisDate6").val();
	//alert(startDate);
	var endDate = $("#endDate6").val();
	
	if(CompoenentCategory=="" || CompoenentCategory==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Compoenet Category !",
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
		     text: "Please Select Start Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select start Date");
		$("#fisDate5").focus();
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
		$("#endDate5").focus();
		return false;
	}
	
	getCompoentCategoryBetTwoDays();
}


//************ Client Enquiry Report **************//*
//****** Between Two dates **********//*

function getCompoentCategoryBetTwoDays(){
	var params= {};
	var CompoenentName= $('#CompoenentName').val();
	
	var fisDate = $("#fisDate6").val();
	var endDate = $("#endDate6").val();

	var input1 = document.getElementById('CompoenentName'),
	list = document.getElementById('Compoenetnamelist'),
	i,fkClientId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkCompenetId = list.options[i].getAttribute('data-value');
		}
	}
	params["fkCompenetId"]= fkCompenetId ;
	//alert(fkCompenetId);
	
	params["CompoenentName"]= CompoenentName;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getCompoentnameReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#CompoennetNameBetweenTwoDatesAndName').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#CompoennetNameBetweenTwoDatesAndName').DataTable( {

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
					
					  {"data": "SrNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "billNo", "width": "5%" ,"defaultContent": ""},	
				      {"data": "billingDate", "width": "5%" ,"defaultContent": ""},	
				      {"data": "clientName", "width": "5%" ,"defaultContent": ""},
				      {"data": "compoenentCategory", "width": "5%" ,"defaultContent": ""},
				      {"data": "CompoenentName", "width": "5%" ,"defaultContent": ""},
				      
				      {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
				      {"data": "quantity", "width": "5%" ,"defaultContent": ""},
				      {"data": "amount", "width": "5%" ,"defaultContent": ""},
				      {"data": "discountPercentage", "width": "5%" ,"defaultContent": ""},
				      {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
				      {"data": "subTotal", "width": "5%" ,"defaultContent": ""},					
				      {"data": "gst", "width": "5%" ,"defaultContent": ""},
			          {"data": "IGST" , "width": "5%" ,"defaultContent": ""}, 
			          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Billing Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#CompoennetNameBetweenTwoDatesAndName').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


function componentList()
{	
	var input1 = document.getElementById('componentCategory'),
	list = document.getElementById('compoentCategorylist'),
	i,categoryId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			categoryId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input2 = document.getElementById('componentBoxSubcategory'),
	list = document.getElementById('subcategoryList'),
	i,subCategoryId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input2.value) {
			subCategoryId = list.options[i].getAttribute('data-value');
		}
	}

	var fk_cat_id = fk_cat_id;
	
	$("#componentList").empty();
	$("#componentList").append($("<option></option>").attr("value","").text("Select Component"));
	var params= {};

	params["categoryId"] = categoryId;
	params["subCategoryId"] = subCategoryId;
	params["methodName"] = "getComponentListForComponentBilling";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				//$("#BillNo").append($("<option></option>").attr("value",(v.billNo))); 
				$("#componentList").append($("<option></option>").attr("value",i.componentSubCategory).text(v.componentSubCategory));
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


