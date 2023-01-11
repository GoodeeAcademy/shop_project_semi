package dao.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import vo.Goods;

public class GoodsDao {
	// 상품 리스트
	public ArrayList<HashMap<String, Object>> selectGoodsList(Connection conn) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		String sql = "SELECT gs.goods_code goodsCode, goods_name goodsName, goods_price goodsPrice, filename \r\n"
				+ "FROM goods gs JOIN goods_img gsi ON gs.goods_code = gsi.goods_code\r\n"
				+ "GROUP BY gs.goods_code";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getInt("goodsPrice"));
			m.put("filename", rs.getString("fileName"));
			list.add(m);
		}
		
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		
		return list;
	}
	
	// 상품 상세 정보
	public HashMap<String, Object> selectGoodsOne(Connection conn, int goodsCode) throws Exception {
		HashMap<String, Object> m = null;
		String sql = "SELECT gs.goods_code goodsCode, goods_name goodsName, goods_price goodsPrice, sold_out soldOut,"
				+ " emp_id empId, hit, filename, gs.createdate createdate, gs.updatedate updatedate"
				+ " FROM goods gs JOIN goods_img gsi ON gs.goods_code = gsi.goods_code"
				+ " WHERE gs.goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			m = new HashMap<>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getInt("goodsPrice"));
			m.put("soldOut", rs.getString("soldOut"));
			m.put("empId", rs.getString("empId"));
			m.put("hit", rs.getInt("hit"));
			m.put("filename", rs.getString("fileName"));
			m.put("createdate", rs.getString("createdate"));
			m.put("updatedate", rs.getString("updatedate"));
		}
		
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		
		return m;
	}
	
	// 해당 상품 리뷰 리스트
	public ArrayList<HashMap<String, Object>> selectReviewByGoods(Connection conn, int goodsCode) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		String sql = "SELECT review_memo reviewMemo, star, rv.createdate createdate, customer_id customerId"
				+ " FROM review rv JOIN orders ods ON rv.order_code = ods.order_code"
				+ " WHERE goods_code = ?;";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("reviewMemo", rs.getString("reviewMemo"));
			m.put("star", rs.getInt("star"));
			m.put("createdate", rs.getString("createdate"));
			m.put("customerId", rs.getString("customerId"));
			list.add(m);
		}
		
		return list;
	}
	
	// 상품 수정
	public int updateGoods(Connection conn, Goods goods) throws Exception {
		String sql = "UPDATE goods SET goods_name = ?, goods_price = ?, sold_out = ?, emp_id = ?, hit = ?, updatedate = NOW() WHERE goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, goods.getGoodsName());
		stmt.setInt(2, goods.getGoodsPrice());
		stmt.setString(3, goods.getSoldOut());
		stmt.setString(4, goods.getEmpId());
		stmt.setInt(5, goods.getHit());
		stmt.setInt(6, goods.getGoodsCode());
		
		int result = stmt.executeUpdate();
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
	
	// 상품 삭제
	public int deleteGoods(Connection conn, int goodsCode) throws Exception {
		String sql = "DELETE FROM goods WHERE goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		int result = stmt.executeUpdate();
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
	
	// 상품 추가
	public HashMap<String, Integer> insertGoods(Connection conn, Goods goods) throws Exception {
		String sql = "INSERT INTO goods(goods_name, goods_price, sold_out, emp_id, hit, createdate, updatedate) VALUES(?, ?, ?, ?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		stmt.setString(1, goods.getGoodsName());
		stmt.setInt(2, goods.getGoodsPrice());
		stmt.setString(3, goods.getSoldOut());
		stmt.setString(4, goods.getEmpId());
		stmt.setInt(5, goods.getHit());
		
		int result = stmt.executeUpdate();
		ResultSet rs = stmt.getGeneratedKeys(); 
		
		int autoKey = 0; 
		if(rs.next()) {
			autoKey = rs.getInt(1); // goods.goods_code AUTO_INCREMENT
		}
		
		HashMap<String, Integer> m = new HashMap<>();
		m.put("result", result);
		m.put("autoKey", autoKey);
		
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		
		return m;
	}
}
