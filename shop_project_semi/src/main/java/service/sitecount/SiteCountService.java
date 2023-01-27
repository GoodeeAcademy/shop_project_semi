package service.sitecount;

import java.sql.Connection;
import java.sql.SQLException;

import dao.sitecount.SiteCountDao;
import util.DBUtil;

public class SiteCountService {
	SiteCountDao siteCountDao = new SiteCountDao();
	
	// 오늘 첫번째 접속자
	public void addCounter() {
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			siteCountDao.insertCounter(conn);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally {
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		}
	}
	
	// 오늘 첫번째 접속자 x
	public void modifyCounter() {
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			siteCountDao.updateCounter(conn);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally {
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		}
	}

	// 오늘 접속자 수 확인
	public int getTodayCount() {
		int todayCount = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			todayCount = siteCountDao.selectTodayCount(conn);
			System.out.println("SiteCountService todayCount : "+todayCount);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally {
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		}
		return todayCount;
	}
	// 전체 접속자 수 확인
	public int getTotalCount() {
		int totalCount = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			totalCount = siteCountDao.selectTotalCount(conn);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally {
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		}
		return totalCount;
	}
}
