package service.goods;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.GoodsDao;
import dao.GoodsImgDao;
import util.DBUtil;
import vo.Goods;
import vo.GoodsImg;

public class GoodsService {
	private GoodsDao goodsDao;
	private GoodsImgDao goodsImgDao;
	
	// 상품 리스트
	public ArrayList<HashMap<String, Object>> getGoodsList() {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			
			goodsDao = new GoodsDao();
			list = goodsDao.selectGoodsList(conn);
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	// 상품 상세 정보
	
	// 상품 수정
	
	// 상품 삭제
	
	// 상품 추가
	public int addGoods(Goods goods, GoodsImg goodsImg, String dir) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			
			goodsDao = new GoodsDao();
			HashMap<String, Integer> m = goodsDao.insertGoods(conn, goods);
			
			// 상품 등록 실패 시
			if(m.get("result") != 1) {
				throw new Exception();
			}
			
			goodsImgDao = new GoodsImgDao();
			goodsImg.setGoodsCode(m.get("autoKey"));
			
			result = goodsImgDao.insertGoodsImg(conn, goodsImg);
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
				
				File file = new File(dir + "\\" + goodsImg.getFileName());
				if(file.exists()) {
					file.delete();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) {conn.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
