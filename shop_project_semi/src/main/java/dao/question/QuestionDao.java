package dao.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Customer;
import vo.Question;

public class QuestionDao {
	// 1) 직원
	// 전체 문의 목록
	public ArrayList<Question> selectQuestionListForEmp(Connection conn, int beginRow, int rowPerPage)throws Exception{
		ArrayList<Question> list = new ArrayList<Question>();
		String sql = "SELECT question_code questionCode\r\n"
				+ "		, order_code orderCode\r\n"
				+ "		, category\r\n"
				+ "		, question_memo questionMemo\r\n"
				+ "		, createdate\r\n"
				+ "FROM question\r\n"
				+ "ORDER BY createdate DESC \r\n"
				+ "LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Question q = new Question();
			q.setQuestionCode(rs.getInt("questionCode"));
			q.setOrderCode(rs.getInt("orderCode"));
			q.setCategory(rs.getString("category"));
			q.setQuestionMemo(rs.getString("questionMemo"));
			q.setCreatedate(rs.getString("createdate"));
			list.add(q);
		}
		return list;
	}
	
	// 문의 총 개수
	public int selectCountQuestionListForEmp(Connection conn) throws Exception{
		int count = 0;
		String sql = "SELECT COUNT(*) FROM question";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("COUNT(*)");
		}
		return count;
	}
	
	// 2) 고객
	// 고객별 전체 문의 목록
	public ArrayList<Question> selectQuestionListForCustomer(Connection conn, Customer loginCustomer, int beginRow, int rowPerPage)throws Exception{
		ArrayList<Question> list = new ArrayList<Question>();
		String sql = "SELECT q.question_code questionCode\r\n"
				+ "		, q.order_code orderCode\r\n"
				+ "		, q.category category\r\n"
				+ "		, q.question_memo questionMemo\r\n"
				+ "		, q.createdate createdate\r\n"
				+ "FROM(SELECT o.order_code order_code \r\n"
				+ "			,c.customer_id customer_id\r\n"
				+ "			FROM orders o INNER JOIN customer c ON o.customer_id = c.customer_id) t INNER JOIN question q ON t.order_code = q.order_code\r\n"
				+ "WHERE t.customer_id = ?\r\n"
				+ "ORDER BY createdate DESC\r\n"
				+ "LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, loginCustomer.getCustomerId());
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Question q = new Question();
			q.setQuestionCode(rs.getInt("questionCode"));
			q.setOrderCode(rs.getInt("orderCode"));
			q.setCategory(rs.getString("category"));
			q.setQuestionMemo(rs.getString("questionMemo"));
			q.setCreatedate(rs.getString("createdate"));
			list.add(q);
		}
		return list;
	}
	
	// 고객별 문의 총 개수
	public int selectCountQuestionListForCustomer(Connection conn, Customer loginCustomer) throws Exception{
		int count = 0;
		String sql = "SELECT COUNT(*)\r\n"
				+ "FROM(SELECT o.order_code order_code \r\n"
				+ "			,c.customer_id customer_id\r\n"
				+ "			FROM orders o INNER JOIN customer c ON o.customer_id = c.customer_id) t INNER JOIN question q ON t.order_code = q.order_code\r\n"
				+ "WHERE t.customer_id = ?\r\n"
				+ "ORDER BY createdate DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, loginCustomer.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("COUNT(*)");
		}
		return count;
	}
	
	// 문의 삭제
	public int deleteQuestion(Connection conn, int questionCode) throws Exception{
		int row = 0;
		String sql = "DELETE FROM question\r\n"
				+ "WHERE question_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, questionCode);
		row = stmt.executeUpdate();
		return row;
	}
	
	// 문의하기
	public int insertQuestion(Connection conn, Question question) throws Exception{
		int row = 0;
		String sql = "INSERT INTO question(order_code\r\n"
				+ "							, category\r\n"
				+ "							, question_memo)\r\n"
				+ "VALUES(?\r\n"
				+ "		, ?\r\n"
				+ "		, ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, question.getOrderCode());
		stmt.setString(2, question.getCategory());
		stmt.setString(3, question.getQuestionMemo());
		row = stmt.executeUpdate();
		return row;
	}

}