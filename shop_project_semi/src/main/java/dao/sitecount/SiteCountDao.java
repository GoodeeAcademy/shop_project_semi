package dao.sitecount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SiteCountDao {
	// 오늘 첫번째 접속자가 발생 insert : selectTodayCount() 호출의 결과가 0일때
	public int insertCounter(Connection conn) throws Exception {
		int row = 0;
		String sql = "INSERT INTO site_count(count_date, count_num) values(CURDATE(), 1)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		row = stmt.executeUpdate();
		if(stmt != null) {stmt.close();}
		return row;
	}
	// 오늘 첫번째 접속자가 아닐때 update : : selectTodayCount() 호출의 결과가 0이 아닐때
	public int updateCounter(Connection conn) throws Exception {
		int row = 0;
		String sql = "UPDATE site_count SET count_num = count_num+1"
					+ " WHERE count_date = CURDATE()";
		PreparedStatement stmt = conn.prepareStatement(sql);
		row = stmt.executeUpdate();
		if(stmt != null) {stmt.close();}
		return row;
	}
	
	// 오늘 접속자 수 확인 select
	public int selectTodayCount(Connection conn) throws Exception {
		int todayCount = 0;
		String sql = "SELECT count_num countNum FROM site_count\r\n"
				+ "WHERE count_date = CURDATE()";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			todayCount = rs.getInt("countNum");
		}
		System.out.println("SiteCountDao todayCount: "+todayCount);
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		return todayCount;
	}
	// 전체 접속 수 확인 select
	public int selectTotalCount(Connection conn) throws Exception {
		int totalCount = 0;
		String sql = "SELECT SUM(count_num) totalCount FROM site_count";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			totalCount = rs.getInt("totalCount");
		}
		if(rs != null) {rs.close();}
		if(stmt != null) {stmt.close();}
		return totalCount;
	}
}
