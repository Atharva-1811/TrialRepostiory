//add purchase order details
function purchaseOrderInfo(){
	
	var params = {}
	
	var customerName= $('#customerName').val();
	var purchaseDate= $('#purchaseDate').val();
	var regard= $('#regard').val();
	var cost= $('#cost').val();
	var reference= $('#reference').val();
	var detail = $('#detail').val();
	var requirement = $('#requirement').val();
	
	params["customerName"] = customerName;
	params["purchaseDate"] = purchaseDate;
	params["regard"] = regard;
	params["cost"] = cost;
	params["reference"] = reference;
	params["detail"] = detail;
	params["requirement"] = requirement;
	
    params["methodName"] = "PurchaseOrderInfo";
	
    $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
		 		alert(data);
		 		location.reload();
 			}
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
}



//------------Grid Start of PURCHASE ORDER RECEIVE-----------------

// Grid validation of product name in Purchase Order Receive
function getGridForRecivePO(){
	
	/*if(document.product.productName.value=="" || document.product.productName.value==null)
	{
		alert('Please enter product name===');
		return false;
		
	}*/
	getReceivePOGrid();
}

// get Grid of Purchase Order Receive
function getReceivePOGrid()
{
		var params={};
		var count=0;
		var newrow;
		var rowId;
		
		
		
			
			var productName = $('#productName').val();
			if(productName== null || productName == "" || productName == undefined)
				{
			var billno = $("#billno").val();
				}
			
			params["productName"] = productName;
			params["billno"] = billno;
		
		
		params["methodName"] ="receivePOGrid";
		
	
		document.getElementById('productName').value = null;
			//var productResourceName=$('#productName').val();
			
			$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
				{
			  var jsonData = $.parseJSON(data);
				
			
	        
		     $.each(jsonData,function(i,v)
				{
		  
				  
		    	 
//					var totaldisamt= document.getElementById("totalSubTotal").value;
//					 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
//					 {
//						 totaldisamt=0;
//						
//					 }
//					  var totalDis = v.subTotal;
//					  totaldisamt = +totaldisamt + +totalDis;
//					document.getElementById("totalSubTotal").value = totaldisamt.toFixed(2);
//					
//					
//					
//					var totaldisamt= document.getElementById("totalTaxAmount").value;
//					 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
//					 {
//						 totaldisamt=0;
//					 }
//					  var totalDis = v.taxAmount;
//					  totaldisamt = +totaldisamt + +totalDis;
//					document.getElementById("totalTaxAmount").value = totaldisamt.toFixed(2);
//					
//					
//					var gross= document.getElementById("grossTotal").value;
//					 if(gross=="" || gross==null || gross==undefined)
//					 {
//					 gross=0;
//					 }
//					  var gs = v.total;
//					 gross = +gross + +gs;
//					 
//					document.getElementById("grossTotal").value = gross.toFixed(2);
		    	 
		    	 
		    	    document.getElementById("totalSubTotal").value = parseInt(0);
					document.getElementById("totalTaxAmount").value = parseInt(0);
					document.getElementById("grossTotal").value = parseInt(0);
					
					
					for(var k =0; k<v.length;k++)
						{
						var totalsubamt= parseInt(document.getElementById("totalSubTotal").value);
					    document.getElementById("totalSubTotal").value = totalsubamt + parseInt(v[k].subTotal);
					    
					    var totaltaxamt= parseInt(document.getElementById("totalTaxAmount").value);
					    document.getElementById("totalTaxAmount").value =  totaltaxamt + parseInt(v[k].taxAmount);
					    
					    var totalgrossamt= parseInt(document.getElementById("grossTotal").value);
						document.getElementById("grossTotal").value =  totalgrossamt + parseInt(v[k].total);
					    
						}
					var plaintext = document.getElementById("grossTotal"); 
		      	    //plaintext.style.color = "#FF0000";
					
					
			    	count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
				    var rowdata =$("#list4").jqGrid('getGridParam','data');
				    var ids = jQuery("#list4").jqGrid('getDataIDs');
				
				    document.getElementById("productName").value = "";
				    var productName,com,packing,unit,billNo;
					
				    for (var j = 0; j < count; j++) 
				    {
				    	productName = rowdata[j].productName;
				    	billNo = rowdata[j].billNo;
				    	var rowId = ids[j];
						var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
						if (productName == jsonData.offer.productName) 
						{
					    	newrow=false;
							alert("Product Name OR Bill No  Already Inserted !!!");
							var grid = jQuery("#list4");
						    grid.trigger("reloadGrid");
						   
					    	break;
						}
						
						
						else
						{
							newrow = true;
						}
					}
		    	 
				  if(newrow == true)
					 {
						
					  $("#list4").addRowData(count,jsonData.offer);
						
					 }
			
			
			$("#list4").jqGrid({
				datatype: "local",
				
				colNames:['ProductName','Description','HSN/SAC','Unit Price','Quantity','Amount','Discount%','Discount Amt','SubTotal','GST%','IGST%','TAX AMT','Total','billNo'],
				colModel:[ 
					
	               
				    {	name:'productName',
				    	 width:42,
				    	 editable: true
					},
					{	name:'description',
				    	 width:42,
				    	 editable: true
					},
					{	name:'hsnSac',
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
					{	name:'discountPercent',
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
					{	name:'GST',
						width:20,
						editable: true						
					},
					{	name:'IGST',
						width:20,
						editable: true						
					},
					{	name:'taxAmount',
						width:30,
						editable: false					
					},
					{	name:'total',
						width:40,						
					},
					{	name:'billNo',
						width:40,	
						hidden: true,
					}
					
				],
							
				sortorder : 'desc',
				loadonce: false,
				viewrecords: true,
				width: 1550,
				shrinkToFit:true,
	            rowheight: 300,
	            hoverrows: true,
		        rownumbers: true,
	            rowNum: 10,
	            'cellEdit':true,
	         	 afterSaveCell: function  grossTotal() {
				      
				        	    var rowId =$("#list4").jqGrid('getGridParam','selrow');  
		                        var rowData = jQuery("#list4").getRowData(rowId);
		                    	var quantity = rowData['quantity'];
		                    	var unitPrice = rowData['unitPrice'];
		                    	
		                    	/* 	Calculation of Amount after editing quantity*/
		                    	var amount = (quantity * unitPrice);
		                    	$("#list4").jqGrid("setCell", rowId, "amount", amount.toFixed(2));		                    	
		                    	
		                    	/* 	Calculation of discountAmountCal after editing discountPercent*/
		                    	var discountPercent = rowData['discountPercent'];	        		        	
	        		        	var discountAmount = (amount * discountPercent) / 100;
	        		        	$("#list4").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));	        		        	
	        		        	
	        		        	/* 	Calculation of gridSubTotal to after editing discountPercent*/	        		        	
	        		        	var subTotal = amount - discountAmount;
	        		        	$("#list4").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));		                    	
		                    	
		                    	/* 	Calculation of gridGstAmount after editing quantity*/
	        		        	var GST = rowData['GST']; 		        	
	        		        	var GSTAmount = (subTotal * GST) / 100;
	        		        	var IGST = rowData['IGST']; 		        	
	        		        	var IGSTAmount = (subTotal * IGST) / 100;
	        		        	var taxAmount = (GSTAmount + IGSTAmount);
	        		        	
		                    	//var GST = rowData['GST'];	        		        	
	        		        	//var gridGstAmountCal = (gridSubTotalcal * gridGstPercent) / 100;
	        		        	$("#list4").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of Total after editing quantity*/
		                    	var total = subTotal + taxAmount;	                    	
	                    		$("#list4").jqGrid("setCell", rowId, "total", total.toFixed(2));
	                    		
//	                    		var Total =0;
//	                    		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
//	        		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
//	        		        	var AllRows=JSON.stringify(allRowsInGrid1);
//	        		        	for (var k = 0; k < count; k++) {
//	        		        		var Total1 = allRowsInGrid1[k].total;
//	        		        		if(Total1 != null){
//	        		        		Total = Total + Total1;
//	        		        		}
//	        		        	}
//	        		        	//Total = Total.toFixed(2);
//	        		        	document.getElementById("subTotal1").value = Total;
//	        		        	document.getElementById("gst1").value = "";
//	        		        	document.getElementById("gstAmount").value = "";
//	        		        	document.getElementById("grossTotal1").value = Total;
	        		        	
	        		        	var grossTotal = 0;
	                    		var totalSubTotal = 0;
	                    		var totalTaxAmount = 0;
	                    		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
	        		        	var AllRows=JSON.stringify(allRowsInGrid1);
	        		        	for (var k = 0; k < count; k++) {
	        		        		
	        		        		//var Total1 = allRowsInGrid1[k].total;
	        		        		var grossTotal1 = allRowsInGrid1[k].total;
	        		        		if(grossTotal1 != null){
		        		        		//Total = Total + Total1;
		        		        		
		        		        		grossTotal = +grossTotal + +grossTotal1;
		        		        	}
	        		        		
	        		        		
	        		        		var totalSubTotal1 = allRowsInGrid1[k].subTotal;
	        		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
	        		        		
	        		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
	        		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
	        		        	}
	        		        	document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
		     		        	document.getElementById("totalTaxAmount").value = totalTaxAmount.toFixed(2);
		     		        	document.getElementById("grossTotal").value = grossTotal.toFixed(2);
		        	},
	           
				pager: "#jqGridPager",
				
				
				
			});
			
		
			//$("#list4").addRowData(i+1,jsonData[i]);
			if(count==0 || count==null)
			{
				 // $("#list4").addRowData(i,jsonData[i]);
				  $("#list4").addRowData(0,jsonData.offer);
			}
			

	     
			 $('#list4').navGrid('#jqGridPager',

		                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
		                
		                {
		                    editCaption: "The Edit Dialog",
		                   
		                    afterSubmit: function () {
								
		                      var grid = $("#list4"),
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
			                    var rowId =$("#list4").jqGrid('getGridParam','selrow');  
			                       var rowData = jQuery("#list4").getRowData(rowId);
			                    	var quantity = rowData['quantity'];
			                    	var unitPrice = rowData['unitPrice'];
			                    	
			                    	var total = quantity * unitPrice;
		                 		$("#list4").jqGrid("setCell", rowId, "total", total);
		                 		
//	                 		var Total =0;
//	                 		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	                 		
//	     		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
//	     		        	var AllRows=JSON.stringify(allRowsInGrid1);
//	     		        	for (var k = 0; k < count; k++) {
//	     		        		var Total1 = allRowsInGrid1[k].total;
//	     		        		Total = +Total + +Total1;
//	     		        	}
//	     		        	
//	     		        	document.getElementById("subTotal1").value = Total;
//	     		        	document.getElementById("grossTotal1").value = Total;
//	     		       	
//        		        	document.getElementById("gst1").value = "";
//        		        	document.getElementById("gstAmount").value = "";
	                 		
	                 		var grossTotal = 0;
                    		var totalSubTotal = 0;
                    		var totalTaxAmount = 0;
                    		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		
        		        		//var Total1 = allRowsInGrid1[k].total;
        		        		var grossTotal1 = allRowsInGrid1[k].total;
        		        		if(grossTotal1 != null){
	        		        		//Total = Total + Total1;
	        		        		
	        		        		grossTotal = +grossTotal + +grossTotal1;
	        		        	}
        		        		
        		        		
        		        		var totalSubTotal1 = allRowsInGrid1[k].subTotal;
        		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
        		        		
        		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
        		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
        		        	}
        		        	document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
	     		        	document.getElementById("totalTaxAmount").value = totalTaxAmount.toFixed(2);
	     		        	document.getElementById("grossTotal").value = grossTotal.toFixed(2);
        		        	
	     		        	
		                  }
		                });
				   });
			})
	}

