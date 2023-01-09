package service.customer;

import java.sql.*;
import java.util.ArrayList;

import dao.customer.CustomerDao;
import util.DBUtil;
import vo.Customer;
import vo.CustomerAddress;

public class CustomerService {
	private CustomerDao customerDao;
	
	//회원가입(회원, 주소 등록)
	public int getAddCustomer(Customer paramCustomer, String Address) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			
			//ID중복체크 (customer, emp, outid)
			String duplicateId = customerDao.duplicateId(conn, paramCustomer);
			if(duplicateId != null) {
				return row;
			}
			//customer 등록
			row = customerDao.addCustomer(conn, paramCustomer);
			if(row == 1) {
				//성공시 주소 등록, 사용한 비밀번호 이력 등록
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
	
	//로그인
	public Customer getSingIn(Customer paramCustomer) {
		Customer resultCustomer = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			//로그인 
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
	
	//고객리스트 불러오기(전체)
	public ArrayList<Customer> getCustomerListByAll() {
		ArrayList<Customer> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			// 고객 전체 리스트 불러오기
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
	
	//고객 정보 수정(이름)
	public int getModifyCustomerName(Customer customer) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			//정보 수정(이름)
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
	
	//고객 비밀번호 수정
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
			
			//현재 ID 비밀번호랑 입력한 비밀번호 확인(본인확인기능)
			if(customerDao.checkPwById(conn, customer, passWord) != 1) {
				System.out.println("현재비밀번호 체크에러");
				throw new Exception();
			}
			
			//비밀번호 변경 이력 조회
			int pwHistoryCnt = customerDao.pwHistoryCnt(conn, customer);
			if(pwHistoryCnt >= 3) {
				System.out.println("갯수 제한 걸림");
				while(pwHistoryCnt >= 3) {
					// 이력 3회 이상시 가장 예전 이력 삭제
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
			
			//비밀번호 중복 검사
			boolean dupPw = customerDao.duplicatePw(conn, customer);
			System.out.println("비밀번호 중복검사");
			if(dupPw) {
				new Exception();
				System.out.println("비밀번호 중복");
			} else {
				// 비밀번호 변경
				row = customerDao.modifyCustomerPw(conn, customer);
				if(row != 0) {
					//비밀번호 변경 성공시 변경 이력 저장
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
	
	//회원 탈퇴
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
			
			//회원 정보, 주소, 비밀번호 변경이력 삭제 & 탈퇴한 ID 이력 생성
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
	
	//주소 가져오기
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
