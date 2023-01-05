package service.customer;

import java.sql.*;
import java.util.ArrayList;

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
			String duplicateId = customerDao.duplicateId(conn, paramCustomer);
			if(duplicateId != null) {
				return row;
			}
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
	
	public ArrayList<Customer> getCustomerListByAll() {
		ArrayList<Customer> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			list = customerDao.customerListByAll(conn);
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
		
		return list;
	}
	
	public int getModifyCustomerName(Customer customer) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			row = customerDao.modifyCustomer(conn, customer);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (Exception e1) {
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
	
	public int getModifyCustomerPw(Customer customer) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			/*  pw 히스토리 조회 
			 *  > 변경 기록 3회 이상 -> 가장 예전에 만들어진 기록 삭제;
			 *  > 이전 변경값 조회 -> 중복 값 없을 시 변경
			 *  > history에도 추가
			 */
			int pwHistoryCnt = customerDao.pwHistoryCnt(conn, customer);
			if(pwHistoryCnt >= 3) {
				System.out.println("갯수 제한 걸림");
				for(int i=pwHistoryCnt; i<3;) {
					boolean removePwHistory = customerDao.removePwHistory(conn, customer);
					System.out.println("갯수 삭제");
					if(removePwHistory) {
						pwHistoryCnt = customerDao.pwHistoryCnt(conn, customer);
						System.out.println("갯수 재계산");
					}
				}
			} else {
				System.out.println("갯수 제한 통과");
				boolean dupPw = customerDao.duplicatePw(conn, customer);
				System.out.println("비밀번호 중복검사");
				if(dupPw) {
					new Exception();
					System.out.println("비밀번호 중복");
				} else {
					row = customerDao.modifyCustomerPw(conn, customer);
					System.out.println("비밀번호 수정완료");
					//add pw_history
				}
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	public int getRemoveCustomer(Customer customer) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			row = customerDao.removeCustomer(conn, customer);
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
}