//-----------End Grid of PURCHASE ORDER RECEIVE


//Start ------------Gst Amount And Gross Total------------

/*function getGstTotal()
{
	//var gstAmount;
	

	
	var gst = $('#gst').val();
	var subTotal = $('#subTotal').val();
	

	var gstAmt = (subTotal)*( gst)/100;
	
	document.getElementById('gstAmount').value = gstAmt;
	
	 var grossTotal = +subTotal + +gstAmt;
	 
	 document.getElementById('grossTotal').value = gstAmt;
}
*/



function getGstAmountTotal()
{

	
	var gst1 = $('#gst1').val();
	var subTotal1 = $('#subTotal1').val();
	
	var gstAmount = (gst1)*(subTotal1)/100;

	document.getElementById('gstAmount').value = gstAmount;
	
	var grossTotal1 = +subTotal1 + +gstAmount;
	
	document.getElementById('grossTotal1').value = grossTotal1;
}


function receivedPOValidation()
{
	if(document.product.fk_vendor_id.value == "")
	{
		swal({
			title: "Alert!",
			text: "Select Vendor Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Select Vendor Name.");
		return false;
	}
/*	if(document.product.billno.value=="" || document.product.billno.value==null)
	{
		swal({
			title: "Alert!",
			text: "Please Enter Bill/Challan No..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Enter Bill/Challan No");
		return false;
	}*/
	if(document.product.purchasedate.value=="" || document.product.purchasedate.value==null)
	{
		swal({
			title: "Alert!",
			text: "Please Select Purchase Date..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Select Purchase Date");
		return false;
	}
	if(document.product.expectpaymentdate.value=="" || document.product.expectpaymentdate.value==null)
	{
		swal({
			title: "Alert!",
			text: "Please Select Expect Payment Date..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Select Expect Payment Date");
		return false;
	}
	
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
		
	if(count<= 0)
	{
		swal({
			title: "Alert!",
			text: "Please Enter Product Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('please enter product name.....');
		return false;
	}	
	
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{	
		var unitPrice = allRowsInGrid[i].unitPrice;
		var quantity = allRowsInGrid[i].quantity;
		var discountPercent = allRowsInGrid[i].discountPercent;
		var GST = allRowsInGrid[i].GST;
		var IGST = allRowsInGrid[i].IGST;
		
		if(unitPrice=="" || unitPrice==null)
		{
			swal({
				title: "Alert!",
				text: "Please Enter unit Price..!",
				icon: 'error',
				timer: 2500,
				button:false
			});
			//alert("Please Enter unit Price ");
			return false;
		}
		var letterNumber = /^[0-9]+$/;
		if(unitPrice.toString().match(letterNumber))
		{
			if(quantity=="" || quantity==null)
			{
				swal({
					title: "Alert!",
					text: "Please Enter Quantity..!",
					icon: 'error',
					timer: 2500,
					button:false
				});
				//alert("Please Enter Quantity");
				return false;
			}
			var letterNumber = /^[0-9]+$/;
			if(quantity.toString().match(letterNumber))
			{
				var letterNumber = /^[0-9]+$/;
				if(discountPercent.toString().match(letterNumber))
				{
					//
				}
				else
				{
					swal({
						title: "Alert!",
						text: "Please Enter Numbers in Discount %..!",
						icon: 'error',
						timer: 2500,
						button:false
					});
					//alert("Please Enter Numbers in Discount %");
					return false;
				}
			}
		else
			{
				swal({
					title: "Alert!",
					text: "Please Enter Numbers in Quantity..!",
					icon: 'error',
					timer: 2500,
					button:false
				});		
				//alert("Please Enter Numbers in Quantity");
				return false;
			}
		}
		else
		{
			swal({
				title: "Alert!",
				text: "Please Enter Number in Unit Price..!",
				icon: 'error',
				timer: 2500,
				button:false
			});
			//alert("Please Enter Number in Unit Price");
			return false;
		}	
	}
	
	/*if(GST=="" || GST==null || GST==undefined || IGST=="" || IGST==null || IGST==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please Enter GST Or IGST..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Enter GST Or IGST");
		//allRowsInGrid[i].discountAmount.focus();
		return false;
	}*/
	
	var GSTPercent = GST;
	var IGSTPercent = IGST;
	if(GSTPercent > 0 && IGSTPercent > 0)
	{
		swal({
			title: "Alert!",
			text: "Please Enter GST Or IGST Only, Both Taxes are not allowed (GST and IGST)..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Enter GST Or IGST Only, Both Taxes are not allowed (GST and IGST)");
		//allRowsInGrid[i].GST.focus();
		return false;
	}
	
	receivedPODetails();
	
}

function receivedPODetails()
{
	
	var params={};
	
	var input1 = document.getElementById('fk_vendor_id'),
	list = document.getElementById('vendorNameList'), i, fkVendorId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{
		var productName = allRowsInGrid[i].productName;
		params["productName"+i]=productName;
		
		var  description = allRowsInGrid[i].description;
		params["description"+i]=description;
		
		var  hsnSac = allRowsInGrid[i].hsnSac;
		params["hsnSac"+i]=hsnSac;
		
		var  unitPrice = allRowsInGrid[i].unitPrice;
		params["unitPrice"+i]=unitPrice;
		
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i]=quantity;
		
		var amount = allRowsInGrid[i].amount;
		params["amount"+i]=amount;
		
		var discountPercent = allRowsInGrid[i].discountPercent;
		params["discountPercent"+i]=discountPercent;
		
		var discountAmount = allRowsInGrid[i].discountAmount;
		params["discountAmount"+i]= discountAmount;
		
		var subTotal = allRowsInGrid[i].subTotal;
		params["subTotal"+i]=subTotal;
		
		var GST = allRowsInGrid[i].GST;
		params["GST"+i]= GST;
		
		var IGST = allRowsInGrid[i].IGST;
		params["IGST"+i]= IGST;
		
		var taxAmount = allRowsInGrid[i].taxAmount;
		params["taxAmount"+i]= taxAmount;
		
		var total = allRowsInGrid[i].total;
		params["total"+i]=total;
		
		var billNo = allRowsInGrid[i].billNo;
		params["billNo"+i]=billNo;
		
	}
	
	var vendorName = $('#fk_vendor_id').val();
	//var vendorName = $('#vendorName').val();
	//var billno = $('#billno').val();
	var purchasedate = $('#purchasedate').val();
	var expectpaymentdate = $('#expectpaymentdate').val();
	var totalSubTotal = $('#totalSubTotal').val();
	var totalTaxAmount = $('#totalTaxAmount').val();
	var grossTotal = $('#grossTotal').val();
	
	
	params["fkVendorId"] = fkVendorId;
	params["vendorName"] = vendorName;
	//params["billno"] = billno;
	params["purchasedate"] = purchasedate;
	params["expectpaymentdate"] = expectpaymentdate;
	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;
		
	params["count"] = count;
	
	/*params["methodName"] = "purchaseDetailas";*/
	params["methodName"] ="receivedPODetails";
	
	 $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		 		swal({
				     title: "Success!",
				     text: "Purchase Order Details Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				});
		 		//alert(data);
		 		location.reload();
 			}
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})

}

function receivedPOList()
{
	var params= {};

	params["methodName"] = "getReceivedPOList";
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
//					pageTotal = api
//					.column( 8 )
//					.data()
//					.reduce( function (a, b) {
//						return intVal(a) + intVal(b);
//					}, 0 );
//
//					// Update footer
//					$( api.column( 29 ).footer() ).html(
//
//							''+' '+parseFloat(pageTotal).toFixed(2)
//
//					);
//				console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [	
					
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
						  {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "PurchaseOrderDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "expectPaymentDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "amount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountAmount" , "width": "5%" ,"defaultContent": ""},				          
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "GST", "width": "5%" ,"defaultContent": ""},
				          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
				          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "balanceStatus" , "width": "5%" ,"defaultContent": ""},
				          
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

function receivedPOReport()
{

	var params= {};
	
	params["methodName"] = "getReceivedPOReport";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#typeWiseReport').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function() {
			$('#typeWiseReport').DataTable( {

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
					.column( 17 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 17 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
										
					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
					  {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "PurchaseOrderDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "expectPaymentDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "description", "width": "5%" ,"defaultContent": ""},
			          {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
			          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			          {"data": "amount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
			          {"data": "discountAmount" , "width": "5%" ,"defaultContent": ""},				          
			          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "GST", "width": "5%" ,"defaultContent": ""},
			          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
			          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "balanceStatus" , "width": "5%" ,"defaultContent": ""},
			          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Received PO Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Received PO Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Received PO Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Received PO Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
				
				
				
			} );
		} );
		var mydata = catmap;
		$('#typeWiseReport').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

function getVendorName()
{

	
	//var type = document.getElementById('vendor').value;
	
	$("#vendorList_Drop").empty();
	$("#vendorList_Drop").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	params["methodName"] = "getAllVendorName";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName)).attr("data-value",(v.vendorId))); 
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

function getClientName()
{
	
	//var type = document.getElementById('client').value;
	
		$("#vendorList_Drop").empty();
		$("#vendorList_Drop").append($("<option></option>").attr("value","").text("Select product"));
		var params= {};
		
		params["methodName"] = "getAllClientName";
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
				{ var count = 1;

				var jsonData = $.parseJSON(data);
				$.each(jsonData,function(i,v)
						{
							$("#vendorList_Drop").append($("<option></option>").attr("value",(v.firstName+" "+ v.lastName)).attr("data-value",(v.clientId))); 
							count++;
						});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
	
}

//----------- Grid Start of PURCHASE CREATE----------------

/*// Validation for Product Description in purchase order create for Grid
function getGridForProductValidation()
{
	if(document.po.productdescription.value=="" || document.po.productdescription.value==null)
	{
		alert('please enter product name . . .');
		return false;
	}
	getGridForProduct();
}
*/


// Grid for Product Description in purchase order create
function getGridForProduct()
{
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var productDescription = $('#productdescription').val();
	
	params["productDescription"] = productDescription;
	
	params["methodName"] = "gridForProductDescription";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		  var jsonData = $.parseJSON(data);
			
	     // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
        
	     $.each(jsonData,function(i,v)
			{
	    	 count = jQuery("#product_grid").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#product_grid").jqGrid('getGridParam','data');
		     var ids = jQuery("#product_grid").jqGrid('getDataIDs');
			 
			
			  var prodName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].productDescription;
				
				 var rowId = ids[j];
				 var rowData = jQuery('#product_grid').jqGrid ('getRowData', rowId);
					
				if (!prodName == jsonData.offer.productDescription) 
				{
						newrow=true;
			    	
						alert("Product Name Already Inserted !!!");
						var grid = jQuery("#product_grid");
				    	grid.trigger("reloadGrid");
				    	break;
				}
				else
				{
					newrow = true;
				}				
			 }
			  
			  if(newrow == true)
				 {
					
				  //$("#product_grid").addRowData(i,jsonData[i]);
				  $("#product_grid").addRowData(count,jsonData.offer);
					
				 }
		
		
		$("#product_grid").jqGrid({
			datatype: "local",
			
			colNames:['Product Name','Unit Price','Quantity','Total'],
			colModel:[ 
				
               
			     {	name:'productDescription',
			    	 width:70,
			    	 editable: true			    	
				},
				{	name:'unitPrice',
					width:50,
					editable: true				
				},
				{	name:'quantity',
			    	 width:50,
			    	 editable: true  	 
				},
				{	name:'total',
					width:70,				
				}
				
			],
						
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 700,
			//height: 350,
			shrinkToFit:true,
            rowheight: 300,
            hoverrows: true,
	        rownumbers: true,
            rowNum: 10,
            'cellEdit':true,
         	 afterSaveCell: function  grossTotal() {
			       /* 	Calculation of total after editing quantity*/
			        	   
			        	   // $(this).trigger('reloadGrid');
			        	    var rowId =$("#product_grid").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#product_grid").getRowData(rowId);
	                    	var quantity = rowData['quantity'];
	                    	var unitPrice = rowData['unitPrice'];
	                    	
	                    	var tota = (quantity * unitPrice);
                    		$("#product_grid").jqGrid("setCell", rowId, "total", tota.toFixed(2));
                    		
                    		var Total =0;
                    		var count = jQuery("#product_grid").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#product_grid').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		var Total1 = allRowsInGrid1[k].total;
        		        		if(Total1 != undefined){
        		        			Total = Total + Total1;
        		        		}        		        		
        		        	}
        		        	document.getElementById("subtotal").value = Total;
        		        	document.getElementById("gst").value = "";
         		        	document.getElementById("vat").value = "";
         		        	document.getElementById("grossTotal").value = Total;
         		        	//document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
	        	},
           
			pager: "#jqGridPager",
		});
		
	
		//$("#product_grid").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#product_grid").addRowData(i,jsonData[i]);
			  $("#product_grid").addRowData(0,jsonData.offer);
		}
		
		 $('#product_grid').navGrid('#jqGridPager',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#product_grid"),
						  intervalId = setInterval(
						   function() 
						   {
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
		                    var rowId =$("#product_grid").jqGrid('getGridParam','selrow');  
		                       var rowData = jQuery("#product_grid").getRowData(rowId);
		                    	var quantity = rowData['quantity'];
		                    	var unitPrice = rowData['unitPrice'];
		                    	
		                    	var tota = quantity * unitPrice;
	                 		$("#product_grid").jqGrid("setCell", rowId, "total", tota);
	                 		
                 		var Total =0;
                 		var count = jQuery("#product_grid").jqGrid('getGridParam', 'records');
     		        	var allRowsInGrid1 = $('#product_grid').getGridParam('data');
     		        	var AllRows=JSON.stringify(allRowsInGrid1);
     		        	for (var k = 0; k < count; k++) {
     		        		var Total1 = allRowsInGrid1[k].total;
     		        		Total = +Total + +Total1;
     		        	}
     		        	document.getElementById("subtotal").value = Total;
     		        	document.getElementById("gst").value = "";
     		        	document.getElementById("vat").value = "";
     		        	document.getElementById("grossTotal").value = Total;  		        	 
		                    
		               }
	                    
	                 
	                    
	                });
		 
		 
			   });
			
		})
}

