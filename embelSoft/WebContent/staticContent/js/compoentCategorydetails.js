function getTaxDetailsForCompoentCategoryDetails()
{
	$("#taxPercentage").append($("<input/>").attr("value","").text());
	$("#CGST").append($("<input/>").attr("value","").text());
	$("#SGST").append($("<input/>").attr("value","").text());
	
	var params= {};
	var TaxName= $('#fk_tax_id').val();
	
	
	var input1 = document.getElementById('fk_tax_id'),
	list = document.getElementById('taxNameList'),
	i,fktaxid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fktaxid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fktaxid"] = fktaxid;
	params["TaxName"] = TaxName;
	params["methodName"] = "getTaxDetailsForComponentDetails";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			document.getElementById("taxPercentage").value = v.taxPercentage;
			document.getElementById("CGST").value = v.CGST;
			document.getElementById("SGST").value = v.SGST;
		});
	}).error(function(jqXHR, textStatus, errorThrown)
	{
		if(textStatus==="timeout")
		{
			
		}
	});
}



var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form ...
  var x = document.getElementsByClassName("formsection");
  x[n].style.display = "block";
  // ... and fix the Previous/Next buttons:
  if (n == 0 ) {
    document.getElementById("prevBtn").style.display = "none";
  }else if(n== 1){
    document.getElementById("prevBtn").style.display = "inline";
  }else if(n==2){
	  document.getElementById("nextBtn").style.display = "none";
  }
  if (n == (x.length - 1)) {
   // document.getElementById("nextBtn").innerHTML = "Submit";
	  return false;
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  // ... and run a function that displays the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("formsection");
  // Exit the function if any field in the current tab is invalid:
 // if (n == 1 ) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
 
  if(currentTab<=2)
  currentTab = currentTab + n;
 
  // if you have reached the end of the form... :
 // if (currentTab >= x.length) {
    //...the form gets submitted:
   // document.getElementById("vendorForm").submit();
   // return false;
  //}
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("formsection");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false:
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class to the current step:
  x[n].className += " active";
}



