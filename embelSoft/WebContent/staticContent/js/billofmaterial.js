function getGridOfBillOfMaterial() {
	
	var params = {};	
	var count = 0;
	var newrow;
	var rowId;

	var componentType = $('#componentType').val();
	var ComponentName = $('#compName').val();
	
	var input1 = document.getElementById('componentType'), 
	list = document.getElementById('billofmateriallist'), i, pkCompTypeId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			pkCompTypeId = list.options[i].getAttribute('data-value');
		}
	}

	var input2 = document.getElementById('componentSubcategory'), 
	list2 = document.getElementById('componentSubcategory'),
		   i, pkcompoentSubcategoryId;

	for (i = 0; i < list2.options.length; ++i) {
	if (list2.options[i].value === input2.value) {
	pkcompoentSubcategoryId = list2.options[i].getAttribute('value');
		}
	}
	
	params["componentType"] = componentType;
	params["pkCompTypeId"] = pkCompTypeId;
	params["pkcompoentSubcategoryId"] = pkcompoentSubcategoryId;
	params["ComponentName"] = ComponentName;
	
	params["methodName"] = "getGridBillOfMaterial";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		
		$.each(jsonData,function(i, v)
		{
			count = jQuery("#list4").jqGrid('getGridParam', 'records');
			var rowdata = $("#list4").jqGrid('getGridParam', 'data');
			var ids = jQuery("#list4").jqGrid('getDataIDs');
			var prodName, com, packing, unit;
			for (var j = 0; j < count; j++)
			{
				

				var rowId = ids[j];
				var rowData = jQuery('#list4').jqGrid('getRowData',rowId);
				
				
				newrow = true;
			}
			
			if (newrow == true) {
				
				$("#list4").addRowData(count,jsonData.offer);
			}

			$("#list4").jqGrid({
				datatype : "local",
				
				colNames : ['Comp.Category','Comp. Id','Comp. Name','Ref Designator','Part Number','Package','Tol/VA Rating','Value','Manufacturer Name','Description','QTY ReqFor1Board','UnitPrice','Board Cost','Remark','VendorName'],
				colModel : [
					{
						name : 'componentType',
						width : 42,
						editable : false
					},
					{
						name : 'pkCompTypeId',
						width : 20,
						editable : false,
						hidden : true
					},
					{
						name : 'componentName',
						width : 42,
						editable : true
					},
					{
						name : 'Ref_Designator',
						width : 42,
						editable : true
					},
					{
						name : 'Part_Number',
						width : 42,
						editable : true
					},
					{
						name : 'compPackage',
						width : 42,
						editable : true
					},
					{
						name : 'TolvRating',
						width : 42,
						editable : true
					},
					{
						name : 'Value',
						width : 42,
						editable : true
					},
					{
						name : 'manufacturarName',
						width : 40,
						editable : true
					},
					{
						name : 'description',
						width : 42,
						editable : true
					},
					{
						name : 'oneBoardQty',
						width : 40,
						editable : true
					},
					{
						name : 'unitPrice',
						width : 30,
						editable : true
					},
					
					{
						name : 'boardCost',
						width : 28,
						editable : false
					},
					{	
						 name:'Remark',
				    	 width:30,
				    	 editable: true
					},
					{	
						 name:'vendorName',
				    	 width:30,
				    	 editable: true
					}
				],
				
				sortorder : 'desc',
				loadonce : false,
				viewrecords : true,
				width : 1850,
				// height: 350,
				shrinkToFit : true,
				rowheight : 300,
				hoverrows : true,
				rownumbers : true,
				rowNum : 10,
				'cellEdit' : true,
				afterSaveCell: function grossTotal(){
					
					var rowId =$("#list4").jqGrid('getGridParam','selrow');  
		        	var rowData = jQuery("#list4").getRowData(rowId);
		        	
		            var OneBoardQty = rowData['oneBoardQty'];
		            var unitPrice = rowData['unitPrice'];
		            
		            var totalUnitPrice = OneBoardQty * unitPrice;
		            
		            $("#list4").jqGrid("setCell", rowId, "boardCost",totalUnitPrice);
					
				},
			
				
				pager : "#jqGridPager",

			});
			
			
			if (count == 0 || count == null) {
				
				$("#list4").addRowData(0,
						jsonData.offer);
			}
			
			$('#list4').navGrid('#jqGridPager',
					{
						edit : true,
						add : false,
						del : true,
						search : true,
						refresh : true,
						view : true,
						position : "left",
						cloneToTop : false
					},
					
					{
						editCaption : "The Edit Dialog",

						afterSubmit : function() {

							var grid = $("#list4"), intervalId = setInterval(function() {
								
								grid.trigger(
										"reloadGrid",
										[ {
											current : true
										} ]);															
									}, 500);
						},

						recreateForm : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfterEdit : true,

						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},
					
					{
						closeAfterAdd : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},
					
					{
						closeAfterdel : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						recreateForm : true,

						reloadAftersubmit : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						},
						
						
					});
		});
	})
	//clearFiled();
}

