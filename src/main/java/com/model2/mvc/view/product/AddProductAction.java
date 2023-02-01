package com.model2.mvc.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.product.vo.ProductVO;

public class AddProductAction extends Action {

	public AddProductAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductVO productVO=new ProductVO();
		//TODO �信�� �Ѿ���� �Ķ���� �̸��̶� ������ �� Ȯ��!!!
		productVO.setProdName(request.getParameter("prodName"));
		productVO.setProdDetail(request.getParameter("prodDetail"));
		productVO.setManuDate(request.getParameter("manuDate"));
		productVO.setPrice(Integer.parseInt(request.getParameter("price")));
		productVO.setFileName(request.getParameter("fileName"));
		
		
		System.out.println(productVO);
		
		ProductService service=new ProductServiceImpl();
		service.addProduct(productVO);
		
		//TODO �Ʒ� resultPage navigating ��İ� URIȮ�� ö���� �ϱ� 
		return "forward:/user/findProduct.jsp";
		// ?���� ���� ��� �Ǵ���? <-- ���� : ��üũ�� view���������� js�� �ϰ� ��ǰ ��ȸ�� ��ǰ ��ȣ�� where������ �ɾ� ������ �ϹǷ� ������ 1�� �����⶧���� ���� 
	}// end of AddProduct execute()

}
