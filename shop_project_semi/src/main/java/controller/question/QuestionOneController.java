package controller.question;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.goods.GoodsService;
import service.question.QuestionService;
import vo.Customer;
import vo.Emp;
import vo.Question;
import vo.QuestionComment;

@WebServlet("/emp/question/detail")
public class QuestionOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodsService goodsService;
	QuestionService questionService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원/고객 로그인 시에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginEmp == null && loginCustomer == null) {
			response.sendRedirect(request.getContextPath()+"/main");
			return;
		}
		
		// 문의 상세보기
		if(request.getParameter("questionCode") == null) {
			if(loginEmp != null) {	// 직원이 보는 상태라면
				response.sendRedirect(request.getContextPath()+"/emp/question");
			}
			if(loginCustomer != null) {	// 고객이 보는 상태라면
				response.sendRedirect(request.getContextPath()+"/member/question");
			}
			return;
		}
		int questionCode = Integer.parseInt(request.getParameter("questionCode"));
		System.out.println("questionCode : " + questionCode);	// 디버깅
		
		questionService = new QuestionService();
		Question question = questionService.getQuestionOne(questionCode);
		goodsService = new GoodsService();
		HashMap<String, Object> m = goodsService.getGoodsOne(question.getGoodsCode());
		request.setAttribute("question", question);
		request.setAttribute("m", m);
		
		
		if(loginCustomer != null) {	// 고객이 보는 상태라면
			// 아이디 일치여부 확인
			if(!loginCustomer.getCustomerId().equals(question.getCustomerId())) {
				response.sendRedirect(request.getContextPath()+"/member/question"); // 내 문의내역으로
				return;
			}
		}
		
		// 답변
		QuestionComment comment = questionService.getQuestionComment(questionCode);
		request.setAttribute("comment", comment);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/question/questionOne.jsp").forward(request, response);
	}
}
