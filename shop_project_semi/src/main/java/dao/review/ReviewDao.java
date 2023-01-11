package dao.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import vo.Review;

public class ReviewDao {
	// 리뷰 중복 검사 - 중복:true 중복아님:false
	public boolean selectDuplicateReview(Connection conn, Review review) throws Exception {
		boolean check = false;
		String sql = "SELECT order_code FROM review WHERE order_code = ? AND goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, review.getOrderCode());
		stmt.setInt(2, review.getGoodsCode());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) { 
			check = true; // 중복 
		}
		
		return check;
	}
	
	// 리뷰 작성 - 구매한 상품에 한해서
	public int insertReview(Connection conn, Review review) throws Exception {
		String sql = "INSERT INTO review(order_code, goods_code, review_memo, star, createdate) VALUES(?, ?, ?, ?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, review.getOrderCode());
		stmt.setInt(2, review.getGoodsCode());
		stmt.setString(3, review.getReviewMemo());
		stmt.setInt(4, review.getStar());
		int result = stmt.executeUpdate();
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
	
	// 리뷰 작성 시 필요한 해당 상품 정보
	public HashMap<String, Object> selectGoodsOneByReview(Connection conn, Review review) throws Exception {
		HashMap<String, Object> m = new HashMap<>();
		String sql = "SELECT odg.order_code orderCode, odg.goods_code goodsCode, odg.order_goods_price orderGoodsPrice, odg.order_goods_quantity orderGoodsQuantity, goods_name goodsName, filename"
				+ " FROM order_goods odg"
				+ " JOIN goods gs ON odg.goods_code = gs.goods_code"
				+ " JOIN goods_img gsi ON gs.goods_code = gsi.goods_code"
				+ " WHERE odg.order_code = ? AND odg.goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, review.getOrderCode());
		stmt.setInt(2, review.getGoodsCode());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			m.put("orderCode", rs.getInt("orderCode"));
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("orderGoodsPrice", rs.getInt("orderGoodsPrice"));
			m.put("orderGoodsQuantity", rs.getInt("orderGoodsQuantity"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("filename", rs.getString("filename"));
		}
		
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		
		return m;
	}
}
