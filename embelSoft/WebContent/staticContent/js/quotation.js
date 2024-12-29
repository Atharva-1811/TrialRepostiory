function QuotationValidation(){
	
	if(!(document.quotation.vendor.checked || document.quotation.client.checked))
	{
		alert("Select Type.");
		return false;
		
	}
	
	if(document.quotation.vendorName.value == "")
	{
		alert("Select Vendor Name.");
		return false;
	}	
	if(document.quotation.quotDate.value == "")
	{
		alert("Select Date");
		return false;
	}	
	

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	
	if(count <= 0)
	{
		alert("Please Enter Description");
		return false;
	}
	
	
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);

	
	for(var i=0;i<count;i++)
	{
		
		var unit = allRowsInGrid[i].unit;
		var unitPrice = allRowsInGrid[i].unitPrice;
		var quantity = allRowsInGrid[i].quantity;

		
			if(unitPrice=="" || unitPrice==null)
			{
				alert("Please Enter Unit Price in Grid");
			}
			var letterNumber = /^[.0-9]+$/;
			if(unitPrice.match(letterNumber))
			{
		
				if(quantity=="" || quantity==null)
				{
					alert("Please Enter quantity in Grid");
				}
					var letterNumber = /^[0-9]+$/;
					if(quantity.match(letterNumber))
					{
/*
						if(document.quotation.gst1.value == "")
						{
							alert("Please Enter Gst");
							return false;
						}*/
						
					}
		
				else
				{
					alert("Enter Numbers Only in Quantity..!!");
					return false;
				
				}
			}
			
			else
			{
				alert("Enter Numbers Only in Unit Price in Grid..!!");
				return false;
			
			}
		
	}	

	QuotationDetails();	
	
}
	

//add Quotation Details
function QuotationDetails(){
	
	var params = {};
	
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	var vendorName= $('#vendorName').val();
	//var billingPeriodFrom= $('#billingPeriodFrom').val();
	var quotDate= $('#quotDate').val();
	var uploadFile = $('#uploadFile').val();
	
	
	var companyname = $('#companyname').val();
	var companyaddress = $('#companyaddress').val();
	var city = $('#city').val();
	var state = $('#state').val();
	var zip = $('#zip').val();
	var phoneno = $('#phoneno').val();
	var productName = $('#fk_product_id').val();
	//var productName = $('#productName').val();
	var features = $('#features').val();
	var subTotal1 = $('#subTotal1').val();
	var gst1 = $('#gst1').val();
	var gstAmount = $('#gstAmount').val();
	var afterGstTotal1 = $('#afterGstTotal1').val();
	var discount = $('#discount').val();
	var discountAmount = $('#discountAmount').val();
	var grossTotal1 = $('#grossTotal1').val();
	var quotationNo = $('#quotationNo').val();
	
	
	var type1 = $('#vendor').val();
	var type2 = $('#client').val();
	
	
	var input1 = document.getElementById('vendorName'),
	list = document.getElementById('vendorList_Drop'),
	i,fkVendorId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
	

	for(var i=0;i<count;i++)
	{
		var description = allRowsInGrid[i].description;
		params["description"+i]=description;

		var unitPrice = allRowsInGrid[i].unitPrice;
		params["unitPrice"+i]=unitPrice;
		
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i]=quantity;
		
		var total = allRowsInGrid[i].total;
		params["total"+i]=total;
		
		
	}
	
	
	if(document.quotation.vendor.checked)
	{
		params["type"] = type1;
		
	}
	
	if(document.quotation.client.checked)
	{
		params["type"] = type2;
		
	}
	
	
	if(document.quotation.client.checked)
	{
		params["afterGstTotal1"] = "0";
	}
/*	
	
	if(afterGstTotal1=="")
	{
		params["type"] = type2;
	}*/
	
	params["quotationNo"] = quotationNo;
	
	params["fkVendorId"] = fkVendorId;
	params["vendorName"] = vendorName;
	params["quotDate"] = quotDate;

	params["uploadFile"] = uploadFile;
	
	params["companyname"] = companyname;
	params["companyaddress"] = companyaddress;
	params["city"] = city;
	params["state"] = state;
	params["zip"] = zip;
	params["phoneno"] = phoneno;
	//params["fk_product_id"] = fk_product_id;
	params["productName"] = productName;
	params["features"] = features;
	params["subTotal1"] = subTotal1;
	params["gst1"] = gst1;
	params["gstAmount"] = gstAmount;
	params["discount"] = discount;
	params["discountAmount"] = discountAmount;
	params["grossTotal1"] = grossTotal1;
	
	
	params["count"] = count;
	
    params["methodName"] = "QuotationInfo";
	
    $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data) 
 	    	{
		 		alert(data);
		 		window.open("QuotationPDF.jsp");
		 		location.reload();
 			}
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
}