function CompoentCategoryDetialvalidate() {
	
	var unitPrice1 = $('#unitPrice1').val();
	
	//alert(unitPrice1);
	var CompoentCategory = $('#componentCategory').val();
   // alert("CompoentCategory-->"+CompoentCategory);
     
    if(CompoentCategory=="" || CompoentCategory==null || CompoentCategory==undefined)
	{
    	swal({
		     title: "Alert!",
		     text: "Please Select Component Category !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Component Category");
		return false;
	}
    
//    var TaxName= $('#fk_tax_id').val();
//    
//    if(TaxName=="" || TaxName==null || TaxName==undefined)
//	{
//    	swal({
//		     title: "Alert!",
//		     text: "Please Select Taxt Type !",
//		     icon: 'error',
//		     timer: 2500,
//		     button:false
//		     });
//		//alert("Please Select Tax Type");
//		return false;
//	}
	
    CompoentCategoryDetial();
    
}

function CompoentCategoryDetial(){
	
	var componentCategory = $('#componentCategory').val();
	var componentName = $('#componentName').val();
	var pkComponentSubCategoryId = $('#componentSubcategory').val();
	var componentValue = $('#componentValue').val();
	var partNumber = $('#partNumber').val();
	var manufacturerName = $('#manufacturerName').val();
	var description = $('#description').val();
	var type = $('#type').val();
	var packages = $('#packages').val();
	var totalVolt = $('#totalVolt').val();
	var unit = $('#unit').val();
	var unitPrice = $('#unitPrice').val();	
	var TaxName= $('#fk_tax_id').val();
	var unitPrice1 = $('#unitPrice1').val();
	var taxPercentage = $('#taxPercentage').val();
	var CGST = $('#CGST').val();
	var SGST = $('#SGST').val();
	var duty = $('#duty').val();
	
	
	var params = {};
	
	var input1 = document.getElementById('componentCategory'), 
	list = document.getElementById('compoentCategorylist'), i, pkCompTypeId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			pkCompTypeId = list.options[i].getAttribute('data-value');
		}
	}
	
	var list = document.getElementById('componentSubcategory');
	var input = document.getElementById('componentSubcategory'); // Assuming you meant to get the input element
	var componentSubCategory;

	for (var i = 0; i < list.options.length; ++i) {
	    if (list.options[i].value === input.value) {
	    	componentSubCategory = list.options[i].text;
	        break; // Once a match is found, no need to continue the loop
	    }
	}

	
	var input2 = document.getElementById('fk_tax_id'),
	list = document.getElementById('taxNameList'),
	i,fktaxid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input2.value) {
		fktaxid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["pkCompTypeId"] = pkCompTypeId;
	params["componentSubCategory"] = componentSubCategory;
	params["pkComponentSubCategoryId"] = pkComponentSubCategoryId;
	params["componentName"]=componentName;
	params["componentValue"]=componentValue;
	params["partNumber"]=partNumber;
	params["manufacturerName"]=manufacturerName;
	params["description"]=description;
	params["type"]=type;
	params["packages"]=packages;
	params["totalVolt"]=totalVolt;
	params["unit"]=unit;
	params["unitPrice"]=unitPrice;									
	params["componentCategory"] = componentCategory;	
	params["fktaxid"] = fktaxid;
	params["TaxName"] = TaxName;
	params["taxPercentage"] = taxPercentage;
	params["CGST"] = CGST;
	params["SGST"] = SGST;	
	params["duty"] = duty;
	
	params["unitPrice1"]=unitPrice1;
	params["methodName"] = "savecomponentCategoryDetails";
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
 		swal({
		     title: "Success!",
		     text: "Component Category Details Added Successful !",
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
function compoentCategoryDetaillist()
{
	

	var params= {};
	
	params["methodName"] = "CompoentCategoryDetaillist";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#Compoentcategorylist').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#Compoentcategorylist').DataTable( {
			
		/*	'columnDefs' : [
			//hide the second & fourth column
			{ 'visible': false, 'targets': [18,19,20] }
			],*/


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
					.column( 6 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 6 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},
				
				destroy: true,
				searching: true,
				"scrollX": true,
				"scrollY": 300,
				columns: [
				        
					  {"data": "SrNo" , "width": "5%" ,"defaultContent": ""},
					  {"data": "componentCategory", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentValue", "width": "5%" ,"defaultContent": ""},
			          {"data": "partNumber", "width": "5%" ,"defaultContent": ""},
			          {"data": "manufractureName", "width": "5%" ,"defaultContent": ""},
			          {"data": "description" , "width": "5%" ,"defaultContent": ""},				          
			          {"data": "componentType" , "width": "5%" ,"defaultContent": ""},
			          {"data": "packages" , "width": "5%" ,"defaultContent": ""},
			          {"data": "tovRating", "width": "5%" ,"defaultContent": ""},
			          {"data": "unit", "width": "5%" ,"defaultContent": ""},
			          {"data": "unitPrice" , "width": "5%" ,"defaultContent": ""},
			          {"data": "duty" , "width": "5%" ,"defaultContent": ""},
			          
			          {"data": "unitPriceWithCustomduty" , "width": "5%" ,"defaultContent": ""},
			          
			          {"data": "taxName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "taxPercentage" , "width": "5%" ,"defaultContent": ""},
			          {"data": "CGST", "width": "5%" ,"defaultContent": ""},
			          {"data": "SGST", "width": "5%" ,"defaultContent": ""},
			          
			         /* {"data": "pkComponentCategoryDetailsId", "width": "5%" ,"defaultContent": ""},
			          {"data": "fkCompTypeId", "width": "5%" ,"defaultContent": ""},
			          {"data": "fkTaxTypeId", "width": "5%" ,"defaultContent": ""},*/
			         
			          { 
	                        "orderable": false,
	                        "data": 'pkComponentCategoryDetailsId',
	                        "render": function (data, type, row, meta) {
	                         return '<i class="fa fa-pencil-square-o fa-2x" style="color: blue;" aria-hidden="true" id='+data+' onclick="getCompoentCategoryDetailsIdPkForEdit(this)"></i>'
	                            +'&nbsp;&nbsp;'+
	                            '<i class="fa fa-trash fa-2x" style="color: red;" aria-hidden="true" id='+data+' onclick="getCompCatDelete(this)"></i>'

			          } 
			          
			          }
			          
			         
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Category detail Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Category detail Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Category detail Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Category detail Report";
				                    	 },
				                     	 orientation : 'landscape',
				                     	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     },
				                   /*  {   extend : 'print',
				                    	 orientation : 'landscape',
				                     }*/
				                     ]
					} );
				});

		
		var mydata = catmap;
		$('#Compoentcategorylist').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

}


