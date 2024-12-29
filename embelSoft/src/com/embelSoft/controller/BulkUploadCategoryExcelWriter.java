package com.embelSoft.controller;


import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.usermodel.DataValidationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.embelSoft.dao.ComponentCategoryDetailsDao;

public class BulkUploadCategoryExcelWriter {

	public static void main(HttpServletRequest request, HttpServletResponse response) {
	    // Create a new workbook
	    Workbook workbook = new XSSFWorkbook();

	    // Create a new sheet
	    Sheet sheet = workbook.createSheet("Sheet1");

	    // Create a data array
	    Object[][] data = {
	        {"Sr.No", "ComponentCategory", "Component Name", "Component Value", "Part Name", "Manufacturer Name", "Description Type", "Package", "Tol/Va Rating", "Quantity", "Unit Price", "Custom Duty %", "Unit Price(incl)Custom Duty", "Tax Name", "Tax Percentage", "CGST", "SGST"}
	    };

	    // Write the data to the sheet
	    int rowNum = 0;
	    for (Object[] rowData : data) {
	        Row row = sheet.createRow(rowNum++);
	        int colNum = 0;
	        for (Object cellData : rowData) {
	            Cell cell = row.createCell(colNum++);
	            if (cellData instanceof String) {
	                cell.setCellValue((String) cellData);
	            } else if (cellData instanceof Integer) {
	                cell.setCellValue((Integer) cellData);
	            }
	        }
	    }

	    ComponentCategoryDetailsDao categorydao = new ComponentCategoryDetailsDao();
	    String[] componentCategories = categorydao.CompoentCategoryListBulkUpload();
	    // Create a dropdown list for the "ComponentCategory" column
	    DataValidationHelper validationHelper = sheet.getDataValidationHelper();
	    DataValidationConstraint validationConstraint = validationHelper.createExplicitListConstraint(componentCategories);
	    CellRangeAddressList addressList = new CellRangeAddressList( 2, 30, 2, 30); // Assuming the "ComponentCategory" column starts at index 1
	    DataValidation validation = validationHelper.createValidation(validationConstraint, addressList);
	    sheet.addValidationData(validation);

	    // Save the workbook to a file
	    try (FileOutputStream outputStream = new FileOutputStream("C:/Users/Atharva Solaskar/Desktop/Bulk Upload Template/output.xlsx")) {
	        workbook.write(outputStream);
	        workbook.close();
	        System.out.println("Excel file with dropdowns created successfully.");
	    } catch (IOException e) {
	        e.printStackTrace();


	    }
	}


//	    public static void main(HttpServletRequest request, HttpServletResponse response) {
//	        // Create a new workbook
//	        Workbook workbook = new XSSFWorkbook();
//
//	        // Create a new sheet
//	        Sheet sheet = workbook.createSheet("Sheet1");
//
//	        // Create a data array
//	        Object[][] data = {
//	                {"Sr.No","ComponentCategory","Component Name","Component Value","Part Name","Manufacturer Name","Description Type","Package","Tol/Va Rating","	Quantity","Unit Price","Custom Duty %","Unit Price(incl)Custom Duty","Tax Name","Tax Percentage","CGST","SGST"}
//
//	        };
//
//	        // Write the data to the sheet
//	        int rowNum = 0;
//	        for (Object[] rowData : data) {
//	            Row row = sheet.createRow(rowNum++);
//	            int colNum = 0;
//	            for (Object cellData : rowData) {
//	                Cell cell = row.createCell(colNum++);
//	                if (cellData instanceof String) {
//	                    cell.setCellValue((String) cellData);
//	                } else if (cellData instanceof Integer) {
//	                    cell.setCellValue((Integer) cellData);
//	                }
//	            }
//	        }
//
//	        ComponentCategoryDetailsDao categorydao = new ComponentCategoryDetailsDao();
//	        String[] ComponentCategory = categorydao.CompoentCategoryListBulkUpload();
//	        // Create a dropdown list for the "City" column
//	        String[] cities = {"New York", "London", "Sydney"};
//	        DataValidationHelper validationHelper = sheet.getDataValidationHelper();
//	        DataValidationConstraint validationConstraint = validationHelper.createExplicitListConstraint(ComponentCategory);
//	        CellRangeAddressList addressList = new CellRangeAddressList(2, 2, 2, 2);
//	        DataValidation validation = validationHelper.createValidation(validationConstraint, addressList);
//	        sheet.addValidationData(validation);
//
//	        // Save the workbook to a file
//	        try (FileOutputStream outputStream = new FileOutputStream("C:/Users/Atharva Solaskar/Desktop/Bulk Upload Template/output.xlsx")) {
//	            workbook.write(outputStream);
//	            System.out.println("Excel file with dropdowns created successfully.");
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }
//
//	       // workbook.close();
//	    }




}
