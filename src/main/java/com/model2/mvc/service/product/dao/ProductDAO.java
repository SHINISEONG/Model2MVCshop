package com.model2.mvc.service.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.product.vo.ProductVO;

public class ProductDAO {
	/// field
	/// constructor
	public ProductDAO() {
	}

	/// method
	public void insertProduct(ProductVO productVO) throws Exception {
		Connection con = DBUtil.getConnection();

		String sql = "INSERT INTO product VALUES(seq_product_prod_no.NEXTVAL, ?, ?, ?, ?, ?, sysdate)";
		
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, productVO.getProdName());
		stmt.setString(2, productVO.getProdDetail());
		stmt.setString(3, productVO.getManuDate());
		stmt.setInt(4, productVO.getPrice());
		stmt.setString(5, productVO.getFileName());
		stmt.executeUpdate();

		con.close();
	}// end of insertProduct()

	public ProductVO findProduct(int prodNo) throws Exception {
		Connection con = DBUtil.getConnection();
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM product WHERE PROD_NO = ?");
		stmt.setInt(1, prodNo);

		ResultSet rs = stmt.executeQuery();	
		
		ProductVO productVO = null;
		
		while (rs.next()) {
			productVO = new ProductVO();
			productVO.setProdNo(prodNo);
			
			productVO.setProdName(rs.getString("PROD_NAME"));
			productVO.setFileName(rs.getString("IMAGE_FILE"));
			productVO.setProdDetail(rs.getString("PROD_DETAIL"));
			productVO.setManuDate(rs.getString("MANUFACTURE_DAY"));
			productVO.setPrice(rs.getInt("PRICE"));
			productVO.setRegDate(rs.getDate("REG_DATE"));
			
		}
		con.close();
		return productVO;
	}// end of findProduct

	public HashMap<String, Object> getProductList(SearchVO searchVO) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "select * from PRODUCT ";
		if (searchVO.getSearchCondition() != null) {
				
			if (searchVO.getSearchCondition().equals("0")) {
				sql += " where PROD_NO='" + searchVO.getSearchKeyword() // searchCon�� 0�̸� ���̵�˻�
						+ "'";
			} else if (searchVO.getSearchCondition().equals("1")) {
				sql += " where PROD_NAME like '%" + searchVO.getSearchKeyword() // serchCon�� 1�̸� �̸� �˻�
						+ "%'";
			} else if (searchVO.getSearchCondition().equals("2")) {
				sql += " where PRICE='" + searchVO.getSearchKeyword() // serchCon�� 2�̸� ���� �˻�
				+ "'";
			}
		}
		sql += " order by PROD_NO";

		PreparedStatement stmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE); // ?�̺κ��� ����?
		ResultSet rs = stmt.executeQuery();

		rs.last();
		int total = rs.getRow();
		System.out.println("��ǰ�˻� �ο��� ��:" + total);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("count", new Integer(total)); // �� Ű count�� �� �˻� ��� �� �Ҵ�.

		rs.absolute(searchVO.getPage() * searchVO.getPageUnit() - searchVO.getPageUnit() + 1);
		// ������ page��ȣ(ex. 2) page�� ������ ��� ��(ex.3) - page�� ������ ��� ��+1(ex.4) =2)
		// 3*3-3+1 = 7
		// 1*3-4 = -1
		System.out.println("searchVO.getPage():" + searchVO.getPage());
		System.out.println("searchVO.getPageUnit():" + searchVO.getPageUnit());

		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		if (total > 0) { // �˻� ����� ������!
			
			for (int i = 0; i < searchVO.getPageUnit(); i++) {
				ProductVO vo = new ProductVO();

				vo.setProdNo(rs.getInt("PROD_NO"));
				vo.setProdName(rs.getString("PROD_NAME"));
				vo.setFileName(rs.getString("IMAGE_FILE"));
				vo.setProdDetail(rs.getString("PROD_DETAIL"));
				vo.setManuDate(rs.getString("MANUFACTURE_DAY"));
				vo.setPrice(rs.getInt("PRICE"));
				vo.setRegDate(rs.getDate("REG_DATE"));

				list.add(vo);
				if (!rs.next())
					break;
			}
		}
		System.out.println("list.size() : " + list.size());
		map.put("list", list); // "list"�� �˻���� �Ҵ�
		System.out.println("map().size() : " + map.size());

		con.close();

		return map;
	}// end of getProductList

	public void updateProduct(ProductVO productVO) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "UPDATE product SET prod_name=?, prod_detail=?, manufacture_day=?, price=?, image_file=?"
					+ "WHERE prod_no=?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, productVO.getProdName());
		stmt.setString(2, productVO.getProdDetail());
		stmt.setString(3, productVO.getManuDate());
		stmt.setInt(4, productVO.getPrice());
		stmt.setString(5, productVO.getFileName());
		stmt.setInt(6, productVO.getProdNo());
		stmt.executeUpdate();

		con.close();
	}// end of updateProduct

}
