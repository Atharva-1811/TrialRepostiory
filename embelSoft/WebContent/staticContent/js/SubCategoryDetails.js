function compSubTypesDetailsValidate()
{
	var componentType = $('#componentType').val();
	var componentSubcategory = $('#componentSubcategory').val();
	
	if(componentType=="" || componentType==null || componentType==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Component Category !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Component Type");
		return false;
	}
	
	if(componentSubcategory=="" || componentSubcategory==null || componentSubcategory==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Component SubCategory !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Component Type");
		return false;
	}
	
	compTypeDetails();
}

//componentDetails
function compTypeDetails()
{	
	//document.componentTypeDetailsForm.saveBtn.disabled = true;
	
	//var componentType = $('#componentType').val();
	
	var input1 = document.getElementById('componentType'), 
	list = document.getElementById('compList'),
		   i, pkcompoentNameid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
	pkcompoentNameid = list.options[i].getAttribute('data-value');
		}
	}
	
	var componentType = pkcompoentNameid;
	
	var componentSubcategory = $('#componentSubcategory').val();
	
	
	var params = {};
	
	params["componentType"] = componentType;
	params["compSubcategory"] = componentSubcategory;
	
	params["methodName"] = "saveCompSubcategoryDetails";
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
 		swal({
		     title: "Success!",
		     text: "Component SubCategory Details Added Successfully !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     });
 		//alert(data);
 		//location.reload();
 		document.getElementById("componentType").value = "";
 	 	document.getElementById("componentSubcategory").value = "";
		}

 	).error(function(jqXHR, textStatus, errorThrown){
 		if(textStatus==="timeout") {
 			$(loaderObj).hide();
 			$(loaderObj).find('#errorDiv').show();
 		}
 	})
 	
}


function compTypeList()
{
	var params= {};

	params["methodName"] = "getSubcategoryList";
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
					.column( 2 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 2 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollY": 300,
				"scrollX": true,
				columns: [
					
					      {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "componentType" , "width": "5%" ,"defaultContent": ""},
				          {"data": "componentSubCategory" , "width": "5%" ,"defaultContent": ""},
				          {"data": "status" , "width": "5%" ,"defaultContent": ""}
				          
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

function compSubcategoryDetails()
{	
	var input1 = document.getElementById('componentCategory'),
	list = document.getElementById('compoentCategorylist'),
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


function compSubcategoryDetailsForComponentBilling()
{	
	var input1 = document.getElementById('componentCategory'),
	list = document.getElementById('compoentCategorylist'),
	i,categoryId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			categoryId = list.options[i].getAttribute('data-value');
		}
	}

	var fk_cat_id = fk_cat_id;
	
	$("#subcategoryList").empty();
	$("#subcategoryList").append($("<option></option>").attr("value","").text("Select Subcategory").attr("data-value","").text("Select Subcategory"));
	var params= {};

	params["categoryId"] = categoryId;
	params["methodName"] = "getComponentList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				//$("#BillNo").append($("<option></option>").attr("value",(v.billNo))); 
				//$("#subcategoryList").append($("<option></option>").attr("value",i.componentSubCategory).text(v.componentSubCategory));
				$("#subcategoryList").append($("<option></option>").attr("value",v.componentSubCategory).text(v.componentSubCategory).attr("data-value",v.pksubCategoryId));
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}




function showAddComponentSubCategoryBox() {
	console.log("Its Me");
	  $("#addComponentSubCategoryBox").modal("show");
	}
function getComponentSubcategoryForEdit()
{	
	var input1 = document.getElementById('componentSubcategory'),
	list = document.getElementById('componentSubcategory'),
	i,subCategoryId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			subCategoryId = list.options[i].getAttribute('value');
		}
	}

	var fk_cat_id = fk_cat_id;
	
	$("#updatedSubCategory").empty();
	
	var params= {};

	params["subCategoryId"] = subCategoryId;
	params["methodName"] = "getSubcategoryForedit";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				document.getElementById("updatedSubCategory").value =v.componentSubCategory;
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}