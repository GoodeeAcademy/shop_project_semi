package dao.order;

import java.sql.*;

import vo.Orders;
import java.util.*;

public class OrderDao {
	public int addOrder(Connection conn, Orders order) throws Exception {
		int autoKey = 0;
		String sql = "INSERT"
				+ " INTO orders(customer_id, order_name, address, order_price, order_state, createdate)"
				+ " VALUES(?, ?, ?, ?, '결제', now());";
		PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		stmt.setString(1, order.getCustomerId());
		stmt.setString(2, order.getOrderName());
		stmt.setString(3, order.getAddress());
		stmt.setInt(4, order.getOrderPrice());
		int row = stmt.executeUpdate();
		System.out.println("return addOrder: "+row);
		ResultSet rs = stmt.getGeneratedKeys();
		if(rs.next()) {
			autoKey = rs.getInt(1);
		}
		
		rs.close();
		stmt.close();
		
		return autoKey;
	}
	
	public int addOrderGoods(Connection conn, int orderCode, int goodsCode, int price, int quantity) throws Exception {
		int row = 0;
		String sql = "INSERT"
				+ " INTO order_goods(order_code, goods_code, order_goods_price, order_goods_quantity)"
				+ " VALUES(?, ?, ?, ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orderCode);
		stmt.setInt(2, goodsCode);
		stmt.setInt(3, price);
		stmt.setInt(4, quantity);
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	public int addPointHistoryByUse(Connection conn, int orderCode, int point) throws Exception{
		int row = 0;
		String sql = "INSERT"
				+ " INTO point_history(order_code, point_kind, point, createdate)"
				+ " VALUES(?, '사용', ?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orderCode);
		stmt.setInt(2, point);
		
		row = stmt.executeUpdate();
		
		stmt.close();
		return row;
	}
	
	public ArrayList<Orders> getOrderList(Connection conn, String customerId) throws Exception {
		ArrayList<Orders> orderList= new ArrayList<Orders>();
		String sql = "SELECT * FROM orders WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Orders order = new Orders();
			order.setOrderCode(rs.getInt("order_code"));
			order.setCustomerId(rs.getString("customer_id"));
			order.setOrderName(rs.getString("order_name"));
			order.setOrderPrice(rs.getInt("order_price"));
			order.setOrderState(rs.getString("order_state"));
			order.setCreatedate(rs.getString("createdate"));
			
			orderList.add(order);
		}
		return orderList;
	}
	
	public HashMap<String, Object> getGoodsListByOrder(Connection conn, int orderCode) throws Exception {
		HashMap<String, Object> goodsList = null;
		String sql = "SELECT a.goodsCode goodsCode, a.goodsName goodsName, a.fileName fileName, a1.orderQuantity quantity\n"
				+ "FROM\n"
				+ "	(SELECT t.goodsCode goodsCode, t.goodsName goodsName, t.fileName fileName, t1.order_code orderCode FROM\n"
				+ "	 (SELECT g.goods_name goodsName, gi.fileName fileName, g.goods_code goodsCode FROM goods g INNER JOIN goods_img gi ON g.goods_code = gi.goods_code) t\n"
				+ "	  INNER JOIN\n"
				+ "	 (SELECT goods_code, order_code FROM order_goods WHERE order_code = ? ORDER BY goods_code ASC LIMIT 1) t1 ON t.goodsCode = t1.goods_code ) a\n"
				+ "	INNER JOIN \n"
				+ "	  	(SELECT order_code, (SELECT COUNT(*) FROM order_goods WHERE order_code = ?) orderQuantity FROM orders WHERE order_code = ?) a1\n"
				+ "	ON a.orderCode = a1.order_code";
		//뽑아야하는거 ORDER CODE 최상단
		//해당 오더 코드에서 1번 굿즈 이름, 사진 -> 쿼리 완성
		// 총 굿즈 갯수 -> order quantity
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orderCode);
		stmt.setInt(2, orderCode);
		stmt.setInt(3, orderCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			goodsList = new HashMap<String,Object>();
	
			goodsList.put("goodsCode", rs.getInt("goodsCode"));
			goodsList.put("goodsName", rs.getString("goodsName"));
			goodsList.put("fileName", rs.getString("fileName"));
			goodsList.put("quantity", rs.getInt("quantity"));
		}
		
		rs.close();
		stmt.close();
		
		return goodsList;
	}
}
