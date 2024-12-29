

// validation for offer letter detailas
function offerLetterDetailsvalidation()
{
	if(document.offerLetterForm.fk_employee_id.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Employee Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert('Please Select Employee Name');
		return false;
	}
	
	if(document.offerLetterForm.description1.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Enter Description For 8.1..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert('Enter Description For 8.1 ');
		return false;
	}
	
	if(document.offerLetterForm.description2.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Enter Description For 8.2..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert('Enter Description For 8.2 ');
		return false;
	}
	offerLetterDetails();
}



//Add Employee Details
function offerLetterDetails(){
		
	document.offerLetterForm.btn.disabled = true;

				var employeeName = $('#fk_employee_id').val();
				var idNumber = $('#idNumber').val();
				var designation = $('#designation').val();
				var salary = $('#salary').val();
				var dateOfJoining = $('#dateOfJoining').val();
				var emailId = $('#emailId').val();
				var place = $('#place').val();
				var description1 = $('#description1').val();
				var description2 = $('#description2').val();
				
				var params = {};
				
				var input1 = document.getElementById('fk_employee_id'),
				list = document.getElementById('employeeNameList'),
				i,fkEmployeeId;

				for (i = 0; i < list.options.length; ++i) {
				if (list.options[i].value === input1.value) {
					fkEmployeeId = list.options[i].getAttribute('data-value');
					}
				}
				
				//params["fk_employee_id"] = fk_employee_id;
				params["employeeName"] =employeeName;
				params["idNumber"] =idNumber;
				params["designation"] =designation;
				params["salary"] =salary;
				params["dateOfJoining"] =dateOfJoining;
				params["emailId"] = emailId;
				params["place"] =place;
				
				params["description1"] =description1;
				params["description2"] =description2;
				
				params["methodName"] = "offerLetterInfo";
			 			$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
					 			{
					 		swal({
							     title: "Success!",
							     text: "Offer Latter Added Successfully !",
							     icon: 'success',
							     timer: 2500,
							     button:false
							 });
							//alert(data);
					 		window.open("OfferLetterPdf.jsp");
					 		location.reload();
			 			}
			 	
			 	    	).error(function(jqXHR, textStatus, errorThrown){
			 	    		if(textStatus==="timeout") {
			 	    			$(loaderObj).hide();
			 	    			$(loaderObj).find('#errorDiv').show();
			 	    		}
			 	    	})
			}
			
function reset()
{
   document.offerLetterForm.reset();	

}


//get Employee Details for offer Letter

function getEmployeeDetailas()
{

	
	var input = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),

	i,fkRootSupId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootSupId = list.options[i].getAttribute('data-value');
		}
	}
	
	var employeeName = $('#fk_employee_id').val();
	
	$("#idNumber").append($("<input/>").attr("value","").text());
	$("#designation").append($("<input/>").attr("value","").text());
	$("#salary").append($("<input/>").attr("value","").text());
	$("#dateOfJoining").append($("<input/>").attr("value","").text());
	$("#place").append($("<input/>").attr("value","").text());
	$("#emailId").append($("<input/>").attr("value","").text());

	
	
	var param ={};
	//param["employeeName"] = employeeName;
	
	param["employeeId"] = fkRootSupId;
	param["methodName"] = "getEmployeeInfo";
	$.post('/embelSoft/jsp/utility/controller.jsp',param,function(data){
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				document.getElementById("idNumber").value = v.idNumber;
				document.getElementById("designation").value = v.designation;
				document.getElementById("salary").value = v.salary;
				document.getElementById("dateOfJoining").value = v.dateOfJoining;
				document.getElementById("place").value = v.placeOfposting;
				document.getElementById("emailId").value = v.email;
			
				});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});

	
	
}




//get Employee Details for Experience Letter

function getEmployeeDetailasforExperience()
{

	
	var input = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),

	i,fkRootSupId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootSupId = list.options[i].getAttribute('data-value');
		}
	}
	
	var employeeName = $('#fk_employee_id').val();
	

	$("#designation").append($("<input/>").attr("value","").text());
	$("#dateOfJoining").append($("<input/>").attr("value","").text());

	
	
	var param ={};
	//param["employeeName"] = employeeName;
	
	param["employeeId"] = fkRootSupId;
	param["methodName"] = "getEmployeeInfo";
	$.post('/embelSoft/jsp/utility/controller.jsp',param,function(data){
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			
				document.getElementById("designation").value = v.designation;
				document.getElementById("dateOfJoining").value = v.dateOfJoining;
			
			
				});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});

	
	
}

function experienceLetterDetailsvalidation()
{
	if(document.experienceLetterForm.fk_employee_id.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Employee Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert('Please select Employee Name');
		return false;
	}
	
	if(document.experienceLetterForm.dateOfLeaving.value=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please select Leaving Date..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert('Please select Leaving Date');
		return false;
	}
	
	offerLetterDetailas();

}


function offerLetterDetailas()
{

	
	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	var employeeName = $('#fk_employee_id').val();
	var designation = $('#designation').val();
	var dateOfJoining = $('#dateOfJoining').val();
	var dateOfLeaving = $('#dateOfLeaving').val();
	
	var params = {};
	
	params["fkEmployeeid"] = fkEmployeeid;
	params["employeeName"] = employeeName;
	params["designation"] = designation;
	params["dateOfJoining"] = dateOfJoining;
	params["dateOfLeaving"] = dateOfLeaving;
	
	
	params["methodName"] = "experienceLetterInfo";
	
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
				swal({
				     title: "Success!",
				     text: "Employee Experience Latter Details Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				 });
		 		//alert(data);
		 		window.open("ExperienceLetterPDF.jsp");
		 		location.reload();
 			}

 	).error(function(jqXHR, textStatus, errorThrown){
 		if(textStatus==="timeout") {
 			$(loaderObj).hide();
 			$(loaderObj).find('#errorDiv').show();
 		}
 	})

	
}