//------------Grid End of PURCHASE CREATE------------------

function getPurchaseGrid()
{
	if(document.po.productName.value=="" || document.po.productName.value==null)
		{
			alert('Please Enter Product Name');
			return false;
		}
	purchaseGrid();
}


function purchaseGrid()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var productName1=$('#productName').val();
	
	var input = document.getElementById('productName'),
	list = document.getElementById('productNameList'),

	i,produtId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			produtId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["productName1"] = productName1;
	params["produtId"] = produtId;
	params["methodName"] ="getPurchaseGrid";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			
			
			// $("#jqgrid").jqGrid("clearGridData", true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
				document.getElementById("productName").value = "";
		    	count = jQuery("#jqgrid").jqGrid('getGridParam', 'records'); 
			    var rowdata =$("#jqgrid").jqGrid('getGridParam','data');
			    var ids = jQuery("#jqgrid").jqGrid('getDataIDs');
			    
			    
			    document.getElementById("totalSubTotal").value = parseInt(0);
				document.getElementById("totalTaxAmount").value = parseInt(0);
				document.getElementById("grossTotal").value = parseInt(0);
				
				
				for(var k =0; k<v.length;k++)
					{
					var totalsubamt= parseInt(document.getElementById("totalSubTotal").value);
				    document.getElementById("totalSubTotal").value = totalsubamt + parseInt(v[k].subTotal);
				    
				    var totaltaxamt= parseInt(document.getElementById("totalTaxAmount").value);
				    document.getElementById("totalTaxAmount").value =  totaltaxamt + parseInt(v[k].taxAmount);
				    
				    var totalgrossamt= parseInt(document.getElementById("grossTotal").value);
					document.getElementById("grossTotal").value =  totalgrossamt + parseInt(v[k].total);
				    
					}
			    
			    var productName,com,packing,unit;
				
			    for (var j = 0; j < count; j++) 
			    {
			    	productName = rowdata[j].productName;
			    	
			    	var rowId = ids[j];
					var rowData = jQuery('#jqgrid').jqGrid ('getRowData', rowId);
					if (productName == jsonData.offer.productName) 
					{
				    	newrow=false;
						alert("Product Name Already Inserted !!!");
						var grid = jQuery("#jqgrid");
					    grid.trigger("reloadGrid");
				    	break;
					}
					else
					{
						newrow = true;
					}
				}
			    
			    if(newrow == true)
				 {
				  //$("#jqgrid").addRowData(i,jsonData[i]);
				  $("#jqgrid").addRowData(count,jsonData.offer);					
				 }
			    	
		$("#jqgrid").jqGrid({
			datatype: "local",
			
			colNames:['Product Name','Description','HSN/SAC','Unit Price','Quantity','Amount','Discount%','Discount Amt','SubTotal','GST%','IGST%','TAX AMT','Total'],
			colModel:[ 
				
			    {	name:'productName',
			    	 width:42,
			    	 //editable: true	
				},
				{	name:'description',
			    	 width:42,
			    	 editable: true	
				},
				{	name:'hsnSac',
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
				{	name:'discountPercent',
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
				{	name:'GST',
			    	 width:24,			    	 
			    	 editable: true
				},
				/*{	name:'SGST',
			    	 width:24,
			    	 editable: true
				},*/
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
			       /* 	Calculation of total after editing quantity*/
			        	   
			        	   // $(this).trigger('reloadGrid');
			        	    var rowId =$("#jqgrid").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#jqgrid").getRowData(rowId);
	                    	var unitPrice = rowData['unitPrice'];
	                    	var quantity = rowData['quantity'];
	                    	
	                    	
	                    	document.getElementById('totalSubTotal').value = 0;
	                    	/* 	Calculation of Amount after editing quantity*/
	                    	var amount = (unitPrice * quantity);
	                    	$("#jqgrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
	                    	
	                    	/* 	Calculation of discountAmount after editing discountPercent*/
	                    	var discountPercent = rowData['discountPercent'];	        		        	
        		        	var discountAmount = (amount * discountPercent) / 100;
        		        	$("#jqgrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
        		        	var subTotal = amount-discountAmount;
        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
        		        	$("#jqgrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));        		        	
        		        	
        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
        		        	
        		        	
        		        	
        		        	//var CGST = rowData['CGST'];
        		        	/*function fsdfs(CGST)
          			    	 {
          			    		 CGST = (CGST) ? CGST : window.event;
          			    	 	var charCode = (CGST.which) ? CGST.which : CGST.keyCode;
          			    	 	if (charCode > 31 && (charCode < 48 || charCode > 57 ) && (charCode < 46 || charCode > 46))
          			    	 	{
          			    	 		alert("Please Enter Number Only");
          			    	 	//$("#jqgrid").jqGrid('getGridParam','selrow').focus();
          			    	 		return false;
          			    	 	}
          			    	 	return true;
          			    	 }*/
        		        	
        		        	//var CGSTAmount = (subTotal * CGST) / 100;
        		        	var GST = rowData['GST']; 		        	
        		        	var GSTAmount = (subTotal * GST) / 100;
        		        	var IGST = rowData['IGST']; 		        	
        		        	var IGSTAmount = (subTotal * IGST) / 100;
        		        	var taxAmount = (GSTAmount + IGSTAmount);
        		        	/*var taxAmount = 0.00;
        		        	
        		        	if(taxAmount=="" || taxAmount==null || taxAmount==undefined || taxAmount==0.00)
        		    		{
        		        		taxAmount = (CGSTAmount + SGSTAmount);
        		        		
        		    			//alert("Please Enter total");
        		    			//allRowsInGrid[i].total.focus();
        		    			//return false;
        		    		}
        		        	if(taxAmount=="" || taxAmount==null || taxAmount==undefined || taxAmount==0.00)
        		    		{
        		        		taxAmount = IGSTAmount;
        		        		
        		    			//alert("Please Enter total");
        		    			//allRowsInGrid[i].total.focus();
        		    			//return false;
        		    		} 
        		        	
        		        	if(CGST > 0 || SGST > 0 && IGST > 0)
        		    		{
        		    			alert("Please Enter CGST and SGST or IGST only");
        		    			//allRowsInGrid[i].total.focus();
        		    			return false;
        		    		}*/
        		        	
        		        	$("#jqgrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of Total after editing CGST and SGST or IGST% */        		        	
	                    	var total = subTotal + taxAmount;
                    		$("#jqgrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
                    		
                    		var grossTotal = 0;
                    		var totalSubTotal = 0;
                    		var totalTaxAmount = 0;
                    		var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#jqgrid').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		var grossTotal1 = allRowsInGrid1[k].total;
        		        		grossTotal = +grossTotal + +grossTotal1;
        		        		
        		        		var totalSubTotal1 = allRowsInGrid1[k].subTotal;
        		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
        		        		
        		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
        		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
        		        	}
        		        	document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
	     		        	document.getElementById("totalTaxAmount").value = totalTaxAmount.toFixed(2);
	     		        	document.getElementById("grossTotal").value = grossTotal.toFixed(2);
	        	},
           
			pager: "#jqGridPager",
		});
				
		//$("#jqgrid").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#jqgrid").addRowData(i,jsonData[i]);
			  $("#jqgrid").addRowData(0,jsonData.offer);
		}
		     
		 $('#jqgrid').navGrid('#jqGridPager',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#jqgrid"),
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
				        	    var rowId =$("#jqgrid").jqGrid('getGridParam','selrow');  
		                        var rowData = jQuery("#jqgrid").getRowData(rowId);
		                    	var unitPrice = rowData['unitPrice'];
		                    	var quantity = rowData['quantity'];
		                    	
		                    	
		                    	
		                    	
		                    	/* 	Calculation of Amount after editing quantity*/
		                    	var amount = (unitPrice * quantity);
		                    	$("#jqgrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
		                    	
		                    	/* 	Calculation of discountAmount after editing discountPercent*/
		                    	var discountPercent = rowData['discountPercent'];	        		        	
	        		        	var discountAmount = (amount * discountPercent) / 100;
	        		        	$("#jqgrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
	        		        	var subTotal = amount-discountAmount;
	        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
	        		        	$("#jqgrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
	        		        	
	        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
	        		        	//var CGST = rowData['CGST']; 		        	
	        		        	//var CGSTAmount = (subTotal * CGST) / 100;
	        		        	var GST = rowData['SGST']; 		        	
	        		        	var GSTAmount = (subTotal * GST) / 100;
	        		        	var IGST = rowData['IGST']; 		        	
	        		        	var IGSTAmount = (subTotal * IGST) / 100;
	        		        	var taxAmount = (GSTAmount + IGSTAmount);	        		        	       		        	
	        		        	$("#jqgrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of Total after editing GST or IGST% */        		        	
		                    	var total = subTotal + taxAmount;
	                    		$("#jqgrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
	                    		
	                    		var grossTotal = 0;
	                    		var totalSubTotal = 0;
	                    		var totalTaxAmount = 0;
	                    		var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#jqgrid').getGridParam('data');
	        		        	var AllRows=JSON.stringify(allRowsInGrid1);
	        		        	for (var k = 0; k < count; k++) {
	        		        		var grossTotal1 = allRowsInGrid1[k].total;
	        		        		grossTotal = +grossTotal + +grossTotal1;
	        		        		
	        		        		var totalSubTotal1 = allRowsInGrid1[k].subTotal;
	        		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
	        		        		
	        		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
	        		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
	        		        	}
	        		        	document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
		     		        	document.getElementById("totalTaxAmount").value = totalTaxAmount.toFixed(2);
		     		        	document.getElementById("grossTotal").value = grossTotal.toFixed(2);     		        	
	                  }
	                });	 
			});				
		})	
}


//Start-------------Gst and Gross Total Calculation of PURCHASE ORDER CREATE--------------
function getVatTotal()
{
	var vatValue;
	//var gst = document.getElementById('gst').val();
	var gst = $('#gst').val();
	var subTotal = $('#subtotal').val();
	
	
	vatValue = (gst)*(subTotal)/100;
	
	document.getElementById('vat').value=vatValue;
	
	
	var grossTotal = +subTotal + +vatValue;
	
	document.getElementById('grossTotal').value=grossTotal;

}


//Start-------------Gst and Gross Total Calculation of PURCHASE ORDER CREATE--------------
function getVatTotalAfterDelete()
{
	var vatValue;
	//var gst = document.getElementById('gst').val();
	var gst = $('#gst').val();
	var subTotal = $('#subtotal').val();
	
	
	vatValue = (gst)*(subTotal)/100;
	
	document.getElementById('vat').value=vatValue;
	
	
	var grossTotal = +subTotal + +vatValue;
	
	document.getElementById('grossTotal').value=grossTotal;

}


//validation for purchase Order Create Info
function purchaseOrderCreateValidation()
{
	
	if(document.po.fk_vendor_id.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Select Vendor Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Select Vendor Name.");
		return false;
	}	
	
	if(document.po.vendorcompanyname.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Enter Vendor Company Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Vendor Company Name.");
		return false;
	}
	
	if(document.po.contactno.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Enter Contact Number..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Contact Number.");
		return false;
	}
	
	if(document.po.companyAddress.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Enter Company Address..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Company Address.");
		return false;
	}
	
	if(document.po.panNumber.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Enter PAN No..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter PAN No.");
		return false;
	}
	
	/*if(document.po.city.value == "")
	{
		alert("Enter City Name.");
		return false;
	}
	
	if(document.po.zipcode.value == "")
	{
		alert("Enter Zipcode.");
		return false;
	}
	
	if(document.po.phone.value == "")
	{
		alert("Enter Phone Number.");
		return false;
	}
	
	if(document.po.fax.value == "")
	{
		alert("Enter Fax Number.");
		return false;
	}*/
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	
	if(count <= 0)
	{
		swal({
	
		     title: "Alert!",
		     text: "Enter Product Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:true
		});
		//alert("Enter Product Name");
		return false;
	}
	
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{
		var productName = allRowsInGrid[i].productName;
		var description = allRowsInGrid[i].description;
		var hsnSac = allRowsInGrid[i].hsnSac;
		var unitPrice = allRowsInGrid[i].unitPrice;
		var quantity = allRowsInGrid[i].quantity;		
		var amount = allRowsInGrid[i].amount;
		var discountPercent = allRowsInGrid[i].discountPercent;
		var discountAmount = allRowsInGrid[i].discountAmount;
		var subTotal = allRowsInGrid[i].subTotal;
		//var CGST = allRowsInGrid[i].CGST;
		var GST = allRowsInGrid[i].GST;
		var IGST = allRowsInGrid[i].IGST;
		var taxAmount = allRowsInGrid[i].taxAmount;
		var total = allRowsInGrid[i].total;
		
		
		if(productName=="" || productName==null || productName==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Product/Resources Name..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Product/Resourcen Name");
			//allRowsInGrid[i].productName.focus();
			return false;
		}
		if(description=="" || description==null || description==undefined)
		{	
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Description..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Description");
			//allRowsInGrid[i].description.focus();
			return false;
		}
		if(hsnSac=="" || hsnSac==null || hsnSac==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter HSN/SAC..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			alert("Please Enter HSN/SAC");
			//allRowsInGrid[i].hsnSac.focus();
			return false;
		}
		if(unitPrice=="" || unitPrice==null || unitPrice==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Unit Price..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Unit Price");
			//allRowsInGrid[i].unitPrice.focus();
			return false;
		}
		if(quantity=="" || quantity==null || quantity==undefined)
		{	
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Quantity..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Quantity");
			//allRowsInGrid[i].quantity.focus();
			return false;
		}
		if(amount=="" || amount==null || amount==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Amount..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Amount");
			//allRowsInGrid[i].amount.focus();
			return false;
		}
		if(discountPercent=="" || discountPercent==null || discountPercent==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Discount Percent..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Discount Percent");
			//allRowsInGrid[i].discountPercent.focus();
			return false;
		}
		if(discountAmount=="" || discountAmount==null || discountAmount==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Discount Amount..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Discount Amount");
			//allRowsInGrid[i].discountAmount.focus();
			return false;
		}
		
		if(GST=="" || GST==null || GST==undefined || IGST=="" || IGST==null || IGST==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter GST Or IGST..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter GST Or IGST");
			//allRowsInGrid[i].discountAmount.focus();
			return false;
		}
		
		/*if(GST=="" || GST==null || GST==undefined)
		{			
			GST =0;
		}
		if(IGST=="" || IGST==null || IGST==undefined)
		{
			IGST =0;
		}*/
		var GSTPercent = GST;
		var IGSTPercent = IGST;
		if(GSTPercent > 0 && IGSTPercent > 0)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter GST Or IGST Only, Both Taxes are not allowed (GST and IGST)..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter GST Or IGST Only, Both Taxes are not allowed (GST and IGST)");
			//allRowsInGrid[i].GST.focus();
			return false;
		}
		/*if(CGST > 0 && SGST <= 0)
		{
			alert("Please Enter CGST and SGST Both");
			//allRowsInGrid[i].SGST.focus();
			return false;
		}
		if(SGST > 0 && CGST <= 0)
		{
			alert("Please Enter CGST and SGST Both");
			//allRowsInGrid[i].CGST.focus();
			return false;
		}*/
		
		if(taxAmount=="" || taxAmount==null || taxAmount==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Tax Amount..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Tax Amount");
			//allRowsInGrid[i].taxAmount.focus();
			return false;
		}
		if(total=="" || total==null || total==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter total..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter total");
			//allRowsInGrid[i].total.focus();
			return false;
		}
	}
	

	purchaseOrderCreateInfo();
	
}

//add and store info of purchase Order Create Info
function purchaseOrderCreateInfo()
{
	var params = {};
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	//get vendorName through pkId(fkVendorId)
	/*var vendorName = $('#fkVendorId').val();
	
	var input1 = document.getElementById('fkVendorId'),
	list = document.getElementById('vendorNamesList'), i, fkVendorId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}*/
	
//	var billDate = $('#billDate').val();
//	var billPeriodStartDate = $('#billPeriodStartDate').val();
//	var billPeriodEndDate = $('#billPeriodEndDate').val();
	
	for(var i=0;i<count;i++)
	{
		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
		
		var description = allRowsInGrid[i].description;
		params["description"+i] = description;
		
		var hsnSac = allRowsInGrid[i].hsnSac;
		params["hsnSac"+i] = hsnSac;
		
		var unitPrice = allRowsInGrid[i].unitPrice;
		params["unitPrice"+i] = unitPrice;
		
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i] = quantity;
		
		var amount = allRowsInGrid[i].amount;
		params["amount"+i] = amount;
		
		var discountPercent = allRowsInGrid[i].discountPercent;
		params["discountPercent"+i] = discountPercent;
		
		var discountAmount = allRowsInGrid[i].discountAmount;
		params["discountAmount"+i] = discountAmount;
		
		var subTotal = allRowsInGrid[i].subTotal;
		params["subTotal"+i] = subTotal;
		
		var GST = allRowsInGrid[i].GST;
		params["GST"+i] = GST;
		
		//var SGST = allRowsInGrid[i].SGST;
		//params["SGST"+i] = SGST;
		
		var IGST = allRowsInGrid[i].IGST;
		params["IGST"+i] = IGST;
		
		var taxAmount = allRowsInGrid[i].taxAmount;
		params["taxAmount"+i] = taxAmount;
		
		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
	}
	
	var totalSubTotal = $('#totalSubTotal').val();
	var totalTaxAmount = $('#totalTaxAmount').val();
	var grossTotal = $('#grossTotal').val();
	
	params["count"] = count;	
	
//	params["vendorName"] = vendorName; 
//	params["fkVendorId"] = fkVendorId;
//	params["billDate"] = billDate;
//	params["billPeriodStartDate"] = billPeriodStartDate;
//	params["billPeriodEndDate"] = billPeriodEndDate;
	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;
	
	
	/*var params = {};
	
	var count = jQuery("#product_grid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#product_grid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	

	for(var i=0;i<count;i++)
	{
		var productDescription = allRowsInGrid[i].productDescription;
		params["productDescription"+i]=productDescription;
		
		var  quantity = allRowsInGrid[i].quantity;
		params["quantity"+i]=quantity;
		
		var unitPrice = allRowsInGrid[i].unitPrice;
		params["unitPrice"+i]=unitPrice;
		
		var total = allRowsInGrid[i].total;
		params["total"+i]=total;
		
	}*/
	
	var vendorname = $('#fk_vendor_id').val();
	var vendorcompanyname = $('#vendorcompanyname').val();
	var contactno = $('#contactno').val();
	var streetaddress = $('#streetaddress').val();
	var city = $('#city').val();
	var zipcode = $('#zipcode').val();
	var phone = $('#phone').val();
	var fax = $('#fax').val();
//	var subtotal = $('#subtotal').val();
//	var gst = $('#gst').val();
//	var vat = $('#vat').val();
//	var grossTotal = $('#grossTotal').val();
	
	var companyAddress = $('#companyAddress').val();
	var gstinNumber = $('#gstinNumber').val();
	var panNumber = $('#panNumber').val();
	var cinNumber = $('#cinNumber').val();
	

	
	if(city=="")
	{
		city = "N/A";
	}
	
	if(zipcode=="")
	{
		zipcode = "N/A";
	}
	
	
	if(streetaddress=="")
	{
		streetaddress = "N/A";
	}
	
	
	//params["count"] = count;
	
	params["vendorname"] = vendorname;
	params["vendorcompanyname"] = vendorcompanyname;
	params["contactno"] = contactno;
	params["streetaddress"] = streetaddress;
	params["city"] = city;
	params["zipcode"] = zipcode;
	params["phone"] = phone;
	params["fax"] = fax;
//	params["subtotal"] = subtotal;
//	params["gst"] = gst;
//	params["vat"] = vat;
//	params["grossTotal"] = grossTotal;
	
	params["companyAddress"] = companyAddress;
	params["gstinNumber"] = gstinNumber;
	params["panNumber"] = panNumber;
	params["cinNumber"] = cinNumber;

	

	params["methodName"] ="purchaseOrderReciveInfo";
	
	 $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		 		swal({
				     title: "Success!",
				     text: "Employee Details Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				 });
		 		//alert(data);
		 		window.open("Purchase_Order_RecivePDF.jsp");
		 		location.reload(true);
			}
	
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		
	    		}
	    	})
	    		    
}


