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
		String sql = "SELECT goods_name goodsName, goods_price goodsPrice, filename FROM goods gs JOIN goods_img gsi ON gs.goods_code = gsi.goods_code";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getInt("goodsPrice"));
			m.put("filename", rs.getString("fileName"));
			list.add(m);
		}
		
		return list;
	}
	
	// 상품 상세 정보
	public void selectGoodsOne() throws Exception {
		
	}
	
	// 상품 수정
	public void updateGoods() throws Exception {
		
	}
	
	// 상품 삭제
	public void deleteGoods() throws Exception {
		
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
		
		return m;
	}
}