//vender Quotation


function getGridForVenderQuotaion()
{
	if(document.quotation.taskInText.value=="" && document.quotation.taskInText.value == null)
	{
		alert('please enter description. . .');
		return false;
	}
	venderQuotaionGrid()
	
}


function venderQuotaionGrid()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var productResourceName=$('#productResourceName').val();
	
	params["productName"] = productResourceName;
	
	params["methodName"] ="gridForVenderQuotation";
	
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
        		        	document.getElementById("venderTotalSubTotal").value = totalSubTotal.toFixed(2);
	     		        	document.getElementById("venderTotalTaxAmount").value = totalTaxAmount.toFixed(2);
	     		        	document.getElementById("venderGrossTotal").value = grossTotal.toFixed(2);
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
	        		        	var GST = rowData['GST']; 		        	
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
	        		        	document.getElementById("venderTotalSubTotal").value = totalSubTotal.toFixed(2);
		     		        	document.getElementById("venderTotalTaxAmount").value = totalTaxAmount.toFixed(2);
		     		        	document.getElementById("venderGrossTotal").value = grossTotal.toFixed(2);     		        	
	                  }
	                });	 
			});				
		})	
}

function venderQuotationValidation(){
	
	
	if(document.quotation.vendorName.value == "")
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
	if(document.quotation.quotDate.value == "")
	{
		swal({
			title: "Alert!",
			text: "Select Date..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Select Date");
		return false;
	}
	
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	
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

			///alert("Please Enter Quantity");
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

	venderQuotationDetails();	
	
}

function venderQuotationDetails(){
	
	var params = {};
	
	var count = jQuery("#jqgrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqgrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	var vendorName= $('#vendorName').val();
	//var billingPeriodFrom= $('#billingPeriodFrom').val();
	var quotDate= $('#quotDate').val();
	var uploadFile = $('#uploadFile').val();
	
	
	var companyname = $('#vendorCompanyName').val();
	var companyaddress = $('#venderCompanyAddress').val();
	var city = $('#city').val();
	var state = $('#state').val();
	var zip = $('#zip').val();
	var phoneno = $('#phoneno').val();
	//var productName = $('#fk_product_id').val();
	//var productName = $('#productName').val();
	var features = $('#features').val();
	var quotationNo = $('#quotationNo').val();	
	
	var type1 = $('#vendor').val();
	var type2 = $('#client').val();
	
	
	var input1 = document.getElementById('vendorName'),
	list = document.getElementById('vendorList_Drop'),
	i,fkVendorId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	for(var i=0;i<count;i++)
	{
		var fkProductId = allRowsInGrid[i].fkProductId;
		params["fkProductId"+i] = 0;
		
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
		
		var IGST = allRowsInGrid[i].IGST;
		params["IGST"+i] = IGST;
		
		var taxAmount = allRowsInGrid[i].taxAmount;
		params["taxAmount"+i] = taxAmount;
		
		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
	}
	
	var totalSubTotal = $('#venderTotalSubTotal').val();
	var totalTaxAmount = $('#venderTotalTaxAmount').val();
	var grossTotal = $('#venderGrossTotal').val();
	
	
//	if(document.quotation.vendor.checked)
//	{
//		params["type"] = type1;
//		
//	}
//	
//	if(document.quotation.client.checked)
//	{
//		params["type"] = type2;
//		
//	}
	
	
//	if(document.quotation.client.checked)
//	{
//		params["afterGstTotal1"] = "0";
//	}
/*	
	
	if(afterGstTotal1=="")
	{
		params["type"] = type2;
	}*/
	
	var fkClientId = 0;
	var clientName = "N/A";
	
	params["fkClientId"] = fkClientId;
	params["clientName"] = clientName;
	
	params["count"] = count;
	
	params["quotationNo"] = quotationNo;
	
	params["type"] = type1;
	
	params["fkVendorId"] = fkVendorId;
	params["vendorName"] = vendorName;
	params["quotDate"] = quotDate;
	params["uploadFile"] = uploadFile;	
	params["companyname"] = companyname;
	params["companyaddress"] = companyaddress;
	params["city"] = city;
	params["state"] = state;
	params["zip"] = zip;
	params["phoneno"] = phoneno;
	//params["fk_product_id"] = fk_product_id;
//	params["productName"] = productName;	
	
	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;
	
    params["methodName"] = "QuotationDetails";
	
    $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data) 
 	    	{
				swal({
				     title: "Success!",
				     text: "Vender Quotation Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
			    });
		 		//alert(data);
		 		window.open("QuotationPDF.jsp");
		 		location.reload();
 			}
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
}


function venderQuotationReport()
{

	var params= {};
	
/*	var vendor = $('#vendor').val();
	
	params["vendor"] = vendor;
*/
	params["methodName"] = "getVenderQuotationReport";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#typeWiseReportForQuo').dataTable().fnClearTable();

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
			$('#typeWiseReportForQuo').DataTable( {

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

					/*// Total over this page
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
					console.log( pageTotal);*/
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
						  {"data": "quotationNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfQuotation", "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},				          
				          {"data": "companyName", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyAddress" , "width": "5%" ,"defaultContent": ""},
				          {"data": "state" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zip" , "width": "5%" ,"defaultContent": ""},
				          {"data": "phoneNo" , "width": "5%" ,"defaultContent": ""},
//				          {"data": "features" , "width": "5%" ,"defaultContent": ""},				          
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
//				          {"data": "SGST" , "width": "5%" ,"defaultContent": ""},
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
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#typeWiseReportForQuo').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});



	
}




//client quotation

function getGridForClientQuotaion()
{
	if(document.quotation.taskInText.value=="" && document.quotation.taskInText.value == null)
	{
		alert('please enter description. . .');
		return false;
	}
	clientQuotaionGrid()
	
}

function clientQuotaionGrid()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var productName = $('#fk_product_id').val();

	var input1 = document.getElementById('fk_product_id'), list = document
			.getElementById('productNameList'), i, fkProductId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkProductId = list.options[i].getAttribute('data-value');
		}
	}

	params["fkProductId"] = fkProductId;
	params["productName"] = productName;
	
	params["methodName"] = "gridForClientQuotation";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			
			// $("#productGrid").jqGrid("clearGridData", true).trigger("reloadGrid");
			
			$.each(jsonData,function(i,v)
			{
				document.getElementById("fk_product_id").value = "";
		    	count = jQuery("#productGrid").jqGrid('getGridParam', 'records'); 
			    var rowdata =$("#productGrid").jqGrid('getGridParam','data');
			    var ids = jQuery("#productGrid").jqGrid('getDataIDs');
			    
			    var productName,com,packing,unit;
				
			    for (var j = 0; j < count; j++) 
			    {
			    	productName = rowdata[j].productName;
			    	
			    	var rowId = ids[j];
					var rowData = jQuery('#productGrid').jqGrid ('getRowData', rowId);
					if (productName == jsonData.offer.productName) 
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
        		        	document.getElementById("clientTotalSubTotal").value = totalSubTotal.toFixed(2);
	     		        	document.getElementById("clientTotalTaxAmount").value = totalTaxAmount.toFixed(2);
	     		        	document.getElementById("clientGrossTotal").value = grossTotal.toFixed(2);
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
	        		        	document.getElementById("clientTotalSubTotal").value = totalSubTotal.toFixed(2);
		     		        	document.getElementById("clientTotalTaxAmount").value = totalTaxAmount.toFixed(2);
		     		        	document.getElementById("clientGrossTotal").value = grossTotal.toFixed(2);		        	
	                  }
	                });			 
			});				
		})	
}


