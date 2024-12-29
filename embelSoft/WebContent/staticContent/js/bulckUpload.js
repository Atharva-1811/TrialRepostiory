function convertExcelToJson() {
    var fileInput = document.getElementById('filename1');
    var file = fileInput.files[0];
    var filename = file.name;

    if (!file) {
        swal({
            title: "Failed!",
            text: "Please select a file.",
            icon: 'success',
            timer: 250,
            button: false
        });
        return;
    }

    event.preventDefault();

    var input = document.getElementById('filename1');

    if (!input.files || input.files.length === 0) {
        alert('Please select an Excel file.');
        return;
    }

    var file = input.files[0];

    var reader = new FileReader();

    reader.readAsBinaryString(file);

    reader.onload = function(e) {

        var data = e.target.result;

      
        var workbook = XLSX.read(data, { type: 'binary' });

        
        var sheetName = workbook.SheetNames[0];
        var sheet = workbook.Sheets[sheetName];
        
        var jsonData = XLSX.utils.sheet_to_json(sheet, {
            header: 1,
            raw: false,
            defval: '',
            dateNF: 'YYYY-MM-DD', // Specify the expected date format
            // Add a custom function to handle date cells
            cellDates: true // This option tells the XLSX library to automatically convert Excel dates to JavaScript dates
        });
        
        
        var count = Object.keys(jsonData).length;
        
        
        console.log(jsonData);
        alert('Check the console for the JSON data.');

        var params = {};
        
        for (var i = 1; i < count; i++) {
        	var vendorName = jsonData[i][1];
    		params["vendorName" + i] = vendorName;
    		
    		var vendorId = jsonData[i][2];
    		params["vendorId" + i] = vendorId;
    		
    		var billChallanNo = jsonData[i][3];
    		params["billChalanNo" + i] = billChallanNo;
    		
    		var purchaseOrderDate = jsonData[i][4];
    		params["purchaseOrderDate" + i] = purchaseOrderDate;
    		
    		var expectedPaymentDate = jsonData[i][5];
    		params["expectPaymentDate" + i] = expectedPaymentDate;
    		
    		var componentType = jsonData[i][6];
    		params["componentCategory" + i] = componentType;
    		
    		var componentTypeId = jsonData[i][7];
    		params["fkCompTypeId" + i] = componentTypeId;
    		
    		var componentName = jsonData[i][8];
    		params["componentName" + i] = componentName;
    		
    		var componentNameId = jsonData[i][9];
    		params["pkComponentCategoryDetailsId" + i] = componentNameId;
    		
    		var componentValue = jsonData[i][10];
    		params["componentValue" + i] = componentValue;
    		
    		var partNumber = jsonData[i][11];
    		params["partNumber" + i] = partNumber;
    		
    		var manufacturerName = jsonData[i][12];
    		params["manufractureName" + i] = manufacturerName;
    		
    		var description = jsonData[i][13];
    		params["description" + i] = description;
    		
    		var type = jsonData[i][14];
    		params["componentType" + i] = type;
    		
    		var componentPackage = jsonData[i][15];
    		params["packages" + i] = componentPackage;
    		
    		var tolerance = jsonData[i][16];
    		params["tolerance" + i] = tolerance;
    		
    		var unit = jsonData[i][17];
    		params["unit" + i] = unit;
    		
    		var unitPrice = jsonData[i][18];
    		params["unitPriceWithCustomduty" + i] = unitPrice;
    		
    		var quantity = jsonData[i][19];
    		params["quantity" + i] = quantity;
    		
    		var subTotal = jsonData[i][20];
    		params["subTotal" + i] = subTotal;
    		
    		var gst = jsonData[i][21];
    		params["gst" + i] = gst;
    		
    		var igst = jsonData[i][22];
    		params["igst" + i] = igst;
    		
    		var taxAmount = jsonData[i][23];
    		params["taxAmount" + i] = taxAmount;
    		
    		var total = jsonData[i][24];
    		params["total" + i] = total;
    		
    		var totalSubTotal = jsonData[i][23];
    		params["totalSubTotal" + i] = totalSubTotal;
    		
    		var totalTaxAmount = jsonData[i][26];
    		params["totalTaxAmount" + i] = totalTaxAmount;
    		
    		var grossTotal = jsonData[i][27];
    		params["grossTotal" + i] = grossTotal;
        }
        
        params["count"] = count;
        params["methodName"] = "bulkUploadComponentReceived";
      
        $.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) {
            var jsonData = JSON.parse(data);
            var myJSON = JSON.stringify(jsonData);
            swal({
                title: "Success!",
                text: "Component Category Details Uploaded Successfully",
                icon: 'success',
                timer: 2500,
                button: false
            });
            location.reload();
        }).error(function(jqXHR, textStatus, errorThrown) {
            if (textStatus === "timeout") {
                $(loaderObj).hide();
                $(loaderObj).find('#errorDiv').show();
            }
        });
    };
}


