package service.goods;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.goods.GoodsDao;
import dao.goods.GoodsImgDao;
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
	public HashMap<String, Object> getGoodsOne(int goodsCode) {
		HashMap<String, Object> m = null;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			
			goodsDao = new GoodsDao();
			m = goodsDao.selectGoodsOne(conn, goodsCode);
			
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
		
		return m;
	}
	
	// 해당 상품 리뷰 리스트
	public ArrayList<HashMap<String, Object>> getReviewByGoods(int goodsCode) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			
			goodsDao = new GoodsDao();
			list = goodsDao.selectReviewByGoods(conn, goodsCode);
			
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
	
	// 상품 수정
	public int modifyGoods(Goods goods, GoodsImg goodsImg, String dir) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			
			goodsDao = new GoodsDao();
			result = goodsDao.updateGoods(conn, goods);
			
			// 상품 수정 실패 시 
			if(result != 1) {
				System.out.println("GoodsService : updateGoods fail");
				throw new Exception();
			}
			
			goodsImgDao = new GoodsImgDao();
			result = goodsImgDao.updateGoodsImg(conn, goodsImg);
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
				
				File file = new File(dir + "\\" + goodsImg.getFilename());
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
	
	// 상품 삭제
	public int removeGoods(int goodsCode) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			
			goodsImgDao = new GoodsImgDao();
			result = goodsImgDao.deleteGoodsImg(conn, goodsCode);
			
			// 상품 삭제 실패 시
			if(result != 1) {
				throw new Exception();
			}
			
			goodsDao = new GoodsDao();
			result = goodsDao.deleteGoods(conn, goodsCode);
			
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
				if(conn != null) {conn.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
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
				
				File file = new File(dir + "\\" + goodsImg.getFilename());
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
