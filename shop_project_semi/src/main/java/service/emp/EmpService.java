package service.emp;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.emp.EmpDao;
import util.DBUtil;
import vo.Emp;

public class EmpService {
	
	private EmpDao empDao;
	
	// 비밀번호 일치 확인
	public boolean getPw(Emp loginEmp, String empPw) {
		boolean check = false;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			check = empDao.selectPw(conn, loginEmp, empPw);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
	// 직원 로그인
	public Emp login(Emp emp) {
		Emp loginEmp = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			loginEmp = empDao.selectEmpByIdAndPw(conn, emp);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return loginEmp;
	}
	
	// 직원 정보
	public Emp getEmpOne(String empId) {
		Emp returnEmp = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			returnEmp = empDao.selectEmpOne(conn, empId);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return returnEmp;
	}
	
	// 직원가입
	public int addEmp(Emp emp) {
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = empDao.insertEmp(conn, emp);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// 아이디 중복 확인 (true == 중복 아이디 있음 == 사용 불가)
	public boolean getDuplicatedId(String empId) {
		boolean check = false;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			check = empDao.selectDuplicatedId(conn, empId);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
	// 직원 정보 수정
	public int modifyEmp(Emp changedEmp) {
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = empDao.updateEmp(conn, changedEmp);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// 직원 비밀번호 수정
	public int modifyEmpPw(Emp loginEmp, String newPw) {
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = empDao.updateEmpPw(conn, loginEmp, newPw);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// 직원 목록
	public ArrayList<Emp> getEmpList(int beginRow, int rowPerPage){
		ArrayList<Emp> list = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = empDao.selectEmpList(conn, beginRow, rowPerPage);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 직원 수
	public int getCountEmpList() {
		int count = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			count = empDao.selectCountEmpList(conn);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	// 관리자
	// 직원 삭제
	public int removeEmp(String empId) {
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = empDao.deleteEmp(conn, empId);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// 삭제 지원 outid로
	public int addOutEmp(String empId) {
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = empDao.insertOutEmp(conn, empId);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// 직원 활성화
	public int modifyEmpActive(String empId, boolean checked) {
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = empDao.updateEmpActive(conn, empId, checked);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// 모든 직원 등급
	public ArrayList<HashMap<String, Object>> getAuthCodeList(){
		ArrayList<HashMap<String, Object>> list = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = empDao.selectAuthCodeList(conn);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
