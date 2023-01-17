package service.review;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.customer.CustomerDao;
import dao.order.OrderDao;
import dao.review.ReviewDao;
import util.DBUtil;
import vo.Customer;
import vo.PointHistory;
import vo.Review;

public class ReviewService {
	private ReviewDao reviewDao;
	private CustomerDao customerDao;
	private OrderDao orderDao;
	
	// 리뷰 작성
	public int addReview(Review review, Customer customer, PointHistory pointHistory) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			
			reviewDao = new ReviewDao();
			result = reviewDao.insertReview(conn, review);
			
			if(result != 1) { // 리뷰 등록 실패
				System.out.println("리뷰 등록 실패");
				throw new Exception();
			} else { // 리뷰 등록 성공
				System.out.println("리뷰 등록 성공");
				customerDao = new CustomerDao();
				result = customerDao.modifySaveCustomerPoint(conn, customer);
				if(result != 1) { // 고객 포인트 적립 실패
					System.out.println("고객 포인트 적립 실패");
					throw new Exception();
				} else { // 고객 포인트 적립 성공
					System.out.println("고객 포인트 적립 성공");
					orderDao = new OrderDao();
					result = orderDao.insertSavePointHistory(conn, pointHistory);					
				}
			}
			
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
	
	// 별점 개수 분포
	public ArrayList<Integer> getStar() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.reviewDao = new ReviewDao();
			list = reviewDao.selectStar(conn);
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
	
}
