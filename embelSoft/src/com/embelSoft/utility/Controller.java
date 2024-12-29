package com.embelSoft.utility;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;

import com.embelSoft.bean.CompoenentBillingBean;
import com.embelSoft.bean.CompoentCategoryDetailBean;
import com.embelSoft.bean.HrBillingBean;
import com.embelSoft.bean.ProductBillingBean;
import com.embelSoft.bean.PurchaseOrderBean;
import com.embelSoft.bean.PurchaseOrderCreateBean;
import com.embelSoft.bean.PurchaseOrderCreateBeanNew;
import com.embelSoft.bean.QuotationBean;
import com.embelSoft.bean.ResourceBillingBean;
import com.embelSoft.helper.AccessControlHelper;
import com.embelSoft.helper.BillOfMaterialHelper;
import com.embelSoft.helper.CashbookHelper;
import com.embelSoft.helper.ClientEnquiryHelper;
import com.embelSoft.helper.ClientPaymentHelper;
import com.embelSoft.helper.ClientResponseHelper;
import com.embelSoft.helper.CompoenentBillingHelper;
import com.embelSoft.helper.ComponentCategoryDetailsHelper;
import com.embelSoft.helper.ComponentDetailsHelper;
import com.embelSoft.helper.ComponentReceivedPOHelper;
import com.embelSoft.helper.ComponentStockHelper;
import com.embelSoft.helper.ComponentSubcategoryHelper;
import com.embelSoft.helper.ComponentTypeHelper;
import com.embelSoft.helper.EmployeeDetailsHelper;
import com.embelSoft.helper.EmployeePaymentHelper;
import com.embelSoft.helper.ExpenditureDetailsHelper;
import com.embelSoft.helper.ExpenditurePaymentHelper;
import com.embelSoft.helper.ExperienceLetterHelper;
import com.embelSoft.helper.HRBillingHelper;
import com.embelSoft.helper.LoginController;
import com.embelSoft.helper.LogoutController;
import com.embelSoft.helper.OfferLetterHelper;
import com.embelSoft.helper.ProductBillingHelper;
import com.embelSoft.helper.ProductDetailsHelper;
import com.embelSoft.helper.PurchaseOrderHelper;
import com.embelSoft.helper.PurchaseOrderReceivedHelper;
import com.embelSoft.helper.QuotationHelper;
import com.embelSoft.helper.ResourceBillingHelper;
import com.embelSoft.helper.TaxDetailsHelper;
import com.embelSoft.helper.UserDetailasHelper;
import com.embelSoft.helper.VendorDetailsHelper;
import com.embelSoft.helper.VendorPaymentHelper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
//import com.oreilly.servlet.MultipartRequest;

public class Controller {

	private String toJson(Object data) {
		Gson gson = new GsonBuilder().setPrettyPrinting().disableHtmlEscaping().create();
		return gson.toJson(data);
	}

	// User Details
	public String saveUserDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		UserDetailasHelper udh = new UserDetailasHelper();

		udh.saveUserDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// getAllUserDetailsList
	public String getAllUserDetailsList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		UserDetailasHelper helper = new UserDetailasHelper();
		List categories = helper.getAllUserDetailsList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// getUserDetailForEdit
	public String getUserDetailForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String pkUserId1 = request.getParameter("pkUserId");
		Long pkUserId = Long.parseLong(pkUserId1);
		UserDetailasHelper helper = new UserDetailasHelper();
		List map = helper.getUserDetailForEdit(pkUserId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// updateUserDetails
	public String updateUserDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		UserDetailasHelper helper = new UserDetailasHelper();
		helper.updateUserDetails(request, response);
		return toJson("Data Update Successfully");
	}

	// get User Dtl For Access Control
	public String getUserDtlForAccessControl(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fkEmployeeid2 = request.getParameter("fkEmployeeid");
		Long fkEmployeeid = Long.parseLong(fkEmployeeid2);
		AccessControlHelper helper = new AccessControlHelper();
		List map = helper.getUserDtlForAccessControl(fkEmployeeid);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// AccessControlDetails
	public String accessControlDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		AccessControlHelper ach = new AccessControlHelper();
		ach.doAccessControlDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// accessControlList
	public String accessControlList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		AccessControlHelper helper = new AccessControlHelper();
		List categories = helper.getAccessControlList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// getAccessControlDtlForEdit
	public String getAccessControlDtlForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String pkACUserId1 = request.getParameter("pkACUserId");
		Long pkACUserId = Long.parseLong(pkACUserId1);
		AccessControlHelper helper = new AccessControlHelper();
		List map = helper.getAccessControlDtlForEdit(pkACUserId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// updateAccessControlDetails
	public String updateAccessControlDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		AccessControlHelper helper = new AccessControlHelper();
		helper.updateAccessControlDetails(request, response);
		return toJson("Data Update Successfully");
	}

	public String userRegister(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		UserDetailasHelper udh = new UserDetailasHelper();
		udh.doUserDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// login
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("IN CONTROLLER");
		LoginController helper = new LoginController();
		helper.loginUser(request, response);
		return toJson("Data Added Successfully");
	}

	// loginNew
	public String loginNew(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("IN CONTROLLER NEW LOGIN");
		LoginController helper = new LoginController();
		helper.loginUserNew(request, response);
		return toJson("Data Added Successfully");
	}

	// loginNew
		public String restartConnection(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
			System.out.println("IN CONTROLLER Restart Login");
			LoginController helper = new LoginController();
			helper.restartConnnection(request, response);
			return toJson("Data Added Successfully");
		}

	// logout
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("IN CONTROLLER LOGOUT");
		LogoutController helper = new LogoutController();
		helper.logoutUser(request, response);
		return toJson("Data Added Successsfully");
	}

	// Employee Details
	public String empDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("IN CONTROLLER");
		EmployeeDetailsHelper edh = new EmployeeDetailsHelper();
		edh.doEmpDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// Client Enquiry Details
	public String clientEnquiryDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientEnquiryHelper edh = new ClientEnquiryHelper();
		edh.doClientDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// Client Response Details
	public String ClientResponseInfo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientResponseHelper crh = new ClientResponseHelper();
		crh.doClientResponseDetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String vendorDetailsM(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		VendorDetailsHelper edh = new VendorDetailsHelper();
		edh.doVendorDetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String getTaxDetailsForProductDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fkEmployeeid2 = request.getParameter("fkEmployeeid");
		Long fkEmployeeid = Long.parseLong(fkEmployeeid2);
		ProductDetailsHelper helper = new ProductDetailsHelper();
		List map = helper.getTaxDetailsForProductDetails(fkEmployeeid);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	public String saveProductDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLER");
		ProductDetailsHelper xdh = new ProductDetailsHelper();
		xdh.saveProductDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// gridForPurchase
	public String receivePOGrid(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLER");
		PurchaseOrderReceivedHelper poh = new PurchaseOrderReceivedHelper();
		List<PurchaseOrderBean> d = poh.receivePOGrid(request, response);
		Map<String, List<PurchaseOrderBean>> items = new HashMap<String, List<PurchaseOrderBean>>();
		items.put("offer", d);
		String xyz = toJson(items);
		System.out.println("items-------------" + xyz);
		return xyz;
	}

	public String getPurchaseGrid(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		String produtId = request.getParameter("produtId");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		PurchaseOrderCreateBeanNew timeTable = helper.getPurchaseGrid(produtId);
		Map<String, PurchaseOrderCreateBeanNew> items = new HashMap<String, PurchaseOrderCreateBeanNew>();
		items.put("offer", timeTable);
		System.err.println(items);
		return toJson(items);
	}

	// purchase order Details
	public String PurchaseOrderInfo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		PurchaseOrderHelper poh = new PurchaseOrderHelper();
		poh.doPurchaseOrderDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// componentDetails
	public String saveCompTypesDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentTypeHelper cdh = new ComponentTypeHelper();
		cdh.saveCompTypesDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// To add Component SubCategory
	public String saveCompSubcategoryDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentSubcategoryHelper cdh = new ComponentSubcategoryHelper();
		cdh.saveCompTypesDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// getCompTypeList
	public String getCompTypeList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentTypeHelper helper = new ComponentTypeHelper();
		List categories = helper.getCompTypeList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}


