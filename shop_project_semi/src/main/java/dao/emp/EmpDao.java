package dao.emp;

import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.Emp;

public class EmpDao {
	// 직원 가입
	public int InsertEmp(Connection conn, Emp emp) throws Exception{
		int row = 0;
		String sql = "INSERT INTO emp(emp_id, emp_pw, emp_name) VALUES(?, PASSWORD(?), ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, emp.getEmpId());
		stmt.setString(2, emp.getEmpPw());
		stmt.setString(3, emp.getEmpName());
		row = stmt.executeUpdate();
		return row;
	}
	// 직원 정보 수정
	public int UpdateEmp(Connection conn, Emp emp) throws Exception{
		int row = 0;
		
		return row;
	}
	
}