function fetchPOEditbillno(){

	/*var input1 = document.getElementById('fk_vendor_id'),
	list = document.getElementById('vendorNameList'),
	i,fkVendorId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}*/
	
	var fkVendorId = $('#fk_vendor_id').val();

	$("#billno").empty();
	$("#billno").append($("<option></option>").attr("value","").text("Select Bill No"));
	var params= {};

	params["fkVendorId"]= fkVendorId;
	
	params["methodName"] = "getAllPOBillNoAgainst";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ 
			var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				$("#billno").append($("<option></option>").attr("value",i.billNo).text(v.billNo));
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}




function getVendorDetails()
{
	
	var input = document.getElementById('fk_vendor_id'),
	list = document.getElementById('vendorNameList'),

	i,fkRootSupId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
	
	var param ={};
	
	param["vendorId"] = fkVendorId;
	
	param["methodName"] = "getVendorInfo";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',param,function(data){
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				
					document.getElementById("vendorcompanyname").value = v.vendorCompanyName;
					document.getElementById("contactno").value = v.contactNumber;
					document.getElementById("streetaddress").value = v.streetAddress;
					document.getElementById("companyAddress").value = v.vendorCompanyAddress;
					document.getElementById("gstinNumber").value = v.gstInNumber;
					document.getElementById("panNumber").value = v.panNumber;
					document.getElementById("cinNumber").value = v.cimNumber;
					document.getElementById("city").value = v.city;
					document.getElementById("zipcode").value = v.zipCode;
					document.getElementById("phone").value = v.phone;
					
					
				});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});

	
}