/*function getCompCatEdit() {
	window.location = "editProductDetails.jsp";
}*/

function getCompoentCategoryDetailsIdPkForEdit(data)
{
	
	var params= {};	
	var  abc = data.id;
	var pkId = +abc;
	
	var params = {};
	
	params["componentName_id"] = pkId;
	
	params["methodName"] = "getCompoentCategoryDetailsIdPkForEdit";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{	
		//alert(data);
		
		//window.location.replace("/embelSoft/jsp/editCompoentCategoryDetails.jsp");
		window.location.replace("/embelSoft/jsp/editComponentCategoryById.jsp");
	}
	).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout")
		{
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}


function getComponetCategoryDetailsByComponetIdPkForEdit()
{
	
	var pkId = $('#pkid').val();
	
	$("#componentName").append($("<input/>").attr("value","").text());
	
	$(" #componentValue").append($("<input/>").attr("value","").text());
		
	$("#partNumber").append($("<input/>").attr("value","").text());
		
	$("#manufacturerName").append($("<input/>").attr("value","").text());
		
	$("#description").append($("<input/>").attr("value","").text());
		
	$("#type").append($("<input/>").attr("value","").text());
		
	$("#packages").append($("<input/>").attr("value","").text());
		
	$("#totalVolt").append($("<input/>").attr("value","").text());
		
	$("#unit").append($("<input/>").attr("value","").text());
		
	$("#unitPrice").append($("<input/>").attr("value","").text());

	$("#unitPrice1").append($("<input/>").attr("value","").text());
		
	$("#fk_tax_id").append($("<input/>").attr("value","").text());
		
	$("#taxPercentage").append($("<input/>").attr("value","").text());
		
	$("#CGST").append($("<input/>").attr("value","").text());
		
	$("#SGST").append($("<input/>").attr("value","").text());
		
	$("#componentCategory").append($("<input/>").attr("value","").text());

	$("#componentName11").append($("<input/>").attr("value","").text());
	$("#duty").append($("<input/>").attr("value","").text());	
		
	
	var params= {};
		
		params["componentName_id"] = pkId;
		params["methodName"] = "getComponetCategoryDetailsByComponetIdPkForEdit";
		
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){

			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			
			window.location.replace("/embelSoft/jsp/editCompoentCategoryDetails.jsp");
			
			$.each(jsonData,function(i,v)
					
					{
					 document.getElementById("componentCategory").value = v.componentCategory;
					  document.getElementById("componentName").value = v.componentName;
					  document.getElementById("componentValue").value = v.componentValue;
				      document.getElementById("partNumber").value = v.partNumber;
				      document.getElementById("manufacturerName").value = v.manufractureName;
				      document.getElementById("totalVolt").value = v.tovRating;
				      document.getElementById("description").value = v.description;
				      document.getElementById("unit").value = v.unit;
				      document.getElementById("taxPercentage").value = v.taxPercentage;
				      document.getElementById("CGST").value = v.CGST;
				      document.getElementById("SGST").value = v.SGST;
				      document.getElementById("unitPrice").value = v.unitPrice;
				      document.getElementById("unitPrice1").value = v.unitPriceWithCustomduty;
				      document.getElementById("fk_tax_id").value = v.taxName;
				      document.getElementById("type").value = v.componentType;
				      document.getElementById("packages").value = v.packages;
				      document.getElementById("duty").value = v.duty;
				      document.getElementById("componentName11").value = v.componentName;
				      
					});
				}).error(function(jqXHR, textStatus, errorThrown){
		 			if(textStatus==="timeout") {

					}
				});
	 	    	
}



