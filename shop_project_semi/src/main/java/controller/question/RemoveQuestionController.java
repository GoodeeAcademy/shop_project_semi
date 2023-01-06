package controller.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.question.QuestionService;
import vo.Customer;


@WebServlet("/RemoveQuestionController")
public class RemoveQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    QuestionService questionService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 고객 로그인 시에만 접근 가능
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) {
			response.sendRedirect(request.getContextPath()+"/HomeController");
			return;
		}
		
		int questionCode = Integer.parseInt(request.getParameter("questionCode"));
		
		questionService = new QuestionService();
		int row = questionService.removeQuestion(questionCode);
		if(row != 1) {
			System.out.println("문의 삭제 실패");
			// 오류 안내
			
			return;
		}
		
		System.out.println("문의 삭제 성공");
		response.sendRedirect(request.getContextPath()+"/QuestionListForCustomerController");
	}

}