//purchase Order Create List
function purchaseOrderCreateList()
{
	var params= {};

	params["methodName"] = "getAllPurchaseOrderCreateList";
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
					pageTotal = api.column( 8 ).data().reduce( function (a, b) {
						return intVal(a) + intVal(b);}, 0 );
				
					// Update footer
					$( api.column( 18 ).footer() ).html(''+' '+parseFloat(pageTotal).toFixed(2)
					);
					console.log( pageTotal);
				},
							

					

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [					
						  {"data": "srNO" , "width": "5%" ,"defaultContent": ""},
						  {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				       /*   {"data": "vendorCompanyName", "width": "5%" ,"defaultContent": ""},
				          {"data": "contactNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "streetAddress", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyAddress" , "width": "5%" ,"defaultContent": ""},
				          {"data": "gstinNumber", "width": "5%" ,"defaultContent": ""},
				          {"data": "panNumber", "width": "5%" ,"defaultContent": ""},
				          {"data": "cinNumber", "width": "5%" ,"defaultContent": ""},				          
				          {"data": "city" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zipCode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "phone" , "width": "5%" ,"defaultContent": ""},
				          {"data": "fax" , "width": "5%" ,"defaultContent": ""},*/
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "amount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountAmount" , "width": "5%" ,"defaultContent": ""},				          
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "GST", "width": "5%" ,"defaultContent": ""},
				          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
				          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          
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

