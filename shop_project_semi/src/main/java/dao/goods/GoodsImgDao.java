package dao.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.GoodsImg;

public class GoodsImgDao {
	
	// 상품 전체 사진
	public ArrayList<GoodsImg> getAllGoodsImg(Connection conn, int goodsCode) throws Exception{
		ArrayList<GoodsImg> list = new ArrayList<GoodsImg>();
		String sql = "SELECT goods_img_code goodsImgCode\r\n"
				+ "		, goods_code goodsCode\r\n"
				+ "		, filename\r\n"
				+ "		, origin_name	originName\r\n"
				+ "		, content_type contentType\r\n"
				+ "		, createdate\r\n"
				+ "		, updatedate\r\n"
				+ "FROM goods_img\r\n"
				+ "WHERE goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			GoodsImg goodsImg = new GoodsImg();
			goodsImg.setGoodsImgCode(rs.getInt("goodsImgCode"));
			goodsImg.setGoodsCode(rs.getInt("goodsCode"));
			goodsImg.setFilename(rs.getString("filename"));
			goodsImg.setOriginName(rs.getString("originName"));
			goodsImg.setContentType(rs.getString("contentType"));
			goodsImg.setCreatedate(rs.getString("createdate"));
			goodsImg.setUpdatedate(rs.getString("updatedate"));
			list.add(goodsImg);
		}
		return list;
	}
		
	// 상품 수정
	public int updateGoodsImg(Connection conn, ArrayList<GoodsImg> list) throws Exception {
		PreparedStatement stmt = null;
		int result = 0;
		
		for(GoodsImg gi : list) {			
			String sql = "UPDATE goods_img gsi, goods gs \r\n"
					+ "SET filename = ?, origin_name = ?, content_type = ?, gsi.updatedate = gs.updatedate \r\n"
					+ "WHERE gsi.goods_code = gs.goods_code AND gsi.goods_img_code = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, gi.getFilename());
			stmt.setString(2, gi.getOriginName());
			stmt.setString(3, gi.getContentType());
			stmt.setInt(4, gi.getGoodsImgCode());
			System.out.println(gi.getGoodsImgCode());
			result = stmt.executeUpdate();
		}
		
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
	
	// 상품 삭제
	public int deleteGoodsImg(Connection conn, int goodsCode) throws Exception {
		String sql = "DELETE FROM goods_img WHERE goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		int result = stmt.executeUpdate();
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
	
	// 상품 추가
	public int insertGoodsImg(Connection conn, ArrayList<GoodsImg> list) throws Exception {
		PreparedStatement stmt = null;
		int result = 0;
		
		for(GoodsImg gi : list) {
			String sql = "INSERT INTO goods_img(goods_code, filename, origin_name, content_type) "
					+ "		VALUES(?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, gi.getGoodsCode());
			stmt.setString(2, gi.getFilename());
			stmt.setString(3, gi.getOriginName());
			stmt.setString(4, gi.getContentType());
			result = stmt.executeUpdate();
			System.out.println("GoodsImgDao result : "+result);
		}
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
}
