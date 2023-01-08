package dao.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import vo.Cart;

public class CartDao {
	// 장바구니 중복 체크(같은 상품 체크) ->  , true: 중복이어서 장바구니 추가 x
	public boolean selectDuplicateCart(Connection conn, Cart cart) throws Exception {
		String sql = "SELECT goods_code FROM cart WHERE goods_code = ? AND customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cart.getGoodsCode());
		stmt.setString(2, cart.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		
		boolean check = false;
		if(rs.next()) {
			check = true;
		}
		
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		
		return check;
	}
	
	// 장바구니 담기
	public int insertCart(Connection conn, Cart cart) throws Exception {
		String sql = "INSERT INTO cart(goods_code, customer_id, cart_quantity, createdate) VALUES(?, ?, ?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cart.getGoodsCode());
		stmt.setString(2, cart.getCustomerId());
		stmt.setInt(3, cart.getCartQuantity());
		int result = stmt.executeUpdate();
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
	
	// 장바구니 리스트
	public ArrayList<HashMap<String, Object>> selectCartList(Connection conn, String customerId) throws Exception {
		String sql = "SELECT c.goods_code goodsCode, cart_quantity quantity, goods_name goodsName, goods_price goodsPrice, filename"
				+ " FROM cart c JOIN goods gs ON c.goods_code = gs.goods_code JOIN goods_img gsi ON gs.goods_code = gsi.goods_code"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("quantity", rs.getInt("quantity"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getInt("goodsPrice"));
			m.put("filename", rs.getString("filename"));
			list.add(m);
		}
		
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		
		return list;
	}
	
	// 장바구니 수정
	public int updateCart(Connection conn, ArrayList<Cart> list) throws Exception {
		PreparedStatement stmt = null;
		int result = 0;
		
		for(Cart c : list) {
			String sql = "UPDATE cart SET cart_quantity = ? WHERE goods_code = ? AND customer_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, c.getCartQuantity());
			stmt.setInt(2, c.getGoodsCode());
			stmt.setString(3, c.getCustomerId());
			result = stmt.executeUpdate();
		}
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
	
	// 장바구니 삭제
	public int deleteCart(Connection conn, Cart cart) throws Exception {
		String sql = "DELETE FROM cart WHERE goods_code = ? AND customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cart.getGoodsCode());
		stmt.setString(2, cart.getCustomerId());
		int result = stmt.executeUpdate();
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
}