function fetchProductsbyCatName()
{
	var categoryName= $('#componentType').val();
	var params = {};
	
	$("#compName").empty();
	$("#compName").append($("<option></option>").attr("value","").text("Select Component"));
	
	if(categoryName =="" || categoryName == null || categoryName == undefined)
		{
		swal({
			title:"Alert!",
			text:"Please Enter Category Name!",
			icon: 'error',
			timer: 2500,
			button:false
		    }) 
		    document.getElementById("").focus();
		    return false; 
		}
	
	params["categoryName"] = categoryName;

	params["methodName"] = "fetchproductByCatName";
	
	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) {
		var count = 1;

		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				{
			$("#compName").append($("<option></option>").attr("value",i.list).text(v.componentName));
			count++;
				});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {

		}
	});
	
}
	
	


function BillofMaterialValidation(){
	
	var projectName = $('#projectName').val();
	var boardName = $('#boardName').val();
	
	
	if (projectName == "" || projectName == null || projectName == undefined) {
		swal({
		     title: "Alert!",
		     text: "Please Enter Project Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Project Name");
		document.getElementById("projectName").focus();
		return false;
	}
	
	if (boardName == "" || boardName == null || boardName == undefined) {
		swal({
		     title: "Alert!",
		     text: "Please Enter Board Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Board Name");
		document.getElementById("boardName").focus();
		return false;
	}
	
	
	
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');

	if (count <= 0) {
		swal({
		     title: "Alert!",
		     text: "Please Select Component Category !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please Select Component Category !!!. . .');
		document.getElementById("componentType").focus();
		return false;
	}
	
	
	
	var allRowsInGrid = $('#list4').getGridParam('data');// to get all rows of grid
	var AllRows = JSON.stringify(allRowsInGrid);

	for (var i = 0; i < count; i++) {
		var componentType = allRowsInGrid[i].componentType;
		var componentName = allRowsInGrid[i].componentName;
		var Ref_Designator = allRowsInGrid[i].Ref_Designator;
		var Part_Number = allRowsInGrid[i].Part_Number;
		var Package = allRowsInGrid[i].Package;
		var TolvRating = allRowsInGrid[i].TolvRating;
		var Value = allRowsInGrid[i].Value;
		var Mfg_Name = allRowsInGrid[i].Mfg_Name;
		var description = allRowsInGrid[i].description;
		var OneBoardQty = allRowsInGrid[i].OneBoardQty;
		var unitPrice = allRowsInGrid[i].unitPrice;
		var BoardCost = allRowsInGrid[i].BoardCost;
		
		
		var Remark = allRowsInGrid[i].Remark;
		var vendorName = allRowsInGrid[i].vendorName;
		
		
		/*if (componentType == "" || componentType == null || componentType == undefined) {
			alert("Please Select Component Category");
			return false;
		}
		if (componentName == "" || componentName == null || componentName == undefined) {
			alert("Please Select Component Name");
			return false;
		}
		if (Ref_Designator == "" || Ref_Designator == null || Ref_Designator == undefined) {
			alert("Please Enter Ref_Designator Name");
			
			return false;
		}
		if (Part_Number == "" || Part_Number == null || Part_Number == undefined) {
			alert("Please Enter Part Number ");
			return false;
		}
		if (Package == "" || Package == null || Package == undefined) {
			alert("Please Enter Package");
			return false;
		}
		if (TolvRating == "" || TolvRating == null || TolvRating == undefined) {
			alert("Please Enter Total volat Rating Name");
			return false;
		}
		if (Value == "" || Value == null || Value == undefined) {
			alert("Please Enter value");
			return false;
		}
		if (Mfg_Name == "" || Mfg_Name == null || Mfg_Name == undefined) {
			alert("Please Enter Manufracture name");
			return false;
		}
		if (description == "" || description == null || description == undefined) {
			alert("Please Enter description");
			return false;
		}
		if (OneBoardQty == "" || OneBoardQty == null || OneBoardQty == undefined) {
			alert("Please Enter One Board quantity");
			return false;
		}
		
		if (unitPrice == "" || unitPrice == null || unitPrice == undefined) {
			alert("Please Enter Unit Price");
			return false;
		}
		var letterNumber = /^[0-9]+$/;
		if (unitPrice.match(letterNumber)) {
			if (OneBoardQty == "" || OneBoardQty == null || OneBoardQty == undefined) {
				alert("Please Enter Quantity");
				return false;
			}
			var letterNumber = /^[0-9]+$/;
			if (OneBoardQty.match(letterNumber)) {
				if (BoardCost == "" || BoardCost == null || BoardCost == undefined) {
					alert("Please Enter Quantity or unit price for borad cost");
					return false;
				}
				
			} else {
				alert("Enter Digits Only in Quantity ..!!!");
				return false;
			}
		} else {
			alert("Enter Digits Only in Unit Price ..!!!");
			return false;
		}
	
		if (Remark == "" || Remark == null || Remark == undefined) {
			alert("Please Enter remark");
			return false;
		}*/
	
		
		
		
		
		

		/*if (vendorName == "" || vendorName == null || vendorName == undefined) {
			alert("Please Enter Vendor Name");
			return false;
		}*/
	}
		
	addBillOfMaterial();
}



function addBillOfMaterial() {
	document.BillOfMaterial.btn.disabled = true;
	var params = {};

	

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');// to get all rows of grid
	var AllRows = JSON.stringify(allRowsInGrid);

	for (var i = 0; i < count; i++) {
		var componentType = allRowsInGrid[i].componentType;
		params["componentType" + i] = componentType;

		var pkCompTypeId = allRowsInGrid[i].pkCompTypeId;
		params["pkCompTypeId" + i] = pkCompTypeId;

		var componentName = allRowsInGrid[i].componentName;
		params["componentName" + i] = componentName;
		//alert(componentName);
		var Ref_Designator = allRowsInGrid[i].Ref_Designator;
		params["Ref_Designator" + i] = Ref_Designator;
		//alert(Ref_Designator);
		var Part_Number = allRowsInGrid[i].Part_Number;
		params["Part_Number" + i] = Part_Number;
		//alert(Part_Number);
		var Package = allRowsInGrid[i].compPackage;
		params["Package" + i] = Package;

		var TolvRating = allRowsInGrid[i].TolvRating;
		params["TolvRating" + i] = TolvRating;

		var Value = allRowsInGrid[i].Value;
		params["Value" + i] = Value;

		var Mfg_Name = allRowsInGrid[i].manufacturarName;
		params["Mfg_Name" + i] = Mfg_Name;
//alert(Mfg_Name);
		var description = allRowsInGrid[i].description;
		params["description" + i] = description;
		
		var OneBoardQty = allRowsInGrid[i].oneBoardQty;
		params["OneBoardQty" + i] = OneBoardQty;
		
		
		var unitPrice = allRowsInGrid[i].unitPrice;
		params["unitPrice" + i] = unitPrice;

		var BoardCost = allRowsInGrid[i].boardCost;
		params["BoardCost" + i] = BoardCost;
		
		var Remark = allRowsInGrid[i].Remark;
		params["Remark" + i] = Remark;
	
		var vendorName = allRowsInGrid[i].vendorName;
		params["vendorName" + i] = vendorName;
		
	}
	
	var projectName = $('#projectName').val();
	var boardName = $('#boardName').val();
	
	
	
	params["projectName"] = projectName;
	params["boardName"] = boardName;
	params["count"] = count;

	params["methodName"] = "saveBillOfMaterial";
	
	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) {
		swal({
		     title: "Success!",
		     text: "Bill of Material Added Successful !",
		     icon: 'success',
		     timer: 3000,
		     button:false
		     });

		//alert(data);
		location.reload();
	}

	).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	})
	
	
}
/*
function BillOfMaterialList()
{
	var params= {};

	params["methodName"] = "BillOfMaterialList";
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
					.column( 24 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 21 ).footer() ).html(

							''+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,			      
				columns: [
					
						  {"data": "SrNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "componentType", "width": "5%" ,"defaultContent": ""},
				          {"data": "ref_Designator", "width": "5%" ,"defaultContent": ""},
				          {"data": "part_Number" , "width": "5%" ,"defaultContent": ""},				          
				          {"data": "packages" , "width": "5%" ,"defaultContent": ""},
				          {"data": "tolvRating" , "width": "5%" ,"defaultContent": ""},
				          {"data": "value", "width": "5%" ,"defaultContent": ""},
				          {"data": "manufactureName", "width": "5%" ,"defaultContent": ""},
				          {"data": "description" , "width": "5%" ,"defaultContent": ""},
				          {"data": "oneBoardQty" , "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
				          {"data": "boardCost", "width": "5%" ,"defaultContent": ""},
				          {"data": "remark", "width": "5%" ,"defaultContent": ""},
				          
				         				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Of Material List";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Of Material List";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Of Material List";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Of Material List";
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
}*/







