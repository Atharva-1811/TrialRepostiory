package com.embelSoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.embelSoft.bean.BillOfMaterialBean;
import com.embelSoft.hibernate.BillOfMaterialHibernate;
import com.embelSoft.utility.HibernateUtility;

/*import sun.text.normalizer.NormalizerImpl.ReorderingBuffer;*/

public class BillOfMaterialDao {

	// getAllCompTypeDetails
	public List getAllCompTypeDetails() {

		HibernateUtility hbu = null;
		Session session = null;
		List list = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("from ComponentStockHibernate GROUP BY component_type");
			list = query.list();

		} catch (Exception e) {
			Log.error("Error in getAllCompTypeDetails", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}

		}

		return list;

	}

	public void saveBillofmaterial(BillOfMaterialHibernate hibernate) {
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			System.out.println("got session ");
			transaction = session.beginTransaction();

			System.out.println("Tx started");

			session.save(hibernate);
			transaction.commit();
			System.out.println("Successful");
		}

		catch (RuntimeException e) {
			try {
				transaction.rollback();
			} catch (RuntimeException rbe) {
				Log.error("Couldn't roll back tranaction", rbe);
			}
		} finally {
			hbu.closeSession(session);
		}
	}

	// BillofmaterialList
	public List BillofmaterialList() {
		HibernateUtility hbu = null;
		Session session = null;
		List<BillOfMaterialBean> compList = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"SELECT projectName,boardName,componentType,componentName,ref_desinator,part_number,package,voltage,value,manufracture_name,descrption,quantity_for_board,unit_price,board_cost,remark,vendorName from bill_of_material");
			List<Object[]> list = query.list();

			System.out.println("list Size:" + list);

			compList = new ArrayList<BillOfMaterialBean>(0);

			int i = 0;

			for (Object[] o : list) {
				i++;

				BillOfMaterialBean bean = new BillOfMaterialBean();

				bean.setProjectName(o[0].toString());
				bean.setBoardName(o[1].toString());
				bean.setComponentType(o[2].toString());
				bean.setComponentName(o[3].toString());
				System.out.println(bean.getComponentName());
				bean.setRef_Designator(o[4].toString());
				bean.setPart_Number(o[5].toString());
				bean.setPackages(o[6].toString());
				bean.setTolvRating((o[7].toString()));
				bean.setValue(o[8].toString());
				bean.setManufactureName(o[9].toString());
				bean.setDescription(o[10].toString());
				bean.setOneBoardQty(Double.parseDouble(o[11].toString()));
				bean.setUnitPrice(Double.parseDouble(o[12].toString()));
				bean.setBoardCost(Double.parseDouble(o[13].toString()));
				bean.setRemark(o[14].toString());
				bean.setVendorName(o[15].toString());

				bean.setSrNo(i);

				compList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			hbu.closeSession(session);
		}
		return compList;
	}

	public List getAllprojectName() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("FROM BillOfMaterialHibernate");
			list = query.list();
