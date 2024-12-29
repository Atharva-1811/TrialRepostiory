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
			
			params["productName"] = productName;
		
		
		params["methodName"] ="purchaseRecord";
		
	
		document.getElementById('productName').value = null;
			//var productResourceName=$('#productName').val();
			
			$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
				{
			  var jsonData = $.parseJSON(data);
	        
		     $.each(jsonData,function(i,v)
				{
					var totaldisamt= document.getElementById("totalSubTotal").value;
					 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
					 {
						 totaldisamt=0;
						
					 }
					  var totalDis = v.subTotal;
					  totaldisamt = +totaldisamt + +totalDis;
					document.getElementById("totalSubTotal").value = totaldisamt.toFixed(2);
					
					
					
					var totaldisamt= document.getElementById("totalTaxAmount").value;
					 if(totaldisamt=="" || totaldisamt==null || totaldisamt==undefined)
					 {
						 totaldisamt=0;
					 }
					  var totalDis = v.taxAmount;
					  totaldisamt = +totaldisamt + +totalDis;
					document.getElementById("totalTaxAmount").value = totaldisamt.toFixed(2);
					
					
					var gross= document.getElementById("grossTotal").value;
					 if(gross=="" || gross==null || gross==undefined)
					 {
					 gross=0;
					 }
					  var gs = v.total;
					 gross = +gross + +gs;
					 
					document.getElementById("grossTotal").value = gross.toFixed(2);
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

function receivedPurchase()
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
	
	var filePath = $('#filename1').val();
	
	const fileNameArray = filePath.split("\\");
	
	var fileName = fileNameArray[2];	       
	
	var allBillNo = $('#BNO').val();
	var vendorName = $('#fk_vendor_id').val();
	var totalSubTotal = $('#totalSubTotal').val();
	var totalTaxAmount = $('#totalTaxAmount').val();
	var grossTotal = $('#grossTotal').val();
	var invoiceDate = $('#invoiceDate').val();
	
	params["fileName"] = fileName;
	params["allBillNo"] = allBillNo;
	params["fkVendorId"] = fkVendorId;
	params["vendorName"] = vendorName;
	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;
	params["invoiceDate"] = invoiceDate;
		
	params["count"] = count;
	
	params["methodName"] ="savePurchaseRecord";
	
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

$(document).ready(function() {
    $("#filename1").change(function() {
        var length = this.files.length;
        if (!length) {
            return false;
        }
        useImage(this);
    });
});

// Creating the function
function useImage(img) {
    var file = img.files[0];
    var imagefile = file.type;
    var match = ["image/jpeg", "image/png", "image/jpg"];
    if (!((imagefile == match[0]) || (imagefile == match[1]) || (imagefile == match[2]))) {
        alert("Invalid File Extension");
    } else {
        var reader = new FileReader();
        reader.onload = imageIsLoaded;
        reader.readAsDataURL(img.files[0]);
    }

    function imageIsLoaded(e) {
        $('div.withBckImage').css({ 'background-image': "url(" + e.target.result + ")" });

    }
}

//function uploadFile()
//{
//	var filePath = $('#filename1').val();
//	
//	const fileNameArray = filePath.split("\\");
//	
//	var fileName = fileNameArray[2];
//	
//	
//	
//	
//	
//	console.log(fileName);
//}