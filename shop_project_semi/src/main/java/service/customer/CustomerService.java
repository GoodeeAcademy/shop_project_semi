package service.customer;

import java.sql.*;
import java.util.ArrayList;

import dao.customer.CustomerDao;
import util.DBUtil;
import vo.Customer;
import vo.CustomerAddress;

public class CustomerService {
	private CustomerDao customerDao;
	
	public int getAddCustomer(Customer paramCustomer, String Address) {
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
			if(row == 1) {
				customerDao.addCustomerAddress(conn, paramCustomer, Address);
				customerDao.insertPwHistory(conn, paramCustomer);
			} else {
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
	
	public int getModifyCustomerPw(Customer customer, String passWord) {
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
			
			//현재 비밀번호랑 입력한 비밀번호 확인?..
			if(customerDao.checkPwById(conn, customer, passWord) != 1) {
				System.out.println("현재비밀번호 체크에러");
				throw new Exception();
			}
			
			
			int pwHistoryCnt = customerDao.pwHistoryCnt(conn, customer);
			if(pwHistoryCnt >= 3) {
				System.out.println("갯수 제한 걸림");
				while(pwHistoryCnt >= 3) {
					boolean removePwHistory = customerDao.removePwHistory(conn, customer);
					System.out.println(removePwHistory);
					System.out.println("갯수 삭제");
					if(removePwHistory) {
						pwHistoryCnt = customerDao.pwHistoryCnt(conn, customer);
						System.out.println("갯수 재계산");
					}
				}
			} 
			
			System.out.println("갯수 제한 통과");
			boolean dupPw = customerDao.duplicatePw(conn, customer);
			System.out.println("비밀번호 중복검사");
			if(dupPw) {
				new Exception();
				System.out.println("비밀번호 중복");
			} else {
				row = customerDao.modifyCustomerPw(conn, customer);
				if(row != 0) {
					if(customerDao.insertPwHistory(conn, customer) != 0) {
						System.out.println("변경비밀번호 이력 저장 성공");
						
					} else {
						System.out.println("비밀번호 이력 저장 실패");
						throw new Exception();
					}
				}
				System.out.println("비밀번호 수정완료");
				//add pw_history
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
			
			System.out.println("회원탈퇴");
			/*
			if(customerDao.removeCustomerAdd(conn, customer) == 1) {
				customerDao.removeCustomer(conn, customer);
				customerDao.addCustomerIdByOutId(conn, customer);
				System.out.println("탈퇴한 id 이력등록");
			}
			*/
			
			if(customerDao.removeCustomerAdd(conn, customer) == 1
				&& customerDao.removePwHistoryAll(conn, customer)
				&& customerDao.removeCustomer(conn, customer) == 1
				&& customerDao.addCustomerIdByOutId(conn, customer) == 1) {
					row = 1;
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
	
	public CustomerAddress getAddress(Customer customer) {
		CustomerAddress result = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			result = customerDao.selectAddress(conn, customer);
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
}
