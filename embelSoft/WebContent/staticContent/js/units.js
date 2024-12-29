function addUnit(){
	
	document.munits.btn.disabled = true;
	
	var unitName = $('#unitName').val();
	
	var params = {};
	
	params["unitName"] = unitName;
	
	params["methodName"] = "measuringUnits";

	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				if(document.munits)
 				{
 					document.munits.reset();
 				}	
 				document.munits.btn.disabled =false;
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});

}


function reset()
{
document.munits.reset();	

}