//purchase Order Create Report
function purchaseOrderCreateReport()
{
	var params= {};

	params["methodName"] = "getpurchaseOrderCreateReport";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchaseOrderCreatelist').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}

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
					.column( 26 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 9 ).footer() ).html(

							''+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollY": true,
				"scrollX": true,
				columns: [					
						  {"data": "srNO" , "width": "5%" ,"defaultContent": ""},
						  {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "vendorCompanyName", "width": "5%" ,"defaultContent": ""},
				          {"data": "contactNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "streetAddress", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyAddress" , "width": "5%" ,"defaultContent": ""},
				          {"data": "gstinNumber", "width": "5%" ,"defaultContent": ""},
				          {"data": "panNumber", "width": "5%" ,"defaultContent": ""},
				          {"data": "cinNumber", "width": "5%" ,"defaultContent": ""},				          
				          {"data": "city" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zipCode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "phone" , "width": "5%" ,"defaultContent": ""},
				          {"data": "fax" , "width": "5%" ,"defaultContent": ""},
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "amount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountAmount" , "width": "5%" ,"defaultContent": ""},				          
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "GST", "width": "5%" ,"defaultContent": ""},
				          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
				          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Purchase Order Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Purchase Order Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Purchase Order Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Purchase Order Report";
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


function purchaseOrderReceiveList()
{

	var params= {};

	params["methodName"] = "getPurchaseOrderReceiveList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchaseOrderReceiveList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#purchaseOrderReceiveList').DataTable( {

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
					.column( 9 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 9 ).footer() ).html(

							''+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},	
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "billNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "purchaseDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          {"data": "subSotal", "width": "5%" ,"defaultContent": ""},
				          {"data": "gst", "width": "5%" ,"defaultContent": ""},
				          {"data": "gstAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "balanceStatus" , "width": "5%" ,"defaultContent": ""},
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Receive PO List";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					});
				});

		
		var mydata = catmap;
		$('#purchaseOrderReceiveList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});


}