	// getCompTypeList
		public String getSubcategoryList(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ComponentSubcategoryHelper helper = new ComponentSubcategoryHelper();
			List categories = helper.getCompTypeList(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("CONTROLLER :- " + returnMap);
			return toJson(returnMap);
		}

	// componentDetails
	public String componentDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentDetailsHelper cdh = new ComponentDetailsHelper();
		cdh.doComponentDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// Get List Of Product
	public String getAllComponentDtlList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentDetailsHelper helper = new ComponentDetailsHelper();
		List categories = helper.doAllComponentDtlList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// Save Quotation Details old
	public String QuotationInfo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		QuotationHelper qh = new QuotationHelper();
		qh.doQuotationDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// new
	public String QuotationDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		QuotationHelper qh = new QuotationHelper();
		qh.saveQuotationDetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String clientQuotationDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		QuotationHelper qh = new QuotationHelper();
		qh.saveClientQuotationDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// Billing
	// HR Billing Details
	public String HRBillingInfo(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		HRBillingHelper hbh = new HRBillingHelper();
		hbh.doHRBilligDetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String getVendorName(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		VendorDetailsHelper vdh = new VendorDetailsHelper();
		List v = vdh.getVendor(request, response);
		System.out.println("CONTROLLER :- " + v.size());
		Map<String, List> items = new HashMap<String, List>();
		items.put("offer", v);
		return toJson(items);
	}

	public String getClientName(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		ClientEnquiryHelper cev = new ClientEnquiryHelper();
		List v = cev.getClient(request, response);
		System.out.println("CONTROLLER :- " + v.size());
		Map<String, List> items = new HashMap<String, List>();
		items.put("offer", v);
		return toJson(items);
	}

	// OLD FOR DELETE
	public String gridForHrBill(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		String description = request.getParameter("description");
		HRBillingHelper hbh = new HRBillingHelper();
		HrBillingBean timeTable = hbh.getGridForHrBill(description);
		Map<String, HrBillingBean> items = new HashMap<String, HrBillingBean>();
		items.put("offer", timeTable);
		return toJson(items);
	}

	// getResourceBillingGrid NEW Delete above method
	public String getGridForResourceBilling(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		String productName = request.getParameter("productResourceName");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		ResourceBillingBean timeTable = helper.getGridForResourceBilling(productName);
		Map<String, ResourceBillingBean> items = new HashMap<String, ResourceBillingBean>();
		items.put("offer", timeTable);
		return toJson(items);
	}

	public String getGridForResourceBillingforperfroma(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		String productName = request.getParameter("productResourceName");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		ResourceBillingBean timeTable = helper.getGridForResourceBilling(productName);
		Map<String, ResourceBillingBean> items = new HashMap<String, ResourceBillingBean>();
		items.put("offer", timeTable);
		return toJson(items);
	}

	// save Resource Bill Details
	public String saveResourceBillDetails(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		helper.saveResourceBillDetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String saveperfromaResourceBillDetails(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		helper.saveperfromaResourceBillDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// getResourceBillingList
	public String getResourceBillingList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		List categories = helper.getResourceBillingList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getResourceBillingReportByBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		List categories = helper.getResourceBillingReportByNameAndBetweenTwoDates1(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getCommonBillingReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		List categories = helper.getCommonBillingReportByNameAndBetweenTwoDates1(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getResourceBillingReportByNameAndBetweenTwoDates(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		List categories = helper.getResourceBillingReportByNameAndBetweenTwoDates(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// get Grid For ProductBilling new
	public String getGridForProductBilling(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		String billno = request.getParameter("billno");
		String fkProductId = request.getParameter("fkProductId");
		ProductBillingHelper helper = new ProductBillingHelper();

		List map =  helper.getGridForProductBilling(fkProductId,billno);
		Map<String,List> returnMap = new HashMap<String, List>();
		returnMap.put("offer", map);
		return toJson(returnMap);

	}

	// New save Product Billing Details
	public String saveProductBillingDetails(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper helper = new ProductBillingHelper();
		helper.saveProductBillingDetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String saveProductBillingDetails1(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper helper = new ProductBillingHelper();
		helper.saveProductBillingDetails1(request, response);
		return toJson("Data Added Successfully");
	}

	// getProductBillingListNew
	public String getProductBillingListNew(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper helper = new ProductBillingHelper();
		List categories = helper.getProductBillingListNew(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// getProductBillingReportByNameAndDates new
	public String getProductBillingReportByNameAndDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper helper = new ProductBillingHelper();
		List categories = helper.getProductBillingReportByNameAndDates(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getProductBillingReportByNameAndDates1(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper helper = new ProductBillingHelper();
		List categories = helper.getProductBillingReportByNameAndDates11(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// getProductBillingReportByDates new
	public String getProductBillingReportByDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper helper = new ProductBillingHelper();
		List categories = helper.getProductBillingReportByNameAndDates1(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getProductBillingReportByDates111(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper helper = new ProductBillingHelper();
		List categories = helper.getProductBillingReportByNameAndDates111(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String receivedPODetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		PurchaseOrderReceivedHelper poh = new PurchaseOrderReceivedHelper();
		poh.saveReceivedPODetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String getReceivedPOList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		PurchaseOrderReceivedHelper helper = new PurchaseOrderReceivedHelper();
		List categories = helper.getReceivedPOList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Offer Letter Details
	public String offerLetterInfo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		OfferLetterHelper olh = new OfferLetterHelper();
		olh.doOfferLetterDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// Employee Details report between
	public String getEmployeeReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		EmployeeDetailsHelper helper = new EmployeeDetailsHelper();
		List categories = helper.getEmpDetail(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Client Enquiry report between two days
	public String getClientReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientEnquiryHelper helper = new ClientEnquiryHelper();
		List categories = helper.getClientDetail(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// Cashbook
	// Registering Employee Payment
	public String regEmpCashBook(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		EmployeePaymentHelper helper = new EmployeePaymentHelper();
		helper.regEmployeePayment(request, response);
		return toJson("Data Added Successfully");
	}

	// Registering Expenditure Payment
	public String regExpenseCashBook(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditurePaymentHelper helper = new ExpenditurePaymentHelper();
		helper.regExpensePayment(request, response);
		return toJson("Data Added Successfully");
	}

	// saveExpenseDetails
	public String saveExpenseDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditureDetailsHelper helper = new ExpenditureDetailsHelper();
		helper.saveExpenseDetails(request, response);
		return toJson("Expenditure Added Successfully");
	}

	public String expenseList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditureDetailsHelper helper = new ExpenditureDetailsHelper();
		List categories = helper.expenseList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getExpenditureForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String pkExpenseId1 = request.getParameter("pkExpenseId");
		Long pkExpenseId = Long.parseLong(pkExpenseId1);
		ExpenditureDetailsHelper helper = new ExpenditureDetailsHelper();
		List map = helper.getExpenditureForEdit(pkExpenseId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	public String updateExpenditure(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditureDetailsHelper helper = new ExpenditureDetailsHelper();
		helper.updateExpenditure(request, response);
		return toJson("Data Update Successfully");
	}

	// Employee payment report between two days with Name
	public String getTeacherPaymentReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		EmployeePaymentHelper helper = new EmployeePaymentHelper();
		List categories = helper.getTeacherPaymentByTwoDateWithName(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// Employee payment report between days Only
	public String getPaymentReportBetweenDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		EmployeePaymentHelper helper = new EmployeePaymentHelper();
		List categories = helper.getPaymentByDates(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Expenditure payment report between two days
	public String getExpenditurePaymentReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditurePaymentHelper helper = new ExpenditurePaymentHelper();
		List categories = helper.getExpensePaymentDetailByTwoDate(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Expenditure payment report between days
	public String getExpenditurePaymentReportBetweenDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditurePaymentHelper helper = new ExpenditurePaymentHelper();
		List categories = helper.getExpensePaymentDetailByDate(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// get All Vendor Name
	public String getAllVendorName(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		VendorDetailsHelper helper = new VendorDetailsHelper();
		Map vendorName = helper.getVendorName();
		String xyz = toJson(vendorName);
		System.out.println("CONTROLLER :-" + xyz);
		return xyz;
	}

	// get All Client Name
	public String getAllClientName(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientEnquiryHelper helper = new ClientEnquiryHelper();
		Map vendorName = helper.getClientName();
		String xyz = toJson(vendorName);
		System.out.println("CONTROLLER :-" + xyz);
		return xyz;
	}

	// get grid for Product Description in order create
	public String gridForProductDescription(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String productDescription = request.getParameter("productDescription");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		PurchaseOrderCreateBean bean = helper.getGridForProductDescription(productDescription);
		Map<String, PurchaseOrderCreateBean> items = new HashMap<String, PurchaseOrderCreateBean>();
		items.put("offer", bean);
		return toJson(items);
	}

	// add Purchase Order Create Info
	public String purchaseOrderReciveInfo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		helper.addPurchaseOrderCreateInfo(request, response);
		return ("Data Added successfully");
	}

	// add HR Billing Detailas Old
	public String HRBillingDetailas(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		HRBillingHelper hbh = new HRBillingHelper();
		hbh.addHRBilligDetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String gridForProductBill(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		String description = request.getParameter("description");
		ProductBillingHelper helper = new ProductBillingHelper();
		ProductBillingBean bean = helper.getGridForProduct(description);
		Map<String, ProductBillingBean> items = new HashMap<String, ProductBillingBean>();
		items.put("offer", bean);
		return toJson(items);
	}

	// Add Product Billing Details
	public String ProductBillingInfo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper pbh = new ProductBillingHelper();
		pbh.doAddProductBilligDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// get Employee details for offer letter PDF
	public String getEmployeeInfo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String employeeId1 = request.getParameter("employeeId");
		Long employeeId = Long.parseLong(employeeId1);
		OfferLetterHelper helper = new OfferLetterHelper();
		Map map = helper.getEmployeeDetailas(employeeId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// get Grid For Quotation
	public String gridForQuotation(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String description = request.getParameter("description");
		QuotationHelper poh = new QuotationHelper();
		QuotationBean d = poh.getGridForQuotation(description);
		Map<String, QuotationBean> items = new HashMap<String, QuotationBean>();
		items.put("offer", d);
		return toJson(items);
	}

	public String gridForVenderQuotation(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String productName = request.getParameter("productName");
		System.out.println(" IN CONTROLLER PProductName : " + productName);
		QuotationHelper helper = new QuotationHelper();
		QuotationBean bean = helper.gridForVenderQuotation(productName);
		
		Map<String, QuotationBean> items = new HashMap<String, QuotationBean>();
		items.put("offer", bean);
		return toJson(items);
	}

	public String gridForClientQuotation(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		String fkProductId = request.getParameter("fkProductId");
		String productName = request.getParameter("productName");
		QuotationHelper helper = new QuotationHelper();
		QuotationBean bean = helper.gridForClientQuotation(fkProductId, productName);
		Map<String, QuotationBean> items = new HashMap<String, QuotationBean>();
		items.put("offer", bean);
		return toJson(items);
	}

	// get Total And Balance Amount By VendorName
	public String getTotalAndBalanceAmountByVendorName(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fkVendorId = request.getParameter("fkVendorId");
		String vendorName = request.getParameter("vendorName");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		Map billNo = helper.getTotalAndBalanceAmountByVendorName(fkVendorId, vendorName);
		String xyz = toJson(billNo);
		System.out.println("IN CONTROLLER :- " + xyz);
		return xyz;
	}

	// get Bill Amount And Balance Amount By Bill No
	public String getTotalAmountByBillNo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String billNo = request.getParameter("billNo");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		Map total = helper.getTotalByBillNo(billNo);
		String xyz = toJson(total);
		System.out.println("IN CONTROLLER :- " + xyz);
		return xyz;
	}

	// Registering Vendor Payment
	public String vendorPaymentDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		VendorPaymentHelper helper = new VendorPaymentHelper();
		helper.addVendorPaymentDetailas(request, response);
		return toJson("Data Added Successfully");
	}

	// get All Bill No And Total Amount By ClientId
	public String getTotalAmountAndBalanceAmountByClientName(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fkClientId2 = request.getParameter("fkClientId2");
		String clientName = request.getParameter("clientName");
		CashbookHelper helper = new CashbookHelper();
		Map billNo = helper.getTotalAmountAndBalanceAmountByClientName(fkClientId2, clientName);
		String xyz = toJson(billNo);
		System.out.println("IN CONTROLLER :- " + xyz);
		return xyz;
	}

	// get Bill Amount And Balance Amount By Bill No
	public String getTotalAmountByBillNoForClient(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String billNo2 = request.getParameter("billNo2");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		Map total = helper.getTotalByBillNoForClient(billNo2);
		String xyz = toJson(total);
		System.out.println("IN CONTROLLER :- " + xyz);
		return xyz;
	}

	public String clientPaymentDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientPaymentHelper helper = new ClientPaymentHelper();
		// helper.addClientPaymentDetails(request, response);
		helper.addClientPaymentDetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String experienceLetterInfo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExperienceLetterHelper helper = new ExperienceLetterHelper();
		helper.experienceLetterInfo(request, response);
		return toJson("Data Added Successfully");
	}

	// get Vendor detailas for Purchase Order Create
	public String getVendorInfo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String vendorId2 = request.getParameter("vendorId");
		Long vendorId = Long.parseLong(vendorId2);
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		Map map = helper.getVendorDetailas(vendorId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// Get List Of Employee
	public String getAllEmployeeList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditureDetailsHelper helper = new ExpenditureDetailsHelper();
		List categories = helper.getAllEmployee(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// get Employee Payment by all Employee
	public String getTotalAmtByBillNoEmployee(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		// String billNo = request.getParameter("billNo");
		String fk_teacher_id = request.getParameter("fk_teacher_id");
		EmployeePaymentHelper helper = new EmployeePaymentHelper();
		Map map = helper.getTotalAmtByBillNoEmployee(fk_teacher_id);
		String xyz = toJson(map);
		System.out.println("IN CONTROLLER :- " + xyz);
		return xyz;
	}

	// get Employee Remaining balance
	public String getRemainingAllBillsforemployee(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		// String billNo = request.getParameter("billNo");
		String supplierId = request.getParameter("fk_teacher_id");
		EmployeePaymentHelper helper = new EmployeePaymentHelper();
		Map map = helper.getRemainingAllBillsforemployee(supplierId);
		String xyz = toJson(map);
		System.out.println("IN CONTROLLER :- " + xyz);
		return xyz;
	}

	// Get List Of Vendor
	public String getAllVendorList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		VendorDetailsHelper helper = new VendorDetailsHelper();
		List categories = helper.getAllVendor(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// Get List Of Product
	public String getAllProductList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductDetailsHelper helper = new ProductDetailsHelper();
		List categories = helper.getAllProduct(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// Get List Of Client Enquiry
	public String getAllClientList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientEnquiryHelper helper = new ClientEnquiryHelper();
		List categories = helper.getAllClient(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// Get List Of Client Response
	public String getAllClientResponseList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientResponseHelper helper = new ClientResponseHelper();
		List categories = helper.getAllClientResponse(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// Get Employee Details for edit
	public String getEmployeeDetailsForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fkEmployeeid2 = request.getParameter("fkEmployeeid");
		Long fkEmployeeid = Long.parseLong(fkEmployeeid2);
		EmployeeDetailsHelper helper = new EmployeeDetailsHelper();
		List map = helper.getEmployeeDetails(fkEmployeeid);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	public String updateEmployeeDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		EmployeeDetailsHelper helper = new EmployeeDetailsHelper();
		helper.updateEmployeeDetails(request, response);
		return toJson("Data Update Successfully");
	}

	// Get Vendor Details for edit
	public String getVendorDetailsForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fk_vendor_id2 = request.getParameter("fk_vendor_id");
		Long fk_vendor_id = Long.parseLong(fk_vendor_id2);
		VendorDetailsHelper helper = new VendorDetailsHelper();
		List map = helper.getVendorDetails(fk_vendor_id);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// update Product Details
	public String updateProductDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductDetailsHelper helper = new ProductDetailsHelper();
		helper.updateProductDetails(request, response);
		return toJson("Data Update Successfully");
	}

	// Get Product Details for edit
	public String getProductDetailsForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fk_product_id2 = request.getParameter("fk_product_id");
		Long fk_product_id = Long.parseLong(fk_product_id2);
		ProductDetailsHelper helper = new ProductDetailsHelper();
		List map = helper.getProductDetails(fk_product_id);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// Get Product Details for quotation
	public String getProductListForQuotation(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fk_product_id3 = request.getParameter("fk_product_id");
		Long fk_product_id = Long.parseLong(fk_product_id3);
		ProductDetailsHelper helper = new ProductDetailsHelper();
		List map = helper.getProductDetailsForQuotation(fk_product_id);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// update Vendor Details
	public String updateVendorDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		VendorDetailsHelper helper = new VendorDetailsHelper();
		helper.updateVendorDetails(request, response);
		return toJson("Data Update Successfully");
	}

	// get Vendor Details For Edit
	public String getClientDetailsForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fkClientid2 = request.getParameter("fkClientid");
		Long fkClientid = Long.parseLong(fkClientid2);
		ClientEnquiryHelper helper = new ClientEnquiryHelper();
		List map = helper.getClientDetails(fkClientid);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// update Client Details
	public String updateClientEnquiryDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientEnquiryHelper helper = new ClientEnquiryHelper();
		helper.updateClientDetails(request, response);
		return toJson("Data Update Successfully");
	}

	// Get List Of Purchase Order Create
	public String getAllPurchaseOrderCreateList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		List categories = helper.getPurchaseOrderCreateList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// get purchase Order Create Report
	public String getpurchaseOrderCreateReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		List categories = helper.getpurchaseOrderCreateReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Get List Of Quotation
	public String getQuotationList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		QuotationHelper helper = new QuotationHelper();
		List categories = helper.getQuotationList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get List Of Purchase Order Receive
	public String getPurchaseOrderReceiveList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		List categories = helper.getpurchaseOrderReceiveList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Get List Of Employee Payment List
	public String getEmployeePaymentList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		EmployeePaymentHelper helper = new EmployeePaymentHelper();
		List categories = helper.getEmployeePaymentList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Get List Of Vendor Payment List
	public String getVendorPaymentList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		VendorPaymentHelper helper = new VendorPaymentHelper();
		List categories = helper.getVendorPaymentList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Get List Of Client Payment List
	public String getClientPaymentList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientPaymentHelper helper = new ClientPaymentHelper();
		List categories = helper.getClientPaymentList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get List Of Ependiture Payment List
	public String getExpenditurePaymentList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditurePaymentHelper helper = new ExpenditurePaymentHelper();
		List categories = helper.getExpenditurePaymentList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Get List Of Hr Billing List
	public String getHrBillingList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		HRBillingHelper helper = new HRBillingHelper();
		List categories = helper.getHrBillingList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Get Vendor Records
	public String getReceivedPOReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		PurchaseOrderReceivedHelper helper = new PurchaseOrderReceivedHelper();
		List categories = helper.getReceivedPOReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		System.out.println("IN CONTROLLER :- " + returnMap.size());
		return toJson(returnMap);
	}

	// Get Client Records
	public String getClientRecords(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		List categories = helper.getClientRecords(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Get Vendor Records For Quotation
	public String getVendorRecordsOfQuotation(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		QuotationHelper helper = new QuotationHelper();
		List categories = helper.getVendorRecords(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get Vender Quotation Report
	public String getVenderQuotationReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		QuotationHelper helper = new QuotationHelper();
		List categories = helper.getVenderQuotationReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get client Quotation Report
	public String getClientQuotationReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		QuotationHelper helper = new QuotationHelper();
		List categories = helper.getClientQuotationReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get Vendor Payment Records Of Date With Name Wise For Product Billing old
	public String getClientHrBillingReportBetweenTwoDatesAndName(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper helper = new ProductBillingHelper();
		List categories = helper.getClientHrBillingReportByDateAndName(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get Vendor Payment Records Of Date With Name Wise For HrBilling Old
	public String getVendorHrBillingReportBetweenTwoDatesAndName(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		HRBillingHelper helper = new HRBillingHelper();
		List categories = helper.getVendorHrBillingReportByDateAndName(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get Vendor Payment Records Of Date With Name Wise
	public String getVendorPaymentReportBetweenTwoDatesAndName(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		VendorPaymentHelper helper = new VendorPaymentHelper();
		List categories = helper.getVendorReportByDateAndName(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get Vendor Payment Records Of Date Wise
	public String getVendorPaymentReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		VendorPaymentHelper helper = new VendorPaymentHelper();
		List categories = helper.getVendorReportByDate(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get Vendor Payment Records Of Date With Name Wise
	public String getClientPaymentReportBetweenTwoDatesAndName(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientPaymentHelper helper = new ClientPaymentHelper();
		List categories = helper.getClientReportByDateAndName(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Get Vendor Payment Records Date Wise
	public String getClientPaymentReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientPaymentHelper helper = new ClientPaymentHelper();
		List categories = helper.getClientReportByDates(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	// Previous Employee Details report between
	public String getExEmployeeReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		EmployeeDetailsHelper helper = new EmployeeDetailsHelper();
		List categories = helper.getExEmpDetail(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Client Follow Up Report By Date
	public String getClientResponseFollowUpReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientResponseHelper helper = new ClientResponseHelper();
		List categories = helper.getClientResponseFollowUpReportByDate(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Employee Leave Details
	public String employeeLeaveDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		EmployeeDetailsHelper edh = new EmployeeDetailsHelper();
		edh.doEmpDetailLeaveDetails(request, response);
		return toJson("Data Added Successfully");
	}

	// Get List Of Employee Leave
	public String getAllEmployeeLeaveList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditureDetailsHelper helper = new ExpenditureDetailsHelper();
		List categories = helper.getAllLeaveEmployee(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Get Report Of Employee Leave
	public String getAllEmployeeLeaveReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ExpenditureDetailsHelper helper = new ExpenditureDetailsHelper();
		List categories = helper.getAllLeaveEmployeeByName(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// Get List Of Client Response for today
	public String getAllClientResponseListForToday(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ClientResponseHelper helper = new ClientResponseHelper();
		List categories = helper.getAllClientResponseListForToday(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// getGridAsForCompTypeForCompReceivedPO
	public String getGridAsForCompTypeForCompReceivedPO(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fkCompoentid = request.getParameter("fkCompoentid");
		String componentName = request.getParameter("componentName");

		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		CompoentCategoryDetailBean bean = helper.getGridAsForCompTypeForCompReceivedPO(fkCompoentid, componentName);
		Map<String, CompoentCategoryDetailBean> items = new HashMap<String, CompoentCategoryDetailBean>();
		items.put("offer", bean);
		return toJson(items);
	}

	// saveComponentReceivedPODetails
	public String saveComponentReceivedPODetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		helper.saveComponentReceivedPODetails(request, response);
		return toJson("Data Added Successfully");
	}

	// getAllComponentStock
	public String getComponentStock(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentStockHelper helper = new ComponentStockHelper();
		List categories = helper.getComponentStock(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	public String getAllComponentStockReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentStockHelper helper = new ComponentStockHelper();
		List categories = helper.getComponentStockReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	public String componentReceivedPOList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List categories = helper.componentReceivedPOList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	public String componentReceivedPOReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List categories = helper.componentReceivedPOReport(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	public String getAllCompTypeForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String pkCompTypeId1 = request.getParameter("pkCompTypeId");
		Long pkCompTypeId = Long.parseLong(pkCompTypeId1);
		ComponentTypeHelper helper = new ComponentTypeHelper();
		List map = helper.getCompTypeForEdit(pkCompTypeId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}
	
	public String getSubcategoyForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String pkCompTypeId1 = request.getParameter("pkCompTypeId");
		Long pkCompTypeId = Long.parseLong(pkCompTypeId1);
		ComponentTypeHelper helper = new ComponentTypeHelper();
		List map = helper.getSubcategoyForEdit(pkCompTypeId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	public String updateCompType(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentTypeHelper helper = new ComponentTypeHelper();
		helper.updateCompTypeDetails(request, response);
		return toJson("Data Update Successfully");
	}
	
	public String updateComponentSubCategory(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentTypeHelper helper = new ComponentTypeHelper();
		helper.updateSubCategory(request, response);
		return toJson("Data Update Successfully");
	}

	// getGridAsForBill of material
	public String getGridBillOfMaterial(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String componentType = request.getParameter("componentType");
		String pkCompTypeId = request.getParameter("pkCompTypeId");
		String ComponentName = request.getParameter("ComponentName");
		BillOfMaterialHelper helper = new BillOfMaterialHelper();
		List list = helper.getGridForBillOfMaterial(componentType, pkCompTypeId,ComponentName);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("offer", list );
		return toJson(returnMap);
//		String xyz = toJson(map);
//		return xyz;
	}


	public String getGridBillOfMaterialforedit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String projectname = request.getParameter("projectname");

		BillOfMaterialHelper helper = new BillOfMaterialHelper();

		Map purchaseReturn = helper.getGridForBillOfMaterial1(projectname);
		String xyz = toJson(purchaseReturn);
		return xyz;
	}

	public String saveTaxDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		TaxDetailsHelper helper = new TaxDetailsHelper();
		helper.saveTaxDetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String getTaxDetailsList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		TaxDetailsHelper helper = new TaxDetailsHelper();
		List categories = helper.getAllTaxDetailsList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// getTaxDetailsForEdit
	public String getTaxDetailsForEdit(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String pkTaxDetailsId1 = request.getParameter("pkTaxDetailsId");
		Long pkTaxDetailsId = Long.parseLong(pkTaxDetailsId1);
		TaxDetailsHelper helper = new TaxDetailsHelper();
		List map = helper.getTaxDetailsForEdit(pkTaxDetailsId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	public String updateTaxDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		TaxDetailsHelper helper = new TaxDetailsHelper();
		helper.updateTaxDetails(request, response);
		return toJson("Data Update Successfully");
	}

	// saveBill of material
	public String saveBillOfMaterial(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		BillOfMaterialHelper helper = new BillOfMaterialHelper();
		helper.saveBillOfMaterial(request, response);
		return toJson("Data Added Successfully");
	}

	public String updateBillOfMaterial(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		BillOfMaterialHelper helper = new BillOfMaterialHelper();
		helper.updateBillOfMaterial(request, response);
		return toJson("Data Updated Successfully");
	}
	// Billofmateriallist

	public String BillOfMaterialList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		BillOfMaterialHelper helper = new BillOfMaterialHelper();
		List categories = helper.BillOfMaterialList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	// component categoey detail tax
	public String getTaxDetailsForComponentDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String fktaxid2 = request.getParameter("fktaxid");
		Long fktaxid = Long.parseLong(fktaxid2);
		ComponentCategoryDetailsHelper helper = new ComponentCategoryDetailsHelper();
		List map = helper.getTaxDetailsForComponentCategoryDetail(fktaxid);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// save savecomponentCategoryDetails
	public String savecomponentCategoryDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLER");
		ComponentCategoryDetailsHelper xdh = new ComponentCategoryDetailsHelper();
		xdh.saveCompoentCategorydetails(request, response);
		return toJson("Data Added Successfully");
	}

	public String CompoentCategoryDetaillist(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentCategoryDetailsHelper helper = new ComponentCategoryDetailsHelper();
		List categories = helper.CompoentCategoryDetailList(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("IN CONTROLLER :-" + returnMap);
		return toJson(returnMap);
	}

	public String getCompoentCategoryDetailsIdPkForEdit(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("IN CONTROLLER 1");

		ComponentCategoryDetailsHelper helper = new ComponentCategoryDetailsHelper();
		helper.getCompoentCategoryDetailsIdPkForEdit(request, response);
		return toJson("Data Added Successsfully");
	}


	public String getComponetCategoryDetailsByComponetIdPkForEdit(HttpServletRequest request, HttpServletResponse response)
	{

		System.out.println("IN CONTROLLER");
		String componentName_id2 = request.getParameter("componentName_id");
		Long componentName_id = Long.parseLong(componentName_id2);
		ComponentCategoryDetailsHelper helper = new ComponentCategoryDetailsHelper();
		List map = helper.getCompoentCategoryDetails(componentName_id);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;

//		System.out.println("IN CONTROLLER");
//		//String componentName_id2 = request.getParameter("componentName_id");
//		//Long componentName_id = Long.parseLong(componentName_id2);
//		ComponentCategoryDetailsHelper helper = new ComponentCategoryDetailsHelper();
//		List map = helper.getComponetCategoryDetailsByComponetIdPkForEdit(request, response);
//		Map<String, List> returnMap = new HashMap<String, List>();
//		String name = toJson(map);
//		return name;
	}

	// Get compoent category Details for edit
	public String getCompoentCategoryDetailsForEdit(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("IN CONTROLLER");
		String componentName_id2 = request.getParameter("componentName_id");
		Long componentName_id = Long.parseLong(componentName_id2);
		ComponentCategoryDetailsHelper helper = new ComponentCategoryDetailsHelper();
		List map = helper.getCompoentCategoryDetails(componentName_id);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		return name;
	}

	// update Compoenent category Details
	public String updatecomponentCategoryDetails(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentCategoryDetailsHelper helper = new ComponentCategoryDetailsHelper();
		helper.updateCompoenentCategoryDetails(request, response);
		return toJson("Data Update Successfully");
	}

	// Get compoent Name Details for select

	public String GetCompoentnametoselect(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String componentType2 = request.getParameter("componentType");
		Long componentType = Long.parseLong(componentType2);
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List map = helper.getCompoentnameforselect(componentType);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		System.out.println(name);
		return name;
	}

	public String GetCompoentnametoselect11(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String componentType2 = request.getParameter("componentType");
		String subCategoryId = request.getParameter("pkcompoentSubcategoryId");
		Long componentType = Long.parseLong(componentType2);
		Long pksubCategoryId = Long.parseLong(subCategoryId);
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List map = helper.getCompoentnameforselect11(componentType,pksubCategoryId);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		System.out.println(name);
		return name;
	}

	public String GetCompoentnametoselectReport(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String componentType2 = request.getParameter("componentType");
		Long componentType = Long.parseLong(componentType2);
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List map = helper.getCompoentnameforselectreport(componentType);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		System.out.println(name);
		return name;
	}

	public String GetCompoentnametoselectReport1(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String componentType2 = request.getParameter("componentType");
		Long componentType = Long.parseLong(componentType2);
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List map = helper.getCompoentnameforselectreport1(componentType);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		System.out.println(name);
		return name;
	}

	public String GetCompoentnametoselectReport2(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String componentType2 = request.getParameter("componentType");
		Long componentType = Long.parseLong(componentType2);
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List map = helper.getCompoentnameforselectreport2(componentType);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		System.out.println(name);
		return name;
	}

	// get Grid For CompoenentRecived po new
	public String getGridForCompoenentBilling(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		String fkCompoentid = request.getParameter("fkCompoentid");
		String componentName = request.getParameter("componentName");
		CompoenentBillingHelper helper = new CompoenentBillingHelper();
		CompoenentBillingBean timeTable = helper.getGridAsForCompenentBilling(fkCompoentid, componentName);
		Map<String, CompoenentBillingBean> items = new HashMap<String, CompoenentBillingBean>();
		items.put("offer", timeTable);
		return toJson(items);
	}

	// Get compoent Name Details for select

	public String getCompoentnameforselectForCompenentBilling(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		String componentType2 = request.getParameter("componentType");
		Long componentType = Long.parseLong(componentType2);
		CompoenentBillingHelper helper = new CompoenentBillingHelper();
		List map = helper.getCompoentnameforselectForCompenentBilling(componentType);
		Map<String, List> returnMap = new HashMap<String, List>();
		String name = toJson(map);
		System.out.println(name);
		return name;
	}

	// New save Compoenet Billing Details
	public String saveCompoenentBillingDetails123(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		CompoenentBillingHelper helper = new CompoenentBillingHelper();
		helper.saveCompoenetBillingDetails121(request, response);
		return toJson("Data Added Successfully");
	}

	public String getCompoentReportbycilentName(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		CompoenentBillingHelper helper = new CompoenentBillingHelper();
		List categories = helper.getClientReportByDateAndName1(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getCompoenetBillingReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		CompoenentBillingHelper helper = new CompoenentBillingHelper();
		List categories = helper.getClientReportByDates(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getCompoentCategoryReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		CompoenentBillingHelper helper = new CompoenentBillingHelper();
		List categories = helper.getClientDetail(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	public String getCompoentnameReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		CompoenentBillingHelper helper = new CompoenentBillingHelper();
		List categories = helper.getCompoentNameDetail(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	// Bill of material reports

	public String getCompoentnameReportBetweenTwoDatesforBom(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		BillOfMaterialHelper helper = new BillOfMaterialHelper();
		List categories = helper.getCompoentNameDetailforBom(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	public String getBillofmaterialReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		BillOfMaterialHelper helper = new BillOfMaterialHelper();
		List categories = helper.getbillofmaterialReportByDates(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getCompoentCategoryForBillofmaterialReportBetweenTwoDates(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		BillOfMaterialHelper helper = new BillOfMaterialHelper();
		List categories = helper.getCategoryDetail(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);
	}

	public String getprojectReportbyprojectName(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		BillOfMaterialHelper helper = new BillOfMaterialHelper();
		List categories = helper.getClientReportByDateAndName1(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getCompoentRecivedReportbyVendorName(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List categories = helper.getvendorReportByDateAndName1(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getCompoentCategoryForCompoenetReciveReportBetweenTwoDates(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List categories = helper.getCategoryDetailforCompoentRcvive(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);

	}

	public String getCompoentReciveReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
		List categories = helper.getCompoenetReportByDates(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String getCompoentCategoryForstockReportBetweenTwoDatesandname(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentStockHelper helper = new ComponentStockHelper();
		List categories = helper.getCategoryDetailforCompoentRcviveandname(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);

	}

	public String getCompoentCategoryForstockreciveBetweenTwoDatesandname(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentStockHelper helper = new ComponentStockHelper();
		List categories = helper.getCategoryDetailforCompoentRcviveandname5(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);

	}

	public String getCompoentCategoryForstockReportBetweenTwoDates(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentStockHelper helper = new ComponentStockHelper();
		List categories = helper.getCategoryDetailforCompoentRcvive(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		System.out.println("CONTROLLER :- " + returnMap);
		return toJson(returnMap);

	}

	public String getstockReportBetweenTwoDates(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ComponentStockHelper helper = new ComponentStockHelper();
		List categories = helper.getCompoenetReportByDates(request, response);
		Map<String, List> returnMap = new HashMap<String, List>();
		returnMap.put("list", categories);
		return toJson(returnMap);
	}

	public String OtherBillCOPY(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper Helper = new ProductBillingHelper();
		Helper.OtherBillCOPY(request, response);
		return toJson("Data Added Successfully");
	}

	public String OtherBillCOPY1(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IN CONTROLLER");
		ProductBillingHelper Helper = new ProductBillingHelper();
		Helper.OtherBillCOPY1(request, response);
		return toJson("Data Added Successfully");
	}

	public String getAllBillNoAgainst(HttpServletRequest request, HttpServletResponse response) {
		HttpSession usersession = request.getSession(true);
		String fkClientId = request.getParameter("fkClientId");
		ProductDetailsHelper helper = new ProductDetailsHelper();
		Map items = helper.getAllSupplerBillNo(fkClientId);
		String xyz = toJson(items);
		System.out.println("In controller == =  =" + xyz);
		return xyz;
	}

	public String getAllResourceBillNoAgainst(HttpServletRequest request, HttpServletResponse response) {
		HttpSession usersession = request.getSession(true);
		String fkVendorId = request.getParameter("fkVendorId");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		Map items = helper.getAllBillNoAgainst(fkVendorId);
		String xyz = toJson(items);
		System.out.println("In controller == =  =" + xyz);
		return xyz;
	}

	// getResourceBillingGrid NEW method
	public String getGridForResourceBilling2(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN CONTROLLER");
		String productName = request.getParameter("productName");
		String billno = request.getParameter("billno");
		ResourceBillingHelper helper = new ResourceBillingHelper();
		List map =  helper.getGridForResourceBilling2(productName, billno);
		Map<String,List> returnMap = new HashMap<String, List>();
		returnMap.put("offer", map);
		return toJson(returnMap);

	}

	public String getPOBillNo(HttpServletRequest request, HttpServletResponse response) {
		HttpSession usersession = request.getSession(true);
		String fkVendorId = request.getParameter("fkVendorId");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		Map items = helper.getPOBillNo(fkVendorId);
		String xyz = toJson(items);
		System.out.println("In controller == =  =" + xyz);
		return xyz;
	}

	public String getPODate(HttpServletRequest request, HttpServletResponse response) {
		HttpSession usersession = request.getSession(true);
		String billno = request.getParameter("billno");
		PurchaseOrderHelper helper = new PurchaseOrderHelper();
		Map items = helper.getPODate(billno);
		String xyz = toJson(items);
		System.out.println("In controller == =  =" + xyz);
		return xyz;
	}

	// getRemoveVendorList by Namrata
		public String getDeleteVendorList(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			VendorDetailsHelper helper = new VendorDetailsHelper();
			helper.getDeleteVendorList(request, response);
			return toJson("Record Deleted Successfully");
		}


		public String getAllPOBillNoAgainst(HttpServletRequest request, HttpServletResponse response) {
			HttpSession usersession = request.getSession(true);
			String fkVendorId = request.getParameter("fkVendorId");
			PurchaseOrderHelper helper = new PurchaseOrderHelper();
			Map items = helper.getAllPOBillNoAgainst(fkVendorId);
			String xyz = toJson(items);
			//System.out.println("In controller == =  =" + xyz);
			return xyz;
		}


		public String getPurchaseFieldsInfo(HttpServletRequest request, HttpServletResponse response) {
			HttpSession usersession = request.getSession(true);
			String billno = request.getParameter("billno");
			PurchaseOrderHelper helper = new PurchaseOrderHelper();
			Map items = helper.getPurchaseFieldsInfo(billno);
			String xyz = toJson(items);
			//System.out.println("In controller == =  =" + xyz);
			return xyz;
		}


		public String getPOEditGrid(HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException {
			System.out.println("IN CONTROLLER");
			String billno = request.getParameter("billno");
			PurchaseOrderHelper helper = new PurchaseOrderHelper();
			List map =  helper.getPOGridsInfo1(billno);
			Map<String,List> returnMap = new HashMap<String, List>();
			returnMap.put("offer", map);
			return toJson(returnMap);
		}



		// Purchase Order Update Info
		public String updatePurchaseOrderInfo(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			PurchaseOrderHelper helper = new PurchaseOrderHelper();
			helper.updatePurchaseOrderInfo(request, response);
			return ("Data Updated successfully");
		}



		public String getAlleditResourceBillNoAgainst(HttpServletRequest request, HttpServletResponse response) {
			HttpSession usersession = request.getSession(true);
			String fkVendorId = request.getParameter("fkVendorId");
			ResourceBillingHelper helper = new ResourceBillingHelper();
			Map items = helper.getAlleditResourceBillNoAgainst(fkVendorId);
			String xyz = toJson(items);
			System.out.println("In controller == =  =" + xyz);
			return xyz;
		}


		public String getRPIBillingDate(HttpServletRequest request,HttpServletResponse response) {
			String resrcbillNo = request.getParameter("resrcbillNo");
			ResourceBillingHelper helper = new ResourceBillingHelper();
			Map map = helper.getRPIBillingDate(resrcbillNo);
			Map<String, List> returnMap = new HashMap<String, List>();
			String xyz = toJson(map);
			System.out.println(xyz);
			System.out.println("going out of controller");
			return xyz;
		}

		// getResourceBillingGrid NEW method
		public String getGridForEditResourceBilling2(HttpServletRequest request, HttpServletResponse response)
				throws IOException, JSONException {
			System.out.println("IN CONTROLLER");
			String productName = request.getParameter("productName");
			String billno = request.getParameter("billno");
			ResourceBillingHelper helper = new ResourceBillingHelper();
			List map =  helper.getGridForEditResourceBilling2(productName, billno);
			Map<String,List> returnMap = new HashMap<String, List>();
			returnMap.put("offer", map);
			return toJson(returnMap);

		}

		// Update updateResourceBill2
		public String updateResourceBill2(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ResourceBillingHelper helper = new ResourceBillingHelper();
			helper.updateResourceBill2(request, response);
			return ("Data Updated successfully");
		}

		public String getProdEditbillnoAgainst(HttpServletRequest request, HttpServletResponse response) {
			HttpSession usersession = request.getSession(true);
			String fkClientId = request.getParameter("fkClientId");
			ProductBillingHelper helper = new ProductBillingHelper();
			Map items = helper.getProdEditbillnoAgainst(fkClientId);
			String xyz = toJson(items);
			System.out.println("In controller == =  =" + xyz);
			return xyz;
		}

		public String fetchEditProdBillDetails(HttpServletRequest request,HttpServletResponse response) {
			String prodbillNo = request.getParameter("prodbillNo");
			ProductBillingHelper helper = new ProductBillingHelper();
			Map map = helper.fetchEditProdBillDetails(prodbillNo);
			Map<String, List> returnMap = new HashMap<String, List>();
			String xyz = toJson(map);
			System.out.println(xyz);
			System.out.println("going out of controller");
			return xyz;
		}

		// get Grid For ProductBilling new
		public String getEditGridForProductBilling(HttpServletRequest request, HttpServletResponse response)
				throws IOException, JSONException {
			System.out.println("IN CONTROLLER");
			String billno = request.getParameter("billno");
			String fkProductId = request.getParameter("fkProductId");
			ProductBillingHelper helper = new ProductBillingHelper();

			List map =  helper.getEditGridForProductBilling(fkProductId,billno);
			Map<String,List> returnMap = new HashMap<String, List>();
			returnMap.put("offer", map);
			return toJson(returnMap);

		}


		// New save Product Billing Details
		public String updateProductBillingDetails(HttpServletRequest request, HttpServletResponse response)
				throws IOException, JSONException {
			System.out.println("IN CONTROLLER");
			ProductBillingHelper helper = new ProductBillingHelper();
			helper.updateProductBillingDetails(request, response);
			return toJson("Data Updated Successfully");
		}

		// Enquiry Form Details by Namrata
		public String enquiryFormDetails(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ClientEnquiryHelper edh = new ClientEnquiryHelper();
			edh.addEnquiryFormDetails(request, response);
			return toJson("Data Added Successfully");
		}


		
		public String getAllEnquiryListDateWise(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ClientEnquiryHelper helper = new ClientEnquiryHelper();
			List categories = helper.getAllEnquiryListDateWise(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("IN CONTROLLER :- " + returnMap);
			return toJson(returnMap);
		}
		
		public String getAllEnquiryList(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ClientEnquiryHelper helper = new ClientEnquiryHelper();
			List categories = helper.getAllEnquiryList(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			System.out.println("IN CONTROLLER :- " + returnMap);
			return toJson(returnMap);
		}

		// Get Person Details for Enquiry Form edit
		public String fetchPersonInfo(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			Long fkprsnid = Long.parseLong(request.getParameter("fkprsnid"));
			ClientEnquiryHelper helper = new ClientEnquiryHelper();
			List map = helper.fetchPersonInfo(fkprsnid);
			Map<String, List> returnMap = new HashMap<String, List>();
			String name = toJson(map);
			return name;
		}


		// Update Enquiry Form Details by Namrata
		public String updateEnquiryFormDetails(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ClientEnquiryHelper edh = new ClientEnquiryHelper();
			edh.updateEnquiryFormDetails(request, response);
			return toJson("Data Updated Successfully");
		}

		// update Client Enquiry Response Details by Namrata
				public String updateClientEnquiryResponseDetails(HttpServletRequest request, HttpServletResponse response) {
					System.out.println("IN CONTROLLER");
					ClientResponseHelper helper = new ClientResponseHelper();
					helper.updateClientEnquiryResponseDetails(request, response);
					return toJson("Data Update Successfully");
				}

		// getRemoveComponenetCategoryList by Namrata

		public String getDeleteCompCatList(HttpServletRequest request, HttpServletResponse response) {
					System.out.println("IN CONTROLLER");
					ComponentCategoryDetailsHelper helper = new ComponentCategoryDetailsHelper();
					helper.getDeleteCompCatList(request, response);
					return toJson("Record Deleted Successfully");
				}


		// ComponentCategoryDetailsHelper
		public String uploadBulkCompoentCategoryDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("IN CONTROLLER");
			ComponentCategoryDetailsHelper helper = new ComponentCategoryDetailsHelper();
			HashMap<String, List<Integer>> map = helper.addExcelFileDataToDatabase2(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			String name = toJson(map);
			return name;

		}

		public String fetchproductByCatName(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ComponentStockHelper helper = new ComponentStockHelper();
			Map categories = helper.fetchproductByCatName(request, response);
			String xyz = toJson(categories);
			return xyz;
		}

		public String PurchaseReportRangeWise(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			PurchaseOrderHelper helper = new PurchaseOrderHelper();
			List categories = helper.getPurchaseDetailsRangeWise(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			returnMap.put("list", categories);
			return toJson(returnMap);
		}

//		public String downloadPDF(HttpServletRequest request, HttpServletResponse response) {
//			System.out.println("IN CONTROLLER");
//			BulkUploadCategoryExcelWriter.main(request, response);
//			return toJson("PDF Downloaded");
//		}


		// get User Dtl For Access Control
		public String getComponentList(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");

			ComponentSubcategoryHelper helper = new ComponentSubcategoryHelper();
			List map = helper.getComponentSubcategoryDropDown(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			String name = toJson(map);
			return name;
		}
		
		public String getSubcategoryForedit(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ComponentSubcategoryHelper helper = new ComponentSubcategoryHelper();
			List map = helper.getSubcategoryForedit(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			String name = toJson(map);
			return name;
		}

		// get User Dtl For Access Control
		public String getComponentListForComponentBilling(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");

			ComponentDetailsHelper helper = new ComponentDetailsHelper();
			List map = helper.getComponentDropDown(request, response);
			Map<String, List> returnMap = new HashMap<String, List>();
			String name = toJson(map);
			return name;
		}
		
		
		public String bulkUploadComponentReceived (HttpServletRequest request, HttpServletResponse response) {
			System.out.println("IN CONTROLLER");
			ComponentReceivedPOHelper helper = new ComponentReceivedPOHelper();
			helper.saveComponentReceivedPODetailsExcel(request, response);
			return toJson("Data Added Successfully");
			
		}




}
