package com.embelSoft.helper;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.json.JSONException;

import com.embelSoft.bean.CompoenentBillingBean;
import com.embelSoft.bean.CompoentCategoryDetailBean;
import com.embelSoft.bean.ComponentStockBean;
import com.embelSoft.dao.CompoenentBillingDao;
import com.embelSoft.dao.ComponentStockDao;
import com.embelSoft.hibernate.CompoenentBillingHibernate;
import com.embelSoft.hibernate.ComponentStockHibernate;
import com.embelSoft.utility.HibernateUtility;

public class CompoenentBillingHelper {

	private String componentCategory = "";
	private String CompoenentName = "";
	private Double unitPrice = 0d;
	private Double gst = 0d;
	private Long quantity = 0l;
	private Long fkCompId = 0l;
	private String partNumber = "";
	private String packages = "";
	private String value = "";
	private String mfgname = "";

	// getGridAsForCompTypeForCompReceivedPO
	public CompoenentBillingBean getGridAsForCompenentBilling(String fkCompoentid, String componentName) {
		CompoenentBillingBean bean = new CompoenentBillingBean();

		System.out.println("IN Helper");
		System.out.println(fkCompoentid + componentName + "compoentname and id in helper");

		Long fkCompoentid1 = Long.parseLong(fkCompoentid);

		CompoenentBillingDao dao = new CompoenentBillingDao();
		List list = dao.getCompoenetBilldata(fkCompoentid1);
		for (int i = 0; i < list.size(); i++) {
			CompoenentBillingBean hibernate = (CompoenentBillingBean) list.get(i);

			componentCategory = hibernate.getCompoenentCategory();

			System.out.println("get compoenet category" + componentCategory);
			CompoenentName = hibernate.getCompoenentName();
			unitPrice = hibernate.getUnitPrice();
			gst = hibernate.getGst();
			quantity = hibernate.getQuantity();
			fkCompId = hibernate.getFkComptypeId();
			packages = hibernate.getPackages();
			partNumber = hibernate.getPartNumber();
			value = hibernate.getValues();
			mfgname = hibernate.getMfgName();

		}
		bean.setCompoenentCategory(componentCategory);

		System.out.println("set compoent category" + componentCategory);

		bean.setCompoenentName(CompoenentName);
		bean.setFkCompoentnameid(fkCompoentid1);
		bean.setUnitPrice(unitPrice);
		bean.setGst(gst);
		bean.setIgst(0.0);
		bean.setAmount(0.0);
		bean.setTotal(0.0);
		bean.setQuantity(0l);
		bean.setTaxAmount(0.0);
		bean.setDiscountAmount(0.0);
		bean.setDiscountPercentage(0.0);
		bean.setSubtotal(0.0);
		bean.setFkComptypeId(fkCompId);
		bean.setHsn("0");
		bean.setQuantity1(quantity);
		bean.setPackages(packages);
		bean.setValues(value);
		bean.setMfgName(mfgname);
		bean.setPartNumber(partNumber);
		return bean;
	}

	public List getCompoentnameforselectForCompenentBilling(Long componentType) {

		Map<Long, CompoentCategoryDetailBean> map = new HashMap<Long, CompoentCategoryDetailBean>();

		CompoenentBillingDao dao = new CompoenentBillingDao();
		List<ComponentStockBean> ven1List = dao.getcompentCategoryNameForselect(componentType);

		System.out.println("Size in Helper------ : " + ven1List.size());

		return ven1List;
	}

