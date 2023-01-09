package dao.customer;

import java.sql.*;
import java.util.*;

import vo.Customer;
import vo.CustomerAddress;

public class CustomerDao {
	
	//회원가입
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
	
	//회원가입(주소)
	public int addCustomerAddress(Connection conn, Customer paramCustomer, String address) throws Exception{
		int row = 0;
		String sql ="INSERT INTO customer_address(customer_id, address, createdate, updatedate)"
				+ " VALUES(?, ?, (SELECT createdate FROM customer WHERE customer_id = ?)"
				+ ",(SELECT updatedate FROM customer WHERE customer_id = ?))";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramCustomer.getCustomerId());
		stmt.setString(2, address);
		stmt.setString(3, paramCustomer.getCustomerId());
		stmt.setString(4, paramCustomer.getCustomerId());
		
		row = stmt.executeUpdate();
		
		stmt.close();
		
		return row;
	}
	
	//로그인기능
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
	
	//모든 회원 리스트 출력
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
	
	//회원 이름 수정
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
	
	//ID 중복 확인(회원가입)
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
		
		rs.close();
		stmt.close();
		
		return map;
	}
	
	//비밀번호 변경 이력 확인
	public int pwHistoryCnt(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "SELECT COUNT(*) cnt FROM pw_history WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			row = rs.getInt("cnt");
		}
		
		rs.close();
		stmt.close();
		
		return row;
	}
	
	//비밀번호 변경 이력 삭제(가장 예전)
	public boolean removePwHistory(Connection conn, Customer customer) throws Exception {
		boolean result = false;
		String sql = "DELETE FROM pw_history WHERE customer_id = ? ORDER BY createdate ASC LIMIT 1";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		if(stmt.executeUpdate() != 0) {
			result = true;
		}
		stmt.close();
		return result;
	}
	
	//회원탈퇴 시 비밀번호 변경 이력 전부 삭제
	public boolean removePwHistoryAll(Connection conn, Customer customer) throws Exception {
		boolean result = false;
		String sql = "DELETE FROM pw_history WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		if(stmt.executeUpdate() != 0) {
			result = true;
		}
		stmt.close();
		return result;
	}
	
	//비밀번호 중복여부 확인(현재 + 변경이력)
	public boolean duplicatePw(Connection conn, Customer customer) throws Exception {
		boolean dup = false;
		String sql = "SELECT pw"
				+ " FROM (SELECT customer_pw pw FROM customer WHERE customer_id = ?"
				+ "		UNION ALL"
				+ "		SELECT pw FROM pw_history WHERE customer_id = ?) c"
				+ " WHERE c.pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerId());
		stmt.setString(3, customer.getCustomerPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			System.out.println("현재 비밀번호 중복");
			dup = true;
		}
		rs.close();
		stmt.close();
		return dup;
	}
	
	//비밀번호 변경
	public int modifyCustomerPw(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "UPDATE customer SET customer_pw = PASSWORD(?), updatedate = NOW() WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerPw());
		stmt.setString(2, customer.getCustomerId());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	//비밀번호 변경시 이력에 추가
	public int insertPwHistory(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql ="INSERT INTO pw_history(customer_id, pw, createdate) VALUES(?, PASSWORD(?), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPw());
		row = stmt.executeUpdate();
		
		stmt.close();
		return row;
	}
	
	//현재 비밀번호 맞는지 체크
	public int checkPwById(Connection conn, Customer customer, String passWord) throws Exception {
		int row = 0;
		String sql = "SELECT COUNT(*) cnt FROM customer WHERE customer_id = ? AND customer_pw = PASSWORD(?) ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, passWord);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			row = rs.getInt("cnt");
		}
		
		rs.close();
		stmt.close();
		
		return row;
	}
	
	//회원 탈퇴
	public int removeCustomer(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "DELETE FROM customer WHERE customer_id = ? AND customer_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPw());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	//회원 탈퇴 시 회원 주소 삭제
	public int removeCustomerAdd(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "DELETE FROM customer_address WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	//회원탈퇴시 ID사용이력에 추가
	public int addCustomerIdByOutId(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "INSERT INTO outid(id, createdate) VALUES(?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	//주소 가져오기
	public CustomerAddress selectAddress(Connection conn, Customer customer) throws Exception {
		CustomerAddress result = null;
		String sql = "SELECT * FROM customer_address WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			result = new CustomerAddress();
			result.setAddressCode(rs.getInt("address_code"));
			result.setCustomerId(rs.getString("customer_id"));
			result.setAddress(rs.getString("address"));
		}
		return result;
	}

}
