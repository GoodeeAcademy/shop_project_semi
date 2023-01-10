package service.review;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import dao.review.ReviewDao;
import util.DBUtil;
import vo.Review;

public class ReviewService {
	private ReviewDao reviewDao;
	
	// 리뷰 작성
	public int addReview(Review review) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			
			reviewDao = new ReviewDao();
			result = reviewDao.insertReview(conn, review);
			
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
		
		return result;
	}
	
	// 리뷰 작성 시 필요한 해당 상품 정보
	public HashMap<String, Object> getGoodsOneByReview(Review review) {
		HashMap<String, Object> m = null;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			
			reviewDao = new ReviewDao();
			m = reviewDao.selectGoodsOneByReview(conn, review);
			
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
}
