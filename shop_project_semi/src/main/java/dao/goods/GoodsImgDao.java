package dao.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.GoodsImg;

public class GoodsImgDao {
	// 상품 추가
	public int insertGoodsImg(Connection conn, GoodsImg goodsImg) throws Exception {
		String sql = "INSERT INTO goods_img(goods_code, filename, origin_name, content_type, createdate, updatedate) "
				+ "VALUES(?, ?, ?, ?, (SELECT createdate FROM goods WHERE goods_code = "+ goodsImg.getGoodsCode() +"), "
						+ "(SELECT updatedate FROM goods WHERE goods_code = "+ goodsImg.getGoodsCode() +") )";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsImg.getGoodsCode());
		stmt.setString(2, goodsImg.getFileName());
		stmt.setString(3, goodsImg.getOriginName());
		stmt.setString(4, goodsImg.getContentType());
		
		int result = stmt.executeUpdate();
		
		return result;
	}
}
