package dao.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import vo.Category;
import vo.Goods;

public class GoodsDao {
	// 상품 리스트 (메인)
	public ArrayList<HashMap<String, Object>> selectGoodsList(Connection conn) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		String sql = "SELECT gs.goods_code goodsCode, goods_name goodsName, goods_price goodsPrice, gs.category_code categoryCode, gs.hit hit, filename\r\n"
				+ "FROM goods gs JOIN goods_img gsi ON gs.goods_code = gsi.goods_code\r\n"
				+ "GROUP BY gs.goods_code\r\n"
				+ "ORDER BY hit DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getInt("goodsPrice"));
			m.put("categoryCode", rs.getInt("categoryCode"));
			m.put("hit", rs.getInt("hit"));
			m.put("filename", rs.getString("fileName"));
			list.add(m);
		}
		
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		
		return list;
	}
	
	// 상품 리스트(카테고리별, 신상품순)
	public ArrayList<HashMap<String, Object>> selectGoodsListByCategory(Connection conn, int categoryCode) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		String sql = "SELECT gs.goods_code goodsCode, goods_name goodsName, goods_price goodsPrice, gs.category_code categoryCode, gs.hit hit, gs.category_code, filename\r\n"
				+ "FROM goods gs JOIN goods_img gsi ON gs.goods_code = gsi.goods_code\r\n"
				+ "GROUP BY gs.goods_code HAVING gs.category_code = ?\r\n"
				+ "ORDER BY gs.createdate DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryCode);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getInt("goodsPrice"));
			m.put("categoryCode", rs.getInt("categoryCode"));
			m.put("hit", rs.getInt("hit"));
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
		String sql = "SELECT t.goods_code goodsCode\r\n"
				+ "		, c.category_code categoryCode\r\n"
				+ "		, c.category_name categoryName\r\n"
				+ "		, t.goods_name goodsName\r\n"
				+ "		, t.goods_price goodsPrice\r\n"
				+ "		, t.sold_out soldOut\r\n"
				+ "		, t.emp_id empId\r\n"
				+ "		, t.hit hit\r\n"
				+ "		, t.createdate createdate\r\n"
				+ "		, t.updatedate updatedate\r\n"
				+ "		, t.filename filename\r\n"
				+ "FROM (SELECT gs.goods_code goods_code, gs.category_code category_code, gs.goods_name goods_name, gs.goods_price goods_price, gs.hit hit, gs.sold_out sold_out, gs.emp_id emp_id, gs.createdate createdate, gs.updatedate updatedate, filename\r\n"
				+ "		FROM goods gs JOIN goods_img gsi ON gs.goods_code = gsi.goods_code) t INNER JOIN category c ON t.category_code = c.category_code\r\n"
				+ "WHERE t.goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			m = new HashMap<>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("categoryCode", rs.getInt("categoryCode"));
			m.put("categoryName", rs.getString("categoryName"));
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
		String sql = "INSERT INTO goods(category_code, goods_name, goods_price, sold_out, emp_id, hit, createdate, updatedate) VALUES(?, ?, ?, ?, ?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, goods.getCategoryCode());
		stmt.setString(2, goods.getGoodsName());
		stmt.setInt(3, goods.getGoodsPrice());
		stmt.setString(4, goods.getSoldOut());
		stmt.setString(5, goods.getEmpId());
		stmt.setInt(6, goods.getHit());
		
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
	
	//상품 주문시 hit + 1
	public int updateHit(Connection conn, int goodsCode) throws Exception {
		int row = 0;
		String sql = "UPDATE goods SET hit = hit+1 WHERE goods_code = ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		
		row = stmt.executeUpdate();
		
		if(stmt!=null) {
			stmt.close();
		}
		
		return row;
	}
	
	// 카테고리 목록
	public ArrayList<Category> selectCategoryList(Connection conn) throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		String sql = "SELECT category_code categoryCode, category_name categoryName FROM category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Category c = new Category();
			c.setCategoryCode(rs.getInt("categoryCode"));
			c.setCategoryName(rs.getString("categoryName"));
			list.add(c);
		}
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		return list;
	}
}
