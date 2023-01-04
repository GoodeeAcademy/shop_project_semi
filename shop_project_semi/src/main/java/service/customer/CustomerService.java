package service.customer;

import java.sql.*;

import dao.customer.CustomerDao;
import util.DBUtil;
import vo.Customer;

public class CustomerService {
	private CustomerDao customerDao;
	
	public int getAddCustomer(Customer paramCustomer) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			row = customerDao.addCustomer(conn, paramCustomer);
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
	
	public Customer getSingIn(Customer paramCustomer) {
		Customer resultCustomer = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			resultCustomer = customerDao.signIn(conn, paramCustomer);
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
		return resultCustomer;
	}
}