function getCompCatEdit(data){
	var params= {};	
	var  abc = data.id;
	var pkId = +abc;
	
	
	$("#componentName").append($("<input/>").attr("value","").text());
	
	$(" #componentValue").append($("<input/>").attr("value","").text());
		
	$("#partNumber").append($("<input/>").attr("value","").text());
		
	$("#manufacturerName").append($("<input/>").attr("value","").text());
		
	$("#description").append($("<input/>").attr("value","").text());
		
	$("#type").append($("<input/>").attr("value","").text());
		
	$("#packages").append($("<input/>").attr("value","").text());
		
	$("#totalVolt").append($("<input/>").attr("value","").text());
		
	$("#unit").append($("<input/>").attr("value","").text());
		
	$("#unitPrice").append($("<input/>").attr("value","").text());

	$("#unitPrice1").append($("<input/>").attr("value","").text());
		
	$("#fk_tax_id").append($("<input/>").attr("value","").text());
		
	$("#taxPercentage").append($("<input/>").attr("value","").text());
		
	$("#CGST").append($("<input/>").attr("value","").text());
		
	$("#SGST").append($("<input/>").attr("value","").text());
		
	$("#componentCategory").append($("<input/>").attr("value","").text());

	$("#componentName11").append($("<input/>").attr("value","").text());
	$("#duty").append($("<input/>").attr("value","").text());	
		

		
		params["componentName_id"] = pkId;
		params["methodName"] = "getCompoentCategoryDetailsForEdit";
		
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){

			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			
			window.location.replace("/embelSoft/jsp/editCompoentCategoryDetails.jsp");
			
			$.each(jsonData,function(i,v)
					
					{
					 document.getElementById("componentCategory").value = v.componentCategory;
					  document.getElementById("componentName").value = v.componentName;
					  document.getElementById("componentValue").value = v.componentValue;
				      document.getElementById("partNumber").value = v.partNumber;
				      document.getElementById("manufacturerName").value = v.manufractureName;
				      document.getElementById("totalVolt").value = v.tovRating;
				      document.getElementById("description").value = v.description;
				      document.getElementById("unit").value = v.unit;
				      document.getElementById("taxPercentage").value = v.taxPercentage;
				      document.getElementById("CGST").value = v.CGST;
				      document.getElementById("SGST").value = v.SGST;
				      document.getElementById("unitPrice").value = v.unitPrice;
				      document.getElementById("unitPrice1").value = v.unitPriceWithCustomduty;
				      document.getElementById("fk_tax_id").value = v.taxName;
				      document.getElementById("type").value = v.componentType;
				      document.getElementById("packages").value = v.packages;
				      document.getElementById("duty").value = v.duty;
				      document.getElementById("componentName11").value = v.componentName;
				      
					});
				}).error(function(jqXHR, textStatus, errorThrown){
		 			if(textStatus==="timeout") {

					}
				});
	 	    	
}


function getCompCatDelete(data) {

			var params= {};
				
			var  abc = data.id;
			var pkId = +abc;
			
			  var r = confirm("Do You want to delete component with id "+pkId+" ?");
			  if (r == true) {
			
				     	params["pkTempId"] = pkId;
								
						params["methodName"] = "getDeleteCompCatList";
						
						$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
					 			{
					 		swal({
							     title: "Success!",
							     text: "Record Deleted Successfully !",
							     icon: 'success',
							     timer: 2500,
							     button:false
							     });
					 		location.reload();
							}

					 	).error(function(jqXHR, textStatus, errorThrown){
					 		if(textStatus==="timeout") {
					 			$(loaderObj).hide();
					 			$(loaderObj).find('#errorDiv').show();
					 		}
					 	})
					}
			  else{
				  swal({
					     title: "Failed!",
					     text: "Your Record is Safe !",
					     icon: 'warning',
					     timer: 2500,
					     button:false
					     });
			 		location.reload();
					}
			  
}



