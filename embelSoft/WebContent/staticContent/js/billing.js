//Resource Billing Coding and Validation

//isNumberWithFloat
function isNumberWithFloat(evt)
{
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57 ) && (charCode < 46 || charCode > 46))
	{
		return false;
	}
	return true;
}

//get Resource Bill Grid
function getResourceBillGrid()
{
	if(document.resourceBilling.productResourceName.value=="" || document.resourceBilling.productResourceName.value==null)
		{
			alert('Please Enter Product/Resource Name');
			return false;		
		}
	resourceBillGrid();
}


//get Resource Bill Grid
function resourceBillGrid()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var productResourceName=$('#productResourceName').val();
	
	params["productResourceName"] = productResourceName;
	
	params["methodName"] ="getGridForResourceBilling";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			// $("#jqgrid").jqGrid("clearGridData", true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
				document.getElementById("productResourceName").value = "";
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
			
			colNames:['Product Name','Description','HSN/SAC','Unit Price','Quantity','Amount','Discount%','Discount Amt','SubTotal','GST%','IGST%','TAX AMT','Total'],
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

//resource Bill Validation
function resourceBillValidation()
{
	if(document.resourceBilling.fkVendorId.value==""){
		swal({
		     title: "Alert!",
		     text: "Please Select Vendor Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Vendor Name");
		document.getElementById("fkVendorId").focus();
		return false;
	 }
	if(document.resourceBilling.billDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Bill Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Bill Date");
		document.getElementById("billDate").focus();
		return false;
	}	
	if(document.resourceBilling.billPeriodStartDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Billing Peroiod Start Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Billing Peroiod Start Date");
		document.getElementById("billPeriodStartDate").focus();
		return false;
	}
	if(document.resourceBilling.billPeriodEndDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Billing Period End Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Billing Period End Date");
		document.getElementById("billPeriodEndDate").focus();
		return false;
	}
	
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
		
	if(count <= 0)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Product/Resourcen Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		 //alert("Please Enter Product/Resourcen Name");
		 document.getElementById("productResourceName").focus();
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
			     text: "Please Enter Product/Resourcen Name..!",
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
			//alert("Please Enter HSN/SAC");
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
//		if(discountPercent=="" || discountPercent==null || discountPercent==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter Discount Percent..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//			//alert("Please Enter Discount Percent");
//			//allRowsInGrid[i].discountPercent.focus();
//			return false;
//		}
//		if(discountAmount=="" || discountAmount==null || discountAmount==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter Discount Amount..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//			//alert("Please Enter Discount Amount");
//			//allRowsInGrid[i].discountAmount.focus();
//			return false;
//		}
		
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
	
		if(document.resourceBilling.totalSubTotal.value==""){
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Sub Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Sub Total");
			document.getElementById("totalSubTotal").focus();
			return false;
		 }
		if(document.resourceBilling.totalTaxAmount.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Tax Amount..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Tax Amount");
			document.getElementById("totalTaxAmount").focus();
			return false;
		}	
		if(document.resourceBilling.grossTotal.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Gross Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Gross Total");
			document.getElementById("grossTotal").focus();
			return false;
		}
		
		/*var totalSubTotal = $('#totalSubTotal').val();
		var totalTaxAmount = $('#totalTaxAmount').val();
		var grossTotal = $('#grossTotal').val();
		
		if(totalSubTotal=="" || totalSubTotal==null || totalSubTotal==undefined)
		{
			alert("Please Enter Total Sub Total");
			document.getElementById("totalSubTotal").focus();
			return false;
		}*/
		
	/*var gst = $('#gst').val();
	if(gst=="" || gst==null)
	{
		alert("Please Enter GST");
		return false;
	}
	var letterNumber = /^[0-9]+$/;
	if(gst.match(letterNumber))
	{
		
	}
	else
	{
		alert("Please Enter Only Numbers in GST");
		return false;
	}*/

	resourceBill();
	
}

//Add HrBill resourceBill Info
function resourceBill()
{
	document.resourceBilling.btn1.disabled = true;
	var params = {};
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	var vendorName = $('#fkVendorId').val();
	
	var input1 = document.getElementById('fkVendorId'),
	list = document.getElementById('vendorNamesList'), i, fkVendorId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
	
	var billDate = $('#billDate').val();
	var billPeriodStartDate = $('#billPeriodStartDate').val();
	var billPeriodEndDate = $('#billPeriodEndDate').val();
	
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
	}
	
	var totalSubTotal = $('#totalSubTotal').val();
	var totalTaxAmount = $('#totalTaxAmount').val();
	var grossTotal = $('#grossTotal').val();
	
	params["count"] = count;
	console.log("This is My Count OF Number Of number of grid parameters:" +count)
	
	params["vendorName"] = vendorName; 
	params["fkVendorId"] = fkVendorId;
	params["billDate"] = billDate;
	params["billPeriodStartDate"] = billPeriodStartDate;
	params["billPeriodEndDate"] = billPeriodEndDate;
	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;	
	
	params["methodName"] = "saveResourceBillDetails";
	
	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) 
			{
				swal({
				     title: "Success!",
				     text: "Resource Bill Details Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				 });
				//alert(data);
					//window.open("TestVendorBillingPDF.jsp");
					/*window.open("VendorBillingPDF.jsp");*/
					//window.open("TestClientBillingPDF.jsp");
					window.open("TestVendorBillingPDF1.jsp");
					
				location.reload();
				
			}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});	
	
}

//getResourceBillingList
function getResourceBillingList()
{
	var params= {};

	params["methodName"] = "getResourceBillingList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{		
		$('#list2').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#list2').DataTable( {

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
					.column( 20 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 1 ).footer() ).html(

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
				          {"data": "billDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "billPeriodStartDate" , "width": "5%" ,"defaultContent": ""},				          
				          {"data": "billPeriodEndDate" , "width": "5%" ,"defaultContent": ""},
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description" , "width": "5%" ,"defaultContent": ""},
				          {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "amount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "CGST" , "width": "5%" ,"defaultContent": ""},
				          {"data": "SGST" , "width": "5%" ,"defaultContent": ""},
				          {"data": "IGST" , "width": "5%" ,"defaultContent": ""},
				          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "total", "width": "5%" ,"defaultContent": ""},
				          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          ],
					} );
				});
		
		var mydata = catmap;
		$('#list2').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			
			});
}

//get Resource Billing Report ByNameAndDates Validation
function getResourceBillingReportByNameAndDatesValidation()
{
	var vendorName = $("#fk_vendor_id").val();
	var startDate = $("#fisDate").val();
	var endDate = $("#endDateV").val();
	
	if(vendorName=="" || vendorName==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Vendor Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Vendor Name");
		$("#fk_vendor_id").focus();
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
		$("#fisDate").focus();
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
		$("#endDate").focus();
		return false;
	}
	getResourceBillingReportByNameAndDates();	
}