function clientQuotationValidation(){
	
	if(document.clientQuotation.clientName.value == "")
	{
		swal({
			title: "Alert!",
			text: "Select Client Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Select Client Name.");
		return false;
	}	
	if(document.clientQuotation.clientQuotDate.value == "")
	{
		swal({
			title: "Alert!",
			text: "Select Date..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Select Date");
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
		}*/
		
		if(CGST=="" || CGST==null || CGST==undefined ||SGST=="" || SGST==null || SGST==undefined)
		{
			swal({
				title: "Alert!",
				text: "Please Enter CGST and SGST Or IGST..!",
				icon: 'error',
				timer: 2500,
				button:false
			});
			//alert("Please Enter CGST and SGST Or IGST");
			//allRowsInGrid[i].GST.focus();
			return false;
		}		
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
	
	clientQuotationDetails();	
	
}

function clientQuotationDetails(){
	
	var params = {};
	
	var count = jQuery("#productGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#productGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	
	//get clientName through pkId(fkClientId)
	var clientName = $('#clientName').val();
	
	var input1 = document.getElementById('clientName'),
	list = document.getElementById('clientList_Drop'), i, fkClientId;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}
	
	//var vendorName= $('#clientName').val();
	var quotDate= $('#clientQuotDate').val();
	var uploadFile = $('#clientUploadFile').val();
	
	
	var companyname = $('#clientCompanyName').val();
	var companyaddress = $('#clientCompanyAddress').val();
	var city = $('#city').val();
	var state = $('#clientState').val();
	var zip = $('#clientZip').val();
	var phoneno = $('#clientPhoneno').val();
	var features = $('#clientFeatures').val();
	var quotationNo = $('#quotationNo').val();
	
	var type1 = $('#vendor').val();
	var type2 = $('#client').val();
	
	
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
	
	var totalSubTotal = $('#clientTotalSubTotal').val();
	var totalTaxAmount = $('#clientTotalTaxAmount').val();
	var grossTotal = $('#clientGrossTotal').val();
	
	
	params["count"] = count;
	
	params["quotationNo"] = quotationNo;
	
	params["type"] = type2;
	
	params["fkClientId"] = fkClientId;
	params["clientName"] = clientName;
	params["quotDate"] = quotDate;
	params["uploadFile"] = uploadFile;	
	params["companyname"] = companyname;
	params["companyaddress"] = companyaddress;
	params["city"] = city;
	params["state"] = state;
	params["zip"] = zip;
	params["phoneno"] = phoneno;	
	
	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;
	
    params["methodName"] = "clientQuotationDetails";
	
    $.post('/embelSoft/jsp/utility/controller.jsp',params,function(data) 
 	    	{
				swal({
				     title: "Success!",
				     text: "Client Quotation Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
     		     });
		 		//alert(data);
		 		window.open("QuotationPDFClient.jsp");
		 		location.reload();
 			}
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
}


function clientQuotationReport()
{

	var params= {};
	
/*	var vendor = $('#vendor').val();
	
	params["vendor"] = vendor;
*/
	params["methodName"] = "getClientQuotationReport";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#typeWiseReportForQuo').dataTable().fnClearTable();

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
			$('#typeWiseReportForQuo').DataTable( {

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

					/*// Total over this page
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
					console.log( pageTotal);*/
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
						
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
						  {"data": "quotationNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "quotDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "clientName" , "width": "5%" ,"defaultContent": ""},				          
				          {"data": "companyName", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyAddress" , "width": "5%" ,"defaultContent": ""},
				          {"data": "state" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zip" , "width": "5%" ,"defaultContent": ""},
				          {"data": "phoneno" , "width": "5%" ,"defaultContent": ""},
//				          {"data": "features" , "width": "5%" ,"defaultContent": ""},				          
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
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#typeWiseReportForQuo').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});



	
}


//get Product Details for Edit
function getProductListForEdit()
{
	
	
	$("#features").append($("<input/>").attr("value","").text());
	
	
	
	
	var params= {};
	
	var input1 = document.getElementById('fk_product_id'),
	list = document.getElementById('productNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fk_product_id"] = fkEmployeeid;
	params["methodName"] = "getProductDetailsForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
			
			
				 
			      document.getElementById("features").value = v.features;
			      
			     
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}



//get features Details for quotation
function getFeatures()
{
	
	$("#productName").append($("<input/>").attr("value","").text());
	$("#features").append($("<input/>").attr("value","").text());
	
	
	
	
	var params= {};
	
	var input1 = document.getElementById('fk_product_id'),
	list = document.getElementById('productNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fk_product_id"] = fkEmployeeid;
	params["methodName"] = "getProductListForQuotation";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
			
			
				  document.getElementById("productName").value = v.productName;
				  document.getElementById("features").value = v.features;
			      
			     
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}



// get Vendor Name For DropDown

function getVendorName()
{

	$("#vendorList_Drop").empty();
	$("#vendorList_Drop").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	params["methodName"] = "getAllVendorName";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName)).attr("data-value",(v.vendorId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown)
					{
						if(textStatus==="timeout") {

				}
			});
}

//get Client Name For DropDown

function getClientName()
{
	
	//var type = document.getElementById('client').value;
	
		$("#clientList_Drop").empty();
		$("#clientList_Drop").append($("<option></option>").attr("value","").text("Select product"));
		var params= {};
		
		params["methodName"] = "getAllClientName";
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
				{ var count = 1;

				var jsonData = $.parseJSON(data);
				$.each(jsonData,function(i,v)
						{
					/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.firstName+" "+ v.lastName)));*/
					$("#clientList_Drop").append($("<option></option>").attr("value",(v.firstName+" "+ v.lastName)).attr("data-value",(v.clientId)));
					count++;
						});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
}


/*
function getDiscountAmountTotal()
{
	var afterGstTotal = $('#afterGstTotal1').val();
	var discount = $('#discount').val();
	var discountAmount = (afterGstTotal)*(discount)/100;
	document.getElementById('discountAmount').value = discountAmount;
	
	var grossTotal = +afterGstTotal - +discountAmount;
	
	var total = +sub_Total + +vat;
	var total222 = grossTotal.toFixed(2);

	document.getElementById('grossTotal1').value = total222;
	
}
*/

// get Discount amount by discount %
function getDiscountAmountTotal()
{
	var sub_Total = $('#subTotal1').val();
	var discount = $('#discount').val();
	var discountAmount = (sub_Total)*(discount)/100;
	var gst = $('#gst1').val();
	
	var total = sub_Total - discountAmount;
	var total2 = total.toFixed(2);
	
	document.getElementById('discountAmount').value = discountAmount;
	document.getElementById('afterDiscountTotal1').value = total;
	document.getElementById('grossTotal1').value = total2;
	
	
	if(! gst == 0)
	{
		var afterDiscountTotal1 = $('#afterDiscountTotal1').val();
		var gst = $('#gst1').val();
		var vat = (gst) * (afterDiscountTotal1)/100;
		
		document.getElementById('gstAmount').value = vat;
		
		var total = +afterDiscountTotal1 + +vat;
		var total2 = total.toFixed(2);
		
		document.getElementById('grossTotal1').value = total2;
	}
	
}

// calculate gst amount 
function getGstAmountTotal()
{
	
	var discount = $('#discount').val();
	if(discount == 0)
	{
		var sub_Total = $('#subTotal1').val();
		var gst = $('#gst1').val();
		var vat = (gst) * (sub_Total)/100;
		
		document.getElementById('gstAmount').value = vat.toFixed(2);
		var total = +sub_Total + +vat;
		var total2 = total.toFixed(2);
		document.getElementById('grossTotal1').value = total2;

	}
	else
	{
		var afterDiscountTotal1 = $('#afterDiscountTotal1').val();
		var gst = $('#gst1').val();
		var vat = (gst) * (afterDiscountTotal1)/100;
		
		document.getElementById('gstAmount').value = vat;
		
		var total = +afterDiscountTotal1 + +vat;
		var total2 = total.toFixed(2);
		
		document.getElementById('grossTotal1').value = total2;
	}
}



/*//Gst,Discount,ect.. Calculation
function getGstAmountTotal()
{
	var gst = $('#gst1').val();
	var sub_Total = $('#subTotal1').val();
	var discount = $('#discount').val();
	var vat = (gst) * (sub_Total)/100;
	document.getElementById('gstAmount').value = vat;
	
	
	var total = +sub_Total + +vat;
	
	var total2 = total.toFixed(2);
	
	document.getElementById('afterGstTotal1').value = total;
	document.getElementById('grossTotal1').value = total2;
	
	
	if(!discount==0)
	{
		var discount = $('#discount').val();
		var afterGstTotal = $('#afterGstTotal1').val();
		
		var discountAmount = (afterGstTotal)*(discount)/100;
		
		var grossTotal = +afterGstTotal - +discountAmount;
		
		var total22 = grossTotal.toFixed(2);
		
		document.getElementById('discountAmount').value = discountAmount;
		document.getElementById('grossTotal1').value = total22;
		
	}
	
	
		var grossTotal = +afterGstTotal - +discountAmount;
		document.getElementById('grossTotal1').value = grossTotal;
	
}
*/

//------------------ Grid for Product Description---------------
// Grid Validation
function getGridForProductDescription()
{
	if(document.quotation.taskInText.value=="" && document.quotation.taskInText.value == null)
	{
		alert('please enter description. . .');
		return false;
	}
	getGridProductDescription()
	
}


function getGridProductDescription()
{
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var description = $('#taskInText').val()

	params["description"] = description;
	
	params["methodName"] ="gridForQuotation";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		  var jsonData = $.parseJSON(data);
			
	     // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
        
	     $.each(jsonData,function(i,v)
			{
	    	 count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list4").jqGrid('getGridParam','data');
		     var ids = jQuery("#list4").jqGrid('getDataIDs');
			 
			
			  var prodName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].description;
				  
				 var rowId = ids[j];
				 var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
				
				if (prodName == jsonData.offer.description) 
				{
			    	newrow=false;
					alert("Product Name Already Inserted !!!");
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
					
				  //$("#list4").addRowData(i,jsonData[i]);
				  $("#list4").addRowData(count,jsonData.offer);
					
				 }
		
		
		$("#list4").jqGrid({
			datatype: "local",
			
			colNames:['Description','Unit Price','Quantity','Total'],
			colModel:[ 
				
               
			    {	name:'description',
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
			width: 800,
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
			        	    var rowId =$("#list4").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#list4").getRowData(rowId);
	                    	var quantity = rowData['quantity'];
	                    	var buyPrice = rowData['unitPrice'];
	                    	
	                    	var tota = quantity * buyPrice;
                    		$("#list4").jqGrid("setCell", rowId, "total", tota);
                    		
                    		var Total =0;
                    		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		
        		        		
        		        		var Total1 = allRowsInGrid1[k].total;
        		        		if(Total1 != null){
        		        		Total = Total + Total1;
        		        		
        		        		}
        		        	}
        		        	document.getElementById("subTotal1").value = Total;
        		        	document.getElementById("gst1").value = "0";
         		        	document.getElementById("gstAmount").value = "0";
         		        	document.getElementById("afterDiscountTotal1").value = "0";
         		        	document.getElementById("discount").value = "0";
         		        	document.getElementById("discountAmount").value = "0";
        		        	document.getElementById("grossTotal1").value = Total;
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
		                    	var buyPrice = rowData['unitPrice'];
		                    	
		                    	var tota = quantity * buyPrice;
	                 		$("#list4").jqGrid("setCell", rowId, "total", tota);
	                 		
                 		var Total =0;
                 		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
     		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
     		        	var AllRows=JSON.stringify(allRowsInGrid1);
     		        	for (var k = 0; k < count; k++) {
     		        		var Total1 = allRowsInGrid1[k].total;
     		        		Total = +Total + +Total1;
     		        	}
     		        	document.getElementById("subTotal1").value = Total;
     		        	
     		        	document.getElementById("gst1").value = "0";
     		        	document.getElementById("gstAmount").value = "0";
     		        	document.getElementById("afterDiscountTotal1").value = "0";
     		        	document.getElementById("discount").value = "0";
     		        	document.getElementById("discountAmount").value = "0";
     		        	document.getElementById("grossTotal1").value = Total;
	                  }
	                });
		 
		 
			   });
			
		})
}


function getGridForVenderQuotaion()
{
	if(document.quotation.taskInText.value=="" && document.quotation.taskInText.value == null)
	{
		alert('please enter description. . .');
		return false;
	}
	venderQuotaionGrid()
	
}


function venderQuotaionGrid()
{	
	var params={};
	var count=0;
	var newrow;
	var rowId;
	
	var productResourceName=$('#productResourceName').val();
	
	params["productName"] = productResourceName;
	
	params["methodName"] ="gridForVenderQuotation";
	
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
        		        	document.getElementById("venderTotalSubTotal").value = totalSubTotal.toFixed(2);
	     		        	document.getElementById("venderTotalTaxAmount").value = totalTaxAmount.toFixed(2);
	     		        	document.getElementById("venderGrossTotal").value = grossTotal.toFixed(2);
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
	        		        	var GST = rowData['GST']; 		        	
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
	        		        	document.getElementById("venderTotalSubTotal").value = totalSubTotal.toFixed(2);
		     		        	document.getElementById("venderTotalTaxAmount").value = totalTaxAmount.toFixed(2);
		     		        	document.getElementById("venderGrossTotal").value = grossTotal.toFixed(2);     		        	
	                  }
	                });	 
			});				
		})	
}



