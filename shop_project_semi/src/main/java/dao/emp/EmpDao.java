package dao.emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	// 직원 로그인
	public Emp selectEmpByIdAndPw(Connection conn, Emp emp) throws Exception{
		Emp loginEmp = null;
		String sql = "SELECT emp_code empCode\r\n"
				+ "		, emp_id empId\r\n"
				+ "		, emp_pw empPw\r\n"
				+ "		, emp_name empName\r\n"
				+ "		, active"
				+ "		, auth_code authCode"
				+ "		, createdate, updatedate\r\n"
				+ "FROM emp\r\n"
				+ "WHERE emp_id = ? AND emp_pw=PASSWORD(?);";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, emp.getEmpId());
		stmt.setString(2, emp.getEmpPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			loginEmp = new Emp();
			loginEmp.setEmpCode(rs.getInt("empCode"));
			loginEmp.setEmpId(rs.getString("empId"));
			loginEmp.setEmpPw(rs.getString("empPw"));
			loginEmp.setEmpName(rs.getString("empName"));
			loginEmp.setActive(rs.getString("active"));
			loginEmp.setAuthCode(rs.getInt("authCode"));
			loginEmp.setCreatedate(rs.getString("createdate"));
			loginEmp.setUpdatedate(rs.getString("updatedate"));
		}
		return loginEmp;
	}
	
	// 직원 정보 select
	public Emp selectEmpOne(Connection conn, String empId) throws Exception{
		Emp emp = null;
		String sql = "SELECT emp_code empCode\r\n"
				+ "		, emp_id empId\r\n"
				+ "		, emp_pw empPw\r\n"
				+ "		, emp_name empName\r\n"
				+ "		, active"
				+ "		, auth_code authCode"
				+ "		, createdate, updatedate\r\n"
				+ "FROM emp\r\n"
				+ "WHERE emp_id = ?;";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, empId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			emp = new Emp();
			emp.setEmpCode(rs.getInt("empCode"));
			emp.setEmpId(rs.getString("empId"));
			emp.setEmpPw(rs.getString("empPw"));
			emp.setEmpName(rs.getString("empName"));
			emp.setActive(rs.getString("active"));
			emp.setAuthCode(rs.getInt("authCode"));
			emp.setCreatedate(rs.getString("createdate"));
			emp.setUpdatedate(rs.getString("updatedate"));
		}
		return emp;
	}
	
	// 직원 가입
	public int insertEmp(Connection conn, Emp emp) throws Exception{
		int row = 0;
		String sql = "INSERT INTO emp(emp_id, emp_pw, emp_name, active, auth_code, createdate, updatedate) "
				+ "VALUES(?, PASSWORD(?), ?, 'N', 3, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, emp.getEmpId());
		stmt.setString(2, emp.getEmpPw());
		stmt.setString(3, emp.getEmpName());
		row = stmt.executeUpdate();
		return row;
	}
	
	// 아이디 중복 확인 (true == 중복 아이디 있음 == 사용 불가)
	public boolean selectDuplicatedId(Connection conn, String empId) throws Exception{
		boolean check = false;
		String sql = "SELECT t.id id\r\n"
				+ "FROM((SELECT emp_id id FROM emp\r\n"
				+ "		UNION\r\n"
				+ "		SELECT customer_id id FROM customer)\r\n"
				+ "		UNION\r\n"
				+ "		SELECT id FROM outid) t\r\n"
				+ "WHERE t.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, empId);	// 로그인 중인 직원아이디
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {	// 일치하는 아이디가 있다면
			check = true;
		}
		return check;
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
	
	// 직원 비밀번호 수정
	public int updateEmpPw(Connection conn, Emp loginEmp, String newPw) throws Exception{
		int row = 0;
		String sql = "UPDATE emp \r\n"
				+ "SET emp_pw = PASSWORD(?), updatedate = NOW()\r\n"
				+ "WHERE emp_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, newPw);
		stmt.setString(2, loginEmp.getEmpId());
		row = stmt.executeUpdate();
		return row;
	}
	
	// 직원 목록
	public ArrayList<Emp> selectEmpList(Connection conn, int beginRow, int rowPerPage) throws Exception{
		ArrayList<Emp> list = new ArrayList<Emp>();
		String sql = "SELECT emp_code empCode\r\n"
				+ "		, emp_id empId\r\n"
				+ "		, emp_pw empPw\r\n"
				+ "		, emp_name empName\r\n"
				+ "		, active\r\n"
				+ "		, auth_code authCode\r\n"
				+ "		, createdate, updatedate\r\n"
				+ "FROM emp \r\n"
				+ "ORDER BY createdate DESC \r\n"
				+ "LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Emp e = new Emp();
			e.setEmpCode(rs.getInt("empCode"));
			e.setEmpId(rs.getString("empId"));
			e.setEmpPw(rs.getString("empPw"));
			e.setEmpName(rs.getString("empName"));
			e.setActive(rs.getString("active"));
			e.setAuthCode(rs.getInt("empCode"));
			e.setCreatedate(rs.getString("createdate"));
			e.setUpdatedate(rs.getString("updatedate"));
			list.add(e);
		}
		return list;
	}
	
	// 직원 수(마지막 페이지 구하기 위함)
	public int selectCountEmpList(Connection conn) throws Exception{
		int count = 0;
		String sql = "SELECT COUNT(*) FROM emp";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("COUNT(*)");
		}
		return count;
	}
	
	// 관리자: 직원 삭제
	public int deleteEmp(Connection conn, String empId) throws Exception{
		int row = 0;
		String sql = "DELETE FROM emp\r\n"
				+ "WHERE emp_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, empId);
		row = stmt.executeUpdate();
		return row;
	}
	
	// 삭제 직원 outid로
	public int insertOutEmp(Connection conn, String empId) throws Exception{
		int row = 0;
		String sql = "INSERT INTO outid(id) VALUES(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, empId);
		row = stmt.executeUpdate();
		return row;
	}
}