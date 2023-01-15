package dao.order;

import java.sql.*;

import vo.OrderGoods;
import vo.Orders;
import vo.PointHistory;

import java.util.*;

public class OrderDao {
	public int addOrder(Connection conn, Orders order) throws Exception {
		int autoKey = 0;
		String sql = "INSERT"
				+ " INTO orders(customer_id, order_name, address, order_price, createdate)"
				+ " VALUES(?, ?, ?, ?, now());";
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
				+ " INTO order_goods(order_code, goods_code, order_goods_price, order_goods_quantity, order_goods_state)"
				+ " VALUES(?, ?, ?, ?, '결제전')";
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
	
	// 포인트 적립 내역
	public int insertSavePointHistory(Connection conn, PointHistory pointHistory) throws Exception {
		String sql = "INSERT INTO point_history(order_code, point_kind, point, createdate)"
				+ " VALUES(?, '적립', ?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, pointHistory.getOrderCode());
		stmt.setInt(2, pointHistory.getPoint());

		int result = stmt.executeUpdate();
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
	
	/* 사용 X
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
	*/
	
	
	//실험용(Order 테이블에서 ID에 맞는 주문코드, 주문일 불러오기)
	public ArrayList<Orders> getOrder(Connection conn, String customerId) throws Exception {
		ArrayList<Orders> list = new ArrayList<Orders>();
		String sql = "SELECT * FROM orders WHERE customer_id = ? ORDER BY createdate DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Orders order = new Orders();
			order.setOrderCode(rs.getInt("order_code"));
			order.setCreatedate(rs.getString("createdate"));
			
			list.add(order);
		}
		return list;
	}
	
	//실험용(Order_goods 테이블에서 해당 주문코드에 맞는 내역 가져오기)
	public ArrayList<HashMap<String,Object>> getOrderGoods(Connection conn, int orderCode) throws Exception {
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		String sql = "SELECT og.goods_code gc, g.goods_name gn, og.order_goods_price gp, og.order_goods_quantity gq, og.order_goods_state gs, gi.filename fileName\n"
				+ "	FROM order_goods og\n"
				+ "	JOIN goods g ON og.goods_code = g.goods_code\n"
				+ "	JOIN goods_img gi ON g.goods_code = gi.goods_code\n"
				+ "	WHERE og.order_code = ? ORDER BY og.goods_code ASC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orderCode);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String,Object>();
			map.put("goodsCode", rs.getInt("gc"));
			map.put("goodsName", rs.getString("gn"));
			map.put("goodsPrice", rs.getInt("gp"));
			map.put("goodsQuantity", rs.getInt("gq"));
			map.put("goodsState", rs.getString("gs"));
			map.put("fileName", rs.getString("fileName"));
			
			list.add(map);
		}
		return list;
	}
	