/*function getVendorDetails()
{
	//if(document.quotation.vendor.checked)
	//{
		var params = {};
		
		var input = document.getElementById('vendorName'),
	    list = document.getElementById('vendorList_Drop'),
	    i,fkVendorId;
		
		$("#companyname").append($("<input/>").attr("value","").text());
		$("#companyaddress").append($("<input/>").attr("value","").text());
			
		var vendoName = $('#vendorName').val();
	
		var input1 = document.getElementById('vendorName'),
		list = document.getElementById('vendorList_Drop'),
		i,fkVendorId;
		
		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input1.value) {
				fkVendorId = list.options[i].getAttribute('data-value');
				}
			}
			
		params["fk_vendor_id"] = fkVendorId;
		params["vendoName"] = vendoName;
		
		params["methodName"] = "getVendorDetailsForEdit";
		
		
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			
			$.each(jsonData,function(i,v)
					
					{
				
					  document.getElementById("companyname").value = v.companyName;
				      document.getElementById("companyaddress").value = v.companyAddress;
				   
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
	 	  
		
//}

}*/


/*function getClientDetails()
{
//if(document.quotation.client.checked)
//{

	var params = {};
	
	$("#companyname").append($("<input/>").attr("value","").text());
	$("#companyaddress").append($("<input/>").attr("value","").text());
	$("#city").append($("<input/>").attr("value","").text());

	
	
	var input1 = document.getElementById('clientName'),
	list = document.getElementById('clientList_Drop'),
	i,fkClientId;
	
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClientId = list.options[i].getAttribute('data-value');
			}
		}
	
	params["fkClientid"] = fkClientId;
	
	params["methodName"] = "getClientDetailsForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
			
				  document.getElementById("companyname").value = v.businessName;
			      document.getElementById("companyaddress").value = v.businessAddress;
			      document.getElementById("city").value = v.address;
			 
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
	
//}

}*/


