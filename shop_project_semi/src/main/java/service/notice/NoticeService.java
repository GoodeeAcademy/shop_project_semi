package service.notice;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.notice.NoticeDao;
import util.DBUtil;
import vo.Emp;
import vo.Notice;

public class NoticeService {
	private NoticeDao noticeDao = new NoticeDao();
	
	// 1. 직원
	// 공지 추가
	public int addNotice(Notice notice, Emp loginEmp) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = noticeDao.insertNotice(conn, notice, loginEmp);
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
	
	// 공지 수정
	public int motifyNotice(int noticeCode, Notice notice) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = noticeDao.updateNotice(conn, noticeCode, notice);
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
	
	// 공지 삭제
	public int removeNotice(int noticeCode) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = noticeDao.deleteNotice(conn, noticeCode);
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
	
	// 2. 공통
	// 공지 목록
	public ArrayList<Notice> getNoticeList(int beginRow, int rowPerPage){
		ArrayList<Notice> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = noticeDao.selectNoticeList(conn, beginRow, rowPerPage);
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
	
	// 공지 총 개수
	public int getNoticeCount() {
		int count = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			count = noticeDao.selectNoticeCount(conn);
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
	
	// 공지 상세보기
	public Notice getNoticeOne(int noticeCode) {
		Notice notice = new Notice();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			notice = noticeDao.selectNoticeOne(conn, noticeCode);
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
		return notice;
	}
}