function getCompoentCategoryForEdit()
{
$("#componentName").append($("<input/>").attr("value","").text());
	
$(" #componentValue").append($("<input/>").attr("value","").text());
	
$("#partNumber").append($("<input/>").attr("value","").text());
	
$("#manufacturerName").append($("<input/>").attr("value","").text());
	
$("#description").append($("<input/>").attr("value","").text());
	
$("#type").append($("<input/>").attr("value","").text());
	
$("#packages").append($("<input/>").attr("value","").text());
	
$("#totalVolt").append($("<input/>").attr("value","").text());
	
$("#unit").append($("<input/>").attr("value","").text());
	
$("#unitPrice").append($("<input/>").attr("value","").text());

$("#unitPrice1").append($("<input/>").attr("value","").text());
	
$("#fk_tax_id").append($("<input/>").attr("value","").text());
	
$("#taxPercentage").append($("<input/>").attr("value","").text());
	
$("#CGST").append($("<input/>").attr("value","").text());
	
$("#SGST").append($("<input/>").attr("value","").text());
	
$("#componentCategory").append($("<input/>").attr("value","").text());

$("#componentName11").append($("<input/>").attr("value","").text());
$("#duty").append($("<input/>").attr("value","").text());	
	
	var params= {};
	
	var input1 = document.getElementById('componentName_id'),
	list = document.getElementById('compoentCategoryNamelist'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["componentName_id"] = fkEmployeeid;
	params["methodName"] = "getCompoentCategoryDetailsForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
				 document.getElementById("componentCategory").value = v.componentCategory;
				  document.getElementById("componentName").value = v.componentName;
				  document.getElementById("componentValue").value = v.componentValue;
			      document.getElementById("partNumber").value = v.partNumber;
			      document.getElementById("manufacturerName").value = v.manufractureName;
			      document.getElementById("totalVolt").value = v.tovRating;
			      document.getElementById("description").value = v.description;
			      document.getElementById("unit").value = v.unit;
			      document.getElementById("taxPercentage").value = v.taxPercentage;
			      document.getElementById("CGST").value = v.CGST;
			      document.getElementById("SGST").value = v.SGST;
			      document.getElementById("unitPrice").value = v.unitPrice;
			      document.getElementById("unitPrice1").value = v.unitPriceWithCustomduty;
			      document.getElementById("fk_tax_id").value = v.taxName;
			      document.getElementById("type").value = v.componentType;
			      document.getElementById("packages").value = v.packages;
			      document.getElementById("duty").value = v.duty;
			      document.getElementById("componentName11").value = v.componentName;
			      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
	 			if(textStatus==="timeout") {

				}
			});
 	    	
}

