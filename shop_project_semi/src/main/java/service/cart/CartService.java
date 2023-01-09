package service.cart;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.cart.CartDao;
import util.DBUtil;
import vo.Cart;

public class CartService {
	private CartDao cartDao;
	
	// 장바구니 담기
	public int addCart(Cart cart) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			cartDao = new CartDao();
			boolean check = cartDao.selectDuplicateCart(conn, cart);
			if(check) { // 이미 내 카트에 있는 상품이면 -1 반환
				return -1;
			}
			
			result = cartDao.insertCart(conn, cart);
			
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
	
	// 장바구니 리스트
	public ArrayList<HashMap<String, Object>> getCartList(String customerId) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			cartDao = new CartDao();
			list = cartDao.selectCartList(conn, customerId);
			
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
		
		return list;
	}
	
	// 장바구니 수정
	public int modifyCart(ArrayList<Cart> list) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			cartDao = new CartDao();
			result = cartDao.updateCart(conn, list);
			
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
	
	// 장바구니 삭제
	public int removeCart(Cart cart) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			cartDao = new CartDao();
			result = cartDao.deleteCart(conn, cart);
			
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
}
