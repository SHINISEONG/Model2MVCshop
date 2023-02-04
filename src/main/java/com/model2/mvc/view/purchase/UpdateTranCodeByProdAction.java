package com.model2.mvc.view.purchase;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.purchase.vo.PurchaseVO;

public class UpdateTranCodeByProdAction extends Action {

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PurchaseService purchaseService = new PurchaseServiceImpl();
		PurchaseVO purchaseVO = new PurchaseVO();
		SearchVO searchVO = new SearchVO();
		
		HashMap<String,Object> saleMap =purchaseService.getSaleList(searchVO);
		String prodNo = request.getParameter("prodNo");
		String tranCode = request.getParameter("tranCode");
		String tranNo = (String)saleMap.get(prodNo);
		
		String searchCondition = request.getParameter("searchCondition");
		String searchKeyword = request.getParameter("searchKeyword");
		String page = request.getParameter("page");
		
		purchaseVO.setTranNo(Integer.parseInt(tranNo));
		purchaseVO.setTranCode(tranCode);
		
		purchaseService.updateTranCode(purchaseVO);
		
		return "forward:/listProduct.do?menu=manage&searchCondition="+searchCondition
				+"&searchKeyword="+searchKeyword
				+"&page="+page;
	}

}