function getVendorDetails()
{
	var params = {};
	
	$("#vendorCompanyName").append($("<input/>").attr("value","").text());
	$("#venderCompanyAddress").append($("<input/>").attr("value","").text());
		
	var vendoName = $('#vendorName').val();

	var input1 = document.getElementById('vendorName'),
	list = document.getElementById('vendorList_Drop'),
	i,fkVendorId;
	
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkVendorId = list.options[i].getAttribute('data-value');
			}
		}
		
	params["fk_vendor_id"] = fkVendorId;
	params["vendoName"] = vendoName;
	
	params["methodName"] = "getVendorDetailsForEdit";
	
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
			
				  document.getElementById("vendorCompanyName").value = v.companyName;
			      document.getElementById("venderCompanyAddress").value = v.companyAddress;
			      document.getElementById("state").value = v.state;
			      document.getElementById("zip").value = v.zipCode;
			      document.getElementById("phoneno").value = v.contactNo;
			   
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

function getClientDetails()
{
	var params = {};
	
	$("#clientCompanyName").append($("<input/>").attr("value","").text());
	$("#clientCompanyAddress").append($("<input/>").attr("value","").text());
	//$("#city").append($("<input/>").attr("value","").text());

	
	
	var input1 = document.getElementById('clientName'),
	list = document.getElementById('clientList_Drop'),
	i,fkVendorId;
	
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClientId = list.options[i].getAttribute('data-value');
			}
		}
	
	params["fkClientid"] = fkClientId;
	
	params["methodName"] = "getClientDetailsForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
			
				  document.getElementById("clientCompanyName").value = v.businessName;
			      document.getElementById("clientCompanyAddress").value = v.businessAddress;
			      document.getElementById("clientState").value = v.state;
			      document.getElementById("clientZip").value = v.zipCode;
			      document.getElementById("clientPhoneno").value = v.contactNo;
			 
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


