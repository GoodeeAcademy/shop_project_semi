package service.emp;

import java.sql.Connection;
import java.sql.SQLException;

import dao.emp.EmpDao;
import util.DBUtil;
import vo.Emp;

public class EmpService {
	
	private EmpDao empDao;
	
	// 직원가입
	public int AddEmp(Emp emp) {
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = empDao.InsertEmp(conn, emp);
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
}
