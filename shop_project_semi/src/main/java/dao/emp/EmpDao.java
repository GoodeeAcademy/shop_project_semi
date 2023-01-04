package dao.emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.Emp;

public class EmpDao {
	// 비밀번호 일치 확인 (true == 일치)
	public boolean selectPw(Connection conn, Emp loginEmp, String empPw) throws Exception{
		boolean check = false;
		String sql = "SELECT * FROM emp WHERE emp_id = ? AND emp_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, loginEmp.getEmpId());	// 로그인 중인 직원아이디
		stmt.setString(2, empPw);  	// 현재 입력한 비밀번호
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {	// 비밀번호가 일치한다면
			check = true;
		}
		return check;
	}
	
	// 직원 정보 select
	public Emp selectEmpOne(Connection conn, String empId) throws Exception{
		Emp emp = new Emp();
		String sql = "SELECT emp_code empCode\r\n"
				+ "		, emp_id empId\r\n"
				+ "		, emp_pw empPw\r\n"
				+ "		, emp_name empName\r\n"
				+ "		, ACTIVE, auth_code, createdate, updatedate\r\n"
				+ "FROM emp\r\n"
				+ "WHERE emp_id = ?;";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, empId);
		return emp;
	}
	
	// 직원 가입
	public int insertEmp(Connection conn, Emp emp) throws Exception{
		int row = 0;
		String sql = "INSERT INTO emp(emp_id, emp_pw, emp_name) "
				+ "VALUES(?, PASSWORD(?), ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, emp.getEmpId());
		stmt.setString(2, emp.getEmpPw());
		stmt.setString(3, emp.getEmpName());
		row = stmt.executeUpdate();
		return row;
	}
	
	// 직원 정보 수정
	public int updateEmp(Connection conn, Emp loginEmp, String newName) throws Exception{
		int row = 0;
		String sql = "UPDATE emp \r\n"
				+ "SET emp_name = ?, updatedate = NOW()\r\n"
				+ "WHERE emp_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, newName);
		stmt.setString(2, loginEmp.getEmpId());
		row = stmt.executeUpdate();
		return row;
	}
	
	// 직원 삭제
	public int deleteEmp(Connection conn) {
		int row = 0;
		
		return row;
	}
	
}