function updateCompoentCategoryDetailValidation() {
	
	var componentName_id = $('#componentName_id').val();
	
	//alert(unitPrice1);
	var componentName_id = $('#componentName_id').val();
   // alert("CompoentCategory-->"+CompoentCategory);
     
    
    
    if(componentName_id=="" || componentName_id==null || componentName_id==undefined)
	{
    	swal({
		     title: "Alert!",
		     text: "Please Select Component Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Component Category");
		return false;
	}
    
   
	
    updateCompoentCategoryDetail();
    
}

function updateCompoentCategoryDetail() {
	
	var componentCategory = $('#componentCategory').val();
	var componentName2 = $('#componentName_id').val();
//	alert("Compoent name"+componentName);
	var componentNewName = $('#componentName').val();
	var componentName = $('#componentName11').val();
	//alert(componentName);
	//alert("updated Compoent name"+componentNewName );
	
	
	var componentValue = $('#componentValue').val();
	
	var partNumber = $('#partNumber').val();
	
	var manufacturerName = $('#manufacturerName').val();
	
	var description = $('#description').val();
	
	var type = $('#type').val();
	
	var packages = $('#packages').val();
	
	var totalVolt = $('#totalVolt').val();
	
	var unit = $('#unit').val();
	
	var unitPrice = $('#unitPrice').val();	
	
	var TaxName= $('#fk_tax_id').val();	
	
	
	var taxPercentage = $('#taxPercentage').val();
	
	var unitPrice1 = $('#unitPrice1').val();
	
	var CGST = $('#CGST').val();
	
	var SGST = $('#SGST').val();
	
	var duty = $('#duty').val();
	
	var componentName11 = $('#componentName_id').val();
	
/*	alert(componentName11);
	$("#componentName11 option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var componentName = splitText[0];
	alert(componentName);
	$("#componentName11 option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var packages = splitText[1];
	
	$("#componentName11 option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var type = splitText[2];
	
	
	$("#componentName11 option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var value = splitText[3];*/
	
	
	
	var params= {};
	
	var input1 = document.getElementById('componentName_id'),
	list = document.getElementById('compoentCategoryNamelist'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkCompoentid = list.options[i].getAttribute('data-value');
		}
	}
	
	
	
	var input2 = document.getElementById('fk_tax_id'),
	list = document.getElementById('taxNameList'),
	i,fktaxid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input2.value) {
		fktaxid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["componentName"]=componentName;
	params["componentNewName"]=componentNewName;
	
	params["fkCompoentid"]=fkCompoentid;
	params["componentValue"]=componentValue;
	params["partNumber"]=partNumber;
	params["manufacturerName"]=manufacturerName;
	params["description"]=description;
	params["type"]=type;
	params["packages"]=packages;
	params["totalVolt"]=totalVolt;
	params["unit"]=unit;
	params["unitPrice"]=unitPrice;
	params["unitPrice1"]=unitPrice1;									
	params["componentCategory"] = componentCategory;	
	params["fktaxid"] = fktaxid;
	params["TaxName"] = TaxName;
	params["taxPercentage"] = taxPercentage;
	params["CGST"] = CGST;
	params["SGST"] = SGST;	
	params["duty"] = duty;
	params["methodName"] = "updatecomponentCategoryDetails";
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
 		swal({
		     title: "Success!",
		     text: "Component Category Details Updated Successful !",
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
	
	
function updateCompoentCategoryDetailById() {

	var componentPk_id = $('#componentName_id').val();

	var componentCategory = $('#componentCategory').val();
	var componentNewName = $('#componentName').val();
	var componentName = $('#componentName11').val();

	var componentValue = $('#componentValue').val();

	var partNumber = $('#partNumber').val();

	var manufacturerName = $('#manufacturerName').val();

	var description = $('#description').val();

	var type = $('#type').val();

	var packages = $('#packages').val();

	var totalVolt = $('#totalVolt').val();

	var unit = $('#unit').val();

	var unitPrice = $('#unitPrice').val();

	var TaxName = $('#fk_tax_id').val();

	var taxPercentage = $('#taxPercentage').val();

	var unitPrice1 = $('#unitPrice1').val();

	var CGST = $('#CGST').val();

	var SGST = $('#SGST').val();

	var duty = $('#duty').val();

	var componentName11 = $('#componentName_id').val();
		
	
	var params= {};
	
	var input2 = document.getElementById('fk_tax_id'),
	list = document.getElementById('taxNameList'),
	i,fktaxid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input2.value) {
		fktaxid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["componentName"]=componentName;
	params["componentNewName"]=componentNewName;
	params["fkCompoentid"]=componentPk_id;
	params["componentValue"]=componentValue;
	params["partNumber"]=partNumber;
	params["manufacturerName"]=manufacturerName;
	params["description"]=description;
	params["type"]=type;
	params["packages"]=packages;
	params["totalVolt"]=totalVolt;
	params["unit"]=unit;
	params["unitPrice"]=unitPrice;
	params["unitPrice1"]=unitPrice1;									
	params["componentCategory"] = componentCategory;	
	params["fktaxid"] = fktaxid;
	params["TaxName"] = TaxName;
	params["taxPercentage"] = taxPercentage;
	params["CGST"] = CGST;
	params["SGST"] = SGST;	
	params["duty"] = duty;
	params["methodName"] = "updatecomponentCategoryDetails";
	
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
 		swal({
		     title: "Success!",
		     text: "Component Category Details Updated Successful !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     });
 		
 		window.location.replace("/embelSoft/jsp/CompoenentCategoryDetailList.jsp");
 		//window.location.replace("/embelSoft/jsp/editComponentCategoryById.jsp");
  		//location.reload();
 		 		
		}

 	).error(function(jqXHR, textStatus, errorThrown){
 		if(textStatus==="timeout") {
 			$(loaderObj).hide();
 			$(loaderObj).find('#errorDiv').show();
 		}
 	})
}
	
function downloadExcel()
{
	
	
	var params= {};
	
	
	params["methodName"] = "downloadPDF";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			document.getElementById("taxPercentage").value = v.taxPercentage;
			document.getElementById("CGST").value = v.CGST;
			document.getElementById("SGST").value = v.SGST;
		});
	}).error(function(jqXHR, textStatus, errorThrown)
	{
		if(textStatus==="timeout")
		{
			
		}
	});
}

