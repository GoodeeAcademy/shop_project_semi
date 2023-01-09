package service.question;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.question.QuestionDao;
import util.DBUtil;
import vo.Customer;
import vo.Question;
import vo.QuestionComment;

public class QuestionService {
	private QuestionDao questionDao;
	
	// 1. 문의
	// 1) 직원
	// 전체 문의 목록
	public ArrayList<Question> getQuestionListForEmp(int beginRow, int rowPerPage){
		ArrayList<Question> list = new ArrayList<Question>();
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = questionDao.selectQuestionListForEmp(conn, beginRow, rowPerPage);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 문의 총 개수
	public int getCountQuestionListForEmp() {
		int count = 0;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			count = questionDao.selectCountQuestionListForEmp(conn);
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
	
	// 2) 고객
	// 전체 문의 목록
	public ArrayList<Question> getQuestionListForCustomer(Customer loginCustomer, int beginRow, int rowPerPage){
		ArrayList<Question> list = new ArrayList<Question>();
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = questionDao.selectQuestionListForCustomer(conn, loginCustomer, beginRow, rowPerPage);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 고객별 문의 총 개수
	public int getCountQuestionListForCustomer(Customer loginCustomer) {
		int count = 0;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			count = questionDao.selectCountQuestionListForCustomer(conn, loginCustomer);
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
	
	// 문의 삭제
	public int removeQuestion(int questionCode) {
		int row = 0;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = questionDao.deleteQuestion(conn, questionCode);
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
	
	// 문의하기
	public int addQuestion(Question question) {
		int row = 0;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = questionDao.insertQuestion(conn, question);
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
	
	// 2. 답변
	// 1) 직원
	// 전체 답변 목록
	public ArrayList<QuestionComment> getQuestionCommentListForEmp(int beginRow, int rowPerPage){
		ArrayList<QuestionComment> list = new ArrayList<QuestionComment>();
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = questionDao.selectQuestionCommenteListForEmp(conn, beginRow, rowPerPage);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 문의 총 개수
	public int getCountQuestionCommentListForEmp() {
		int count = 0;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			count = questionDao.selectCountQuestionCommentListForEmp(conn);
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
	
	// 1)2) 공통
	// 문의 상세보기
	public Question getQuestionOne(int questionCode){
		Question question = new Question();
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			question = questionDao.selectQuestionOne(conn, questionCode);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return question;
	}
	
	// 2) 고객
}
