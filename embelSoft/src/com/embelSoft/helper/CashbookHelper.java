package com.embelSoft.helper;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.embelSoft.bean.ProductBillingDtlForClientPaymentCashBookBean;
import com.embelSoft.dao.CashbookDao;

public class CashbookHelper {
	
	
	//coding for client cash book
	public Map getTotalAmountAndBalanceAmountByClientName(String fkClientId,String clientName) 
	{
		Map  map =  new HashMap();
		int count = 1;
		CashbookDao dao = new CashbookDao();
		List list= dao.getTotalAmountAndBalanceAmountByClientName(fkClientId,clientName);

		BigDecimal paidAmount = dao.getTotalClientPayment(fkClientId);
		if (paidAmount == null) {
			paidAmount = BigDecimal.valueOf(0);
		}
		Double paidAmt = 0.0;
		try {
			
			System.out.println("Paid Amount "+paidAmount);
			
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				
				ProductBillingDtlForClientPaymentCashBookBean bean = new ProductBillingDtlForClientPaymentCashBookBean();
				System.out.println(Arrays.toString(o));
				
				bean.setGrossTotal(Double.parseDouble(o[1].toString())+paidAmt);
				bean.setBalanceStatus(Double.parseDouble(o[1].toString()));
				System.out.println("***************"+o[0]);
				
				map.put(count,bean);
				count++;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return map;
	}

}