function getVendor_ClietDetails()
{
	
	if(document.quotation.vendor.checked)
	{
		var params = {};
		
		$("#companyname").append($("<input/>").attr("value","").text());
		$("#companyaddress").append($("<input/>").attr("value","").text());
			
		var vendoName = $('#vendorName').val();
	
		var input1 = document.getElementById('vendorName'),
		list = document.getElementById('vendorList_Drop'),
		i,fkVendorId;
		
		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input1.value) {
				fkVendorId = list.options[i].getAttribute('data-value');
				}
			}
			
		params["fk_vendor_id"] = fkVendorId;
		params["vendoName"] = vendoName;
		
		params["methodName"] = "getVendorDetailsForEdit";
		
		
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			
			$.each(jsonData,function(i,v)
					
					{
				
					  document.getElementById("companyname").value = v.companyName;
				      document.getElementById("companyaddress").value = v.companyAddress;
				   
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
	 	  
		
	}
	
	if(document.quotation.client.checked)
	{

		var params = {};
		
		$("#companyname").append($("<input/>").attr("value","").text());
		$("#companyaddress").append($("<input/>").attr("value","").text());
		$("#city").append($("<input/>").attr("value","").text());
	
		
		
		var input1 = document.getElementById('vendorName'),
		list = document.getElementById('vendorList_Drop'),
		i,fkVendorId;
		
		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input1.value) {
				fkClientId = list.options[i].getAttribute('data-value');
				}
			}
		
		params["fkClientid"] = fkClientId;
		
		params["methodName"] = "getClientDetailsForEdit";
		
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			
			$.each(jsonData,function(i,v)
					
					{
				
					  document.getElementById("companyname").value = v.businessName;
				      document.getElementById("companyaddress").value = v.businessAddress;
				      document.getElementById("city").value = v.address;
				 
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
		
	}
	
}


