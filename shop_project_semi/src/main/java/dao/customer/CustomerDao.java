package dao.customer;

import java.sql.*;
import java.util.*;

import vo.Customer;

public class CustomerDao {
	public int addCustomer(Connection conn, Customer paramCustomer) throws Exception {
		int row = 0;
		String sql ="INSERT INTO"
				+ " customer(customer_id, customer_pw, customer_name, customer_phone, point, createdate, updatedate)"
				+ " VALUES(?, PASSWORD(?), ?, ?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramCustomer.getCustomerId());
		stmt.setString(2, paramCustomer.getCustomerPw());
		stmt.setString(3, paramCustomer.getCustomerName());
		stmt.setString(4, paramCustomer.getCustomerPhone());
		stmt.setInt(5, 0);
		
		row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	public Customer signIn(Connection conn, Customer paramCustomer) throws Exception {
		Customer resultCustomer = null;
		String sql = "SELECT * FROM customer WHERE customer_id = ? AND customer_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramCustomer.getCustomerId());
		stmt.setString(2, paramCustomer.getCustomerPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			resultCustomer = new Customer();
			resultCustomer.setCustomerId(rs.getString("customer_id"));
			resultCustomer.setCustomerName(rs.getString("customer_name"));
			resultCustomer.setCustomerPhone(rs.getString("customer_phone"));
			resultCustomer.setPoint(rs.getInt("point"));
		}
		
		rs.close();
		stmt.close();
		
		return resultCustomer;
	}
	
	public ArrayList<Customer> customerListByAll(Connection conn) throws Exception {
		ArrayList<Customer> list = new ArrayList<Customer>();
		String sql = "SELECT * FROM customer ORDER BY createdate DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Customer c = new Customer();
			c.setCustomerId(rs.getString("customer_id"));
			c.setCustomerName(rs.getString("customer_name"));
			c.setCustomerPhone(rs.getString("customer_phone"));
			c.setPoint(rs.getInt("point"));
			c.setCreatedate(rs.getString("createdate"));
			
			list.add(c);
		}
		rs.close();
		stmt.close();
		return list;
	}
	
	public int modifyCustomer(Connection conn, Customer paramCustomer) throws Exception {
		int row = 0;
		String sql = "UPDATE customer SET customer_name = ?, customer_phone = ?, updatedate = NOW()"
					+ " WHERE customer_id = ? AND customer_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramCustomer.getCustomerName());
		stmt.setString(2, paramCustomer.getCustomerPhone());
		stmt.setString(3, paramCustomer.getCustomerId());
		stmt.setString(4, paramCustomer.getCustomerPw());
		
		row = stmt.executeUpdate();
		
		stmt.close();
		return row;
	}
	
	public String duplicateId(Connection conn, Customer customer) throws Exception {
		String map = null;
		String sql = "SELECT t.id id"
				+ " FROM ((SELECT customer_id id FROM customer"
				+ "		UNION all"
				+ "		SELECT emp_id id FROM emp)"
				+ "		UNION all"
				+ "		SELECT id FROM outid) t"
				+ " WHERE t.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			System.out.println(rs.getString("id"));
			map = rs.getString("id");
		}
		return map;
	}
}