function BillOfMateriallist()
{
	

	var params= {};
	
	params["methodName"] = "BillOfMaterialList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchaseOrderCreatelist').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#purchaseOrderCreatelist').DataTable( {

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
				"scrollY": 300,
				"scrollX": true,
				columns: [
				        
					  {"data": "SrNo" , "width": "5%" ,"defaultContent": ""},
					  {"data": "projectName", "width": "5%" ,"defaultContent": ""},
			          {"data": "boardName", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentType", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "ref_Designator", "width": "5%" ,"defaultContent": ""},
			          {"data": "part_Number" , "width": "5%" ,"defaultContent": ""},				          
			          {"data": "packages" , "width": "5%" ,"defaultContent": ""},
			          {"data": "tolvRating" , "width": "5%" ,"defaultContent": ""},
			          {"data": "value", "width": "5%" ,"defaultContent": ""},
			          {"data": "manufactureName", "width": "5%" ,"defaultContent": ""},
			          {"data": "description" , "width": "5%","defaultContent": ""},
			          {"data": "oneBoardQty" , "width": "5%" ,"defaultContent": ""},
			          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			          {"data": "boardCost", "width": "5%" ,"defaultContent": ""},
			          {"data": "remark", "width": "5%" ,"defaultContent": ""},
			          {"data": "vendorName", "width": "5%" ,"defaultContent": ""},   
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Material List";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Material List";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Material List";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Material List";
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



function compoentnamereports()
{
	var CompoenentName= $('#CompoenentName').val();
	//alert(CompoenentCategory);
	var startDate = $("#fisDate6").val();
	//alert(startDate);
	var endDate = $("#endDate6").val();
	
	if(CompoenentName=="" || CompoenentName==null) 
	{
		alert("Please Select Compoenet Name");
		$("#CompoenentName").focus();
		return false;
	}
	if(startDate=="" || startDate==null) 
	{
		alert("Please Select start Date");
		$("#fisDate6").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		alert("Please Select end Date");
		$("#endDate6").focus();
		return false;
	}
	
	getCompoentNameBetTwoDays();
}



function getCompoentNameBetTwoDays(){
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
	
	
	params["CompoenentName"]= CompoenentName;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getCompoentnameReportBetweenTwoDatesforBom";
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
				"scrollY": true,
				"scrollX": true,
				columns: [
					
					{"data": "srNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "projectName", "width": "5%" ,"defaultContent": ""},	
				      {"data": "boardName", "width": "5%" ,"defaultContent": ""},	
				      {"data": "componentType", "width": "5%" ,"defaultContent": ""},
				      {"data": "componentName", "width": "5%" ,"defaultContent": ""},
				      {"data": "ref_Designator", "width": "5%" ,"defaultContent": ""},
				      {"data": "part_Number", "width": "5%" ,"defaultContent": ""},
				      {"data": "packages", "width": "5%" ,"defaultContent": ""},
				      {"data": "tolvRating", "width": "5%" ,"defaultContent": ""},
				      {"data": "value", "width": "5%" ,"defaultContent": ""},
				      {"data": "manufactureName", "width": "5%" ,"defaultContent": ""},
				      {"data": "description", "width": "5%" ,"defaultContent": ""},
				      {"data": "oneBoardQty", "width": "5%" ,"defaultContent": ""},					
				      {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
			          {"data": "boardCost" , "width": "5%" ,"defaultContent": ""}, 
			          {"data": "remark" , "width": "5%" ,"defaultContent": ""},
			          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
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
function ok()
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
	
	params["methodName"] = "getBillofmaterialReportBetweenTwoDates";
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
				"scrollY": true,
				"scrollX": true,
				columns: [
				        
					{"data": "srNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "projectName", "width": "5%" ,"defaultContent": ""},	
				      {"data": "boardName", "width": "5%" ,"defaultContent": ""},	
				      {"data": "componentType", "width": "5%" ,"defaultContent": ""},
				      {"data": "componentName", "width": "5%" ,"defaultContent": ""},
				      {"data": "ref_Designator", "width": "5%" ,"defaultContent": ""},
				      {"data": "part_Number", "width": "5%" ,"defaultContent": ""},
				      {"data": "packages", "width": "5%" ,"defaultContent": ""},
				      {"data": "tolvRating", "width": "5%" ,"defaultContent": ""},
				      {"data": "value", "width": "5%" ,"defaultContent": ""},
				      {"data": "manufactureName", "width": "5%" ,"defaultContent": ""},
				      {"data": "description", "width": "%" ,"defaultContent": ""},
				      {"data": "oneBoardQty", "width": "5%" ,"defaultContent": ""},					
				      {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
			          {"data": "boardCost" , "width": "5%" ,"defaultContent": ""}, 
			          {"data": "remark" , "width": "5%" ,"defaultContent": ""},
			          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
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



function getCompoentCategoryBetTwoDaysvalidation()
{
	var CompoenentCategory= $('#componentCategory_id').val();
	//alert(CompoenentCategory);
	var startDate = $("#fisDate7").val();
	//alert(startDate);
	var endDate = $("#endDate7").val();
	
	if(CompoenentCategory=="" || CompoenentCategory==null) 
	{
		alert("Please Select Compoenet Category");
		$("#componentCategory_id").focus();
		return false;
	}
	if(startDate=="" || startDate==null) 
	{
		alert("Please Select start Date");
		$("#fisDate7").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		alert("Please Select end Date");
		$("#endDate7").focus();
		return false;
	}
	
	getCompoentCategoryBetTwoDays()();
}


//************ Client Enquiry Report **************//*
//****** Between Two dates **********//*

function getCompoentCategoryBetTwoDays(){
	var params= {};
	var CompoentCategory= $('#componentCategory_id').val();
	var fisDate = $("#fisDate7").val();
	var endDate = $("#endDate7").val();

	var input1 = document.getElementById('componentCategory_id'),
	list = document.getElementById('compoentCategorylist'),
	i,fkClientId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkCompenetId = list.options[i].getAttribute('data-value');
		}
	}
	params["fkCompenetId"]= fkCompenetId ;
	params["CompoentCategory"]= CompoentCategory;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getCompoentCategoryForBillofmaterialReportBetweenTwoDates";
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
				"scrollY": true,
				"scrollX": true,
				columns: [
					
					{"data": "srNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "projectName", "width": "5%" ,"defaultContent": ""},	
				      {"data": "boardName", "width": "5%" ,"defaultContent": ""},	
				      {"data": "componentType", "width": "5%" ,"defaultContent": ""},
				      {"data": "componentName", "width": "5%" ,"defaultContent": ""},
				      {"data": "ref_Designator", "width": "5%" ,"defaultContent": ""},
				      {"data": "part_Number", "width": "5%" ,"defaultContent": ""},
				      {"data": "packages", "width": "5%" ,"defaultContent": ""},
				      {"data": "tolvRating", "width": "5%" ,"defaultContent": ""},
				      {"data": "value", "width": "5%" ,"defaultContent": ""},
				      {"data": "manufactureName", "width": "5%" ,"defaultContent": ""},
				      {"data": "description", "width": "5%" ,"defaultContent": ""},
				      {"data": "oneBoardQty", "width": "5%" ,"defaultContent": ""},					
				      {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
			          {"data": "boardCost" , "width": "5%" ,"defaultContent": ""}, 
			          {"data": "remark" , "width": "5%" ,"defaultContent": ""},
			          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
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





function reportsbyprojecttname()
{
	var ProjectName = $("#projectName").val();
	var startDate = $("#fisDate4").val();
	var endDate = $("#endDate4").val();
	
	if(ProjectName=="" || ProjectName==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Project Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Project Name");
		$("#projectName").focus();
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

	var projectName = $("#projectName").val();
	var fisDate4 = $("#fisDate4").val();
	var endDate4 = $("#endDate4").val();
	
	var input1 = document.getElementById('projectName'), list = document
	.getElementById('cli_drop'), i, fkClientId2;
    for (i = 0; i < list.options.length; ++i)
    {
	    if (list.options[i].value === input1.value) 
	    {
	    	fkClientId2 = list.options[i].getAttribute('data-value');
	    }
    }
	
  	var params= {};
	
	//params["fkClientId2"] = fkClientId2;
	params["projectName"] = projectName;
	params["fisDate4"] = fisDate4;
	params["endDate4"] = endDate4;
	
	params["methodName"] = "getprojectReportbyprojectName";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#clientBetweenTwoDatesAndName').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap=="" || catmap<=0 || catmap==null) 
		{
			swal({
			     title: "Warning!",
			     text: "No data Available for "+projectName+" \nFrom "+fisDate4+" To "+endDate4+"..!",
			     icon: 'warning',
			     timer: 2500,
			     button:false
			     });
			return false;
		}
		
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
				"scrollY": true,
				"scrollX": true,
				
				
				
				columns: [
				        

					{"data": "SrNo", "width": "5%" ,"defaultContent": ""},
					//  {"data": "projectName", "width": "5%" ,"defaultContent": ""},	
				      //{"data": "boardName", "width": "5%" ,"defaultContent": ""},	
				      {"data": "componentType", "width": "5%" ,"defaultContent": ""},
				      {"data": "componentName", "width": "5%" ,"defaultContent": ""},
				      {"data": "ref_Designator", "width": "5%" ,"defaultContent": ""},
				      {"data": "part_Number", "width": "5%" ,"defaultContent": ""},
				      {"data": "packages", "width": "5%" ,"defaultContent": ""},
				      {"data": "tolvRating", "width": "5%" ,"defaultContent": ""},
				      {"data": "value", "width": "5%" ,"defaultContent": ""},
				      {"data": "manufactureName", "width": "5%" ,"defaultContent": ""},
				      {"data": "description", "width": "5%" ,"defaultContent": ""},
				      {"data": "oneBoardQty", "width": "5%" ,"defaultContent": ""},					
				      {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
			          {"data": "boardCost" , "width": "5%" ,"defaultContent": ""}, 
			          {"data": "remark" , "width": "5%" ,"defaultContent": ""},
			          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          
				          ],
				          
				          
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Of material Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Of material Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Bill Of material Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return " Bill Of material Report";
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


function getGridOfBillOfMaterial1() {
	
	
	var params = {};	
	var count = 0;
	var newrow;
	var rowId;
	var input1 = document.getElementById('projectname'), 
	list = document.getElementById('billofmateriallist'), i, projectname;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			projectname = list.options[i].getAttribute('data-value');
		}
	}

	params["projectname"] = projectname;
	
	
	params["methodName"] = "getGridBillOfMaterialforedit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		//alert(data);

		$("#list4").jqGrid("clearGridData");

		$.each(jsonData,function(i, v)
		{
			
			document.getElementById("Projectname1").value = v.projectName;
			/*count = jQuery("#list4").jqGrid('getGridParam', 'records');
			var rowdata = $("#list4").jqGrid('getGridParam', 'data');
			var ids = jQuery("#list4").jqGrid('getDataIDs');
			var prodName, com, packing, unit;
			for (var j = 0; j < count; j++)
			{
				

				var rowId = ids[j];
				var rowData = jQuery('#list4').jqGrid('getRowData',rowId);
				
				
				newrow = true;
			}
			
			if (newrow == true) {
				
				$("#list4").addRowData(count,jsonData.offer);
			}*/

			$("#list4").jqGrid({
				datatype : "local",
				
				colNames : ['billid','ProjectName','Boardname','Comp.Category','Comp.Id','Comp.Name','Ref_Designator','Part_Number','Package','Tol/VA Rating','Value','Manufacturer_Name','Description','QTY_ReqFor1Board','UnitPrice','Board Cost','Remark','VendorName'],
				colModel : [
					
					{
						name : 'pkCompBomId',
						width : 2,
						editable : false,
						 hidden:true
					},
					{
						name : 'projectName',
						width : 42,
						editable : false
					},
					{
						name : 'boardName',
						width : 42,
						editable : true
					},
					{
						name : 'componentType',
						width : 42,
						editable : true
					},
					{
						name : 'fkCompTypeId',
						width : 2,
						editable : false,
						hidden : true
					},
					{
						name : 'componentName',
						width : 42,
						editable : true
					},
					{
						name : 'ref_Designator',
						width : 42,
						editable : true
					},
					{
						name : 'part_Number',
						width : 42,
						editable : true
					},
					{
						name : 'packages',
						width : 30,
						editable : true
					},
					{
						name : 'tolvRating',
						width : 42,
						editable : true
					},
					{
						name : 'value',
						width : 30,
						editable : true
					},
					{
						name : 'manufactureName',
						width : 40,
						editable : true
					},
					{
						name : 'description',
						width : 42,
						editable : true
					},
					{
						name : 'oneBoardQty',
						width : 40,
						editable : true
					},
					{
						name : 'unitPrice',
						width : 30,
						editable : true
					},
					
					{
						name : 'boardCost',
						width : 28,
						editable : false
					},
					{	name:'remark',
				    	 width:30,
				    	 editable: true
					},
					{	name:'vendorName',
				    	 width:30,
				    	 editable: true
					}
				],
				
				//sortorder : 'desc',
				loadonce : false,
				viewrecords : true,
				width : 1850,
				// height: 350,
				shrinkToFit : true,
				rowheight : 300,
				hoverrows : true,
				rownumbers : true,
				rowNum : 10,
				'cellEdit' : true,
				afterSaveCell: function grossTotal(){
					
					var rowId =$("#list4").jqGrid('getGridParam','selrow');  
		        	var rowData = jQuery("#list4").getRowData(rowId);
		        	
		            var OneBoardQty = rowData['oneBoardQty'];
		            var unitPrice = rowData['unitPrice'];
		            
		            var totalUnitPrice = OneBoardQty * unitPrice;
		            
		            $("#list4").jqGrid("setCell", rowId, "boardCost",totalUnitPrice);
					
				},
			
				
				pager : "#jqGridPager",

			});
			
			$("#list4").addRowData(i, jsonData[i]);
			/*if (count == 0 || count == null) {
				
				$("#list4").addRowData(0,
						jsonData.offer);
			}*/
			
			$('#list4').navGrid('#jqGridPager',
					{
						edit : true,
						add : false,
						del : false,
						search : true,
						refresh : true,
						view : true,
						position : "left",
						cloneToTop : false
					},
					
					{
						editCaption : "The Edit Dialog",

						afterSubmit : function() {

							var grid = $("#list4"), intervalId = setInterval(function() {
								
								grid.trigger(
										"reloadGrid",
										[ {
											current : true
										} ]);															
									}, 500);
						},

						recreateForm : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfterEdit : true,

						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},
					
					{
						closeAfterAdd : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},
					
					{
						closeAfterdel : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						recreateForm : true,

						reloadAftersubmit : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						},
						
						
					});
		});
	})
}

function BillofMaterialValidation1(){
	
	var projectName = $('#projectname').val();
	
	
	
	if (projectName == "" || projectName == null || projectName == undefined) {
		swal({
		     title: "Alert!",
		     text: "Please Select Project Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Project Name");
		document.getElementById("projectname").focus();
		return false;
	}
	updateBillOfMaterial();
}

function updateBillOfMaterial() {
	document.BillOfMaterial.btn.disabled = true;
	var params = {};

	

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');// to get all rows of grid
	var AllRows = JSON.stringify(allRowsInGrid);

	for (var i = 0; i < count; i++) {
		
		
		var pkCompBomId = allRowsInGrid[i].pkCompBomId;
		params["pkCompBomId" + i] = pkCompBomId;

		var projectName = allRowsInGrid[i].projectName;
		params["projectName" + i] = projectName;

		var boardName = allRowsInGrid[i].boardName;
		params["boardName" + i] = boardName;
		
		var componentType = allRowsInGrid[i].componentType;
		params["componentType" + i] = componentType;

		var fkCompTypeId = allRowsInGrid[i].fkCompTypeId;
		params["fkCompTypeId" + i] = fkCompTypeId;

		var componentName = allRowsInGrid[i].componentName;
		params["componentName" + i] = componentName;
	
		var ref_Designator = allRowsInGrid[i].ref_Designator;
		params["ref_Designator" + i] = ref_Designator;
		
		var part_Number = allRowsInGrid[i].part_Number;
		params["part_Number" + i] = part_Number;
	
		var packages = allRowsInGrid[i].packages;
		params["packages" + i] = packages;

		var tolvRating = allRowsInGrid[i].tolvRating;
		params["tolvRating" + i] = tolvRating;

		var value = allRowsInGrid[i].value;
		params["value" + i] = value;

		var part_Number = allRowsInGrid[i].part_Number;
		params["part_Number" + i] = part_Number;

		var description = allRowsInGrid[i].description;
		params["description" + i] = description;
		
		var oneBoardQty = allRowsInGrid[i].oneBoardQty;
		params["oneBoardQty" + i] = oneBoardQty;
		
		
		var unitPrice = allRowsInGrid[i].unitPrice;
		params["unitPrice" + i] = unitPrice;

		var boardCost = allRowsInGrid[i].boardCost;
		params["boardCost" + i] = boardCost;
		
		var remark = allRowsInGrid[i].remark;
		params["remark" + i] = remark;
	
		var vendorName = allRowsInGrid[i].vendorName;
		params["vendorName" + i] = vendorName;
		
		var manufactureName = allRowsInGrid[i].manufactureName;
		params["manufactureName" + i] = manufactureName;
		
	}
	
	
	
	
	var projectName = $('#Projectname1').val();
	
	params["projectName"] = projectName;
	params["count"] = count;

	params["methodName"] = "updateBillOfMaterial";
	
	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) {
		swal({
		     title: "Success!",
		     text: "Bill of Material Update Successful !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     });
		//alert(data);
		location.reload();
	}

	).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	})
	
	
}


function validateGenerateBillCOPYForOtherBill(){
	var BillNo = $('#BillNo').val(); 
	var input = document.getElementById('BillNo'), list = document
	.getElementById('productBillList'), i, billNo;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
		}
	}
	if(BillNo != null && BillNo != "" && BillNo != " "){
		if(billNo != null){
			generateBillCOPY1();
		}
		else{
			swal({
			     title: "Invalid!",
			     text: "Please select Correct Bill number form avaliable list !",
			     icon: 'error',
			     timer: 2500,
			     button:false
			     });
			//swal("Invalid!","Invalid Bill Number ! Please select correct Bill number form avaliable list","error");
		}
	}
	else{
		swal({
		     title: "Alert!",
		     text: "Please select Bill Number first !",
		     icon: 'warning',
		     timer: 2500,
		     button:false
		     });
		     //swal("Alert!","Please select Bill Number first !","warning");
	}
}

function generateBillCOPY1() {
	var input = document.getElementById('BillNo'), 
	list = document.getElementById('productBillList'), i, billNo,fkclientid,clientname,igst,sgst,cgst,totaltaxamount,grosstotal,subtotal;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
			fkclientid = list.options[i].getAttribute('myvalue');
			clientname = list.options[i].getAttribute('myvalue1');
			cgst = list.options[i].getAttribute('myvalue2');
			sgst = list.options[i].getAttribute('myvalue3');
			igst = list.options[i].getAttribute('myvalue4');
			totaltaxamount = list.options[i].getAttribute('myvalue5');
			subtotal = list.options[i].getAttribute('myvalue6');
			grosstotal = list.options[i].getAttribute('myvalue7');
			taxpercentage= list.options[i].getAttribute('myvalue8');
		}
	}
	
	//alert("billno-"+billNo+"clientid-"+fkclientid+"clientname-"+clientname+"cgest-"+cgst+"sgest-"+sgst+"igst-"+igst+"taxamount-"+totaltaxamount+"subtotal-"+subtotal+"grosstotal-"+grosstotal)
	var params = {};
	params["billNo"] = billNo;
	params["fkclientid"] = fkclientid;
	params["clientname"] = clientname;
	params["cgst"] = cgst;
	params["sgst"] = sgst;
	params["igst"] = igst;
	params["totaltaxamount"] = totaltaxamount;
	params["subtotal"] = subtotal;
	params["grosstotal"] = grosstotal;
	params["taxpercentage"] = taxpercentage;
	params["methodName"] = "OtherBillCOPY";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data){
		
		window.open("productBillingPdfcopy.jsp");
		location.reload(true);
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}
function validateGenerateBillCOPYForOtherBill1(){
	var BillNo = $('#BillNo').val(); 
	var input = document.getElementById('BillNo'), list = document
	.getElementById('productBillList'), i, billNo;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
		}
	}
	if(BillNo != null && BillNo != "" && BillNo != " "){
		if(billNo != null){
			generateBillCOPY11();
		}
		else{
			swal({
			     title: "Invalid!",
			     text: "Please select Correct Bill number form avaliable list !",
			     icon: 'error',
			     timer: 2500,
			     button:false
			     });
			//alert("Invalid Bill Number ! Please select correct Bill number form avaliable list");
		}
	}
	else{
		swal({
		     title: "Alert!",
		     text: "Please select Bill Number first !",
		     icon: 'warning',
		     timer: 2500,
		     button:false
		     });
		//alert("Please select Bill Number first !");
	}
}

function generateBillCOPY11() {
	var input = document.getElementById('BillNo'), 
	list = document.getElementById('productBillList'), i, billNo,fkclientid,clientname,igst,gst,billdate,totaltaxamount,grosstotal,subtotal,staartdate,enddate;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
			fkclientid = list.options[i].getAttribute('myvalue');
			clientname = list.options[i].getAttribute('myvalue1');
			gst = list.options[i].getAttribute('myvalue2');
			igst = list.options[i].getAttribute('myvalue3');
			billdate = list.options[i].getAttribute('myvalue4');
			totaltaxamount = list.options[i].getAttribute('myvalue5');
			subtotal = list.options[i].getAttribute('myvalue6');
			grosstotal = list.options[i].getAttribute('myvalue7');
			staartdate = list.options[i].getAttribute('myvalue8');
			enddate = list.options[i].getAttribute('myvalue9');
		}
	}
	//alert(billdate+"--"+staartdate+"--"+enddate)
	//alert("billno-"+billNo+"clientid-"+fkclientid+"clientname-"+clientname+"cgest-"+cgst+"sgest-"+sgst+"igst-"+igst+"taxamount-"+totaltaxamount+"subtotal-"+subtotal+"grosstotal-"+grosstotal)
	var params = {};
	params["billNo"] = billNo;
	params["fkclientid"] = fkclientid;
	params["clientname"] = clientname;
	params["gst"] = gst;
	params["billdate"] = billdate;
	params["igst"] = igst;
	params["totaltaxamount"] = totaltaxamount;
	params["subtotal"] = subtotal;
	params["grosstotal"] = grosstotal;
	params["enddate"] = enddate;
	params["staartdate"] = staartdate;
	params["methodName"] = "OtherBillCOPY1";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data){
		
		window.open("ResourseBillingPdfCopy.jsp");
		location.reload(true);
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

function clearFiled()
{
	document.getElementById("componentType").value="";
}

function compSubcategoryDetails()
{	
	var input1 = document.getElementById('componentType'),
	list = document.getElementById('billofmateriallist'),
	i,categoryId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			categoryId = list.options[i].getAttribute('data-value');
		}
	}

	var fk_cat_id = fk_cat_id;
	
	$("#componentSubcategory").empty();
	$("#componentSubcategory").append($("<option></option>").attr("value","").text("Select Subcategory"));
	var params= {};

	params["categoryId"] = categoryId;
	params["methodName"] = "getComponentList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				//$("#BillNo").append($("<option></option>").attr("value",(v.billNo))); 
				$("#componentSubcategory").append($("<option></option>").attr("value",v.pksubCategoryId).text(v.componentSubCategory));
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


function getComponentName() {
	
	var componentType = $('#componentType').val();
	
	var input1 = document.getElementById('componentType'), 
	list = document.getElementById('billofmateriallist'),
		   i, pkcompoentNameid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
	pkcompoentNameid = list.options[i].getAttribute('data-value');
		}
	}
	
	var input2 = document.getElementById('componentSubcategory'), 
	list2 = document.getElementById('componentSubcategory'),
		   i, pkcompoentSubcategoryId;

	for (i = 0; i < list2.options.length; ++i) {
	if (list2.options[i].value === input2.value) {
	pkcompoentSubcategoryId = list2.options[i].getAttribute('value');
		}
	}

	$("#compName").empty();
	$("#compName").append($("<option></option>").attr("value","").text("Select Component Name"));
	
	
	
	var params = {};
	
	params["componentType"] = pkcompoentNameid;
	params["pkcompoentSubcategoryId"] = pkcompoentSubcategoryId;
	
	params["methodName"] = "GetCompoentnametoselect11";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,
		function(data)
		{
		//alert(data);
		var count = 1;
		
		var jsonData = $.parseJSON(data);
		//var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			$("#compName").append($("<option></option>").attr("value",v.pkComponentCategoryDetailsId).text(v.componentName));
			count++;
			 
				});
			}).error(function(jqXHR, textStatus, errorThrown){
	 			if(textStatus==="timeout") {

				}
			});
 	    	
}