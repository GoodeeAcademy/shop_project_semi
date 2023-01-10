package dao.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Emp;
import vo.Notice;

public class NoticeDao {
	
	// 1. 직원
	// 공지 추가
	public int insertNotice(Connection conn, Notice notice, Emp loginEmp) throws Exception{
		int row = 0;
		String sql = "INSERT INTO notice(notice_title, notice_content, emp_name)\r\n"
				+ "VALUES(?, ?, ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setString(3, loginEmp.getEmpName());
		row = stmt.executeUpdate();
		return row;
	}
	
	// 공지 수정
	public int updateNotice(Connection conn, int noticeCode, Notice notice) throws Exception{
		int row = 0;
		String sql = "UPDATE notice SET notice_title = ?, notice_content = ?\r\n"
				+ "WHERE notice_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setInt(3, noticeCode);
		row = stmt.executeUpdate();
		return row;
	}
	
	// 공지 삭제
	public int deleteNotice(Connection conn, int noticeCode) throws Exception{
		int row = 0;
		String sql = "DELETE FROM notice\r\n"
				+ "WHERE notice_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeCode);
		row = stmt.executeUpdate();
		return row;
	}
	
	// 2. 공통
	// 공지 목록
	public ArrayList<Notice> selectNoticeList(Connection conn, int beginRow, int rowPerPage) throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		String sql = "SELECT notice_code noticeCode\r\n"
				+ "		, notice_title noticeTitle\r\n"
				+ "		, notice_content noticeContent\r\n"
				+ "		, emp_name empName\r\n"
				+ "		, createdate\r\n"
				+ "FROM notice\r\n"
				+ "ORDER BY createdate DESC \r\n"
				+ "LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice n = new Notice();
			n.setNoticeCode(rs.getInt("noticeCode"));
			n.setNoticeTitle(rs.getString("noticeTitle"));
			n.setNoticeContent(rs.getString("noticeContent"));
			n.setEmpName(rs.getString("empName"));
			n.setCreatedate(rs.getString("createdate"));
			list.add(n);
		}
		return list;
	}
	
	// 공지 총 개수
	public int selectNoticeCount(Connection conn) throws Exception{
		int count = 0;
		String sql = "SELECT COUNT(*) count FROM notice";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		return count;
	}
	
	// 공지 상세보기
	public Notice selectNoticeOne(Connection conn, int noticeCode) throws Exception{
		Notice notice = null;
		String sql = "SELECT notice_code noticeCode\r\n"
				+ "		, notice_title noticeTitle\r\n"
				+ "		, notice_content noticeContent\r\n"
				+ "		, emp_name empName\r\n"
				+ "		, createdate\r\n"
				+ "FROM notice\r\n"
				+ "WHERE notice_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			notice = new Notice();
			notice.setNoticeCode(rs.getInt("noticeCode"));
			notice.setNoticeTitle(rs.getString("noticeTitle"));
			notice.setNoticeContent(rs.getString("noticeContent"));
			notice.setEmpName(rs.getString("empName"));
			notice.setCreatedate(rs.getString("createdate"));
		}
		return notice;
	}
}