function quotationList()
{


	var params= {};

	params["methodName"] = "getQuotationList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#quotationList22').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#quotationList22').DataTable( {

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
					.column( 10 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 10 ).footer() ).html(

							''+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,			      
				columns: [
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},	
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfQuotation", "width": "5%" ,"defaultContent": ""},
				          {"data": "quotationNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyName", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyAddress" , "width": "5%" ,"defaultContent": ""},
				     /*     {"data": "state" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zip" , "width": "5%" ,"defaultContent": ""},
				          {"data": "phoneNo" , "width": "5%" ,"defaultContent": ""},
				     */
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "gst" , "width": "5%" ,"defaultContent": ""},
				          {"data": "gstAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          
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
		$('#quotationList22').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
}


//Vendor Wise Quotation Details Report Old

function getVendorDetailas()
{

	var params= {};
	
/*	var vendor = $('#vendor').val();
	
	params["vendor"] = vendor;
*/
	params["methodName"] = "getVendorRecordsOfQuotation";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#typeWiseReportForQuo').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#typeWiseReportForQuo').DataTable( {

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
/*
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
					console.log( pageTotal);*/
				},

				destroy: true,
				searching: true,			      
				columns: [
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},	
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfQuotation", "width": "5%" ,"defaultContent": ""},
				          {"data": "quotationNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyName", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyAddress" , "width": "5%" ,"defaultContent": ""},
				          
				      //    {"data": "city" , "width": "5%" ,"defaultContent": ""},
				          {"data": "state" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zip" , "width": "5%" ,"defaultContent": ""},
				          {"data": "phoneNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          
				          
				         /* {"data": "totalWithGst" , "width": "5%" ,"defaultContent": ""},*/
				          {"data": "discount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "gst" , "width": "5%" ,"defaultContent": ""},
				          {"data": "gstAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#typeWiseReportForQuo').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
}



//Client Wise Quotation Details Old

function getClientDetailas()
{

	var params= {};
	
/*	var vendor = $('#vendor').val();
	
	params["vendor"] = vendor;
*/
	params["methodName"] = "getClientRecordsOfQuotation";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#typeWiseReportForQuo').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#typeWiseReportForQuo').DataTable( {

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

					/*// Total over this page
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
					console.log( pageTotal);*/
				},

				destroy: true,
				searching: true,			      
				columns: [
					
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},	
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfQuotation", "width": "5%" ,"defaultContent": ""},
				          {"data": "quotationNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyName", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyAddress" , "width": "5%" ,"defaultContent": ""},
				          
				       //   {"data": "city" , "width": "5%" ,"defaultContent": ""},
				          {"data": "state" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zip" , "width": "5%" ,"defaultContent": ""},
				          {"data": "phoneNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          
				         
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity" , "width": "5%" ,"defaultContent": ""},
				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				        /* {"data": "totalWithGst" , "width": "5%" ,"defaultContent": ""},*/
				          {"data": "discount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "discountAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "gst" , "width": "5%" ,"defaultContent": ""},
				          {"data": "gstAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Quotation Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#typeWiseReportForQuo').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});



	
}