	public void saveCompoenetBillingDetails121(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JSONException {
		System.out.println("IN HELPER");
		String productBillNoForPdf;

		String projectname;
		String boardname;
		Integer count = Integer.parseInt(request.getParameter("count"));
		HttpSession session = request.getSession();
		String Hr;
		SimpleDateFormat simpleformat = new SimpleDateFormat(" dd MM yyyy");
		simpleformat = new SimpleDateFormat("MM yyyy");
		String strMonth = simpleformat.format(new Date());
		System.out.println("Month in MMMM format = " + strMonth);

		String d1123 = strMonth.toString();
		String[] d = d1123.split(" ");
		String year = d[1];
		String month = d[0];
		String CompoenentBillNo = month + "/" + year + "/" + "00" + 1;

		CompoenentBillingDao hrDao = new CompoenentBillingDao();
		List bill = hrDao.getCompoentLastBillNo123();

		for (int i = 0; i < bill.size(); i++) {
			CompoenentBillingBean bean = (CompoenentBillingBean) bill.get(i);

			Hr = bean.getBillNo();
			String[] HrBil = Hr.split("/");
			String lNo = HrBil[2];
			int lstNo = Integer.parseInt(lNo);
			int LastNo = lstNo + 1;

			if (LastNo < 10) {
				CompoenentBillNo = month + "/" + year + "/" + "00" + LastNo;
			} else {
				CompoenentBillNo = month + "/" + year + "/" + LastNo;
			}
		}

		CompoenentBillingHibernate hibernate1 = new CompoenentBillingHibernate();
		System.out.println(
				"-----------------------------------------------------------------------------------------" + count);
		for (int i = 0; i < count; i++) {
			String fkClientId = request.getParameter("fkClientId");
			String clientName = request.getParameter("clientName");
			String billDate = request.getParameter("productBillDate");
			String fkCompoentnameid = request.getParameter("pkComponentCategoryDetailsId" + i);
			String fkComptypeId = request.getParameter("fkCompTypeId" + i);
			String ProjectName = request.getParameter("ProjectName");
			String BoardName = request.getParameter("BoardName");
			String compoenentCategory = request.getParameter("compoenentCategory" + i);
			String CompoenentName = request.getParameter("CompoenentName" + i);
			String hsn = request.getParameter("hsn" + i);
			String unitPrice = request.getParameter("unitPrice" + i);
			String quantity = request.getParameter("quantity" + i);
			String amount = request.getParameter("amount" + i);
			String discountPercentage = request.getParameter("discountPercentage" + i);
			String discountAmount = request.getParameter("discountAmount" + i);
			String subTotal = request.getParameter("subTotal" + i);
			String gst = request.getParameter("gst" + i);
			String IGST = request.getParameter("IGST" + i);
			String taxAmount = request.getParameter("taxAmount" + i);
			String total = request.getParameter("total" + i);
			String description = request.getParameter("description");
			String packages = request.getParameter("packages" + i);
			String partNumber = request.getParameter("partNumber" + i);
			String values1 = request.getParameter("values" + i);
			String mfgName = request.getParameter("mfgName" + i);

			String totalSubTotal = request.getParameter("totalSubTotalProduct");
			String totalTaxAmount = request.getParameter("totalTaxAmountProduct");
			System.out.println("HEALPER totalTaxAmount :-  " + totalTaxAmount);
			String grossTotal = request.getParameter("grossTotalProduct");

			if (CompoenentBillNo == null) {
				hibernate1.setBillNo(CompoenentBillNo);
				productBillNoForPdf = CompoenentBillNo;
			} else {
				hibernate1.setBillNo(CompoenentBillNo);
				productBillNoForPdf = CompoenentBillNo;
			}

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date d1 = null;

			try {
				d1 = format.parse(billDate);
				hibernate1.setBillingDate(d1);
			} catch (Exception e) {
				e.printStackTrace();
			}

			hibernate1.setFkClientId(Long.parseLong(fkClientId));
			hibernate1.setClientName(clientName);
			hibernate1.setFkCompoentnameid(Long.parseLong(fkCompoentnameid));
			System.out.println("fkCompoentnameid in helper---" + fkCompoentnameid);

			hibernate1.setCompoenentName(CompoenentName);
			hibernate1.setCompoenentCategory(compoenentCategory);
			hibernate1.setFkComptypeId(Long.parseLong(fkComptypeId));
			
			if (hsn == null|| hsn =="") {
				hibernate1.setHsn("N/A");
			}else {
				hibernate1.setHsn(hsn);
			}

			if (ProjectName == null || ProjectName.isEmpty() || ProjectName == "" || ProjectName == " ")

			{
				hibernate1.setProjectName("N/A");
				projectname = "N/A";

			} else {
				hibernate1.setProjectName(ProjectName);
				projectname = ProjectName;
			}

			if (BoardName == null || BoardName.isEmpty() || BoardName == "" || BoardName == " ") {
				hibernate1.setBoardName("N/A");
				boardname = "N/A";
			} else {
				hibernate1.setBoardName(BoardName);
				boardname = BoardName;
			}
			if (packages == null || packages.isEmpty() || packages == "" || packages == " ") {
				hibernate1.setPackages("N/A");
			} else {
				hibernate1.setPackages(packages);

			}
			if (partNumber == null || partNumber.isEmpty() || partNumber == "" || partNumber == " ") {
				hibernate1.setPartNumber("N/A");
			} else {
				hibernate1.setPartNumber(partNumber);

			}
			if (values1 == null || values1.isEmpty() || values1 == "" || values1 == " ") {
				hibernate1.setValues1("N/A");
			} else {
				hibernate1.setValues1(values1);

			}
			if (mfgName == null || mfgName.isEmpty() || mfgName == "" || mfgName == " ") {
				hibernate1.setMfgName("N/A");
			} else {
				hibernate1.setMfgName(mfgName);

			}
			hibernate1.setUnitPrice(Double.parseDouble(unitPrice));
			hibernate1.setQuantity(Long.parseLong(quantity));
			if (amount == null || amount =="") {
				hibernate1.setAmount(Double.parseDouble("0"));
			} else {
				hibernate1.setAmount(Double.parseDouble(amount));
			}
			
			if (discountPercentage == null ||discountPercentage=="") {
				hibernate1.setDiscountPercentage(Double.parseDouble("0"));
			}else {
				hibernate1.setDiscountPercentage(Double.parseDouble(discountPercentage));
			}
			
			if (discountAmount == null || discountAmount == "") {
				hibernate1.setDiscountAmount(Double.parseDouble("0"));
			} else {
				hibernate1.setDiscountAmount(Double.parseDouble(discountAmount));
			}
			
			hibernate1.setSubtotal(Double.parseDouble(subTotal));
			if (!"".equals(gst)) {
				hibernate1.setGst(Double.parseDouble(gst));
			} else {
				hibernate1.setGst(Double.parseDouble("0"));
			}

			if (!"".equals(IGST)) {
				hibernate1.setIgst(Double.parseDouble(IGST));
			} else {
				hibernate1.setIgst(Double.parseDouble("0"));
			}
			hibernate1.setTaxAmount(Double.parseDouble(taxAmount));
			hibernate1.setTotal(Double.parseDouble(total));
			hibernate1.setSubtotal(Double.parseDouble(totalSubTotal));
			hibernate1.setTaxAmount(Double.parseDouble(totalTaxAmount));
			hibernate1.setTotal(Double.parseDouble(grossTotal));
			hibernate1.setDescription(description);
			CompoenentBillingDao dao = new CompoenentBillingDao();
			dao.saveProductBillingDetails(hibernate1);

			session.setAttribute("fkClientId", fkClientId);
			session.setAttribute("productBillNo", productBillNoForPdf);
			session.setAttribute("clientName", clientName);
			session.setAttribute("ProjectName", projectname);
			session.setAttribute("BoardName", boardname);

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			String currentDate = dateFormat.format(cal.getTime()).toString();
			Date compStockLastUpdateDate = null;
			try {
				compStockLastUpdateDate = dateFormat.parse(currentDate);

			} catch (Exception e) {
				e.printStackTrace();

			}

			ComponentStockDao csDao = new ComponentStockDao();
			List csList = csDao.getAllLoadComponentStockEntry();
			for (int j = 0; j < csList.size(); j++) {
				System.out.println("inside for loop of stock " + csList.size());

				ComponentStockHibernate csh = (ComponentStockHibernate) csList.get(j);

				String componentTypeOld = csh.getComponentType();
				Long fkCompTypeIdOld = csh.getFkCompTypeId();
				String componentNameOld = csh.getComponentName();
				Long FkCompoentnameidOld = csh.getFkCompoentnameid();
				String manufacturarNameOld = csh.getManufacturarName();
				String typeOld = csh.getType();
				String compPackageOld = csh.getCompPackage();
				String unitOld = csh.getUnit();
				Long quantityOld = csh.getQuantity();
				Long pkCompStockIdOld = csh.getPkCompStockId();
				Date compStockLastUpdateDateOld = csh.getCompStockLastUpdateDate();

				if (componentTypeOld.equals(compoenentCategory) && componentNameOld.equals(CompoenentName)) {
					System.out.println("inside if loop of stock");

					Long quantityUpdate = quantityOld - Long.parseLong(quantity);

					HibernateUtility hbu = HibernateUtility.getInstance();
					Session session2 = hbu.getHibernateSession();
					org.hibernate.Transaction transaction = session2.beginTransaction();

					ComponentStockHibernate updateStock = (ComponentStockHibernate) session2
							.get(ComponentStockHibernate.class, new Long(pkCompStockIdOld));
					// updateStock.setCompStockLastUpdateDate(compStockLastUpdateDate);
					updateStock.setQuantity(quantityUpdate);
					updateStock.setCompStockLastUpdateDate(compStockLastUpdateDate);

					session2.saveOrUpdate(updateStock);
					transaction.commit();
					break;
				}
			}

		}
	}

	public List getClientReportByDateAndName1(HttpServletRequest request, HttpServletResponse response) {
		String fkClientId2 = request.getParameter("fkClientId2");
		String clientName = request.getParameter("clientName");
		String fisDate4 = request.getParameter("fisDate4");
		String endDate4 = request.getParameter("endDate4");

		Map<Long, CompoenentBillingBean> map = new HashMap<Long, CompoenentBillingBean>();

		CompoenentBillingDao dao = new CompoenentBillingDao();
		List<CompoenentBillingBean> exp1List = dao.getClientReportByDateAndName(fkClientId2, clientName, fisDate4,
				endDate4);

		return exp1List;

	}

	public List getClientReportByDates(HttpServletRequest request, HttpServletResponse response) {
		String fisDate = request.getParameter("fisDate42");
		String endDate = request.getParameter("endDate42");

		Map<Long, CompoenentBillingBean> map = new HashMap<Long, CompoenentBillingBean>();

		CompoenentBillingDao dao = new CompoenentBillingDao();
		List<CompoenentBillingBean> exp1List = dao.getClientReportByDates(fisDate, endDate);

		return exp1List;

	}

	public List getClientDetail(HttpServletRequest request, HttpServletResponse response) {

		String fkCompenetId1 = request.getParameter("fkCompenetId1");
		String CompoentCategory = request.getParameter("CompoentCategory");
		String fisDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");

		Map<Long, CompoenentBillingBean> map = new HashMap<Long, CompoenentBillingBean>();

		CompoenentBillingDao dao = new CompoenentBillingDao();
		List<CompoenentBillingBean> exp1List = dao.getClientDetail(fisDate, endDate, CompoentCategory, fkCompenetId1);

		return exp1List;

	}

	public List getCompoentNameDetail(HttpServletRequest request, HttpServletResponse response) {

		String fkCompenetId = request.getParameter("fkCompenetId");
		String CompoenentName = request.getParameter("CompoenentName");
		String fisDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");

		Map<Long, CompoenentBillingBean> map = new HashMap<Long, CompoenentBillingBean>();

		CompoenentBillingDao dao = new CompoenentBillingDao();
		List<CompoenentBillingBean> exp1List = dao.getCompoentNameDetail(fisDate, endDate, CompoenentName,
				fkCompenetId);

		return exp1List;

	}

}