//Resource Billing Report By Name And Dates
function getResourceBillingReportByNameAndDates()
{
	var params= {};
	
	var vendorName = $("#fk_vendor_id").val();
	var startDate = $("#fisDate").val();
	var endDate = $("#endDateV").val();
	
	var input = document.getElementById('fk_vendor_id'),
	list = document.getElementById('vendorNameList'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input.value) 
		{
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkVendorId"]= fkVendorId; 
	params["vendorName"]= vendorName;
	params["startDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getResourceBillingReportByNameAndBetweenTwoDates";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#vendorBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+vendorName+" \nFrom "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function()
		{
			$('#vendorBetweenTwoDates').DataTable({
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
				},
				destroy: true,
				searching: true,	
				"scrollX": true,
				columns: [
					
					 {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			         {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
			         {"data": "billDate", "width": "5%" ,"defaultContent": ""},
			         {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			         {"data": "billPeriodStartDate" , "width": "5%" ,"defaultContent": ""},				          
			         {"data": "billPeriodEndDate" , "width": "5%" ,"defaultContent": ""},
			         {"data": "productName" , "width": "5%" ,"defaultContent": ""},
			         {"data": "description" , "width": "5%" ,"defaultContent": ""},
			         {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
			         {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			         {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			         {"data": "amount" , "width": "5%" ,"defaultContent": ""},
			         {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
			         {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
			         {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			         {"data": "GST" , "width": "5%" ,"defaultContent": ""},
//			         {"data": "SGST" , "width": "5%" ,"defaultContent": ""},				          
			         {"data": "IGST" , "width": "5%" ,"defaultContent": ""},
			         {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			         {"data": "total", "width": "5%" ,"defaultContent": ""},
			         {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			         {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			         {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			    ],
			    dom : 'Bfrtip',
		          buttons : [
		        	  {
	                    	 extend: 'copyHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 }
	                     },
	                     {
	                    	 extend: 'excelHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 }
	                     },
	                     {
	                    	 extend: 'csvHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 }
	                     },
	                     {
	                    	 extend : 'pdfHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 },
	                    	 orientation : 'landscape',
	                    	 pageSize : 'LEGAL',
	                    	 titleAttr : 'PDF' 
	                     }
	              ]
			} );
		} );

		var mydata = catmap;
		$('#vendorBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}


//Product Billing coding and validation

//getProductBillGrid
function getProductBillGrid()
{
	/*if(document.productBilling.productName.value == "" || document.productBilling.productName.value == null)
		{
			alert('Please Select Product Name');
			return false;
		}*/
	
	productBillGrid();
}

//productBillGrid
function productBillGrid()
{	
	var rowDelete = 0;
	var params={};
	var count=0;
	var newrow;
	var rowId;
	var billno = $('#BillNo').val();
	
	
	if(billno == null || billno == "" || billno == " " || billno == undefined)
	{
		
		var productName = $('#productName').val();
	var input1 = document.getElementById('productName'), list = document
			.getElementById('productNameList'), i, fkProductId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkProductId = list.options[i].getAttribute('data-value');
		}
	}

	params["fkProductId"] = fkProductId;
	params["productName"] = productName;
	}
	else
		{
		params["billno"] = billno;
		}
	
	
	
	params["methodName"] = "getGridForProductBilling";
	
	document.getElementById('BillNo').value = null;
	document.getElementById('productName').value = null;
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			// $("#productGrid").jqGrid("clearGridData", true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
				
				document.getElementById("totalSubTotalProduct").value = parseInt(0);
				document.getElementById("totalTaxAmountProduct").value = parseInt(0);
				document.getElementById("grossTotalProduct").value = parseInt(0);
				
				
				for(var k =0; k<v.length;k++)
					{
					var totalsubamt= parseInt(document.getElementById("totalSubTotalProduct").value);
				    document.getElementById("totalSubTotalProduct").value = totalsubamt + parseInt(v[k].subTotal);
				    
				    var totaltaxamt= parseInt(document.getElementById("totalTaxAmountProduct").value);
				    document.getElementById("totalTaxAmountProduct").value =  totaltaxamt + parseInt(v[k].taxAmount);
				    
				    var totalgrossamt= parseInt(document.getElementById("grossTotalProduct").value);
					document.getElementById("grossTotalProduct").value =  totalgrossamt + parseInt(v[k].total);
				    
					}
				
				var plaintext = document.getElementById("grossTotalProduct"); 
	      	    plaintext.style.color = "#FF0000";
				
				document.getElementById("productName").value = "";
		    	count = jQuery("#productGrid").jqGrid('getGridParam', 'records'); 
			    var rowdata =$("#productGrid").jqGrid('getGridParam','data');
			    var ids = jQuery("#productGrid").jqGrid('getDataIDs');
			
			    
			    var productName,com,packing,unit,billNo;
				
			    for (var j = 0; j < count; j++) 
			    {
			    	productName = rowdata[j].productName;
			    	billNo = rowdata[j].billNo;
			    	var rowId = ids[j];
					var rowData = jQuery('#productGrid').jqGrid ('getRowData', rowId);
					if (productName == v[0].productName) 
					{
				    	newrow=false;
						alert("Product Name OR Bill No  Already Inserted !!!");
						var grid = jQuery("#productGrid");
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
				  //$("#productGrid").addRowData(i,jsonData[i]);
				  $("#productGrid").addRowData(count,jsonData.offer);					
				 }
			    	
		$("#productGrid").jqGrid({
			datatype: "local",
			
			colNames:['FK Product Id','Product<br>Name','Description','Unit<br>Price','Qty','Amount','Sub<br>Total','Tax%','CGST%','SGST%','IGST%','TAX<br>AMT','billNo','Discount%','Discount<br>Amt','HSN/SAC','Total'/*,'pkProductBillId'*/],
			colModel:[ 
				
				{
					name : 'fkProductId',
					width : 20,
					editable : false,
					hidden : true
				},
			    {	name:'productName',
			    	 width:42,
			    	 editable: true	
				},
				{	name:'description',
			    	 width:42,
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
				
				{	name:'subTotal',
			    	 width:30,
			    	 editable: false
				},
				{	name:'taxPercentage',
			    	 width:24,
			    	 editable: true
				},
				
				{	name:'CGST',
			    	 //width:24,
			    	 editable: true,
			    	 hidden:true,
				},
				{	name:'SGST',
			    	 //width:24,
			    	 editable: true,
			    	 hidden:true,
				},
				{	name:'IGST',
			    	 width:22,
			    	 editable: true
				},
				{	name:'taxAmount',
			    	 width:35,
			    	 editable: false
				},			
				{ 
		        	   name:  "billNo",
		        	
		        	   hidden:true,
		        	   width:50,
		          },
		          {	name:'discountPercent',
				    	 width:35,
				    	 editable: true
					},
					{	name:'discountAmount',
				    	 width:40,
				    	 editable: false
					},
		          {	name:'hsnSac',
						width:30,
						editable: true						
					},
					{	name:'total',
					width:40,
					
				},
					/*{	name:'pkProductBillId',
						width:30,
						editable: true						
					},*/
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
			        	    var rowId =$("#productGrid").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#productGrid").getRowData(rowId);
	                    	var unitPrice = rowData['unitPrice'];
	                    	var quantity = rowData['quantity'];
	                    	
	                    	/* 	Calculation of Amount after editing quantity*/
	                    	var amount = (unitPrice * quantity);
	                    	$("#productGrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
	                    	
	                    	/* 	Calculation of discountAmount after editing discountPercent*/
	                    	var discountPercent = rowData['discountPercent'];	        		        	
        		        	var discountAmount = (amount * discountPercent) / 100;
        		        	$("#productGrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
        		        	var subTotal = amount-discountAmount;
        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
        		        	$("#productGrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
        		        	
        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
        		        	//var CGST = rowData['CGST']; 		        	
        		        	var gest= rowData['taxPercentage'];
        		        	var gst = (subTotal * gest) / 100;
        		        	//var SGST = rowData['SGST']; 		        	
        		        	//var SGSTAmount = (subTotal * SGST) / 100;
        		        	var IGST = rowData['IGST']; 
        		        	
        		        	
        		        	var IGSTAmount = (subTotal * IGST) / 100;
        		        	var taxAmount = (gst + IGSTAmount);
        		        	
        		        	
        		        	if( Number(gest)>0 &&  Number(IGST)>0  )
							{
								 var setValue = 0;
								 
								 var msg = "You Can't Enter value For Both tax";
							
							alert(msg);
					            $("#productGrid").jqGrid("setCell",rowId,"IGST",setValue);
					           		
					           		 return false;									
							}
        		        	 if (Number(IGST)>0) {
        		        		
        		        		var setValue = 0;
        		        		$("#productGrid").jqGrid("setCell",rowId,"SGST",setValue);
        		        		$("#productGrid").jqGrid("setCell",rowId,"CGST",setValue);
        		        		$("#productGrid").jqGrid("setCell",rowId,"taxPercentage",setValue);
								
							}
        		        	
        		        	
	                    	//var GST = rowData['GST'];
	                    	//var IGST = rowData['IGST'];
        		        	//var taxAmount = ((subTotal * GST) / 100) + ((subTotal * IGST) / 100);
        		        	$("#productGrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of Total after editing CGST and SGST or IGST% */        		        	
	                    	var total = subTotal + taxAmount; 
                    		$("#productGrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
                    		
                    		var grossTotal = 0;
                    		var totalSubTotal = 0;
                    		var totalTaxAmount = 0;
                    		var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#productGrid').getGridParam('data');
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
			  $("#productGrid").addRowData(0,jsonData.offer);
		}
		     
		 $('#productGrid').navGrid('#jqGridPager1',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#productGrid"),
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
		                    	rowDelete++;
		                    	// $(this).trigger('reloadGrid');
				        	    var rowId =$("#productGrid").jqGrid('getGridParam','selrow');  
		                        var rowData = jQuery("#productGrid").getRowData(rowId);
		                    	var unitPrice = rowData['unitPrice'];
		                    	var quantity = rowData['quantity'];
		                    	//rowDelete = 0;
		                    	/* 	Calculation of Amount after editing quantity*/
		                    	var amount = (unitPrice * quantity);
		                    	$("#productGrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
		                    	
		                    	/* 	Calculation of discountAmount after editing discountPercent*/
		                    	var discountPercent = rowData['discountPercent'];	        		        	
	        		        	var discountAmount = (amount * discountPercent) / 100;
	        		        	$("#productGrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
	        		        	var subTotal = amount-discountAmount;
	        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
	        		        	$("#productGrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
	        		        	
	        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
	        		        	//var CGST = rowData['CGST']; 		        	
	        		        	//var CGSTAmount = (subTotal * CGST) / 100;
	        		        	//var SGST = rowData['SGST']; 
	        		        	var gest= rowData['taxPercentage'];
	        		        	var GSTAmount = (subTotal * gest) / 100;
	        		        	var IGST = rowData['IGST']; 		        	
	        		        	var IGSTAmount = (subTotal * IGST) / 100;
	        		        	var taxAmount = (GSTAmount+ IGSTAmount);
	        		        	
		                    	//var GST = rowData['GST'];
		                    	//var IGST = rowData['IGST'];
	        		        	//var taxAmount = ((subTotal * GST) / 100) + ((subTotal * IGST) / 100);
	        		        	$("#productGrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of Total after editing GST or IGST% */        		        	
		                    	var total = subTotal + taxAmount;
	                    		$("#productGrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
	                    		
	                    		var grossTotal = 0;
	                    		var totalSubTotal = 0;
	                    		var totalTaxAmount = 0;
	                    		var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#productGrid').getGridParam('data');
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

//product Bill Details Validation
function productBillDetailsValidation()
{
	var CourierName=$('#CourierName').val();
	var Courierid=$('#Courierid').val();
	
//alert(CourierName+Courierid)
	
	
	if(document.productBilling.fkClientId.value==""){
		swal({
		     title: "Alert!",
		     text: "Please Select Client Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Client Name");
		document.getElementById("fkClientId").focus();
		return false;
	 }
	
	
	if(document.productBilling.productBillDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Bill Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Bill Date");
		document.getElementById("productBillDate").focus();
		return false;
	}
	
/*	if(document.productBilling.ShipAddress.value==""){
		alert("Enter Shipping  Address");
		document.getElementById("ShipAddress").focus();
		return false;
	 }*/
	
	
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
		
	if(count <= 0)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Product Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		 //alert("Please Enter Product Name");
		 document.getElementById("productName").focus();
		 return false;
	}
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#productGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{
		var fkProductId = allRowsInGrid[i].fkProductId;
		var productName = allRowsInGrid[i].productName;
		var description = allRowsInGrid[i].description;
		var hsnSac = allRowsInGrid[i].hsnSac;
		var unitPrice = allRowsInGrid[i].unitPrice;
		var quantity = allRowsInGrid[i].quantity;		
		var amount = allRowsInGrid[i].amount;
		var discountPercent = allRowsInGrid[i].discountPercent;
		var discountAmount = allRowsInGrid[i].discountAmount;
		var subTotal = allRowsInGrid[i].subTotal;
		var CGST = allRowsInGrid[i].CGST;
		var SGST = allRowsInGrid[i].SGST;
		var IGST = allRowsInGrid[i].IGST;
		var taxAmount = allRowsInGrid[i].taxAmount;
		var total = allRowsInGrid[i].total;
		var taxPercentage = allRowsInGrid[i].taxPercentage;
		
		if(fkProductId=="" || fkProductId==null || fkProductId==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter FK Product Id..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter FK Product Id");
			//allRowsInGrid[i].productName.focus();
			return false;
		}
		if(productName=="" || productName==null || productName==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Product/Resourcen Name..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Product/Resourcen Name");
			//allRowsInGrid[i].productName.focus();
			return false;
		}
		/*if(description=="" || description==null || description==undefined)
		{
			alert("Please Enter Description");
			//allRowsInGrid[i].description.focus();
			return false;
		}*/
		if(hsnSac=="" || hsnSac==null || hsnSac==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter HSN/SAC..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter HSN/SAC");
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
			alert("Please Enter Discount Percent");
			//allRowsInGrid[i].discountPercent.focus();
			return false;
		}
		if(discountAmount=="" || discountAmount==null || discountAmount==undefined)
		{
			alert("Please Enter Discount Amount");
			//allRowsInGrid[i].discountAmount.focus();
			return false;
		}*/
		
	/*	if(CGST=="" || CGST==null || CGST==undefined ||SGST=="" || SGST==null || SGST==undefined || IGST=="" || IGST==null || IGST==undefined)
		{
			alert("Please Enter CGST and SGST Or IGST");
			//allRowsInGrid[i].GST.focus();
			return false;
		}*/		
		var CSGSTPercent = CGST+SGST;
		var IGSTPercent = IGST;
		/*if(CSGSTPercent > 0 && IGSTPercent > 0)
		{
			alert("Please Enter CGST and SGST Or IGST Only, Both Taxes are not allowed (CGST / SGST and IGST)");
			//allRowsInGrid[i].GST.focus();
			return false;
		}
		if(CGST > 0 && SGST <= 0)
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
	
	
		if(document.productBilling.totalSubTotalProduct.value==""){
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Sub Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Sub Total");
			document.getElementById("totalSubTotalProduct").focus();
			return false;
		 }
		if(document.productBilling.totalTaxAmountProduct.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Tax Amount..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Tax Amount");
			document.getElementById("totalTaxAmountProduct").focus();
			return false;
		}	
		if(document.productBilling.grossTotalProduct.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Gross Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Gross Total");
			document.getElementById("grossTotalProduct").focus();
			return false;
		}

		productBillDetails();
	
}

//Add HrBill Info
function productBillDetails()
{
	document.productBilling.btn2.disabled = true;
	
	var params = {};
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#productGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	//get clientName through pkId(fkClientId)
	var clientName = $('#fkClientId').val();
	
	var input1 = document.getElementById('fkClientId'),
	list = document.getElementById('clientNamesList'), i, fkClientId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}
	
	var productBillDate = $('#productBillDate').val();
	
	for(var i=0;i<count;i++)
	{
		var fkProductId = allRowsInGrid[i].fkProductId;
		params["fkProductId"+i] = fkProductId;
		
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
		
		var CGST = allRowsInGrid[i].CGST;
		params["CGST"+i] = CGST;
		
		var SGST = allRowsInGrid[i].SGST;
		params["SGST"+i] = SGST;
		
		var IGST = allRowsInGrid[i].IGST;
		params["IGST"+i] = IGST;
		
		var taxAmount = allRowsInGrid[i].taxAmount;
		params["taxAmount"+i] = taxAmount;
		
		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
		
		var billNo = allRowsInGrid[i].billNo;
		params["billNo"+i] = billNo;
		var taxPercentage = allRowsInGrid[i].taxPercentage;
		params["taxPercentage"+i] = taxPercentage;
		
	}
	
	var totalSubTotalProduct = $('#totalSubTotalProduct').val();
	var totalTaxAmountProduct = $('#totalTaxAmountProduct').val();
	var grossTotalProduct = $('#grossTotalProduct').val();
	
	var ShipAddress=$('#ShipAddress').val();
	//alert(ShipAddress);
	
	
	var CourierName=$('#CourierName').val();
	var Courierid=$('#Courierid').val();
	
	params["count"] = count;
	params["fkClientId"] = fkClientId; 
	params["clientName"] = clientName;
	params["productBillDate"] = productBillDate;
	params["totalSubTotalProduct"] = totalSubTotalProduct;
	params["totalTaxAmountProduct"] = totalTaxAmountProduct;

	params["grossTotalProduct"] = grossTotalProduct;
	
	params["ShipAddress"] = ShipAddress;
	
	params["CourierName"] = CourierName;
	params["Courierid"] = Courierid;
	
	params["methodName"] = "saveProductBillingDetails";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) 
	{
		swal({
		     title: "Success!",
		     text: "Product Bill Details Added Successfully !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		 });
		//alert(data);
			//window.open("TestVendorBillingPDF.jsp");
			/*window.open("VendorBillingPDF.jsp");*/
			//window.open("TestClientBillingPDF.jsp");
			window.open("ClientBillingPDFNew.jsp");
		location.reload();
		
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

//getProductBillingList
function getProductBillingList()
{
	var params= {};
	
	params["methodName"] = "getProductBillingListNew";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{		
		$('#list2').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#list2').DataTable( {

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
					.column( 19 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 1 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)
					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollY": true,
				"scrollX": true,
				columns: [
					      {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "billDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "clientName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description" , "width": "5%" ,"defaultContent": ""},
				          {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "amount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "CGST" , "width": "5%" ,"defaultContent": ""},
				          {"data": "SGST" , "width": "5%" ,"defaultContent": ""},
				          {"data": "IGST" , "width": "5%" ,"defaultContent": ""},
				          {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "total", "width": "5%" ,"defaultContent": ""},
				          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          ],
					} );
				});
		
		var mydata = catmap;
		$('#list2').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

//Product Billing Report By Name And Dates validation
function getProductBillingReportByNameAndDatesValidation()
{
	var vendorName = $("#fk_client_id").val();
	var startDate = $("#fis1Date").val();
	var endDate = $("#end1Date").val();
	
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
		$("#fk_client_id").focus();
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
		$("#fis1Date").focus();
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
		$("#end1Date").focus();
		return false;
	}
	getProductBillingReportByNameAndDates();
}

//Product Billing Report By Name And Dates
function getProductBillingReportByNameAndDates()
{
	var params= {};
	
	var clientName = $("#fk_client_id").val();
	var startDate = $("#fis1Date").val();
	var endDate = $("#end1Date").val();
	
	
	var input = document.getElementById('fk_client_id'),
	list = document.getElementById('clientNameList'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input.value) 
		{
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}
	//fkClientId
	params["fkClientId"]= fkClientId; 
	params["clientName"]= clientName;
	params["startDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getProductBillingReportByNameAndDates";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#clientBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+clientName+" \nFrom "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function()
		{
			$('#clientBetweenTwoDates').DataTable({
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

				},
				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
									
					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			        {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
			        {"data": "billDate", "width": "5%" ,"defaultContent": ""},
			        {"data": "clientName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "productName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "description" , "width": "5%" ,"defaultContent": ""},
			        {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
			        {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			        {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			        {"data": "amount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
			        {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
			        {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "CGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "SGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "IGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "total", "width": "5%" ,"defaultContent": ""},
			        {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "shipAdreess" , "width": "5%" ,"defaultContent": ""},
			        {"data": "curiorName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "TrackingNumber" , "width": "5%" ,"defaultContent": ""},
			   ],
			   dom : 'Bfrtip',
		          buttons : [ 
		                     { extend: 'copyHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Product Billing Report";
		                    	 }},
		                     { extend: 'excelHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Product Billing Report";
		                    	 }},
		                     { extend: 'csvHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Product Billing Report";
		                    	 }},
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Product Billing Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]
			} );
		} );
		
		var mydata = catmap;
		$('#clientBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}




function getProductBillingReportByDatesValidation()
{
	var vendorName = $("#fk_client_id").val();
	var startDate = $("#fis1Date55").val();
	var endDate = $("#end1Date55").val();
	
	
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
		$("#fis1Date55").focus();
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
		$("#end1Date55").focus();
		return false;
	}
	getProductBillingReportByDates();
}

//Product Billing Report By Name And Dates
function getProductBillingReportByDates()
{
	var params= {};
	
	
	var startDate = $("#fis1Date55").val();
	var endDate = $("#end1Date55").val();
	
	
	params["startDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getProductBillingReportByDates";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#productBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for Dates \nFrom "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function()
		{
			$('#productBetweenTwoDates').DataTable({
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

				},
				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
									
					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			        {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
			        {"data": "billDate", "width": "5%" ,"defaultContent": ""},
			        {"data": "clientName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "productName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "description" , "width": "5%" ,"defaultContent": ""},
			        {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
			        {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			        {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			        {"data": "amount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
			        {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
			        {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "CGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "SGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "IGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "total", "width": "5%" ,"defaultContent": ""},
			        {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "shipAdreess" , "width": "5%" ,"defaultContent": ""},
			        {"data": "curiorName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "TrackingNumber" , "width": "5%" ,"defaultContent": ""},
			        {"data": "GSTNo" , "width": "5%" ,"defaultContent": ""},
			       /* {"defaultContent": "" , "width": "5%" ,"defaultContent": "<div class='checkdiv'><input type='checkbox' class='downPdf' value='Download'></div>"},*/
			   ],
			   dom : 'Bfrtip',
		          buttons : [ 
		                     { extend: 'copyHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Product Billing Report";
		                    	 }},
		                     { extend: 'excelHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Product Billing Report";
		                    	 }},
		                     { extend: 'csvHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Product Billing Report";
		                    	 }},
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Product Billing Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]
			} );
		} );
		
		var mydata = catmap;
		$('#productBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}





function getProductBillingReportByDatesValidation1()
{
	var vendorName = $("#fk_client_id").val();
	var startDate = $("#fis1Date555").val();
	var endDate = $("#end1Date555").val();
	
	
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
		$("#fis1Date55").focus();
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
		$("#end1Date55").focus();
		return false;
	}
	getProductBillingReportByDates1();
}

//Product Billing Report By Name And Dates
function getProductBillingReportByDates1()
{
	var params= {};
	
	
	var startDate = $("#fis1Date555").val();
	var endDate = $("#end1Date555").val();
	
	
	params["startDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getProductBillingReportByDates111";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#productBetweenTwoDates1').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for Data \nFrom "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function()
		{
			$('#productBetweenTwoDates1').DataTable({
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

				},
				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
									
					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			        {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
			        {"data": "billDate", "width": "5%" ,"defaultContent": ""},
			        {"data": "clientName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "productName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "description" , "width": "5%" ,"defaultContent": ""},
			        {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
			        {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			        {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			        {"data": "amount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
			        {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
			        {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "CGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "SGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "IGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "total", "width": "5%" ,"defaultContent": ""},
			        {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			       
			   ],
			   dom : 'Bfrtip',
		          buttons : [ 
		                     { extend: 'copyHtml5', footer: true,
		                    	 title : function() {
		                    		 return "profroma Billing Report";
		                    	 }},
		                     { extend: 'excelHtml5', footer: true,
		                    	 title : function() {
		                    		 return "profroma Billing Report";
		                    	 }},
		                     { extend: 'csvHtml5', footer: true,
		                    	 title : function() {
		                    		 return "profroma Billing Report";
		                    	 }},
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "profroma Billing Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]
			} );
		} );
		
		var mydata = catmap;
		$('#productBetweenTwoDates1').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}























//Product billing old coding validation


// Calculations for GST and Gross Total for HR Billing
function CalculateGstAmount() 
{
	var subTotal = $('#subTotal').val();
	var gst = $('#gst').val();
	var Total = Number(subTotal) * Number(gst);
	var vat = (Total) / 100;
	
	document.getElementById("vat").value = vat.toFixed(2);
	
	var grossTotal1 = Number(subTotal) + Number(vat);
	document.getElementById("grossTotal1").value = grossTotal1.toFixed(2);

}


// Calculations for GST and Gross Total for product Billing
function CalculateGstAmount1() {
	
	var subTotal1 = $('#subTotal1').val();
	var gst1 = $('#gst1').val();
	var Total1 = Number(subTotal1) * Number(gst1);
	var vat1 = (Total1) / 100;
	document.getElementById("vat1").value = vat1.toFixed(2);

	var grossTotal2 = Number(subTotal1) + Number(vat1);
	document.getElementById("grossTotal2").value = grossTotal2.toFixed(2);

}

// Validation for Product Billing
function ProductBillingDetailsValidation()
{	
	if(document.productForm.fk_client_id.value=="")
	{
		alert('Please Select Client Name. . .');
		return false;
	}	
	if(document.productForm.billingDate1.value=="")
	{
		alert('Please Select Billing Date. . .');
		return false;
	}
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	
	if(count <= 0)
	{
		alert('Please Enter Product Name. . .');
		return false;
	}
	
	var allRowsInGrid = $('#productGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{				
		var description = allRowsInGrid[i].description;
		var buyPrice = allRowsInGrid[i].buyPrice;
		var quantity = allRowsInGrid[i].quantity;
		
		
		if(description=="" || description==null)
		{
			alert("Please Enter Product Name");
			return false;
		}
		if(buyPrice=="" || buyPrice==null)
		{
			alert("Please Enter Sale Price in Grid");
			return false;
		}
		var letterNumber = /^[0-9]+$/;
		if(buyPrice.match(letterNumber))
		{
			if(quantity=="" || quantity==null)
			{
				alert("Please Enter Quantity in Grid");
				return false;
			}			
			var letterNumber = /^[0-9]+$/;
			if(quantity.match(letterNumber))
			{
//				if(document.productForm.gst1.value=="")
//				{
//					alert('Please Enter Gst %. . .');
//					return false;
//				}
			}			
			else
			{
				alert("Please Enter Number in Quantity in Grid");
				return false;
			}			
		}
		else
		{
			alert("Please Enter Number in Sale Price in Grid");			
			return false;
		}				
	}
		
	ProductBillingDetails();
	
}


// Adding Product Billing
function ProductBillingDetails() {

	/* document.exp.btn.disabled = true; */
	
	var params = {};
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#productGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{
		var description = allRowsInGrid[i].description;
		params["description"+i] = description;
		
		var hsn = allRowsInGrid[i].hsn;
		params["hsn"+i] = hsn;
		
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i] = quantity;
		
		var buyPrice = allRowsInGrid[i].buyPrice;
		params["buyPrice"+i] = buyPrice;
		
		var gridAmount = allRowsInGrid[i].gridAmount;
		params["gridAmount"+i] = gridAmount;
		
		var gridDiscountPercent = allRowsInGrid[i].gridDiscountPercent;
		params["gridDiscountPercent"+i] = gridDiscountPercent;
		
		var gridDiscountAmount = allRowsInGrid[i].gridDiscountAmount;
		params["gridDiscountAmount"+i] = gridDiscountAmount;
		
		var gridSubTotal = allRowsInGrid[i].gridSubTotal;
		params["gridSubTotal"+i] = gridSubTotal;
		
		var gridGstPercent = allRowsInGrid[i].gridGstPercent;
		params["gridGstPercent"+i] = gridGstPercent;
		
		var gridGstPercentAmount = allRowsInGrid[i].gridGstPercentAmount;
		params["gridGstPercentAmount"+i] = gridGstPercentAmount;
		
		/*var gst = allRowsInGrid[i].gst;
		params["gst"+i] = gst;*/
		
		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
		
	}
	
	var input2 = document.getElementById('fk_client_id'), list = document
			.getElementById('clientNameList'), i, fkClientId1;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input2.value) {
			fkClientId1 = list.options[i].getAttribute('data-value');
		}
	}
	
	var vendorName1 = $('#fk_client_id').val();
	var billingDate = $('#billingDate1').val();

//	var subTotal1 = $('#subTotal1').val();
//	var gst1= $('#gst1').val();
//	var vat1 = $('#vat1').val();
	var grossTotal2 = $('#grossTotal2').val();

	params["count"] = count;
	params["fkClientId1"] = fkClientId1;
	params["vendorName"] = vendorName1;
	params["billingDate"] = billingDate;
	
//	params["subTotal1"] = subTotal1;
//	params["gst1"] = gst1;
//	params["vat1"] = vat1;
	params["grossTotal2"] = grossTotal2;	

	params["methodName"] = "ProductBillingInfo";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data)
			{
					//alert(data);
					window.open("TestClientBillingPDF.jsp");
					location.reload();
					
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}



//Resorce Billing coding validation

//Hr Billing Grid
function getHrBillingGrid()
{
	if(document.hrBilling.description.value=="" || document.hrBilling.description.value==null)
		{
			alert('Please Enter Description. . .');
			return false;		
		}	
	getHrBillingGridAsPerDescription();
}

function getHrBillingGridAsPerDescription()
	{
		var params={};
		var count=0;
		var newrow;
		var rowId;
		
		var description=$('#description').val();
		
		params["description"] = description;
		
		params["methodName"] ="gridForHrBill";
		
		 $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
				{
			  var jsonData = $.parseJSON(data);
				
		      // $("#jqgrid").jqGrid("clearGridData", true).trigger("reloadGrid");
				        
		     $.each(jsonData,function(i,v)
				{
		    	 document.getElementById("description").value = "";
		    	 count = jQuery("#jqgrid").jqGrid('getGridParam', 'records'); 
			     var rowdata =$("#jqgrid").jqGrid('getGridParam','data');
			     var ids = jQuery("#jqgrid").jqGrid('getDataIDs');
			     
				
				  var prodName,com,packing,unit;
				  for (var j = 0; j < count; j++) 
				  {
					  prodName = rowdata[j].description;
					
					 var rowId = ids[j];
					 var rowData = jQuery('#jqgrid').jqGrid ('getRowData', rowId);
					
					if (prodName == jsonData.offer.description) 
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
				
				colNames:['Product Name','Hsn','UnitPrice','Quantity','Amount','Discount%','Discount Amt','SubTotal','GST%','GST AMT','Total'],
				colModel:[ 
					
				    {	name:'description',
				    	 width:42,
				    	 editable: true	
					},										
					{	name:'hsn',
						width:20,
						editable: true						
					},					   					
					{	name:'buyPrice',
				    	 width:30,
				    	 editable: true
					},
					{	name:'quantity',
						width:28,
						editable: true						
					},
					{	name:'gridAmount',
				    	 width:30,
				    	 editable: false
					},
					{	name:'gridDiscountPercent',
				    	 width:35,
				    	 editable: true
					},
					{	name:'gridDiscountAmount',
				    	 width:40,
				    	 editable: false
					},
					{	name:'gridSubTotal',
				    	 width:30,
				    	 editable: false
					},
					{	name:'gridGstPercent',
				    	 width:20,
				    	 editable: true
					},
					{	name:'gridGstPercentAmount',
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
				width: 1250,
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
		                    	var quantity = rowData['quantity'];
		                    	var buyPrice = rowData['buyPrice'];
		                    	
		                    	/* 	Calculation of Amount after editing quantity*/
		                    	var gridAmountCal = (quantity * buyPrice);
		                    	$("#jqgrid").jqGrid("setCell", rowId, "gridAmount", gridAmountCal.toFixed(2));
		                    	
		                    	/* 	Calculation of discountAmountCal after editing discountPercent*/
		                    	var gridDiscountPercent = rowData['gridDiscountPercent'];	        		        	
	        		        	var gridDiscountAmountCal = (gridAmountCal * gridDiscountPercent) / 100;
	        		        	$("#jqgrid").jqGrid("setCell", rowId, "gridDiscountAmount", gridDiscountAmountCal.toFixed(2));
		                    	
	        		        	/* 	Calculation of gridSubTotal to after editing discountPercent*/	        		        	
	        		        	var gridSubTotalcal = gridAmountCal-gridDiscountAmountCal;
	        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
	        		        	$("#jqgrid").jqGrid("setCell", rowId, "gridSubTotal", gridSubTotalcal.toFixed(2));
	        		        	
	        		        	/* 	Calculation of gridGstAmount and gridGstTaxAmount after editing gridCSGstPercent and gridIGstPercent*/
		                    	var gridGstPercent = rowData['gridGstPercent'];
	        		        	var gridGstPercentAmountCal = (gridSubTotalcal * gridGstPercent) / 100;
	        		        	$("#jqgrid").jqGrid("setCell", rowId, "gridGstPercentAmount", gridGstPercentAmountCal.toFixed(2));
		                    	
	        		        	/* 	Calculation of Total after editing GST% */
	        		        	
		                    	var tota = gridSubTotalcal + gridGstPercentAmountCal;
	                    		$("#jqgrid").jqGrid("setCell", rowId, "total", tota.toFixed(2));
	                    		
	                    		var Total =0;
	                    		var totalTaxAmt =0;
	                    		var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#jqgrid').getGridParam('data');
	        		        	var AllRows=JSON.stringify(allRowsInGrid1);
	        		        	for (var k = 0; k < count; k++) {
	        		        		var Total1 = allRowsInGrid1[k].total;
	        		        		Total = +Total + +Total1;
	        		        		
	        		        		var totalTaxAmt1 = allRowsInGrid1[k].gridGstPercentAmount;
	        		        		totalTaxAmt = +totalTaxAmt + +totalTaxAmt1;	        		        		
	        		        	}
	        		        	//document.getElementById("subTotal").value = Total;
	        		        	//document.getElementById("gst").value = "";
		     		        	document.getElementById("totalTaxAmt").value = totalTaxAmt;
		     		        	document.getElementById("grossTotal1").value = Total;
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
			                    var rowId =$("#jqgrid").jqGrid('getGridParam','selrow');  
			                       var rowData = jQuery("#jqgrid").getRowData(rowId);
			                    	var quantity = rowData['quantity'];
			                    	var buyPrice = rowData['buyPrice'];
			                    	
			                    	var tota = quantity * buyPrice;
		                 		$("#jqgrid").jqGrid("setCell", rowId, "total", tota);
		                 		
	                 		var Total =0;
	                 		var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	     		        	var allRowsInGrid1 = $('#jqgrid').getGridParam('data');
	     		        	var AllRows=JSON.stringify(allRowsInGrid1);
	     		        	for (var k = 0; k < count; k++) {
	     		        		var Total1 = allRowsInGrid1[k].total;
	     		        		Total = +Total + +Total1;
	     		        	}
	     		        	document.getElementById("subTotal").value = Total;
	     		        	
	     		        	document.getElementById("gst").value = "";
	     		        	document.getElementById("vat").value = "";
	     		        	document.getElementById("grossTotal1").value = Total;
	     		        	
		                  }
		                });			 
				});				
			})	
	}	
	
	
//Add HrBill validation 
function addHrBillValidation()
{
	
	if(document.hrBilling.fk_vendor_id.value==""){
		alert("Please Select Vendor Name");
		 return false;
	 }
	if(document.hrBilling.billingDate.value=="")
	{
		alert("Please Select Billing Date");
		 return false;
	}	
	if(document.hrBilling.billingPeriodFrom.value=="")
	{
		alert("Please Select Billing Peroiod From Date");
		 return false;
	}
	if(document.hrBilling.billingPeriodTo.value=="")
	{
		alert("Please Select Billing Period To Date");
		 return false;
	}
	
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
		
	if(count <= 0)
	{
		 alert("Please Enter Description");
		 return false;
	}
	
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{		
			var description = allRowsInGrid[i].description;
			var buyPrice = allRowsInGrid[i].buyPrice;
			var quantity = allRowsInGrid[i].quantity;
			var gridDiscountPercent = allRowsInGrid[i].gridDiscountPercent;
			var gridGstPercent = allRowsInGrid[i].gridGstPercent;
			
			if(description=="" || description==null)
			{
				alert("please Enter Description in Grid");
				return false;
			}
			if(buyPrice=="" || buyPrice==null)
			{
				alert("please Enter Unit Price in Grid");
				return false;
			}			
			var letterNumber = /^[0-9]+$/;
			if(buyPrice.match(letterNumber))
			{
				if(quantity=="" || quantity==null)
				{
					alert("Please Enter Quantity in Grid");
					return false;
				}
				var letterNumber = /^[0-9]+$/;
				if(quantity.match(letterNumber))
				{
				
					
				}
				else
				{
					alert("Please Enter Numbers in Quantity in Grid");
					return false;
				}	
			}
			else
			{
				alert("Please Enter Numbers in Unit Price in Grid");
				return false;
			}
	}
	
//	var gst = $('#gst').val();
//	if(gst=="" || gst==null)
//	{
//		alert("Please Enter GST");
//		return false;
//	}
//	var letterNumber = /^[0-9]+$/;
//	if(gst.match(letterNumber))
//	{
//		
//	}
//	else
//	{
//		alert("Please Enter Only Numbers in GST");
//		return false;
//	}

	addHrBillDetails();
		
}

//Add HrBill Info
function addHrBillDetails()
{
	var params = {};
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{
		
		var description = allRowsInGrid[i].description;
		params["description"+i] = description;
		
		var hsn = allRowsInGrid[i].hsn;
		params["hsn"+i] = hsn;
		
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i] = quantity;
		
		var buyPrice = allRowsInGrid[i].buyPrice;
		params["buyPrice"+i] = buyPrice;
		
		var gridAmount = allRowsInGrid[i].gridAmount;
		params["gridAmount"+i] = gridAmount;
		
		var gridDiscountPercent = allRowsInGrid[i].gridDiscountPercent;
		params["gridDiscountPercent"+i] = gridDiscountPercent;
		
		var gridDiscountAmount = allRowsInGrid[i].gridDiscountAmount;
		params["gridDiscountAmount"+i] = gridDiscountAmount;
		
		var gridSubTotal = allRowsInGrid[i].gridSubTotal;
		params["gridSubTotal"+i] = gridSubTotal;
		
		var gridGstPercent = allRowsInGrid[i].gridGstPercent;
		params["gridGstPercent"+i] = gridGstPercent;
		
		var gridGstPercentAmount = allRowsInGrid[i].gridGstPercentAmount;
		params["gridGstPercentAmount"+i] = gridGstPercentAmount;
				
		var total = allRowsInGrid[i].total;
		params["total"+i] = total;

	}

	//var billno = $('#billno').val();
	var vendorName = $('#fk_vendor_id').val();
	var billingDate = $('#billingDate').val();
	var billingPeriodFrom = $('#billingPeriodFrom').val();
	var billingPeriodTo = $('#billingPeriodTo').val();
//	var subTotal = $('#subTotal').val();
//	var gst = $('#gst').val();
//	var vat = $('#vat').val();
	var grossTotal1 =$('#grossTotal1').val();
	
	var input1 = document.getElementById('fk_vendor_id'),
	list = document.getElementById('vendorNameList'), i, fkVendorId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["count"] = count;
	
	
	params["fkVendorId"] = fkVendorId; 
	params["vendorName"] = vendorName;
	params["billingDate"] = billingDate;
	params["billingPeriodFrom"] = billingPeriodFrom;
	params["billingPeriodTo"] = billingPeriodTo;
//	params["subTotal"] = subTotal;
//	params["gst"] =gst;
//	params["vat"] = vat;
	params["grossTotal1"] = grossTotal1;
	
	
	//params["billno"] = billno;
	
	params["methodName"] = "HRBillingDetailas";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) 
	{
		//alert(data);
			window.open("TestVendorBillingPDF.jsp");
			/*window.open("VendorBillingPDF.jsp");*/
		location.reload();
		
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}



//get Product Billing Grid validation
function getProductBillingGrid()
{
	if(document.productForm.description1.value=="" || document.productForm.description1.value==null)
		{
			alert('Enter description. . .');
			return false;		
		}
	getProductGridAsPerDescription();
	
}

//get Product Billing Grid
function getProductGridAsPerDescription()
	{
		var params={};
		var count=0;
		var newrow;
		var rowId;
		
		var description=$('#description1').val();
		
		params["description"] = description;
		
		params["methodName"] ="gridForProductBill";
		
		 $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
				{
			  var jsonData = $.parseJSON(data);
				
		      // $("#productGrid").jqGrid("clearGridData", true).trigger("reloadGrid");
				        
		     $.each(jsonData,function(i,v)
				{
		    	 		    	 
		    	 count = jQuery("#productGrid").jqGrid('getGridParam', 'records'); 
			     var rowdata =$("#productGrid").jqGrid('getGridParam','data');
			     var ids = jQuery("#productGrid").jqGrid('getDataIDs');
			     				
				  var prodName,com,packing,unit;
				  for (var j = 0; j < count; j++) 
				  {
					  prodName = rowdata[j].description;
					
					 var rowId = ids[j];
					 var rowData = jQuery('#productGrid').jqGrid ('getRowData', rowId);
					
					if (prodName == jsonData.offer.description) 
					{
				    	newrow=false;
						alert("Product Name Already Inserted !!!");
						var grid = jQuery("#productGrid");
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
						
					  //$("#productGrid").addRowData(i,jsonData[i]);
					  $("#productGrid").addRowData(count,jsonData.offer);
						
					 }
			
			
			$("#productGrid").jqGrid({
				datatype: "local",
					
				colNames:['Product Name','HSN','Sale Price','Quantity','Amount','Discount%','DiscountAmt','SubTotal','GST%','GST AMT','Total'],
				colModel:[ 
						               
				     {	name:'description',
				    	 width:42,
				    	 editable: true
				    	
					},					
					{	name:'hsn',
						width:20,
						editable: true
						
					},					   										
					{	name:'buyPrice',
				    	 width:30,
				    	 editable: true
					},
					{	name:'quantity',
						width:28,
						editable: true
						
					},
					{	name:'gridAmount',
				    	 width:30,
				    	 editable: false
					},
					{	name:'gridDiscountPercent',
				    	 width:35,
				    	 editable: true
					},
					{	name:'gridDiscountAmount',
				    	 width:40,
				    	 editable: false
					},
					{	name:'gridSubTotal',
				    	 width:30,
				    	 editable: false
					},
					{	name:'gridGstPercent',
				    	 width:20,
				    	 editable: true
					},
					{	name:'gridGstPercentAmount',
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
				width: 1250,
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
				        	    var rowId =$("#productGrid").jqGrid('getGridParam','selrow');  
		                        var rowData = jQuery("#productGrid").getRowData(rowId);
		                    	var quantity = rowData['quantity'];
		                    	var buyPrice = rowData['buyPrice'];
		                    	/*var gst = rowData['gst'];
		                    	
		                    	if (gst != 0){
	                    			var taxPercentage = gst;
		                    		var taxAmount = ((taxPercentage/100)*buyPrice);
		                    		var BuyPriceWithTaxAmount = Number(taxAmount) + Number(buyPrice);
		                    		var tota = quantity * BuyPriceWithTaxAmount;
			                    		$("#productGrid").jqGrid("setCell", rowId, "total", Math.round(tota));
		                    	}
		                    	 if(gst == 0){
		                    		var  taxPercentage = Number(gst);
		                    		var taxAmount = ((taxPercentage/100)*buyPrice);
		                    		var BuyPriceWithTaxAmount = Number(taxAmount) + Number(buyPrice);
		                    		var tota = quantity * BuyPriceWithTaxAmount;
		                    		$("#productGrid").jqGrid("setCell", rowId, "total", Math.round(tota));
		                    		
		                    	}*/
		                    	
		                    	/* 	Calculation of Amount after editing quantity*/
		                    	var gridAmountCal = (quantity * buyPrice);
		                    	$("#productGrid").jqGrid("setCell", rowId, "gridAmount", gridAmountCal.toFixed(2));
		                    	
		                    	/* 	Calculation of discountAmountCal after editing discountPercent*/
		                    	var gridDiscountPercent = rowData['gridDiscountPercent'];	        		        	
	        		        	var gridDiscountAmountCal = (gridAmountCal * gridDiscountPercent) / 100;
	        		        	$("#productGrid").jqGrid("setCell", rowId, "gridDiscountAmount", gridDiscountAmountCal.toFixed(2));
	        		        	
	        		        	/* 	Calculation of gridSubTotal to after editing discountPercent*/	        		        	
	        		        	var gridSubTotalcal = gridAmountCal - gridDiscountAmountCal;
	        		        	$("#productGrid").jqGrid("setCell", rowId, "gridSubTotal", gridSubTotalcal.toFixed(2));
	        		        	
	        		        	/* 	Calculation of gridGstAmount and gridGstTaxAmount after editing gridCSGstPercent and gridIGstPercent*/
		                    	var gridGstPercent = rowData['gridGstPercent'];
	        		        	var gridGstPercentAmountCal = (gridSubTotalcal * gridGstPercent) / 100;
	        		        	$("#productGrid").jqGrid("setCell", rowId, "gridGstPercentAmount", gridGstPercentAmountCal.toFixed(2));
	        		        	
	        		        	/* 	Calculation of Total after editing GST%*/	        		        	
//		                    	var tota = gridSubTotalcal + gridGstPercentAmountCal;
//	                    		$("#jqgrid").jqGrid("setCell", rowId, "total", tota);
		                    	
	                    		var tota = gridSubTotalcal + gridGstPercentAmountCal;
//		                    	var tota = quantity * buyPrice;
	                    		$("#productGrid").jqGrid("setCell", rowId, "total", tota.toFixed(2));
	                    		
	                    		var Total =0;
	                    		var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#productGrid').getGridParam('data');
	        		        	var AllRows=JSON.stringify(allRowsInGrid1);
	        		        	for (var k = 0; k < count; k++) {
	        		        		var Total1 = allRowsInGrid1[k].total;
	        		        		Total = +Total + +Total1;
	        		        	}
//	        		        	document.getElementById("subTotal1").value = Total;
//	        		        	document.getElementById("gst1").value = "";
//		     		        	document.getElementById("vat1").value = "";
		     		        	document.getElementById("grossTotal2").value = Total;
		                    	
		        	},
	           
				pager: "#jqGridPager1",
				
			});
			
		
			//$("#productGrid").addRowData(i+1,jsonData[i]);
			if(count==0 || count==null)
			{
				 // $("#productGrid").addRowData(i,jsonData[i]);
				  $("#productGrid").addRowData(0,jsonData.offer);
			}
			

	     
			 $('#productGrid').navGrid('#jqGridPager1',
		                
		                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
		                
		                {
		                    editCaption: "The Edit Dialog",
		                   
		                    afterSubmit: function () {
								
		                      var grid = $("#productGrid"),
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
			                    var rowId =$("#productGrid").jqGrid('getGridParam','selrow');  
			                       var rowData = jQuery("#productGrid").getRowData(rowId);
			                    	var quantity = rowData['quantity'];
			                    	var buyPrice = rowData['buyPrice'];
			                    	
			                    	var tota = quantity * buyPrice;
		                 		$("#productGrid").jqGrid("setCell", rowId, "total", tota);
		                 		
	                 		var Total =0;
	                 		var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	     		        	var allRowsInGrid1 = $('#productGrid').getGridParam('data');
	     		        	var AllRows=JSON.stringify(allRowsInGrid1);
	     		        	for (var k = 0; k < count; k++) {
	     		        		var Total1 = allRowsInGrid1[k].total;
	     		        		Total = +Total + +Total1;
	     		        	}
//	     		        	document.getElementById("subTotal1").value = Total;	     		        	
//	     		        	document.getElementById("gst1").value = "";
//	     		        	document.getElementById("vat1").value = "";
	     		        	document.getElementById("grossTotal2").value = Total;
	     		        	
		                  }
		                });
			 
				});
				
			})

	
	}	

//Resource Billing Report By Name And Dates validation
function getVendorHrBillingDetailsByNameValidation()
{
	var vendorName = $("#fk_vendor_id").val();
	var startDate = $("#fisDate").val();
	var endDate = $("#endDate").val();
	
	if(vendorName=="" || vendorName==null) 
	{
		alert("Please Select Vendor Name");
		$("#fk_vendor_id").focus();
		return false;
	}
	if(startDate=="" || startDate==null) 
	{
		alert("Please Select start Date");
		$("#fisDate").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		alert("Please Select end Date");
		$("#endDate").focus();
		return false;
	}
	getVendorHrBillingDetailsByName();	
}

//Resource Billing Report By Name And Dates
function getVendorHrBillingDetailsByName()
{
	var params= {};
	
	var vendorName = $("#fk_vendor_id").val();
	var startDate = $("#fisDate").val();
	var endDate = $("#endDate").val();
	
	var input = document.getElementById('fk_vendor_id'),
	list = document.getElementById('vendorNameList'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input.value) 
		{
			fkVendorPaymentId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	params["fkVendorPaymentId"]= fkVendorPaymentId; 
	params["vendorName"]= vendorName; 
	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getVendorHrBillingReportBetweenTwoDatesAndName";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#vendorBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		
		
		$(document).ready(function()
		{
			$('#vendorBetweenTwoDates').DataTable({
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

				},
				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [

						  {"data": "srNo", "width": "5%" ,"defaultContent": ""},
					      {"data": "vendorName", "width": "5%" ,"defaultContent": ""},
					      {"data": "billNo", "width": "5%" ,"defaultContent": ""},	
					      {"data": "dateOfBilling", "width": "5%" ,"defaultContent": ""},	
					      {"data": "description", "width": "5%" ,"defaultContent": ""},
					      {"data": "buyPrice", "width": "5%" ,"defaultContent": ""},
					      {"data": "quantity", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridAmount", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridDiscountPercent", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridDiscountAmount", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridSubTotal", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridGstPercent", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridGstPercentAmount", "width": "5%" ,"defaultContent": ""},
					      {"data": "total", "width": "5%" ,"defaultContent": ""},
				          {"data": "gst" , "width": "5%" ,"defaultContent": ""}, 
				          {"data": "vat" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
					             
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Resource Billing Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Resource Billing Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Resource Billing Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Resource Billing Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );

		var mydata = catmap;
		$('#vendorBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}


//Product Billing Report By Name And Dates validation
function getClientHrBillingDetailsByNameValidation()
{
	var vendorName = $("#fk_client_id").val();
	var startDate = $("#fis1Date").val();
	var endDate = $("#end1Date").val();
	
	if(vendorName=="" || vendorName==null) 
	{
		alert("Please Select Client Name");
		$("#fk_client_id").focus();
		return false;
	}
	if(startDate=="" || startDate==null) 
	{
		alert("Please Select start Date");
		$("#fis1Date").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		alert("Please Select end Date");
		$("#end1Date").focus();
		return false;
	}
	getClientHrBillingDetailsByName();	
}

//Product Billing Report By Name And Dates validation
function getClientHrBillingDetailsByName()
{
	var params= {};
	
	var vendorName = $("#fk_client_id").val();
	var startDate = $("#fis1Date").val();
	var endDate = $("#end1Date").val();
	
	
	var input = document.getElementById('fk_client_id'),
	list = document.getElementById('clientNameList'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input.value) 
		{
			fkVendorPaymentId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkVendorPaymentId"]= fkVendorPaymentId; 
	params["vendorName"]= vendorName; 
	params["fis1Date"]= startDate;
	params["end1Date"]= endDate;
	
	params["methodName"] = "getClientHrBillingReportBetweenTwoDatesAndName";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#clientBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		
		
		$(document).ready(function()
		{
			$('#clientBetweenTwoDates').DataTable({
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

				},
				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [

						  {"data": "srNo", "width": "5%" ,"defaultContent": ""},
					      {"data": "clientName", "width": "5%" ,"defaultContent": ""},
					      {"data": "billNo", "width": "5%" ,"defaultContent": ""},	
					      {"data": "dateOfBilling", "width": "5%" ,"defaultContent": ""},	
					      {"data": "description", "width": "5%" ,"defaultContent": ""},
					      {"data": "buyPrice", "width": "5%" ,"defaultContent": ""},
					      {"data": "quantity", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridAmount", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridDiscountPercent", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridDiscountAmount", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridSubTotal", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridGstPercent", "width": "5%" ,"defaultContent": ""},
					      {"data": "gridGstPercentAmount", "width": "5%" ,"defaultContent": ""},					
					      {"data": "total", "width": "5%" ,"defaultContent": ""},
				          {"data": "gst" , "width": "5%" ,"defaultContent": ""}, 
				          {"data": "vat1" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
					             
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Product Billing Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Product Billing Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Product Billing Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Product Billing Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );

		var mydata = catmap;
		$('#clientBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}





/*

function hrBillingList()
{


	var params= {};
	
	params["methodName"] = "getExpenditurePaymentList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		
		$('#hrBillingList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#hrBillingList').DataTable( {

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
				columns: [
				        
				          {"data": "vendorName", "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfBilling", "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfBillingFrom", "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfBillingTo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          
				          {"data": "buyPrice" , "width": "5%" ,"defaultContent": ""},
				          
				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "gst" , "width": "5%" ,"defaultContent": ""},
				          {"data": "vat" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Hr Billing Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#hrBillingList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

*/
/*
function productBillingList()
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
				columns: [
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "billNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "purchaseDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
				          
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "buyPrice" , "width": "5%" ,"defaultContent": ""},
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
				                    		 return "Quotation Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#purchaseOrderReceiveList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

}*/

function getResourseBillingReportByDatesValidation()        
{
	
	var startDate = $("#fis1Date66").val();
	var endDate = $("#end1Date66").val();
	
	
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
		$("#fis1Date66").focus();
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
		$("#end1Date66").focus();
		return false;
	}
	getResourceBillingReportByDates();	
}

//Resource Billing Report By Name And Dates
function getResourceBillingReportByDates()
{
	var params= {};
	
	
	var startDate = $("#fis1Date66").val();
	var endDate = $("#end1Date66").val();
	
	
	params["startDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getResourceBillingReportByBetweenTwoDates";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#resourceTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for Dates \nFrom "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function()
		{
			$('#resourceTwoDates').DataTable({
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
				},
				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
					
					 {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			         {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
			         {"data": "billDate", "width": "5%" ,"defaultContent": ""},
			         {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			         {"data": "billPeriodStartDate" , "width": "5%" ,"defaultContent": ""},				          
			         {"data": "billPeriodEndDate" , "width": "5%" ,"defaultContent": ""},
			         {"data": "productName" , "width": "5%" ,"defaultContent": ""},
			         {"data": "description" , "width": "5%" ,"defaultContent": ""},
			         {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
			         {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			         {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			         {"data": "amount" , "width": "5%" ,"defaultContent": ""},
			         {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
			         {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
			         {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			         {"data": "GST" , "width": "5%" ,"defaultContent": ""},
//			         {"data": "SGST" , "width": "5%" ,"defaultContent": ""},				          
			         {"data": "IGST" , "width": "5%" ,"defaultContent": ""},
			         {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			         {"data": "total", "width": "5%" ,"defaultContent": ""},
			         {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			         {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			         {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			         {"data": "gstNo" , "width": "5%" ,"defaultContent": ""},
			    ],
			    dom : 'Bfrtip',
		          buttons : [
		        	  {
	                    	 extend: 'copyHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 }
	                     },
	                     {
	                    	 extend: 'excelHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 }
	                     },
	                     {
	                    	 extend: 'csvHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 }
	                     },
	                     {
	                    	 extend : 'pdfHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 },
	                    	 orientation : 'landscape',
	                    	 pageSize : 'LEGAL',
	                    	 titleAttr : 'PDF' 
	                     }
	              ]
			} );
		} );

		var mydata = catmap;
		$('#resourceTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}


function getCommonBillingReportByDatesValidation()        
{
	
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	
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
		$("#fis1Date66").focus();
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
		$("#end1Date66").focus();
		return false;
	}
	getCommonBillingReportByDates();	
}

//Resource Billing Report By Name And Dates
function getCommonBillingReportByDates()
{
	var params= {};
	
	
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	
	params["startDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getCommonBillingReport";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#commonTable').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for Dates \nFrom "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function()
		{
			$('#commonTable').DataTable({
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
				},
				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
					
					 {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			         {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
			         {"data": "billDate", "width": "5%" ,"defaultContent": ""},
			         {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			         {"data": "billPeriodStartDate" , "width": "5%" ,"defaultContent": ""},				          
			         {"data": "billPeriodEndDate" , "width": "5%" ,"defaultContent": ""},
			         {"data": "productName" , "width": "5%" ,"defaultContent": ""},
			         {"data": "description" , "width": "5%" ,"defaultContent": ""},
			         {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
			         {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			         {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			         {"data": "amount" , "width": "5%" ,"defaultContent": ""},
			         {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
			         {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
			         {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			         {"data": "GST" , "width": "5%" ,"defaultContent": ""},
//			         {"data": "SGST" , "width": "5%" ,"defaultContent": ""},				          
			         {"data": "IGST" , "width": "5%" ,"defaultContent": ""},
			         {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			         {"data": "total", "width": "5%" ,"defaultContent": ""},
			         {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			         {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			         {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			    ],
			    dom : 'Bfrtip',
		          buttons : [
		        	  {
	                    	 extend: 'copyHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 }
	                     },
	                     {
	                    	 extend: 'excelHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 }
	                     },
	                     {
	                    	 extend: 'csvHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 }
	                     },
	                     {
	                    	 extend : 'pdfHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Resource Billing Report";
	                    	 },
	                    	 orientation : 'landscape',
	                    	 pageSize : 'LEGAL',
	                    	 titleAttr : 'PDF' 
	                     }
	              ]
			} );
		} );

		var mydata = catmap;
		$('#commonTable').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}

function getPDFofAllResourceBilling()
{

	var bill, vendorName, totalSubTotal, GST, IGST, totalTaxAmount, grossTotal, startDate, endDate, billDate;
	
	$(document).ready(function () {
		var table = $('#resourceTwoDates').DataTable();
		bill = table.column( [1] ).data();
		vendorName = table.column( [3]).data();
		totalSubtotal = table.column([19]).data();
		GST = table.column([15]).data();
		IGST = table.column([16]).data();
		totalTaxAmount = table.column([20]).data();
		grossTotal = table.column([21]).data();
		startDate = table.column([4]).data();
		endDate = table.column([5]).data();
		billDate = table.column([2]).data();
		
	        console.log(bill);
	       
	});
	
     var params= {};
     var count = bill.length;
	
	for(var i=0;i<bill.length;i++)
		{
	params["BillNo"]= bill[i];
	params["vendorName"] = vendorName[i];
	params["totalSubtotal"] = totalSubtotal[i];
	params["GST"] = GST[i];
	params["IGST"] = IGST[i];
	params["totalTaxAmount"] = totalTaxAmount[i];
	params["grossTotal"] = grossTotal[i];
	params["startDate"] = startDate[i];
	params["endDate"] = endDate[i];
	params["billDate"] = billDate[i];
		
	params["Count"] = count;
	
	params["methodName"] = "getDownloadAllPDFAtOnce";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		if(data != null)
			{
			//window.open("ResourcePerfromaPDF.jsp");
			
			}
		
		
			});
	    //  sleep(20 * 10000);
	
		}
	

}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}




function productBillDetailsValidation1()
{
	var CourierName=$('#CourierName').val();
	var Courierid=$('#Courierid').val();
	
//alert(CourierName+Courierid)
	
	
	if(document.productBilling.fkClientId.value==""){
		swal({
		     title: "Alert!",
		     text: "Please Select Client Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Client Name");
		document.getElementById("fkClientId").focus();
		return false;
	 }
	
	
	if(document.productBilling.productBillDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Bill Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Bill Date");
		document.getElementById("productBillDate").focus();
		return false;
	}
	
/*	if(document.productBilling.ShipAddress.value==""){
		alert("Enter Shipping  Address");
		document.getElementById("ShipAddress").focus();
		return false;
	 }*/
	
	
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
		
	if(count <= 0)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Product Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		 //alert("Please Enter Product Name");
		 document.getElementById("productName").focus();
		 return false;
	}
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#productGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{
		var fkProductId = allRowsInGrid[i].fkProductId;
		var productName = allRowsInGrid[i].productName;
		var description = allRowsInGrid[i].description;
		var hsnSac = allRowsInGrid[i].hsnSac;
		var unitPrice = allRowsInGrid[i].unitPrice;
		var quantity = allRowsInGrid[i].quantity;		
		var amount = allRowsInGrid[i].amount;
		var discountPercent = allRowsInGrid[i].discountPercent;
		var discountAmount = allRowsInGrid[i].discountAmount;
		var subTotal = allRowsInGrid[i].subTotal;
		var CGST = allRowsInGrid[i].CGST;
		var SGST = allRowsInGrid[i].SGST;
		var IGST = allRowsInGrid[i].IGST;
		var taxAmount = allRowsInGrid[i].taxAmount;
		var total = allRowsInGrid[i].total;
		
		if(fkProductId=="" || fkProductId==null || fkProductId==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter FK Product Id..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter FK Product Id");
			//allRowsInGrid[i].productName.focus();
			return false;
		}
		if(productName=="" || productName==null || productName==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Product/Resourcen Name..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Product/Resourcen Name");
			//allRowsInGrid[i].productName.focus();
			return false;
		}
		/*if(description=="" || description==null || description==undefined)
		{
			alert("Please Enter Description");
			//allRowsInGrid[i].description.focus();
			return false;
		}*/
		if(hsnSac=="" || hsnSac==null || hsnSac==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter HSN/SAC..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter HSN/SAC");
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
//		if(discountPercent=="" || discountPercent==null || discountPercent==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter Discount Percent..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//			//alert("Please Enter Discount Percent");
//			//allRowsInGrid[i].discountPercent.focus();
//			return false;
//		}
//		if(discountAmount=="" || discountAmount==null || discountAmount==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter Discount Amount..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//			//alert("Please Enter Discount Amount");
//			//allRowsInGrid[i].discountAmount.focus();
//			return false;
//		}
		
	/*	if(CGST=="" || CGST==null || CGST==undefined ||SGST=="" || SGST==null || SGST==undefined || IGST=="" || IGST==null || IGST==undefined)
		{
			alert("Please Enter CGST and SGST Or IGST");
			//allRowsInGrid[i].GST.focus();
			return false;
		}*/		
		var CSGSTPercent = CGST+SGST;
		var IGSTPercent = IGST;
		if(CSGSTPercent > 0 && IGSTPercent > 0)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter CGST and SGST Or IGST Only, Both Taxes are not allowed (CGST / SGST and IGST)..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter CGST and SGST Or IGST Only, Both Taxes are not allowed (CGST / SGST and IGST)");
			//allRowsInGrid[i].GST.focus();
			return false;
		}
		if(CGST > 0 && SGST <= 0)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter CGST and SGST Both..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter CGST and SGST Both");
			//allRowsInGrid[i].SGST.focus();
			return false;
		}
		if(SGST > 0 && CGST <= 0)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter CGST and SGST Both..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter CGST and SGST Both");
			//allRowsInGrid[i].CGST.focus();
			return false;
		}
		
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
	
	
		if(document.productBilling.totalSubTotalProduct.value==""){
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Sub Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Sub Total");
			document.getElementById("totalSubTotalProduct").focus();
			return false;
		 }
		if(document.productBilling.totalTaxAmountProduct.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Tax Amount..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			alert("Please Enter Total Tax Amount");
			document.getElementById("totalTaxAmountProduct").focus();
			return false;
		}	
		if(document.productBilling.grossTotalProduct.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Gross Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Gross Total");
			document.getElementById("grossTotalProduct").focus();
			return false;
		}

		productBillDetails1();
	
}

//Add HrBill Info
function productBillDetails1()
{
	document.productBilling.btn2.disabled = true;
	
	var params = {};
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#productGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	//get clientName through pkId(fkClientId)
	var clientName = $('#fkClientId').val();
	
	var input1 = document.getElementById('fkClientId'),
	list = document.getElementById('clientNamesList'), i, fkClientId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}
	
	var productBillDate = $('#productBillDate').val();
	
	for(var i=0;i<count;i++)
	{
		var fkProductId = allRowsInGrid[i].fkProductId;
		params["fkProductId"+i] = fkProductId;
		
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
		
		var CGST = allRowsInGrid[i].CGST;
		params["CGST"+i] = CGST;
		
		var SGST = allRowsInGrid[i].SGST;
		params["SGST"+i] = SGST;
		
		var IGST = allRowsInGrid[i].IGST;
		params["IGST"+i] = IGST;
		
		var taxAmount = allRowsInGrid[i].taxAmount;
		params["taxAmount"+i] = taxAmount;
		
		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
	}
	
	var totalSubTotalProduct = $('#totalSubTotalProduct').val();
	var totalTaxAmountProduct = $('#totalTaxAmountProduct').val();
	var grossTotalProduct = $('#grossTotalProduct').val();
	
	var ShipAddress=$('#ShipAddress').val();
	//alert(ShipAddress);
	
	
	var CourierName=$('#CourierName').val();
	var Courierid=$('#Courierid').val();
	
	params["count"] = count;
	params["fkClientId"] = fkClientId; 
	params["clientName"] = clientName;
	params["productBillDate"] = productBillDate;
	params["totalSubTotalProduct"] = totalSubTotalProduct;
	params["totalTaxAmountProduct"] = totalTaxAmountProduct;

	params["grossTotalProduct"] = grossTotalProduct;
	
	params["ShipAddress"] = ShipAddress;
	
	params["CourierName"] = CourierName;
	params["Courierid"] = Courierid;
	
	params["methodName"] = "saveProductBillingDetails1";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) 
	{
		swal({
		     title: "Success!",
		     text: "Proforma Invoice Details Added Successfully !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		 });
		//alert(data);
			//window.open("TestVendorBillingPDF.jsp");
			/*window.open("VendorBillingPDF.jsp");*/
			//window.open("TestClientBillingPDF.jsp");
		window.open("proframainvoicepdf.jsp");
		location.reload();
		
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}
function getProductBillGrid1()
{
	if(document.productBilling.productName.value == "" || document.productBilling.productName.value == null)
		{
			alert('Please Select Product Name');
			return false;
		}
	productBillGrid1();
}

//productBillGrid
function productBillGrid1()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var productName = $('#productName').val();

	var input1 = document.getElementById('productName'), list = document
			.getElementById('productNameList'), i, fkProductId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkProductId = list.options[i].getAttribute('data-value');
		}
	}

	params["fkProductId"] = fkProductId;
	params["productName"] = productName;
	
	params["methodName"] = "getGridForProductBilling";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			// $("#productGrid").jqGrid("clearGridData", true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
				document.getElementById("productName").value = "";
		    	count = jQuery("#productGrid").jqGrid('getGridParam', 'records'); 
			    var rowdata =$("#productGrid").jqGrid('getGridParam','data');
			    var ids = jQuery("#productGrid").jqGrid('getDataIDs');
			    
			    var productName,com,packing,unit;
				
			    for (var j = 0; j < count; j++) 
			    {
			    	productName = rowdata[j].productName;
			    	
			    	var rowId = ids[j];
					var rowData = jQuery('#productGrid').jqGrid ('getRowData', rowId);
					if (productName == v[0].productName) 
					{
				    	newrow=false;
						alert("Product Name Already Inserted !!!");
						var grid = jQuery("#productGrid");
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
				  //$("#productGrid").addRowData(i,jsonData[i]);
				  $("#productGrid").addRowData(count,jsonData.offer);					
				 }
			    	
		$("#productGrid").jqGrid({
			datatype: "local",
			
			colNames:['FK Product Id','Product Name','Description','HSN/SAC','Unit Price','Quantity','Amount','Discount%','Discount Amt','SubTotal','CGST%','SGST%','IGST%','TAX AMT','Total'],
			colModel:[ 
				
				{
					name : 'fkProductId',
					width : 20,
					editable : false,
					hidden : true
				},
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
				{	name:'CGST',
			    	 width:24,
			    	 editable: true
				},
				{	name:'SGST',
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
			        	    var rowId =$("#productGrid").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#productGrid").getRowData(rowId);
	                    	var unitPrice = rowData['unitPrice'];
	                    	var quantity = rowData['quantity'];
	                    	
	                    	/* 	Calculation of Amount after editing quantity*/
	                    	var amount = (unitPrice * quantity);
	                    	$("#productGrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
	                    	
	                    	/* 	Calculation of discountAmount after editing discountPercent*/
	                    	var discountPercent = rowData['discountPercent'];	        		        	
        		        	var discountAmount = (amount * discountPercent) / 100;
        		        	$("#productGrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
        		        	var subTotal = amount-discountAmount;
        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
        		        	$("#productGrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
        		        	
        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
        		        	var CGST = rowData['CGST']; 		        	
        		        	var CGSTAmount = (subTotal * CGST) / 100;
        		        	var SGST = rowData['SGST']; 		        	
        		        	var SGSTAmount = (subTotal * SGST) / 100;
        		        	var IGST = rowData['IGST']; 		        	
        		        	var IGSTAmount = (subTotal * IGST) / 100;
        		        	var taxAmount = (CGSTAmount + SGSTAmount + IGSTAmount);
        		        	
	                    	//var GST = rowData['GST'];
	                    	//var IGST = rowData['IGST'];
        		        	//var taxAmount = ((subTotal * GST) / 100) + ((subTotal * IGST) / 100);
        		        	$("#productGrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
	                    	
        		        	/* 	Calculation of Total after editing CGST and SGST or IGST% */        		        	
	                    	var total = subTotal + taxAmount; 
                    		$("#productGrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
                    		
                    		var grossTotal = 0;
                    		var totalSubTotal = 0;
                    		var totalTaxAmount = 0;
                    		var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#productGrid').getGridParam('data');
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
			  $("#productGrid").addRowData(0,jsonData.offer);
		}
		     
		 $('#productGrid').navGrid('#jqGridPager1',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#productGrid"),
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
				        	    var rowId =$("#productGrid").jqGrid('getGridParam','selrow');  
		                        var rowData = jQuery("#productGrid").getRowData(rowId);
		                    	var unitPrice = rowData['unitPrice'];
		                    	var quantity = rowData['quantity'];
		                    	
		                    	/* 	Calculation of Amount after editing quantity*/
		                    	var amount = (unitPrice * quantity);
		                    	$("#productGrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
		                    	
		                    	/* 	Calculation of discountAmount after editing discountPercent*/
		                    	var discountPercent = rowData['discountPercent'];	        		        	
	        		        	var discountAmount = (amount * discountPercent) / 100;
	        		        	$("#productGrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
	        		        	var subTotal = amount-discountAmount;
	        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
	        		        	$("#productGrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
	        		        	
	        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
	        		        	var CGST = rowData['CGST']; 		        	
	        		        	var CGSTAmount = (subTotal * CGST) / 100;
	        		        	var SGST = rowData['SGST']; 		        	
	        		        	var SGSTAmount = (subTotal * SGST) / 100;
	        		        	var IGST = rowData['IGST']; 		        	
	        		        	var IGSTAmount = (subTotal * IGST) / 100;
	        		        	var taxAmount = (CGSTAmount + SGSTAmount + IGSTAmount);
	        		        	
		                    	//var GST = rowData['GST'];
		                    	//var IGST = rowData['IGST'];
	        		        	//var taxAmount = ((subTotal * GST) / 100) + ((subTotal * IGST) / 100);
	        		        	$("#productGrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of Total after editing GST or IGST% */        		        	
		                    	var total = subTotal + taxAmount;
	                    		$("#productGrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
	                    		
	                    		var grossTotal = 0;
	                    		var totalSubTotal = 0;
	                    		var totalTaxAmount = 0;
	                    		var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#productGrid').getGridParam('data');
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




function fetchbillno(){

	var input1 = document.getElementById('fkClientId'),
	list = document.getElementById('clientNamesList'),
	i,fkClientId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}

	var fk_cat_id = fk_cat_id;
	
	$("#BillNo").empty();
	$("#BillNo").append($("<option></option>").attr("value","").text("Select Bill No"));
	var params= {};

	params["fkClientId"]= fkClientId;
	params["methodName"] = "getAllBillNoAgainst";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				//$("#BillNo").append($("<option></option>").attr("value",(v.billNo))); 
				$("#BillNo").append($("<option></option>").attr("value",i.billNo).text(v.billNo));
				document.getElementById("ShipAddress").value= v.address;
				document.getElementById("CourierName").value= v.curiorName;
				document.getElementById("Courierid").value= v.curiorNo;
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

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
	
	params["methodName"] = "GetCompoentnametoselectReport2";
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



function getProductBillingReportByNameAndDatesValidation1()
{
	var vendorName = $("#fk_client_id1").val();
	var startDate = $("#fis1Date1").val();
	var endDate = $("#end1Date1").val();
	
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
		$("#fk_client_id").focus();
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
		$("#fis1Date").focus();
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
		$("#end1Date").focus();
		return false;
	}
	getProductBillingReportByNameAndDates1();
}

//Product Billing Report By Name And Dates
function getProductBillingReportByNameAndDates1()
{
	var params= {};
	
	var clientName = $("#fk_client_id1").val();
	var startDate = $("#fis1Date1").val();
	var endDate = $("#end1Date1").val();
	
	
	var input = document.getElementById('fk_client_id1'),
	list = document.getElementById('clientNameList1'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input.value) 
		{
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}
	//fkClientId
	params["fkClientId"]= fkClientId; 
	params["clientName"]= clientName;
	params["startDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getProductBillingReportByNameAndDates1";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#clientBetweenTwoDates1').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+clientName+" \nFrom "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function()
		{
			$('#clientBetweenTwoDates1').DataTable({
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

				},
				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
									
					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			        {"data": "billNo" , "width": "5%" ,"defaultContent": ""},
			        {"data": "billDate", "width": "5%" ,"defaultContent": ""},
			        {"data": "clientName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "productName" , "width": "5%" ,"defaultContent": ""},
			        {"data": "description" , "width": "5%" ,"defaultContent": ""},
			        {"data": "hsnSac", "width": "5%" ,"defaultContent": ""},
			        {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			        {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
			        {"data": "amount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "discountPercent" , "width": "5%" ,"defaultContent": ""},
			        {"data": "discountAmount", "width": "5%" ,"defaultContent": ""},
			        {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "CGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "SGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "IGST" , "width": "5%" ,"defaultContent": ""},
			        {"data": "taxAmount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "total", "width": "5%" ,"defaultContent": ""},
			        {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			        {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			        {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
			        
			   ],
			   dom : 'Bfrtip',
		          buttons : [ 
		                     { extend: 'copyHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Proforma Billing Report";
		                    	 }},
		                     { extend: 'excelHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Proforma Billing Report";
		                    	 }},
		                     { extend: 'csvHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Proforma Billing Report";
		                    	 }},
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Proforma Billing Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]
			} );
		} );
		
		var mydata = catmap;
		$('#clientBetweenTwoDates1').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}

function fetchResourcebillno(){

	var input1 = document.getElementById('fkVendorId'),
	list = document.getElementById('vendorNamesList'),
	i,fkVendorId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}

	$("#resrcbillNo").empty();
	$("#resrcbillNo").append($("<option></option>").attr("value","").text("Select Bill No"));
	var params= {};

	params["fkVendorId"]= fkVendorId;
	
	params["methodName"] = "getAllResourceBillNoAgainst";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ 
			var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				$("#resrcbillNo").append($("<option></option>").attr("value",i.billNo).text(v.billNo));
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}



//New get Resource Bill Grid
function getResourceBillGrid2()	// Old fn - getResourceBillGrid()
{
	/*if(document.resourceBilling.productResourceName.value=="" || document.resourceBilling.productResourceName.value==null)
		{
			alert('Please Enter Product/Resource Name');
			return false;		
		}*/
	resourceBillGrid2();
}


//get Resource Bill Grid
function resourceBillGrid2()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var billno = $('#resrcbillNo').val();
	
	
	if(billno == null || billno == "" || billno == " " || billno == undefined)
	{
		
		var productName = $('#productResourceName').val();
		
		params["productName"] = productName;
	}
	else
		{
		params["billno"] = billno;
		}
	
	//params["productName"] = productName;
	
	params["methodName"] ="getGridForResourceBilling2"; //Old mtd - getGridForResourceBilling
	
	document.getElementById('resrcbillNo').value = null;
	var productResourceName=$('#productResourceName').val();
	
//	$("#billPeriodStartDate").append($("<option></option>").attr("value","").text("Select Bill No"));
//	$("#billPeriodEndDate").append($("<option></option>").attr("value","").text("Select Bill No"));
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			// $("#jqgrid").jqGrid("clearGridData", true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
				var quantity = v[0].quantity;
				if( quantity != 0 )
					{
				var startDate = v[0].startDate;
				var endDate = v[0].endDate;
					
				
				$('#billPeriodStartDate').val(startDate);
				$('#billPeriodEndDate').val(endDate);
					}
//				var totaldisamt= document.getElementById("totalSubTotal").value;
//				 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
//				 {
//					 totaldisamt=0;
//					// var unitPrice = v. unitPrice
//					 //var quantity = v. quantity
//					 //totaldisamt=unitPrice*quantity ;
//					 //document.getElementById("totalSubTotalProduct").value = totaldisamt.toFixed(2);
//				 }
//				  var totalDis = v.subTotal;
//				  totaldisamt = +totaldisamt + +totalDis;
//				document.getElementById("totalSubTotal").value = totaldisamt.toFixed(2);
//				
//				
//				
//				var totaldisamt= document.getElementById("totalTaxAmount").value;
//				 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
//				 {
//					 totaldisamt=0;
//				 }
//				  var totalDis = v.taxAmount;
//				  totaldisamt = +totaldisamt + +totalDis;
//				document.getElementById("totalTaxAmount").value = totaldisamt.toFixed(2);
//				
//				
//				var gross= document.getElementById("grossTotal").value;
//				 if(gross=="" || gross==null || gross==undefined)
//				 {
//				 gross=0;
//				 }
//				  var gs = v.total;
//				 gross = +gross + +gs;
//				 
//				document.getElementById("grossTotal").value = gross.toFixed(2);
				
				document.getElementById("totalSubTotal").value = parseInt(0);
				document.getElementById("totalTaxAmount").value = parseInt(0);
				document.getElementById("grossTotal").value = parseInt(0);
				
				
				for(var k =0; k<v.length;k++)
					{
					var totalsubamt= parseInt(document.getElementById("totalSubTotal").value);
				    document.getElementById("totalSubTotal").value = totalsubamt + parseInt(v[k].subTotal);
				    
				    var totaltaxamt= parseInt(document.getElementById("totalTaxAmount").value);
				    document.getElementById("totalTaxAmount").value =  totaltaxamt + parseInt(v[k].taxAmount);
				    
				    //var totalgrossamt= parseInt(document.getElementById("grossTotal").value);
					document.getElementById("grossTotal").value =  parseInt(document.getElementById("totalSubTotal").value) + parseInt(document.getElementById("totalTaxAmount").value);
				    
					}
				
				
				var plaintext = document.getElementById("grossTotal"); 
	      	    plaintext.style.color = "#FF0000";
				document.getElementById("productResourceName").value = "";
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
			
			colNames:['Product<br>Name','Description','HSN/SAC','Unit<br>Price','Quantity','Amount','Discount%','Discount<br>Amt','SubTotal','GST%','IGST%','TAX<br>AMT','Total','billNo','pkResourceBillId'],
			colModel:[ 
				
			    {	name:'productName',
			    	 width:42,
			    	// editable: true	
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
					hidden: true,
				},					
				{	name:'pkResourceBillId',
					width:40,
					hidden: true,
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
						//recreateForm: true,
	                	
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


function getResourceBillGrid12()
{
	if(document.resourceBilling.ResourceName.value=="" || document.resourceBilling.ResourceName.value==null)
		{
			alert('Please Enter Product/Resource Name');
			return false;		
		}
	resourceBillGrid1();
}


//get Resource Bill Grid
function resourceBillGrid1()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var productResourceName=$('#ResourceName').val();
	//alert(productResourceName);
	params["productResourceName"] = productResourceName;
	
	params["methodName"] ="getGridForResourceBilling";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			// $("#jqgrid").jqGrid("clearGridData", true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
		//		document.getElementById("ResourceName").value = "";
		    	count = jQuery("#jqgrid2").jqGrid('getGridParam', 'records'); 
			    var rowdata =$("#jqgrid2").jqGrid('getGridParam','data');
			    var ids = jQuery("#jqgrid2").jqGrid('getDataIDs');
			    
			    var productName,com,packing,unit;
				
			    for (var j = 0; j < count; j++) 
			    {
			    	productName = rowdata[j].productName;
			    	
			    	var rowId = ids[j];
					var rowData = jQuery('#jqgrid2').jqGrid ('getRowData', rowId);
					if (productName == jsonData.offer.productName) 
					{
				    	newrow=false;
						alert("Product Name Already Inserted !!!");
						var grid = jQuery("#jqgrid2");
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
				  $("#jqgrid2").addRowData(count,jsonData.offer);					
				 }
			    	
		$("#jqgrid2").jqGrid({
			datatype: "local",
			
			colNames:['Service Name','Description','HSN/SAC','Unit Price','Quantity','Amount','Discount%','Discount Amt','SubTotal','GST%','IGST%','TAX AMT','Total'],
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
			        	    var rowId =$("#jqgrid2").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#jqgrid2").getRowData(rowId);
	                    	var unitPrice = rowData['unitPrice'];
	                    	var quantity = rowData['quantity'];
	                    	
	                    	/* 	Calculation of Amount after editing quantity*/
	                    	var amount = (unitPrice * quantity);
	                    	$("#jqgrid2").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
	                    	
	                    	/* 	Calculation of discountAmount after editing discountPercent*/
	                    	var discountPercent = rowData['discountPercent'];	        		        	
      		        	var discountAmount = (amount * discountPercent) / 100;
      		        	$("#jqgrid2").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
	                    	
      		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
      		        	var subTotal = amount-discountAmount;
      		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
      		        	$("#jqgrid2").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));        		        	
      		        	
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
      		        	
      		        	$("#jqgrid2").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
	                    	
      		        	/* 	Calculation of Total after editing CGST and SGST or IGST% */        		        	
	                    	var total = subTotal + taxAmount;
                  		$("#jqgrid2").jqGrid("setCell", rowId, "total", total.toFixed(2));
                  		
                  		var grossTotal = 0;
                  		var totalSubTotal = 0;
                  		var totalTaxAmount = 0;
                  		var count = jQuery("#jqgrid2").jqGrid('getGridParam', 'records');
      		        	var allRowsInGrid1 = $('#jqgrid2').getGridParam('data');
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
         
			pager: "#jqGridPager2",
		});
				
		//$("#jqgrid").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#jqgrid").addRowData(i,jsonData[i]);
			  $("#jqgrid2").addRowData(0,jsonData.offer);
		}
		     
		 $('#jqgrid2').navGrid('#jqGridPager2',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#jqgrid2"),
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
				        	    var rowId =$("#jqgrid2").jqGrid('getGridParam','selrow');  
		                        var rowData = jQuery("#jqgrid2").getRowData(rowId);
		                    	var unitPrice = rowData['unitPrice'];
		                    	var quantity = rowData['quantity'];
		                    	
		                    	/* 	Calculation of Amount after editing quantity*/
		                    	var amount = (unitPrice * quantity);
		                    	$("#jqgrid2").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
		                    	
		                    	/* 	Calculation of discountAmount after editing discountPercent*/
		                    	var discountPercent = rowData['discountPercent'];	        		        	
	        		        	var discountAmount = (amount * discountPercent) / 100;
	        		        	$("#jqgrid2").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of subTotal to after editing discountPercent*/	        		        	
	        		        	var subTotal = amount-discountAmount;
	        		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
	        		        	$("#jqgrid2").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
	        		        	
	        		        	/* 	Calculation of taxAmount after editing CGST and SGST or IGST*/
	        		        	//var CGST = rowData['CGST']; 		        	
	        		        	//var CGSTAmount = (subTotal * CGST) / 100;
	        		        	var GST = rowData['SGST']; 		        	
	        		        	var GSTAmount = (subTotal * GST) / 100;
	        		        	var IGST = rowData['IGST']; 		        	
	        		        	var IGSTAmount = (subTotal * IGST) / 100;
	        		        	var taxAmount = (GSTAmount + IGSTAmount);	        		        	       		        	
	        		        	$("#jqgrid2").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
		                    	
	        		        	/* 	Calculation of Total after editing GST or IGST% */        		        	
		                    	var total = subTotal + taxAmount;
	                    		$("#jqgrid2").jqGrid("setCell", rowId, "total", total.toFixed(2));
	                    		
	                    		var grossTotal = 0;
	                    		var totalSubTotal = 0;
	                    		var totalTaxAmount = 0;
	                    		var count = jQuery("#jqgrid2").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#jqgrid2').getGridParam('data');
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
		//document.getElementById("ResourceName").reset();
	$('#ResourceName').val(function() {
	      if (this.value.length == 0) {
	          return $(this).attr('');
	        }
	      });
}




//resource Bill Validation
function resourceBillValidation12()
{
	if(document.resourceBilling.fkVendorId.value==""){
		swal({
		     title: "Alert!",
		     text: "Please Select Vendor Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Vendor Name");
		document.getElementById("fkVendorId").focus();
		return false;
	 }
	if(document.resourceBilling.billDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Bill Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Bill Date");
		document.getElementById("billDate").focus();
		return false;
	}	
	if(document.resourceBilling.billPeriodStartDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Billing Peroiod Start Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Billing Peroiod Start Date");
		document.getElementById("billPeriodStartDate").focus();
		return false;
	}
	if(document.resourceBilling.billPeriodEndDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Billing Period End Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Billing Period End Date");
		document.getElementById("billPeriodEndDate").focus();
		return false;
	}
	
	var count = jQuery("#jqgrid2").jqGrid('getGridParam', 'records');
		
	if(count <= 0)
	{
		/*swal({
		     title: "Alert!",
		     text: "Please Enter Product/Resourcen Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});*/
		 //alert("Please Enter Product/Resourcen Name");
		 document.getElementById("ResourceName").focus();
		// return false;
	}
	
	var count = jQuery("#jqgrid2").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid2').getGridParam('data');//to get all rows of grid
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
			     text: "Please Enter Product/Resourcen Name..!",
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
			//alert("Please Enter HSN/SAC");
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
//		if(discountPercent=="" || discountPercent==null || discountPercent==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter Discount Percent..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//			//alert("Please Enter Discount Percent");
//			//allRowsInGrid[i].discountPercent.focus();
//			return false;
//		}
//		if(discountAmount=="" || discountAmount==null || discountAmount==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter Discount Amount..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//			//alert("Please Enter Discount Amount");
//			//allRowsInGrid[i].discountAmount.focus();
//			return false;
//		}
		
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
	
		if(document.resourceBilling.totalSubTotal.value==""){
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Sub Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Sub Total");
			document.getElementById("totalSubTotal").focus();
			return false;
		 }
		if(document.resourceBilling.totalTaxAmount.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Tax Amount..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Tax Amount");
			document.getElementById("totalTaxAmount").focus();
			return false;
		}	
		if(document.resourceBilling.grossTotal.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Gross Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Gross Total");
			document.getElementById("grossTotal").focus();
			return false;
		}
		
		/*var totalSubTotal = $('#totalSubTotal').val();
		var totalTaxAmount = $('#totalTaxAmount').val();
		var grossTotal = $('#grossTotal').val();
		
		if(totalSubTotal=="" || totalSubTotal==null || totalSubTotal==undefined)
		{
			alert("Please Enter Total Sub Total");
			document.getElementById("totalSubTotal").focus();
			return false;
		}*/
		
	/*var gst = $('#gst').val();
	if(gst=="" || gst==null)
	{
		alert("Please Enter GST");
		return false;
	}
	var letterNumber = /^[0-9]+$/;
	if(gst.match(letterNumber))
	{
		
	}
	else
	{
		alert("Please Enter Only Numbers in GST");
		return false;
	}*/

	resourceBill2();
	
}

//Add HrBill resourceBill Info
function resourceBill2()
{
	document.resourceBilling.btn1.disabled = true;
	var params = {};
	var count = jQuery("#jqgrid2").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid2').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	//get vendorName through pkId(fkVendorId)
	var vendorName = $('#fkVendorId').val();
	
	var input1 = document.getElementById('fkVendorId'),
	list = document.getElementById('vendorNamesList'), i, fkVendorId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
	
	var billDate = $('#billDate').val();
	var billPeriodStartDate = $('#billPeriodStartDate').val();
	var billPeriodEndDate = $('#billPeriodEndDate').val();
	
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
	
	params["vendorName"] = vendorName; 
	params["fkVendorId"] = fkVendorId;
	params["billDate"] = billDate;
	params["billPeriodStartDate"] = billPeriodStartDate;
	params["billPeriodEndDate"] = billPeriodEndDate;
	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;	
	
	params["methodName"] = "saveperfromaResourceBillDetails";
	
	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) 
			{
				swal({
				     title: "Success!",
				     text: "Resource Bill Details Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				 });
				//alert(data);
					//window.open("TestVendorBillingPDF.jsp");
					/*window.open("VendorBillingPDF.jsp");*/
					//window.open("TestClientBillingPDF.jsp");
				window.open("ResourcePerfromaPDF.jsp");
					
				location.reload();
				
			}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});	
	
}

function getAlleditResourceBillNoAgainst(){

	var input1 = document.getElementById('fkVendorId'),
	list = document.getElementById('vendorNamesList'),
	i,fkVendorId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}

	$("#resrcbillNo").empty();
	$("#resrcbillNo").append($("<option></option>").attr("value","").text("Select Bill No"));
	var params= {};

	params["fkVendorId"]= fkVendorId;
	
	params["methodName"] = "getAlleditResourceBillNoAgainst";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ 
			var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				$("#resrcbillNo").append($("<option></option>").attr("value",i.billNo).text(v.billNo));
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

function getRPIBillingDate()
{
	var resrcbillNo = $('#resrcbillNo').val();
	
	$("#billPeriodStartDate").append($("<input/>").attr("value", "").text());
	$("#billPeriodEndDate").append($("<input/>").attr("value", "").text());
	
	var params= {};
	
	params["resrcbillNo"]= resrcbillNo;
	
	params["methodName"] = "getRPIBillingDate";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ 
			//var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				document.getElementById("billPeriodStartDate").value = v.strStartDate;
				document.getElementById("billPeriodEndDate").value = v.strEndDate;
				
				//count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}



//New get Resource Bill Grid
function getEditResourceBillGrid2()	// Old fn - getResourceBillGrid()
{
	/*if(document.resourceBilling.productResourceName.value=="" || document.resourceBilling.productResourceName.value==null)
		{
			alert('Please Enter Product/Resource Name');
			return false;		
		}*/
	resourceEditBillGrid2();
}


//get Resource Bill Grid
function resourceEditBillGrid2()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var billno = $('#resrcbillNo').val();
	
	
	if(billno == null || billno == "" || billno == " " || billno == undefined)
	{
		
		var productName = $('#productResourceName').val();
		
		params["productName"] = productName;
	}
	else
		{
		params["billno"] = billno;
		}
	
	//params["productName"] = productName;
	
	params["methodName"] ="getGridForEditResourceBilling2"; //Old mtd - getGridForResourceBilling
	
	document.getElementById('resrcbillNo').value = null;
	var productResourceName=$('#productResourceName').val();
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			// $("#jqgrid").jqGrid("clearGridData", true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
				    document.getElementById("totalSubTotal").value = v[0].totalSubTotal;
		        	document.getElementById("totalTaxAmount").value = v[0].totalTaxAmount;
		        	document.getElementById("grossTotal").value =v[0].grossTotal; 
				
//				var totaldisamt= document.getElementById("totalSubTotal").value;
//				 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
//				 {
//					 totaldisamt=0;
//					// var unitPrice = v. unitPrice
//					 //var quantity = v. quantity
//					 //totaldisamt=unitPrice*quantity ;
//					 //document.getElementById("totalSubTotalProduct").value = totaldisamt.toFixed(2);
//				 }
//				  var totalDis = v.subTotal;
//				  totaldisamt = +totaldisamt + +totalDis;
//				document.getElementById("totalSubTotal").value = totaldisamt.toFixed(2);
//				
//				var totaldisamt= document.getElementById("totalTaxAmount").value;
//				 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
//				 {
//					 totaldisamt=0;
//				 }
//				  var totalDis = v.taxAmount;
//				  totaldisamt = +totaldisamt + +totalDis;
//				//document.getElementById("totalTaxAmount").value = totaldisamt.toFixed(2);
//				
//				
//				var gross= document.getElementById("grossTotal").value;
//				 if(gross=="" || gross==null || gross==undefined)
//				 {
//				 gross=0;
//				 }
				//  var gs = v.total;
				// gross = +gross + +gs;
				 
				// document.getElementById("grossTotal").value = gross.toFixed(2);
				var plaintext = document.getElementById("grossTotal"); 
	      	    plaintext.style.color = "#FF0000";
				document.getElementById("productResourceName").value = "";
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
			
			colNames:['Product<br>Name','Description','HSN/SAC','Unit<br>Price','Quantity','Amount','Discount%','Discount<br>Amt','SubTotal','GST%','IGST%','TAX<br>AMT','Total','billNo','pkResourceBillId'],
			colModel:[ 
				
			    {	name:'productName',
			    	 width:42,
			    	// editable: true	
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
					hidden: true,
				},					
				{	name:'pkResourceBillId',
					width:40,
					hidden: true,
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




//resource Bill Updation
function editResourceBill()
{
	if(document.editRsrcBilling.fkVendorId.value==""){
		swal({
		     title: "Alert!",
		     text: "Please Select Vendor Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		
		document.getElementById("fkVendorId").focus();
		return false;
	 }
	if(document.editRsrcBilling.billDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Bill Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		document.getElementById("billDate").focus();
		return false;
	}	
	if(document.editRsrcBilling.billPeriodStartDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Billing Peroiod Start Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		document.getElementById("billPeriodStartDate").focus();
		return false;
	}
	if(document.editRsrcBilling.billPeriodEndDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Billing Period End Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		document.getElementById("billPeriodEndDate").focus();
		return false;
	}
	
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
		
/*	if(count <= 0)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select RPI Bill Number..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		 document.getElementById("resrcbillNo").focus();
		 return false;
	}*/
	
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
			     text: "Please Enter Product/Resourcen Name..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
		
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
		
			return false;
		}
//		if(discountPercent=="" || discountPercent==null || discountPercent==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter Discount Percent..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//		
//			return false;
//		}
//		if(discountAmount=="" || discountAmount==null || discountAmount==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter Discount Amount..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//		
//			return false;
//		}
		
//		if(GST=="" || GST==null || GST==undefined || IGST=="" || IGST==null || IGST==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter GST Or IGST..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//			
//			return false;
//		}

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
		
			return false;
		}

		
//		if(taxAmount=="" || taxAmount==null || taxAmount==undefined)
//		{
//			swal({
//			     title: "Alert!",
//			     text: "Please Enter Tax Amount..!",
//			     icon: 'error',
//			     timer: 2500,
//			     button:false
//			});
//			
//			return false;
//		}
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
	
		if(document.editRsrcBilling.totalSubTotal.value==""){
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Sub Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Sub Total");
			document.getElementById("totalSubTotal").focus();
			return false;
		 }
		if(document.editRsrcBilling.totalTaxAmount.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Tax Amount..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Tax Amount");
			document.getElementById("totalTaxAmount").focus();
			return false;
		}	
		if(document.editRsrcBilling.grossTotal.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Gross Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Gross Total");
			document.getElementById("grossTotal").focus();
			return false;
		}
		

	updateResourceBill2();
	
}

//Add HrBill resourceBill Info
function updateResourceBill2()
{
	document.editRsrcBilling.btn1.disabled = true;
	var params = {};
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	//get vendorName through pkId(fkVendorId)
	var vendorName = $('#fkVendorId').val();
	
	var input1 = document.getElementById('fkVendorId'),
	list = document.getElementById('vendorNamesList'), i, fkVendorId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
	
	var billDate = $('#billDate').val();
	var billPeriodStartDate = $('#billPeriodStartDate').val();
	var billPeriodEndDate = $('#billPeriodEndDate').val();
	
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
		
		var pkResourceBillId = allRowsInGrid[i].pkResourceBillId;
		params["pkResourceBillId"+i] = pkResourceBillId;
		
		var billNo = allRowsInGrid[i].billNo;
		params["billNo"+i] = billNo;
	}
	
	var totalSubTotal = $('#totalSubTotal').val();
	var totalTaxAmount = $('#totalTaxAmount').val();
	var grossTotal = $('#grossTotal').val();
	
	params["count"] = count;	
	
	params["vendorName"] = vendorName; 
	params["fkVendorId"] = fkVendorId;
	params["billDate"] = billDate;
	params["billPeriodStartDate"] = billPeriodStartDate;
	params["billPeriodEndDate"] = billPeriodEndDate;
	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;	
	
	params["methodName"] = "updateResourceBill2";
	
	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) 
			{
				swal({
				     title: "Success!",
				     text: "Resource Bill Details Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				 });
				
				window.open("ResourceBillEditPDF.jsp");
					
				location.reload();
				
			}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});	
	
}

function fetchProdEditbillno(){

	var input1 = document.getElementById('fkClientId'),
	list = document.getElementById('clientNamesList'),
	i,fkClientId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}

	var fk_cat_id = fk_cat_id;
	
	$("#BillNo").empty();
	$("#BillNo").append($("<option></option>").attr("value","").text("Select Bill No"));
	var params= {};

	params["fkClientId"]= fkClientId;
	params["methodName"] = "getProdEditbillnoAgainst";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				//$("#BillNo").append($("<option></option>").attr("value",(v.billNo))); 
				$("#BillNo").append($("<option></option>").attr("value",i.billNo).text(v.billNo));
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


function fetchEditProdBillDetails()
{
	var prodbillNo = $('#BillNo').val();
	
	$("#productBillDate").append($("<input/>").attr("value", "").text());
	$("#ShipAddress").append($("<input/>").attr("value", "").text());
	$("#CourierName").append($("<input/>").attr("value", "").text());
	$("#Courierid").append($("<input/>").attr("value", "").text());
	
	var params= {};
	
	params["prodbillNo"]= prodbillNo;
	
	params["methodName"] = "fetchEditProdBillDetails";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ 

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				document.getElementById("productBillDate").value = v.strBillDate;
				document.getElementById("ShipAddress").value = v.shipAdreess;
				document.getElementById("CourierName").value = v.curiorName;
				document.getElementById("Courierid").value = v.TrackingNumber;
				document.getElementById("totalSubTotalProduct").value =v.totalSubTotal;
				document.getElementById("totalTaxAmountProduct").value =v.totalTaxAmount;
				document.getElementById("grossTotalProduct").value =v.grossTotal;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


//getEditProductBillGrid

function getEditProductBillGrid()
{
	/*if(document.productBilling.productName.value == "" || document.productBilling.productName.value == null)
		{
			alert('Please Select Product Name');
			return false;
		}*/
	
	editProductBillGrid();
}

//productBillGrid
function editProductBillGrid()
{	
	var rowDelete = 0;
	var params={};
	var count=0;
	var newrow;
	var rowId;
	var billno = $('#BillNo').val();
	
	
	if(billno == null || billno == "" || billno == " " || billno == undefined)
	{
		
		var productName = $('#productName').val();
	var input1 = document.getElementById('productName'), list = document
			.getElementById('productNameList'), i, fkProductId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkProductId = list.options[i].getAttribute('data-value');
		}
	}

	params["fkProductId"] = fkProductId;
	params["productName"] = productName;
	}
	else
		{
		params["billno"] = billno;
		}
	
	params["methodName"] = "getEditGridForProductBilling";
	
	document.getElementById('BillNo').value = null;
	document.getElementById('productName').value = null;
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			// $("#productGrid").jqGrid("clearGridData",
			// true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
				
				
				/*var totaldisamt= document.getElementById("totalSubTotalProduct").value;
				 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
				 {
					 totaldisamt=0;
					// var unitPrice = v. unitPrice
					 // var quantity = v. quantity
					 // totaldisamt=unitPrice*quantity ;
					 // document.getElementById("totalSubTotalProduct").value= totaldisamt.toFixed(2);
				
				 }
				  var totalDis = v.subTotal;
				  totaldisamt = +totaldisamt + +totalDis;
				  document.getElementById("totalSubTotalProduct").value = totaldisamt.toFixed(2);
				
				var totaldisamt= document.getElementById("totalTaxAmountProduct").value;
				 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
				 {
					 totaldisamt=0;
				 }
				  var totalDis = v.taxAmount;
				  totaldisamt = +totaldisamt + +totalDis;
				document.getElementById("totalTaxAmountProduct").value = totaldisamt.toFixed(2);
				
				
				var gross= document.getElementById("grossTotalProduct").value;
				 if(gross=="" || gross==null || gross==undefined)
				 {
				 gross=0;
				 }
				  var gs = v.total;
				 gross = +gross + +gs;
				 
				document.getElementById("grossTotalProduct").value = gross.toFixed(2);*/
				var plaintext = document.getElementById("grossTotalProduct"); 
	      	    plaintext.style.color = "#FF0000";
				
				document.getElementById("productName").value = "";
		    	count = jQuery("#productGrid").jqGrid('getGridParam', 'records'); 
			    var rowdata =$("#productGrid").jqGrid('getGridParam','data');
			    var ids = jQuery("#productGrid").jqGrid('getDataIDs');
			
			    
			    var productName,com,packing,unit,billNo;
				
			    for (var j = 0; j < count; j++) 
			    {
			    	productName = rowdata[j].productName;
			    	billNo = rowdata[j].billNo;
			    	var rowId = ids[j];
					var rowData = jQuery('#productGrid').jqGrid ('getRowData', rowId);
					if (productName == jsonData.offer.productName) 
					{
				    	newrow=false;
						alert("Product Name OR Bill No  Already Inserted !!!");
						var grid = jQuery("#productGrid");
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
				  // $("#productGrid").addRowData(i,jsonData[i]);
				  $("#productGrid").addRowData(count,jsonData.offer);					
				 }
			    	
		$("#productGrid").jqGrid({
			datatype: "local",
			
			colNames:['Product<br>Name','Description','HSN/SAC','Unit<br>Price','Qty','Amount','Sub<br>Total','Tax%','CGST%','SGST%','IGST%','TAX<br>AMT','Total','billNo','Discount%','Discount<br>Amt','pkProductBillId'],
			colModel:[ 
				
				
			    {	name:'productName',
			    	 width:42,
			    	 // editable: true
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
				
				{	name:'subTotal',
			    	 width:30,
			    	 editable: false
				},
				{	name:'taxPercentage',
			    	 width:24,
			    	 editable: true
				},
				
				{	name:'CGST',
			    	 // width:24,
			    	 editable: true,
			    	 hidden:true,
				},
				{	name:'SGST',
			    	 // width:24,
			    	 editable: true,
			    	 hidden:true,
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
				{ 
		        	   name: "billNo",
		        	
		        	   hidden:true,
		        	   width:50,
		          },
		          {	name:'discountPercent',
				    	 width:35,
				    	 editable: true
					},
					{	name:'discountAmount',
				    	 width:40,
				    	 editable: false
					},
					
					{	name:'pkProductBillId',
						width:30,
						hidden: true						
					},
			],
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 1500,
			// height: 350,
			shrinkToFit:true,
          rowheight: 300,
          hoverrows: true,
	        rownumbers: true,
          rowNum: 10,
          'cellEdit':true,
       	 afterSaveCell: function  grossTotal() {
			       /* Calculation of total after editing quantity */
			        	   
			        	   // $(this).trigger('reloadGrid');
			        	    var rowId =$("#productGrid").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#productGrid").getRowData(rowId);
	                    	var unitPrice = rowData['unitPrice'];
	                    	var quantity = rowData['quantity'];
	                    	
	                    	/* Calculation of Amount after editing quantity */
	                    	var amount = (unitPrice * quantity);
	                    	$("#productGrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
	                    	
	                    	/*
							 * Calculation of discountAmount after editing
							 * discountPercent
							 */
	                    	var discountPercent = rowData['discountPercent'];	        		        	
      		        	var discountAmount = (amount * discountPercent) / 100;
      		        	$("#productGrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
	                    	
      		        	/*
						 * Calculation of subTotal to after editing
						 * discountPercent
						 */	        		        	
      		        	var subTotal = amount-discountAmount;
      		        	// var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
      		        	$("#productGrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
      		        	
      		        	/*
						 * Calculation of taxAmount after editing CGST and SGST
						 * or IGST
						 */
      		        	// var CGST = rowData['CGST'];
      		        	var gest= rowData['taxPercentage'];
      		        	var gst = (subTotal * gest) / 100;
      		        	// var SGST = rowData['SGST'];
      		        	// var SGSTAmount = (subTotal * SGST) / 100;
      		        	var IGST = rowData['IGST']; 
      		        	
      		        	
      		        	var IGSTAmount = (subTotal * IGST) / 100;
      		        	var taxAmount = (gst + IGSTAmount);
      		        	
      		        	
      		        	if( Number(gest)>0 &&  Number(IGST)>0  )
							{
								 var setValue = 0;
								 
								 var msg = "You Can't Enter value For Both tax";
							
							alert(msg);
					            $("#productGrid").jqGrid("setCell",rowId,"IGST",setValue);
					           		
					           		 return false;									
							}
      		        	 if (Number(IGST)>0) {
      		        		
      		        		var setValue = 0;
      		        		$("#productGrid").jqGrid("setCell",rowId,"SGST",setValue);
      		        		$("#productGrid").jqGrid("setCell",rowId,"CGST",setValue);
      		        		$("#productGrid").jqGrid("setCell",rowId,"taxPercentage",setValue);
								
							}
      		        	
      		        	
	                    	// var GST = rowData['GST'];
	                    	// var IGST = rowData['IGST'];
      		        	// var taxAmount = ((subTotal * GST) / 100) + ((subTotal
						// * IGST) / 100);
      		        	$("#productGrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
	                    	
      		        	/*
						 * Calculation of Total after editing CGST and SGST or
						 * IGST%
						 */        		        	
	                    	var total = subTotal + taxAmount; 
                  		$("#productGrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
                  		
                  		var grossTotal = 0;
                  		var totalSubTotal = 0;
                  		var totalTaxAmount = 0;
                  		var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
      		        	var allRowsInGrid1 = $('#productGrid').getGridParam('data');
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
				
	
		if(count==0 || count==null)
		{
			
			  $("#productGrid").addRowData(0,jsonData.offer);
		}
		     
		 $('#productGrid').navGrid('#jqGridPager1',
	                
	                { edit: true, add: false, del: false, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#productGrid"),
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
		                    	rowDelete++;
		                    	// $(this).trigger('reloadGrid');
				        	    var rowId =$("#productGrid").jqGrid('getGridParam','selrow');  
		                        var rowData = jQuery("#productGrid").getRowData(rowId);
		                    	var unitPrice = rowData['unitPrice'];
		                    	var quantity = rowData['quantity'];
		                    	// rowDelete = 0;
		                    	/* Calculation of Amount after editing quantity */
		                    	var amount = (unitPrice * quantity);
		                    	$("#productGrid").jqGrid("setCell", rowId, "amount", amount.toFixed(2));
		                    	
		                    	/*
								 * Calculation of discountAmount after editing
								 * discountPercent
								 */
		                    	var discountPercent = rowData['discountPercent'];	        		        	
	        		        	var discountAmount = (amount * discountPercent) / 100;
	        		        	$("#productGrid").jqGrid("setCell", rowId, "discountAmount", discountAmount.toFixed(2));
		                    	
	        		        	/*
								 * Calculation of subTotal to after editing
								 * discountPercent
								 */	        		        	
	        		        	var subTotal = amount-discountAmount;
	        		        	// var gridSubTotalcal =
								// gridSubTotalcal2.toFixed(2);
	        		        	$("#productGrid").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
	        		        	
	        		        	/*
								 * Calculation of taxAmount after editing CGST
								 * and SGST or IGST
								 */
	        		        	// var CGST = rowData['CGST'];
	        		        	// var CGSTAmount = (subTotal * CGST) / 100;
	        		        	// var SGST = rowData['SGST'];
	        		        	var gest= rowData['taxPercentage'];
	        		        	var GSTAmount = (subTotal * gest) / 100;
	        		        	var IGST = rowData['IGST']; 		        	
	        		        	var IGSTAmount = (subTotal * IGST) / 100;
	        		        	var taxAmount = (GSTAmount+ IGSTAmount);
	        		        	
		                    	// var GST = rowData['GST'];
		                    	// var IGST = rowData['IGST'];
	        		        	// var taxAmount = ((subTotal * GST) / 100) +
								// ((subTotal * IGST) / 100);
	        		        	$("#productGrid").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));
		                    	
	        		        	/*
								 * Calculation of Total after editing GST or
								 * IGST%
								 */        		        	
		                    	var total = subTotal + taxAmount;
	                    		$("#productGrid").jqGrid("setCell", rowId, "total", total.toFixed(2));
	                    		
	                    		var grossTotal = 0;
	                    		var totalSubTotal = 0;
	                    		var totalTaxAmount = 0;
	                    		var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#productGrid').getGridParam('data');
	        		        	var AllRows=JSON.stringify(allRowsInGrid1);
	        		        	for (var k = 0; k < count; k++) {
	        		        		var grossTotal1 = allRowsInGrid1[k].total;
	        		        		grossTotal = +grossTotal + +grossTotal1;
	        		        		
	        		        		var totalSubTotal1 = allRowsInGrid1[k].subTotal;
	        		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
	        		        		
	        		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
	        		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
	        		        	}
	        		        	/*
								 * document.getElementById("totalSubTotalProduct").value =
								 * totalSubTotal.toFixed(2);
								 * document.getElementById("totalTaxAmountProduct").value =
								 * totalTaxAmount.toFixed(2);
								 * document.getElementById("grossTotalProduct").value =
								 * grossTotal.toFixed(2);
								 */		        	
	                  }
	                });			 
			});				
		})	
}


//product Bill Details Validation
function productBillDetailsUpdate()
{
	var CourierName=$('#CourierName').val();
	var Courierid=$('#Courierid').val();
	
	if(document.editProdBilling.fkClientId.value==""){
		swal({
		     title: "Alert!",
		     text: "Please Select Client Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Client Name");
		document.getElementById("fkClientId").focus();
		return false;
	 }
	
	
	if(document.editProdBilling.productBillDate.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Bill Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Bill Date");
		document.getElementById("productBillDate").focus();
		return false;
	}
	
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
		
	if(count <= 0)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Product Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		 //alert("Please Enter Product Name");
		 document.getElementById("productName").focus();
		 return false;
	}
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#productGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	for(var i=0;i<count;i++)
	{
		//var fkProductId = allRowsInGrid[i].fkProductId;
		var productName = allRowsInGrid[i].productName;
		var description = allRowsInGrid[i].description;
		var hsnSac = allRowsInGrid[i].hsnSac;
		var unitPrice = allRowsInGrid[i].unitPrice;
		var quantity = allRowsInGrid[i].quantity;		
		var amount = allRowsInGrid[i].amount;
		var discountPercent = allRowsInGrid[i].discountPercent;
		var discountAmount = allRowsInGrid[i].discountAmount;
		var subTotal = allRowsInGrid[i].subTotal;
		var CGST = allRowsInGrid[i].CGST;
		var SGST = allRowsInGrid[i].SGST;
		var IGST = allRowsInGrid[i].IGST;
		var taxAmount = allRowsInGrid[i].taxAmount;
		var total = allRowsInGrid[i].total;
		var taxPercentage = allRowsInGrid[i].taxPercentage;
		
/*		if(fkProductId=="" || fkProductId==null || fkProductId==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter FK Product Id..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter FK Product Id");
			//allRowsInGrid[i].productName.focus();
			return false;
		}*/
		if(productName=="" || productName==null || productName==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Product/Resourcen Name..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Product/Resourcen Name");
			//allRowsInGrid[i].productName.focus();
			return false;
		}
		/*if(description=="" || description==null || description==undefined)
		{
			alert("Please Enter Description");
			//allRowsInGrid[i].description.focus();
			return false;
		}*/
		if(hsnSac=="" || hsnSac==null || hsnSac==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter HSN/SAC..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter HSN/SAC");
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
		
		var CSGSTPercent = CGST+SGST;
		var IGSTPercent = IGST;
		
		
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
	
	
		if(document.editProdBilling.totalSubTotalProduct.value==""){
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Sub Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Sub Total");
			document.getElementById("totalSubTotalProduct").focus();
			return false;
		 }
		if(document.editProdBilling.totalTaxAmountProduct.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Total Tax Amount..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Total Tax Amount");
			document.getElementById("totalTaxAmountProduct").focus();
			return false;
		}	
		if(document.editProdBilling.grossTotalProduct.value=="")
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Gross Total..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter Gross Total");
			document.getElementById("grossTotalProduct").focus();
			return false;
		}

		updateproductBillDetails();
	
}

//updateproductBillDetails

function updateproductBillDetails()
{
	document.editProdBilling.btn2.disabled = true;
	
	var params = {};
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#productGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	//get clientName through pkId(fkClientId)
	var clientName = $('#fkClientId').val();
	
	var input1 = document.getElementById('fkClientId'),
	list = document.getElementById('clientNamesList'), i, fkClientId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}
	
	var productBillDate = $('#productBillDate').val();
	
	for(var i=0;i<count;i++)
	{
		//var fkProductId = allRowsInGrid[i].fkProductId;
		//params["fkProductId"+i] = fkProductId;
		
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
		
		var CGST = allRowsInGrid[i].CGST;
		params["CGST"+i] = CGST;
		
		var SGST = allRowsInGrid[i].SGST;
		params["SGST"+i] = SGST;
		
		var IGST = allRowsInGrid[i].IGST;
		params["IGST"+i] = IGST;
		
		var taxAmount = allRowsInGrid[i].taxAmount;
		params["taxAmount"+i] = taxAmount;
		
		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
		
		var billNo = allRowsInGrid[i].billNo;
		params["billNo"+i] = billNo;
		
		var taxPercentage = allRowsInGrid[i].taxPercentage;
		params["taxPercentage"+i] = taxPercentage;
		
		var pkProductBillId = allRowsInGrid[i].pkProductBillId;
		params["pkProductBillId"+i] = pkProductBillId;
		
	}
	
	var totalSubTotalProduct = $('#totalSubTotalProduct').val();
	var totalTaxAmountProduct = $('#totalTaxAmountProduct').val();
	var grossTotalProduct = $('#grossTotalProduct').val();
	
	var ShipAddress=$('#ShipAddress').val();
	//alert(ShipAddress);
	
	
	var CourierName=$('#CourierName').val();
	var Courierid=$('#Courierid').val();
	
	params["count"] = count;
	params["fkClientId"] = fkClientId; 
	params["clientName"] = clientName;
	params["productBillDate"] = productBillDate;
	params["totalSubTotalProduct"] = totalSubTotalProduct;
	params["totalTaxAmountProduct"] = totalTaxAmountProduct;

	params["grossTotalProduct"] = grossTotalProduct;
	
	params["ShipAddress"] = ShipAddress;
	
	params["CourierName"] = CourierName;
	params["Courierid"] = Courierid;
	
	params["methodName"] = "updateProductBillingDetails";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) 
	{
		swal({
		     title: "Success!",
		     text: "Product Bill Details Updated Successfully !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		 });
		//alert(data);
			window.open("ClientBillingEditPDF.jsp");
			location.reload();
		
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}