	//실험용 (order code에 따른 굿즈 개수 카운트)
	public int getOrderCount(Connection conn, int orderCode) throws Exception {
		int result = 0;
		String sql = "SELECT COUNT(*) cnt FROM order_goods WHERE order_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orderCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			result = rs.getInt("cnt");
		}
		return result;
	}
	
	
	// 주문 내역 조회
	public ArrayList<HashMap<String, Object>> getOrderList(Connection conn, String customerId) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		String sql = "SELECT od.order_code orderCode, od.createdate createdate, odg.goods_code goodsCode,"
				+ " odg.order_goods_price orderGoodsPrice, odg.order_goods_quantity orderGoodsQuantity, odg.order_goods_state orderState,"
				+ " gs.goods_name goodsName, gsi.filename filename"
				+ " FROM orders od JOIN order_goods odg ON od.order_code = odg.order_code"
				+ " JOIN goods gs ON odg.goods_code = gs.goods_code"
				+ " JOIN goods_img gsi ON gs.goods_code = gsi.goods_code"
				+ " WHERE customer_id = ?"
				+ " ORDER BY od.order_code DESC;";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("orderCode", rs.getInt("orderCode"));
			m.put("createdate", rs.getString("createdate"));
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("orderGoodsPrice", rs.getInt("orderGoodsPrice"));
			m.put("orderGoodsQuantity", rs.getInt("orderGoodsQuantity"));
			m.put("orderState", rs.getString("orderState"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("filename", rs.getString("filename"));
			list.add(m);
		}
		return list;
	}
	
	/* 사용 X
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
	*/
	
	
	
	public ArrayList<HashMap<String, Object>> getGoodsListAllByOrder(Connection conn, String orderCode) throws Exception {
		ArrayList<HashMap<String, Object>> goodsList = new ArrayList<HashMap<String, Object>>();
		String sql = "	SELECT *\n"
				+ "	FROM \n"
				+ "		(SELECT t.goods_code, t.price, t.quantity, t1.goods_name, t.orderState FROM\n"
				+ "			(SELECT goods_code, order_goods_price price, order_goods_quantity quantity, order_goods_state orderState FROM order_goods WHERE order_code = ?)t\n"
				+ "			INNER join\n"
				+ "			(SELECT goods_code, goods_name, goods_price FROM goods)t1 ON t.goods_code = t1.goods_code\n"
				+ "		) a1\n"
				+ "	INNER JOIN \n"
				+ "		(select goods_code, filename FROM goods_img)t2\n"
				+ "	 ON a1.goods_code = t2.goods_code";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orderCode);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			
			m.put("goodsCode", rs.getInt("goods_code"));
			m.put("quantity", rs.getInt("quantity"));
			m.put("price", rs.getInt("price"));
			m.put("orderState", rs.getString("orderState"));
			m.put("goodsName", rs.getString("goods_name"));
			m.put("fileName", rs.getString("filename"));
			
			goodsList.add(m);
		}
		
		return goodsList;
	}
	
	public HashMap<String,Object> getOrderInfoByCustomer(Connection conn, String orderCode) throws Exception {
		HashMap<String,Object> list = new HashMap<String,Object>();
		String sql = "SELECT a1.ID, a1.orderName, a1.address, a1.orderPrice, a1.createdate, a1.POINT, c.customer_phone phone\n"
				+ "FROM\n"
				+ "(SELECT o.customer_id ID, o.order_name orderName, o.address address, o.order_price orderPrice, o.createdate createdate, ph.point POINT\n"
				+ "	 FROM orders o INNER JOIN point_history ph ON o.order_code = ph.order_code WHERE o.order_code = ?) a1\n"
				+ "INNER JOIN\n"
				+ "customer c ON a1.ID = c.customer_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orderCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			list.put("ID", rs.getString("a1.ID"));
			list.put("address", rs.getString("a1.address"));
			list.put("orderName", rs.getString("a1.orderName"));
			list.put("orderPrice", rs.getInt("a1.orderPrice"));
			list.put("createdate", rs.getString("a1.createdate"));
			list.put("point", rs.getInt("a1.point"));
			list.put("phone", rs.getString("phone"));
		}
		rs.close();
		stmt.close();
		return list;
	}
	
	// 주문 상태 변경 (구매확정 링크 클릭 시 리뷰쓰기 링크로)
	public int updateOrderState(Connection conn, OrderGoods orderGoods) throws Exception {
		String sql = "UPDATE order_goods SET order_goods_state = '구매확정' WHERE order_code = ? AND goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orderGoods.getOrderCode());
		stmt.setInt(2, orderGoods.getGoodsCode());
		int result = stmt.executeUpdate();
		
		if(stmt != null) {stmt.close();}
		
		return result;
	}
	
	// 모든 주문 내역(관리자)
	public ArrayList<HashMap<String, Object>> selectAllOrderList(Connection conn, int beginRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		String sql = "SELECT od.order_code orderCode, od.createdate createdate, odg.goods_code goodsCode, od.customer_id customerId,\r\n"
				+ "odg.order_goods_price orderGoodsPrice, odg.order_goods_quantity orderGoodsQuantity, odg.order_goods_state orderState,\r\n"
				+ "gs.goods_name goodsName, gsi.filename filename\r\n"
				+ "FROM orders od\r\n"
				+ "JOIN order_goods odg ON od.order_code = odg.order_code\r\n"
				+ "JOIN goods gs ON odg.goods_code = gs.goods_code\r\n"
				+ "JOIN goods_img gsi ON gs.goods_code = gsi.goods_code\r\n"
				+ "ORDER BY od.order_code DESC\r\n"
				+ "LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("orderCode", rs.getInt("orderCode"));
			m.put("createdate", rs.getString("createdate"));
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("customerId", rs.getString("customerId"));
			m.put("orderGoodsPrice", rs.getInt("orderGoodsPrice"));
			m.put("orderGoodsQuantity", rs.getInt("orderGoodsQuantity"));
			m.put("orderState", rs.getString("orderState"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("filename", rs.getString("filename"));
			list.add(m);
		}
		return list;
	}
	
	// 모든 주문 내역 개수(관리자)
	public int selectAllOrderGoodsCount(Connection conn) throws Exception{
		int count = 0;
		String sql = "SELECT COUNT(*) cnt FROM order_goods";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("cnt");
		}
		return count;
	}
	
	// 주문 상태 변경(관리자)
	public int updateOrderStateByEmp(Connection conn, ArrayList<OrderGoods> list) throws Exception{
		int row = 0;
		PreparedStatement stmt = null;
		for(OrderGoods og : list) {			
			String sql = "UPDATE order_goods\r\n"
					+ "SET order_goods_state = ?\r\n"
					+ "WHERE order_code = ? AND goods_code = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, og.getOrderGoodsState());
			stmt.setInt(2, og.getOrderCode());
			stmt.setInt(3, og.getGoodsCode());
			row += stmt.executeUpdate();
		}
		
		if(stmt != null) {stmt.close();}
		
		return row;
	}
}