function validateCompCatDetails() {
	
	var filename = $('#filename').val();
    
    if(filename=="" || filename==null || filename==undefined)
	{
    	swal({
		     title: "Alert!",
		     text: "Please Select File !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		return false;
	}
    
	
    uploadBulkCompoentCategoryDetail();
    
}

function uploadBulkCompoentCategoryDetail() {
	
	var fileInput = document.getElementById('filename');
    var file = fileInput.files[0];
    var filename  = file.name;
    // Check if a file is selected
    if (!file) {
    	swal({
		     title: "Faild!",
		     text: "Please select a file.",
		     icon: 'success',
		     timer: 250,
		     button:false
		     });
        return;
    }
	
	//var filename = $("#filename").val();		
	var params= {};

	params["filename"]=filename;

	params["methodName"] = "uploadBulkCompoentCategoryDetail";
	//params["methodName"] = "uploadBulkCompoentCategoryDetailNew";
	
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
 		
 		$("#loader").hide();
 		
 		var jsonData = JSON.parse(data);
 		
 		var myJSON = JSON.stringify(jsonData);	
	
		var splitText = myJSON.split('{').join('').split('"').join('').split('[').join(' [').split('],').join(']\n').split('}').join('');
		alert(splitText);

 		swal({
		     title: "Success!",
		     text: "Component Category Details Uploaded Successfully",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     });
 		
 		//window.location.replace("/embelSoft/jsp/CompoenentCategoryDetailList.jsp");
  		location.reload();
 		 		
		}

 	).error(function(jqXHR, textStatus, errorThrown){
 		if(textStatus==="timeout") {
 			$(loaderObj).hide();
 			$(loaderObj).find('#errorDiv').show();
 		}
 	})
}
	

//direct ajax call to BulkUploadController servlet
//ComponentCategory Bulk Upload by Namrata
$(document).on('submit', function(event) {
	
	event.preventDefault();
	//var f = new FormData(this);
	var f = new FormData(document.getElementById("myform"));
	console.log(f);
	
	$("#loader").show();
	
	$.ajax({
		type: "POST",
	    url: "../BulkUploadController",
	    async: true,
	    //data: $("#myform").serialize(),
	    data: f,
	    contentType: false,
	    processData: false,
	
	success: function (data, textStatus, jqXHR) {
		$("#loader").hide();
		
		var splitText = data.split('{').join('').split('"').join('').split('[').join(' [').split('],').join(']\n').split('}').join('');
		alert(splitText);
		location.reload();
		},
		
	error: function (jqXHR, textStatus, errorThrown) {
		$("#loader").hide();
		
		alert('Error! Try again');
		location.reload();
		}
		
		
	});
});