//getVendorReceivedPOList
function getVendorReceivedPOList()
{
	var params= {};
	var vendor= $('#vendor').val();
	
	params["vendor"]= vendor;
	
	params["methodName"] = "getVendorRecords";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#typeWiseReport').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$(document).ready(function() {
			$('#typeWiseReport').DataTable( {

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
					.column( 15 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 15 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
					
					  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
					  {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "billNo", "width": "5%" ,"defaultContent": ""},
			          {"data": "purchaseDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
			          {"data": "productName", "width": "5%" ,"defaultContent": ""},
			          {"data": "buyPrice" , "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridDiscountPercent" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridDiscountAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridSubTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridGstPercent" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridGstAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
			          {"data": "subSotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gst" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gstAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "balanceStatus" , "width": "5%" ,"defaultContent": ""},
			          
			          ],
			} );
		} );
		var mydata = catmap;
		$('#typeWiseReport').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

//getClientReceivedPOList
function getClientReceivedPOList()
{

	var params= {};
	var client= $('#client').val();

	params["client"]= client;
	
	params["methodName"] = "getClientRecords";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#typeWiseReport').dataTable().fnClearTable();

		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$(document).ready(function() {
			$('#typeWiseReport').DataTable( {

				
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
					.column( 15 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

				// Update footer
					$( api.column( 15 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [

 					  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
					  {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "billNo", "width": "5%" ,"defaultContent": ""},
			          {"data": "purchaseDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
			          {"data": "productName", "width": "5%" ,"defaultContent": ""},
			          {"data": "buyPrice" , "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridDiscountPercent" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridDiscountAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridSubTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridGstPercent" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridGstAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
			          {"data": "subSotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gst" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gstAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "balanceStatus" , "width": "5%" ,"defaultContent": ""},
			          
			          ],
			} );
		} );
		var mydata = catmap;
		$('#typeWiseReport').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

	
}


// Get Client Records
function getClientDetailas()
{

	var params= {};
	var client= $('#client').val();

	params["client"]= client;
	
	params["methodName"] = "getClientRecords";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#typeWiseReport').dataTable().fnClearTable();

		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$(document).ready(function() {
			$('#typeWiseReport').DataTable( {

				
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
					.column( 15 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

				// Update footer
					$( api.column( 15 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [

 					  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
					  {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "billNo", "width": "5%" ,"defaultContent": ""},
			          {"data": "purchaseDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
			          {"data": "productName", "width": "5%" ,"defaultContent": ""},
			          {"data": "buyPrice" , "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridDiscountPercent" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridDiscountAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridSubTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridGstPercent" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gridGstAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
			          {"data": "subSotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gst" , "width": "5%" ,"defaultContent": ""},
			          {"data": "gstAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "balanceStatus" , "width": "5%" ,"defaultContent": ""},
			          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Receive PO Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Receive PO Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Receive PO Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Receive PO Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#typeWiseReport').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

	
}

function getPOBillNo()
{
	var params= {};
	
	/*var input1 = document.getElementById('fk_vendor_id'),
	list = document.getElementById('vendorNameList'),
	i,fkVendorId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}*/
	
	var fkVendorId = $('#fk_vendor_id').val();
	
		$("#billno").empty();
		$("#billno").append($("<option></option>").attr("value","").text("Select Bill No"));
		
		params["fkVendorId"]= fkVendorId;
		
		params["methodName"] = "getPOBillNo";
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
				{ 
				var count = 1;

				var jsonData = $.parseJSON(data);
				$.each(jsonData,function(i,v)
						
						{
							$("#billno").append($("<option></option>").attr("value",i.pkVendorId).text(v.billNo)); 
							count++;
						});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
	
}

function getPODate()
{
	var params= {};
	
	var billno = $('#billno').val();
	//var billno = document.getElementById("billno").value;
	
	$("#purchasedate").empty();
	$("#purchasedate").append($("<input></input>").attr("value","").text());
	
	params["billno"]= billno;
	
	params["methodName"] = "getPODate";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
			{ 

		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				
				{
			
			document.getElementById("purchasedate").value = v.poDate;
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					
				}
			});
	
}



function getPurchaseFieldsInfo()
{
	var params= {};
	
	var billno = $('#billno').val();
	
	//$("#purchasedate").empty();
	//$("#purchasedate").append($("<input></input>").attr("value","").text());
	/*$("#fk_vendor_id").empty();
	$("#fk_vendor_id").append($("<input></input>").attr("value","").text());*/
	$("#vendorcompanyname").empty();
	$("#vendorcompanyname").append($("<input></input>").attr("value","").text());
	$("#contactno").empty();
	$("#contactno").append($("<input></input>").attr("value","").text());
	$("#streetaddress").empty();
	$("#streetaddress").append($("<input></input>").attr("value","").text());
	$("#companyAddress").empty();
	$("#companyAddress").append($("<input></input>").attr("value","").text());
	$("#gstinNumber").empty();
	$("#gstinNumber").append($("<input></input>").attr("value","").text());
	$("#panNumber").empty();
	$("#panNumber").append($("<input></input>").attr("value","").text());
	$("#cinNumber").empty();
	$("#cinNumber").append($("<input></input>").attr("value","").text());
	$("#city").empty();
	$("#city").append($("<input></input>").attr("value","").text());
	$("#zipcode").empty();
	$("#zipcode").append($("<input></input>").attr("value","").text());
	$("#phone").empty();
	$("#phone").append($("<input></input>").attr("value","").text());
	$("#fax").empty();
	$("#fax").append($("<input></input>").attr("value","").text());
	
	params["billno"]= billno;
	
	params["methodName"] = "getPurchaseFieldsInfo";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
			{ 

		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				
				{
			
			//document.getElementById("fk_vendor_id").value = v.vendorName;
			document.getElementById("vendorcompanyname").value = v.vendorCompanyName;
			document.getElementById("contactno").value = v.contactNo;
			document.getElementById("streetaddress").value = v.streetAddress;
			document.getElementById("companyAddress").value = v.companyAddress;
			document.getElementById("gstinNumber").value = v.gstinNumber;
			document.getElementById("panNumber").value = v.panNumber;
			document.getElementById("cinNumber").value = v.cinNumber;
			document.getElementById("city").value = v.city;
			document.getElementById("zipcode").value = v.zipCode;
			document.getElementById("phone").value = v.phone;
			document.getElementById("fax").value = v.fax;
			document.getElementById("totalSubTotal").value = v.totalSubTotal;
			document.getElementById("totalTaxAmount").value = v.totalTaxAmount;
			document.getElementById("grossTotal").value = v.grossTotal;
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					
				}
			});
	
}



function getPurchaseGridInfo()
{
	if(document.editPo.billno.value=="" || document.editPo.billno.value==null)
		{
			alert('Please Enter Bill Number..!!');
			return false;
		}
	getPurchaseGridInfo1();
}


function getPurchaseGridInfo1()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var billno1=$('#billno').val();
	
	params["billno"] = billno1;
	
	params["methodName"] ="getPOEditGrid";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			// $("#jqgrid").jqGrid("clearGridData", true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
				document.getElementById("billno").value = "";
				
		    	count = jQuery("#jqgrid").jqGrid('getGridParam', 'records'); 
			    var rowdata =$("#jqgrid").jqGrid('getGridParam','data');
			    var ids = jQuery("#jqgrid").jqGrid('getDataIDs');
			    
			    var productName,com,packing,unit;
				
			    for (var j = 0; j < count; j++) 
			    {
			    	productName = rowdata[j].productName;
			    	
			    	var rowId = ids[j];
					var rowData = jQuery('#jqgrid').jqGrid ('getRowData', rowId);
					if (productName == jsonData.offer.productName) 
					{
				    	newrow=false;
						alert("Product Name Already Inserted !!!");
						var grid = jQuery("#jqgrid");
					    grid.trigger("reloadGrid");
				    	break;
					}
					else
					{
						newrow = true;
					}
				}
			    
			    if(newrow == true)
				 {
				  //$("#jqgrid").addRowData(i,jsonData[i]);
				  $("#jqgrid").addRowData(count,jsonData.offer);					
				 }
			    	
		$("#jqgrid").jqGrid({
			datatype: "local",
			
			colNames:['Product Name','Description','HSN/SAC','Unit Price','Quantity','Amount','Discount%','Discount Amt','SubTotal','GST%','IGST%','TAX AMT','Total','BillNo','pkVendorId'],
			colModel:[ 
				
			    {	name:'productName',
			    	 width:42,
			    	 //editable: true	
				},
				{	name:'description',
			    	 width:42,
			    	 editable: true	
				},
				{	name:'hsnSac',
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
				{	name:'discountPercent',
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
				{	name:'GST',
			    	 width:24,			    	 
			    	 editable: true
				},
				/*{	name:'SGST',
			    	 width:24,
			    	 editable: true
				},*/
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
				{	name:'billNo',
					width:40,
					hidden:true,
				},					
				{	name:'pkVendorId',
					width:40,
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
			       /* 	Calculation of total after editing quantity*/
			        	   
			        	   // $(this).trigger('reloadGrid');
			        	    var rowId =$("#jqgrid").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#jqgrid").getRowData(rowId);
	                    	var unitPrice = rowData['unitPrice'];
	                    	var quantity = rowData['quantity'];
	                    	
	                    	/* 	Calculation of Amount after editing quantity*/
	                    	var amount = (unitPrice * quantity);
	                    	$("#jqgrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
	                    	
	                    	/* 	Calculation of discountAmount after editing discountPercent*/
	                    	var discountPercent = rowData['discountPercent'];	        		        	
        		        	var discountAmount = (amount * discountPercent) / 100;
        		        	$("#jqgrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
        		        	var subTotal = amount-discountAmount;
        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
        		        	$("#jqgrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));        		        	
        		        	
        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
        		        	
        		        	
        		        	
        		        	//var CGST = rowData['CGST'];
        		        	/*function fsdfs(CGST)
          			    	 {
          			    		 CGST = (CGST) ? CGST : window.event;
          			    	 	var charCode = (CGST.which) ? CGST.which : CGST.keyCode;
          			    	 	if (charCode > 31 && (charCode < 48 || charCode > 57 ) && (charCode < 46 || charCode > 46))
          			    	 	{
          			    	 		alert("Please Enter Number Only");
          			    	 	//$("#jqgrid").jqGrid('getGridParam','selrow').focus();
          			    	 		return false;
          			    	 	}
          			    	 	return true;
          			    	 }*/
        		        	
        		        	//var CGSTAmount = (subTotal * CGST) / 100;
        		        	var GST = rowData['GST']; 		        	
        		        	var GSTAmount = (subTotal * GST) / 100;
        		        	var IGST = rowData['IGST']; 		        	
        		        	var IGSTAmount = (subTotal * IGST) / 100;
        		        	var taxAmount = (GSTAmount + IGSTAmount);
        		        	/*var taxAmount = 0.00;
        		        	
        		        	if(taxAmount=="" || taxAmount==null || taxAmount==undefined || taxAmount==0.00)
        		    		{
        		        		taxAmount = (CGSTAmount + SGSTAmount);
        		        		
        		    			//alert("Please Enter total");
        		    			//allRowsInGrid[i].total.focus();
        		    			//return false;
        		    		}
        		        	if(taxAmount=="" || taxAmount==null || taxAmount==undefined || taxAmount==0.00)
        		    		{
        		        		taxAmount = IGSTAmount;
        		        		
        		    			//alert("Please Enter total");
        		    			//allRowsInGrid[i].total.focus();
        		    			//return false;
        		    		} 
        		        	
        		        	if(CGST > 0 || SGST > 0 && IGST > 0)
        		    		{
        		    			alert("Please Enter CGST and SGST or IGST only");
        		    			//allRowsInGrid[i].total.focus();
        		    			return false;
        		    		}*/
        		        	
        		        	$("#jqgrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of Total after editing CGST and SGST or IGST% */        		        	
	                    	var total = subTotal + taxAmount;
                    		$("#jqgrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
                    		
                    		var grossTotal = 0;
                    		var totalSubTotal = 0;
                    		var totalTaxAmount = 0;
                    		var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#jqgrid').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		var grossTotal1 = allRowsInGrid1[k].total;
        		        		grossTotal = +grossTotal + +grossTotal1;
        		        		
        		        		var totalSubTotal1 = allRowsInGrid1[k].subTotal;
        		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
        		        		
        		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
        		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
        		        	}
        		        	document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
	     		        	document.getElementById("totalTaxAmount").value = totalTaxAmount.toFixed(2);
	     		        	document.getElementById("grossTotal").value = grossTotal.toFixed(2);
	        	},
           
			pager: "#jqGridPager",
		});
				
		//$("#jqgrid").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#jqgrid").addRowData(i,jsonData[i]);
			  $("#jqgrid").addRowData(0,jsonData.offer);
		}
		     
		 $('#jqgrid').navGrid('#jqGridPager',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#jqgrid"),
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
		                    var rowId =$("#list4").jqGrid('getGridParam','selrow');  
		                    var rowData = jQuery("#list5").getRowData(rowId);
		                    document.getElementById('totalSubTotal').value = 0;
		                   // totalSubTotal
	                 	
	                 		var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	     		        	var allRowsInGrid1 = $('#jqgrid').getGridParam('data');
	     		        	var AllRows=JSON.stringify(allRowsInGrid1);

	     		        	
		                    	var unitPrice = rowData['unitPrice'];
		                    	var quantity = rowData['quantity'];
		                    	
		                    	/* 	Calculation of Amount after editing quantity*/
		                    	var amount = (unitPrice * quantity);
		                    	$("#jqgrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
		                    	
		                    	/* 	Calculation of discountAmount after editing discountPercent*/
		                    	var discountPercent = rowData['discountPercent'];	        		        	
	        		        	var discountAmount = (amount * discountPercent) / 100;
	        		        	$("#jqgrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
	        		        	var subTotal = amount-discountAmount;
	        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
	        		        	$("#jqgrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
	        		        	
	        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
	        		        	//var CGST = rowData['CGST']; 		        	
	        		        	//var CGSTAmount = (subTotal * CGST) / 100;
	        		        	var GST = rowData['SGST']; 		        	
	        		        	var GSTAmount = (subTotal * GST) / 100;
	        		        	var IGST = rowData['IGST']; 		        	
	        		        	var IGSTAmount = (subTotal * IGST) / 100;
	        		        	var taxAmount = (GSTAmount + IGSTAmount);	        		        	       		        	
	        		        	$("#jqgrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of Total after editing GST or IGST% */        		        	
		                    	var total = subTotal + taxAmount;
	                    		$("#jqgrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
	                    		
	                    		var grossTotal = 0;
	                    		var totalSubTotal = 0;
	                    		var totalTaxAmount = 0;
	                    		var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#jqgrid').getGridParam('data');
	        		        	var AllRows=JSON.stringify(allRowsInGrid1);
	        		        	for (var k = 0; k < count; k++) {
	        		        		var grossTotal1 = allRowsInGrid1[k].total;
	        		        		grossTotal = +grossTotal + +grossTotal1;
	        		        		
	        		        		var totalSubTotal1 = allRowsInGrid1[k].subTotal;
	        		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
	        		        		
	        		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
	        		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
	        		        	}
	        		        	document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
		     		        	document.getElementById("totalTaxAmount").value = totalTaxAmount.toFixed(2);
		     		        	document.getElementById("grossTotal").value = grossTotal.toFixed(2);     		        	
	                  }
	                });	 
			});				
		})	
}



//validation for Update purchase Order Create Info
function updatePurchaseOrderValidation()
{
	
	if(document.editPo.fk_vendor_id.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Select Vendor Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Select Vendor Name.");
		return false;
	}	
	if(document.editPo.vendorcompanyname.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Enter Vendor Company Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Vendor Company Name.");
		return false;
	}
	
	if(document.editPo.contactno.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Enter Contact Number..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Contact Number.");
		return false;
	}
	
	if(document.editPo.companyAddress.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Enter Company Address..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Company Address.");
		return false;
	}
	
	if(document.editPo.panNumber.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Enter PAN No..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter PAN No.");
		return false;
	}
	

	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	
	if(count <= 0)
	{
		swal({
	
		     title: "Alert!",
		     text: "Select Bill Number..!",
		     icon: 'error',
		     timer: 2500,
		     button:true
		});
		return false;
	}
	
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{
		var productName = allRowsInGrid[i].productName;
		var description = allRowsInGrid[i].description;
		var hsnSac = allRowsInGrid[i].hsnSac;
		var unitPrice = allRowsInGrid[i].unitPrice;
		var quantity = allRowsInGrid[i].quantity;		
		var amount = allRowsInGrid[i].amount;
		var discountPercent = allRowsInGrid[i].discountPercent;
		var discountAmount = allRowsInGrid[i].discountAmount;
		var subTotal = allRowsInGrid[i].subTotal;
		//var CGST = allRowsInGrid[i].CGST;
		var GST = allRowsInGrid[i].GST;
		var IGST = allRowsInGrid[i].IGST;
		var taxAmount = allRowsInGrid[i].taxAmount;
		var total = allRowsInGrid[i].total;
		
		
		if(productName=="" || productName==null || productName==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Product/Resources Name..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Product/Resourcen Name");
			//allRowsInGrid[i].productName.focus();
			return false;
		}
		if(description=="" || description==null || description==undefined)
		{	
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Description..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Description");
			//allRowsInGrid[i].description.focus();
			return false;
		}
		if(hsnSac=="" || hsnSac==null || hsnSac==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter HSN/SAC..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			alert("Please Enter HSN/SAC");
			//allRowsInGrid[i].hsnSac.focus();
			return false;
		}
		if(unitPrice=="" || unitPrice==null || unitPrice==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Unit Price..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Unit Price");
			//allRowsInGrid[i].unitPrice.focus();
			return false;
		}
		if(quantity=="" || quantity==null || quantity==undefined)
		{	
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Quantity..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Quantity");
			//allRowsInGrid[i].quantity.focus();
			return false;
		}
		if(amount=="" || amount==null || amount==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Amount..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Amount");
			//allRowsInGrid[i].amount.focus();
			return false;
		}
		/*if(discountPercent=="" || discountPercent==null || discountPercent==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Discount Percent..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Discount Percent");
			//allRowsInGrid[i].discountPercent.focus();
			return false;
		}
		if(discountAmount=="" || discountAmount==null || discountAmount==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Discount Amount..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Discount Amount");
			//allRowsInGrid[i].discountAmount.focus();
			return false;
		}
		*/
		if(GST==="" || GST===null || GST===undefined || IGST==="" || IGST===null || IGST===undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter GST Or IGST..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter GST Or IGST");
			//allRowsInGrid[i].discountAmount.focus();
			return false;
		}
		
		/*if(GST=="" || GST==null || GST==undefined)
		{			
			GST =0;
		}
		if(IGST=="" || IGST==null || IGST==undefined)
		{
			IGST =0;
		}*/
		var GSTPercent = GST;
		var IGSTPercent = IGST;
		if(GSTPercent > 0 && IGSTPercent > 0)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter GST Or IGST Only, Both Taxes are not allowed (GST and IGST)..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter GST Or IGST Only, Both Taxes are not allowed (GST and IGST)");
			//allRowsInGrid[i].GST.focus();
			return false;
		}
		/*if(CGST > 0 && SGST <= 0)
		{
			alert("Please Enter CGST and SGST Both");
			//allRowsInGrid[i].SGST.focus();
			return false;
		}
		if(SGST > 0 && CGST <= 0)
		{
			alert("Please Enter CGST and SGST Both");
			//allRowsInGrid[i].CGST.focus();
			return false;
		}*/
		
		if(taxAmount=="" || taxAmount==null || taxAmount==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter Tax Amount..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter Tax Amount");
			//allRowsInGrid[i].taxAmount.focus();
			return false;
		}
		if(total=="" || total==null || total==undefined)
		{
			swal({
		     	title: "Alert!",
		     	text: "Please Enter total..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter total");
			//allRowsInGrid[i].total.focus();
			return false;
		}
	}
	

	updatePurchaseOrderInfo();
	
}

//add and store info of purchase Order Create Info
function updatePurchaseOrderInfo()
{
	var params = {};
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);

	
	for(var i=0;i<count;i++)
	{
		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
		
		var description = allRowsInGrid[i].description;
		params["description"+i] = description;
		
		var hsnSac = allRowsInGrid[i].hsnSac;
		params["hsnSac"+i] = hsnSac;
		
		var unitPrice = allRowsInGrid[i].unitPrice;
		params["unitPrice"+i] = unitPrice;
		
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i] = quantity;
		
		var amount = allRowsInGrid[i].amount;
		params["amount"+i] = amount;
		
		var discountPercent = allRowsInGrid[i].discountPercent;
		params["discountPercent"+i] = discountPercent;
		
		var discountAmount = allRowsInGrid[i].discountAmount;
		params["discountAmount"+i] = discountAmount;
		
		var subTotal = allRowsInGrid[i].subTotal;
		params["subTotal"+i] = subTotal;
		
		var GST = allRowsInGrid[i].GST;
		params["GST"+i] = GST;
		
		//var SGST = allRowsInGrid[i].SGST;
		//params["SGST"+i] = SGST;
		
		var IGST = allRowsInGrid[i].IGST;
		params["IGST"+i] = IGST;
		
		var taxAmount = allRowsInGrid[i].taxAmount;
		params["taxAmount"+i] = taxAmount;
		
		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
		
		var billNo = allRowsInGrid[i].billNo;
		params["billNo"+i] = billNo;
		
		var pkVendorId = allRowsInGrid[i].pkVendorId;
		params["pkVendorId"+i] = pkVendorId;
	}
	
	var totalSubTotal = $('#totalSubTotal').val();
	var totalTaxAmount = $('#totalTaxAmount').val();
	var grossTotal = $('#grossTotal').val();
	
	params["count"] = count;	

	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;
	
	
	var vendorname = $('#fk_vendor_id').val();
	var vendorcompanyname = $('#vendorcompanyname').val();
	var contactno = $('#contactno').val();
	var streetaddress = $('#streetaddress').val();
	var city = $('#city').val();
	var zipcode = $('#zipcode').val();
	var phone = $('#phone').val();
	var fax = $('#fax').val();

	
	var companyAddress = $('#companyAddress').val();
	var gstinNumber = $('#gstinNumber').val();
	var panNumber = $('#panNumber').val();
	var cinNumber = $('#cinNumber').val();
	

	
	if(city=="")
	{
		city = "N/A";
	}
	
	if(zipcode=="")
	{
		zipcode = "N/A";
	}
	
	
	if(streetaddress=="")
	{
		streetaddress = "N/A";
	}
	
	
	//params["count"] = count;
	
	params["vendorname"] = vendorname;
	params["vendorcompanyname"] = vendorcompanyname;
	params["contactno"] = contactno;
	params["streetaddress"] = streetaddress;
	params["city"] = city;
	params["zipcode"] = zipcode;
	params["phone"] = phone;
	params["fax"] = fax;
	
	params["companyAddress"] = companyAddress;
	params["gstinNumber"] = gstinNumber;
	params["panNumber"] = panNumber;
	params["cinNumber"] = cinNumber;

	
	params["methodName"] ="updatePurchaseOrderInfo";
	
	 $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		 		swal({
				     title: "Success!",
				     text: "Purchased Order Updated Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				 });
		 		//alert(data);
		 		window.open("Purchase_Order_RecivePDF.jsp");
		 		location.reload(true);
			}
	
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		
	    		}
	    	})
	    		    
}

function purchaseReportRangeWise()
{
	var params = {};
	var startDate = $('#fisDate4').val();
	var endDate = $('#endDate4').val();
	
	if(startDate == null || startDate == undefined || startDate == "")
		{
		swal({
	     	title: "Alert!",
	     	text: "Please Enter Start Date..!",
	     	icon: 'error',
	     	timer: 2500,
	     	button:false
		});
		return false;
		  
		}
	
	if(endDate == null || endDate == undefined || endDate == "")
	{
		swal({
	     	title: "Alert!",
	     	text: "Please Enter End Date..!",
	     	icon: 'error',
	     	timer: 2500,
	     	button:false
	     	
		});
		return false;
	
	}
	
	params["startDate"] = startDate;
	params["endDate"] = endDate;
	
    params["methodName"] = "PurchaseReportRangeWise";
	
    $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
		 		//alert(data);
		 		//location.reload();
		 		$('#purchaseReportRangeWise').dataTable().fnClearTable();

				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;

				$(document).ready(function() {
					$('#purchaseReportRangeWise').DataTable( {

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
							.column(24)
							.data()
							.reduce( function (a, b) {
								return intVal(a) + intVal(b);
							}, 0 );

							// Update footer
							$( api.column(24).footer() ).html(

									''+' '+parseFloat(pageTotal).toFixed(2)

							);
							console.log( pageTotal);
						},

						destroy: true,
						searching: true,
						"scrollX": true,
						columns: [					
							  {"data": "srNO" , "width": "5%" ,"defaultContent": ""},
							  {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
					          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
					          {"data": "vendorCompanyName", "width": "5%" ,"defaultContent": ""},
					          {"data": "contactNo", "width": "5%" ,"defaultContent": ""},
					          {"data": "streetAddress", "width": "5%" ,"defaultContent": ""},
					          {"data": "companyAddress" , "width": "5%" ,"defaultContent": ""},
					          {"data": "gstinNumber", "width": "5%" ,"defaultContent": ""},
					        //  {"data": "panNumber", "width": "5%" ,"defaultContent": ""},
					          //{"data": "cinNumber", "width": "5%" ,"defaultContent": ""},				          
					          {"data": "city" , "width": "5%" ,"defaultContent": ""},
					          //{"data": "zipCode" , "width": "5%" ,"defaultContent": ""},
					          //{"data": "phone" , "width": "5%" ,"defaultContent": ""},
					          //{"data": "fax" , "width": "5%" ,"defaultContent": ""},
					          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
					          {"data": "description", "width": "5%" ,"defaultContent": ""},
					          {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
					          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
					          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
					          {"data": "amount" , "width": "5%" ,"defaultContent": ""},
					          {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
					          {"data": "discountAmount" , "width": "5%" ,"defaultContent": ""},				          
					          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
					          {"data": "GST", "width": "5%" ,"defaultContent": ""},
					          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
					          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
					          {"data": "total" , "width": "5%" ,"defaultContent": ""},
					          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
					          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
					          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
					          
					          ],
					          
					          dom : 'Bfrtip',
					          buttons : [ 
					                     { extend: 'copyHtml5', footer: true,
					                    	 title : function() {
					                    		 return "Purchase Order Report";
					                    	 }},
					                     { extend: 'excelHtml5', footer: true,
					                    	 title : function() {
					                    		 return "Purchase Order Report";
					                    	 }},
					                     { extend: 'csvHtml5', footer: true,
					                    	 title : function() {
					                    		 return "Purchase Order Report";
					                    	 }},
					                     { extend : 'pdfHtml5', footer: true,
					                    	 title : function() {
					                    		 return "Purchase Order Report";
					                    	 },
					                    	 orientation : 'landscape',
					                    	 pageSize : 'LEGAL',
					                    	 titleAttr : 'PDF' 
					                     }]
							});
						});

				
				var mydata = catmap;
				$('#purchaseReportRangeWise').dataTable().fnAddData(mydata);
					}).error(function(jqXHR, textStatus, errorThrown){
						if(textStatus==="timeout") {
							$(loaderObj).hide();
							$(loaderObj).find('#errorDiv').show();
						}
					});
}





function clearPurchaseOrderDetailas()
{
	document.getElementById("vendorName").value = "";
	document.getElementById("billno").value = "";
	document.getElementById("purchasedate").value = "";
	document.getElementById("expectpaymentdate").value = "";
	document.getElementById("productname").value = "";
	document.getElementById("subTotal1").value = "";
	document.getElementById("gst1").value = "";
	document.getElementById("gstAmount").value = "";
	document.getElementById("grossTotal1").value = "";
	document.getElementById("jqGridPager").value = "";
	document.getElementById("list4").value = "";
}

