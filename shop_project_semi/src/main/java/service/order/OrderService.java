package service.order;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.cart.CartDao;
import dao.customer.CustomerDao;
import dao.goods.GoodsDao;
import dao.order.OrderDao;
import dao.question.QuestionDao;
import dao.review.ReviewDao;
import util.DBUtil;
import vo.OrderGoods;
import vo.Orders;
import vo.Review;

public class OrderService {
	private OrderDao orderDao;
	private CustomerDao customerDao;
	private CartDao cartDao;
	private ReviewDao reviewDao;
	private GoodsDao goodsDao;
	private QuestionDao questionDao;
	
	//주문하기
	public String addOrder(Orders order, ArrayList<HashMap<String,Object>> cart, int point) {
		String row = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			this.orderDao = new OrderDao();
			this.cartDao = new CartDao();
			this.goodsDao = new GoodsDao();
			
			int orderCode = orderDao.addOrder(conn, order);
			if(orderCode == 0) {
				throw new Exception();
			} else {
				for (HashMap<String, Object> m : cart) {
					int goodsCode = (int)m.get("goodsCode");
					int quantity = (int)m.get("quantity");
					int price = (int)m.get("goodsPrice");
					if(orderDao.addOrderGoods(conn, orderCode, goodsCode, price, quantity) == 0) {
						throw new Exception();
					}
					for(int i = 0; i<quantity; i++) {
						if(goodsDao.updateHit(conn, goodsCode) == 0) {
							throw new Exception();
						}
					}
				}
				if(customerDao.modifyCustomerPoint(conn, order, point) == 0) {
					throw new Exception();
				} else {
					if(orderDao.addPointHistoryByUse(conn, orderCode, point) == 0) {
						throw new Exception();
					}
					if(cartDao.deleteCartAll(conn, order.getCustomerId()) == 0) {
						throw new Exception();
					}
					row = "주문, 포인트사용 성공";
				}
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	/*
	public ArrayList<HashMap<String,Object>> getOrderList(String customerId) {
		ArrayList<HashMap<String,Object>> orderList = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			orderList = new ArrayList<HashMap<String,Object>>();
			
			this.orderDao = new OrderDao();
			 ArrayList<Orders> list = orderDao.getOrderList(conn, customerId);
			 for(Orders orders : list) {
				 HashMap<String, Object> goodsList = orderDao.getGoodsListByOrder(conn, orders.getOrderCode());
				 goodsList.put("orderCode", orders.getOrderCode());
				 goodsList.put("customerId", orders.getCustomerId());
				 goodsList.put("orderName", orders.getOrderName());
				 goodsList.put("orderPrice", orders.getOrderPrice());
				 goodsList.put("orderState", orders.getOrderState());
				 goodsList.put("createdate", orders.getCreatedate());
				 
				 orderList.add(goodsList);
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}
	 */
	
	
	public ArrayList<HashMap<String,Object>> getOrder(String customerId) {
		ArrayList<HashMap<String, Object>> orderList = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			orderList = new ArrayList<HashMap<String,Object>>();
			
			ArrayList<Orders> list = orderDao.getOrder(conn, customerId);
			for(Orders orders : list) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("orderCode", orders.getOrderCode());
				map.put("createdate", orders.getCreatedate());
				int orderQuantity = orderDao.getOrderCount(conn, orders.getOrderCode());
				map.put("orderQuantity", orderQuantity);
				ArrayList<HashMap<String,Object>> arr1 = orderDao.getOrderGoods(conn, orders.getOrderCode());
				
				for(HashMap<String,Object> m : arr1) {
					Review review = new Review();
					review.setOrderCode(orders.getOrderCode());
					review.setGoodsCode((int)m.get("goodsCode"));
					
					// 리뷰 중복 검사
					
					this.reviewDao = new ReviewDao();
					boolean check = reviewDao.selectDuplicateReview(conn, review);
					
					if(check) { // 리뷰 썼으면
						m.put("check", "리뷰 작성 완료");
					}
					
					this.questionDao = new QuestionDao();
					boolean qCheck = questionDao.selectCommentPresence(conn, orders.getOrderCode(), (int)m.get("goodsCode"));
					
					if(qCheck) {
						m.put("qCheck", "답변 확인");
					}
					
				}
				
				map.put("goodsList", arr1);
					
				orderList.add(map);
			}
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return orderList;
	}
	
	
	// 주문 내역 조회 페이지  
	public ArrayList<HashMap<String,Object>> getOrderList(String customerId) {
		ArrayList<HashMap<String,Object>> orderList = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			orderList = new ArrayList<HashMap<String,Object>>();
			
			this.orderDao = new OrderDao();
			orderList = orderDao.getOrderList(conn, customerId); 
			
			ArrayList<HashMap<String, Object>> list = new ArrayList<>();
			for(HashMap<String, Object> m : orderList) {
				// vo
				Review review = new Review();
				review.setOrderCode((int)m.get("orderCode"));
				review.setGoodsCode((int)m.get("goodsCode"));
				
				// 리뷰 중복 검사
				this.reviewDao = new ReviewDao();
				boolean check = reviewDao.selectDuplicateReview(conn, review);
				
				if(check) { // 리뷰 썼으면
					m.put("check", "리뷰 작성 완료");
				}
				
				list.add(m);
			}
			orderList.addAll(list);
			
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}
	
	public ArrayList<HashMap<String,Object>> getOrderOne(String orderCode) {
		ArrayList<HashMap<String,Object>> orderOne = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.orderDao = new OrderDao();
			orderOne = orderDao.getGoodsListAllByOrder(conn, orderCode);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return orderOne;
		
	}
	
	public HashMap<String,Object> getOrderOneInfoCustomer(String orderCode) {
		HashMap<String,Object> orderInfo = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.orderDao = new OrderDao();
			orderInfo = orderDao.getOrderInfoByCustomer(conn, orderCode);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return orderInfo;
	}
	
	// 주문 상태 변경 (구매확정 링크 클릭 시 리뷰쓰기 링크로)
	public int modifyOrderState(OrderGoods orderGoods) {
		int result = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.orderDao = new OrderDao();
			result = orderDao.updateOrderState(conn, orderGoods);
			
			if(result != 1) {
				throw new Exception();
			}
			
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	// 모든 주문 내역 (관리자)
	public ArrayList<HashMap<String, Object>> getAllOrderList(int beginRow, int rowPerPage) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.orderDao = new OrderDao();
			list = orderDao.selectAllOrderList(conn, beginRow, rowPerPage);
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
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 모든 주문 내역 개수(관리자)
	public int getAllOrderGoodsCount() {
		int count = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.orderDao = new OrderDao();
			count = orderDao.selectAllOrderGoodsCount(conn);
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
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	// 주문 상태 변경(관리자)
	public int modifyOrderStateByEmp(ArrayList<OrderGoods> list) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.orderDao = new OrderDao();
			row = orderDao.updateOrderStateByEmp(conn, list);
			
			if(row < 1) {
				throw new Exception();
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
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
}