//				GROUP BY projectName
		} catch (RuntimeException e) {
			Log.error("Error in getAllUnits", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}
	
	public List<BillOfMaterialBean> getAllprojectNameForEdit() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List<BillOfMaterialBean> pList = new ArrayList<BillOfMaterialBean>();

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createSQLQuery("SELECT DISTINCT projectName FROM bill_of_material");
			List<String>list = query.list();
			
			for (String string : list) {
				BillOfMaterialBean bean = new BillOfMaterialBean();
				bean.setProjectName(string);
				pList.add(bean);
			}
			
//			for (Object[] objects : list) {
//				BillOfMaterialBean bean = new BillOfMaterialBean();
//				bean.setProjectName(objects[0].toString());
//				pList.add(bean);
//			}

		} catch (RuntimeException e) {
			Log.error("Error in getAllUnits", e);
			System.out.println(e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return pList;

	}

	public List getAllCompTypeDetails1() {

		HibernateUtility hbu = null;
		Session session = null;
		List list = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("from BillOfMaterialHibernate GROUP BY componentType");
			list = query.list();

		} catch (Exception e) {
			Log.error("Error in getAllCompTypeDetails", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}

		}

		return list;

	}

	public List getAllComponentNameDetails() {

		HibernateUtility hbu = null;
		Session session = null;
		List list = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createQuery("from BillOfMaterialHibernate GROUP BY componentName");
			list = query.list();

		} catch (Exception e) {
			Log.error("Error in getAllComponentNameDetails", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}

		}

		return list;

	}

	public List<BillOfMaterialBean> getCompoentNameDetail(String fisDate, String endDate, String CompoenentName,
			String fkCompenetId) {

		HibernateUtility hbu = null;
		Session session = null;
		List<BillOfMaterialBean> cliList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"SELECT projectName,boardName,componentType,componentName,ref_desinator,part_number,package,voltage,value,manufracture_name,descrption,quantity_for_board,unit_price,board_cost,remark,vendorName FROM bill_of_material WHERE componentName='"
							+ CompoenentName + "' AND pk_comp_BOM_id='" + fkCompenetId
							+ "' and last_update_date BETWEEN '" + fisDate + "' AND '" + endDate + "'");
			List<Object[]> list = query.list();
			cliList = new ArrayList<BillOfMaterialBean>(0);

			System.out.println("========================  SIZE  ======================  :: " + list.size());

			int i = 0;

			for (Object[] o : list) {
				i++;

				BillOfMaterialBean reports = new BillOfMaterialBean();

				reports.setProjectName(o[0].toString());
				reports.setBoardName(o[1].toString());
				reports.setComponentType(o[2].toString());
				reports.setComponentName(o[3].toString());
				reports.setRef_Designator(o[4].toString());
				reports.setPart_Number(o[5].toString());
				reports.setPackages(o[6].toString());
				reports.setTolvRating(o[7].toString());
				reports.setValue(o[8].toString());
				reports.setManufactureName(o[9].toString());
				reports.setDescription(o[10].toString());
				reports.setOneBoardQty(Double.parseDouble(o[11].toString()));
				reports.setUnitPrice(Double.parseDouble(o[12].toString()));
				reports.setBoardCost(Double.parseDouble(o[13].toString()));
				reports.setRemark(o[14].toString());
				reports.setVendorName(o[15].toString());

				reports.setSrNo(i);

				cliList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return cliList;
	}

	public List getClientReportByDates1(String fisDate, String endDate) {

		HibernateUtility hbu = null;
		Session session = null;
		List<BillOfMaterialBean> cliList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"SELECT projectName,boardName,componentType,componentName,ref_desinator,part_number,package,voltage,value,manufracture_name,descrption,quantity_for_board,unit_price,board_cost,remark,vendorName FROM bill_of_material WHERE last_update_date BETWEEN '"
							+ fisDate + "' AND '" + endDate + "'");
			List<Object[]> list = query.list();
			cliList = new ArrayList<BillOfMaterialBean>(0);

			System.out.println("========================  SIZE  ======================  :: " + list.size());

			int i = 0;

			for (Object[] o : list) {
				i++;

				BillOfMaterialBean reports = new BillOfMaterialBean();

				reports.setProjectName(o[0].toString());
				reports.setBoardName(o[1].toString());
				reports.setComponentType(o[2].toString());
				reports.setComponentName(o[3].toString());
				reports.setRef_Designator(o[4].toString());
				reports.setPart_Number(o[5].toString());
				reports.setPackages(o[6].toString());
				reports.setTolvRating(o[7].toString());
				reports.setValue(o[8].toString());
				reports.setManufactureName(o[9].toString());
				reports.setDescription(o[10].toString());
				reports.setOneBoardQty(Double.parseDouble(o[11].toString()));
				reports.setUnitPrice(Double.parseDouble(o[12].toString()));
				reports.setBoardCost(Double.parseDouble(o[13].toString()));
				reports.setRemark(o[14].toString());
				reports.setVendorName(o[15].toString());

				reports.setSrNo(i);

				cliList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return cliList;

	}

	public List<BillOfMaterialBean> getClientDetail(String fisDate, String endDate, String CompoentCategory,
			String fkCompenetId) {

		HibernateUtility hbu = null;
		Session session = null;
		List<BillOfMaterialBean> cliList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"SELECT projectName,boardName,componentType,componentName,ref_desinator,part_number,package,voltage,value,manufracture_name,descrption,quantity_for_board,unit_price,board_cost,remark,vendorName FROM bill_of_material WHERE componentType='"
							+ CompoentCategory + "' AND fk_comp_type_id='" + fkCompenetId
							+ "' and last_update_date BETWEEN '" + fisDate + "' AND '" + endDate + "'");
			List<Object[]> list = query.list();
			cliList = new ArrayList<BillOfMaterialBean>(0);

			System.out.println("========================  SIZE  ======================  :: " + list.size());

			int i = 0;

			for (Object[] o : list) {
				i++;

				BillOfMaterialBean reports = new BillOfMaterialBean();

				reports.setProjectName(o[0].toString());
				reports.setBoardName(o[1].toString());
				reports.setComponentType(o[2].toString());
				reports.setComponentName(o[3].toString());
				reports.setRef_Designator(o[4].toString());
				reports.setPart_Number(o[5].toString());
				reports.setPackages(o[6].toString());
				reports.setTolvRating(o[7].toString());
				reports.setValue(o[8].toString());
				reports.setManufactureName(o[9].toString());
				reports.setDescription(o[10].toString());
				reports.setOneBoardQty(Double.parseDouble(o[11].toString()));
				reports.setUnitPrice(Double.parseDouble(o[12].toString()));
				reports.setBoardCost(Double.parseDouble(o[13].toString()));
				reports.setRemark(o[14].toString());
				reports.setVendorName(o[15].toString());

				reports.setSrNo(i);

				cliList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return cliList;
	}

	public List getClientReportByDateAndName(String projectName, String fisDate4, String endDate4) {

		HibernateUtility hbu = null;
		Session session = null;
		List<BillOfMaterialBean> cliList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery(
					"SELECT componentType,componentName,ref_desinator,part_number,package,voltage,value,manufracture_name,descrption,quantity_for_board,unit_price,board_cost,remark,vendorName FROM bill_of_material WHERE projectName='"
							+ projectName + "' AND last_update_date BETWEEN '" + fisDate4 + "' AND '" + endDate4 + "'");
			List<Object[]> list = query.list();
			cliList = new ArrayList<BillOfMaterialBean>(0);

			System.out.println("========================  SIZE  ======================  :: " + list.size());

			int i = 0;

			for (Object[] o : list) {
				i++;

				BillOfMaterialBean reports = new BillOfMaterialBean();

				// reports.setProjectName(o[0].toString());
				// reports.setBoardName(o[1].toString());
				reports.setComponentType(o[0].toString());
				reports.setComponentName(o[1].toString());
				reports.setRef_Designator(o[2].toString());
				reports.setPart_Number(o[3].toString());
				reports.setPackages(o[4].toString());
				reports.setTolvRating(o[5].toString());
				reports.setValue(o[6].toString());
				reports.setManufactureName(o[7].toString());
				reports.setDescription(o[8].toString());
				reports.setOneBoardQty(Double.parseDouble(o[9].toString()));
				reports.setUnitPrice(Double.parseDouble(o[10].toString()));
				reports.setBoardCost(Double.parseDouble(o[11].toString()));
				reports.setRemark(o[12].toString());
				reports.setVendorName(o[13].toString());

				reports.setSrNo(i);

				cliList.add(reports);

			}
		} catch (RuntimeException e) {

		} finally {

			hbu.closeSession(session);
		}
		return cliList;
	}

	public List getTotalItemByVoucherNoForEditGRDao(String projectname) {
		// TODO Auto-generated method stub
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		;

		List<BillOfMaterialBean> itemlist = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			System.out.println("====DAO====");
			// Query query = session.createSQLQuery("select s.PkGoodRecId,s.CategoryName,
			// s.ItemName, s.OrignalQuantity, s.BuyPrice, s.Vat, s.Total, s.ContactPerson,
			// s.BarcodeNo, s.Date, s.Quantity,s.igst,s.Discount,s.RollSize,s.size,
			// s.FksuppId from goodreceive s where s.BillNo=:billNo And
			// s.FksuppId=:supplierId and s.Quantity>0");
			Query query = session.createSQLQuery(
					"SELECT projectName,boardName,componentType,componentName,fk_comp_type_id,ref_desinator,part_number,package,voltage,`value`,manufracture_name,descrption,quantity_for_board,unit_price,board_cost,remark,vendorName,pk_comp_BOM_id from bill_of_material WHERE projectName=:projectname");
			query.setParameter("projectname", projectname);

			list = query.list();
			System.out.println("list.size() ::::::  " + list.size());
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

		// System.out.println("TOTAL ITEMLIST DAO "+itemlist.size());

		return list;
	}

	public void updateBillOfMaterial(BillOfMaterialHibernate gd) {
		// TODO Auto-generated method stub
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.update(gd);
			transaction.commit();
		} catch (Exception e) {
			try {
				transaction.rollback();
			} catch (RuntimeException ede) {
			}
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
	}

	public List getBillNo() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("FROM ProductBillingHibernateNew GROUP BY billNo"); // GROUP BY billNo
			list = query.list();
		} catch (RuntimeException e) {
			Log.error("Error in getAllUnits", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}

	public List getResourceBillNo() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;

		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("FROM ResourceBillingHibernate GROUP BY billNo"); // GROUP BY billNo
			list = query.list();
		} catch (RuntimeException e) {
			Log.error("Error in getAllUnits", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}
}
