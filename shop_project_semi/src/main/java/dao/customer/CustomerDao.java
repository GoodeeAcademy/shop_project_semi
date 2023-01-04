package dao.customer;

import java.sql.*;
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
		stmt.setInt(5, row);
		
		row = stmt.executeUpdate();
		return row;
	}
}
