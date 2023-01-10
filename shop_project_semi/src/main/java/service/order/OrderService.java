package service.order;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import dao.cart.CartDao;
import dao.customer.CustomerDao;
import dao.order.OrderDao;
import util.DBUtil;
import vo.Orders;

public class OrderService {
	private OrderDao orderDao;
	private CustomerDao customerDao;
	private CartDao cartDao;
	
	//주문하기
	public String addOrder(Orders order, ArrayList<HashMap<String,Object>> cart, int point) {
		String row = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			this.orderDao = new OrderDao();
			this.cartDao = new CartDao();
			
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
	
	public ArrayList<HashMap<String,Object>> getOrderList(String customerId) {
		 ArrayList<HashMap<String,Object>> orderList = new ArrayList<HashMap<String,Object>>();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
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
}
