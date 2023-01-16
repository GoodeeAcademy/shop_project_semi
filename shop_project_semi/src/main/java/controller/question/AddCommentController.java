package controller.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.question.QuestionService;
import vo.QuestionComment;

@WebServlet("/AddCommentController")
public class AddCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	QuestionService questionService = new QuestionService();
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	// 한글 인코딩
		
		int questionCode = Integer.parseInt(request.getParameter("questionCode"));
		String commentMemo = request.getParameter("commentMemo");
		
		QuestionComment comment = new QuestionComment();
		comment.setQuestionCode(questionCode);
		comment.setCommentMemo(commentMemo);
		
		int row = questionService.addComment(comment);
		if(row != 1) {
			System.out.println("답변 추가 실패");
			response.sendRedirect(request.getContextPath()+"/QuestionOneController?questionCode="+questionCode);
			return;
		}
		
		// 해당 문의 상세보기로
		response.sendRedirect(request.getContextPath()+"/QuestionOneController?questionCode="+questionCode);
	}

}
