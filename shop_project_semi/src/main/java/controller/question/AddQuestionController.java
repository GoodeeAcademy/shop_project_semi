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
import vo.Question;

@WebServlet("/AddQuestionController")
public class AddQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodsService goodsService;
	QuestionService questionService;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 고객 로그인 시에만 접근 가능
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) {
			response.sendRedirect(request.getContextPath()+"/HomeController");
			return;
		}
		
		// 주문번호 
		int orderCode = 0;
		if(request.getParameter("orderCode") == null) {
			// 주문 내역으로 돌아가기
			response.sendRedirect(request.getContextPath()+"/OrderListController");
			return;
		}
		orderCode = Integer.parseInt(request.getParameter("orderCode"));
		request.setAttribute("orderCode", orderCode);
		
		// 상품번호
		int goodsCode = 0;
		if(request.getParameter("goodsCode") == null) {
			// 주문 내역으로 돌아가기
			response.sendRedirect(request.getContextPath()+"/OrderListController");
			return;
		}
		goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		goodsService = new GoodsService();
		HashMap<String, Object> m = goodsService.getGoodsOne(goodsCode);
		request.setAttribute("m", m);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/question/addQuestion.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 고객 로그인 시에만 접근 가능
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) {
			response.sendRedirect(request.getContextPath()+"/HomeController");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		String category = request.getParameter("category");
		String questionMemo = request.getParameter("questionMemo");
		
		Question q = new Question();
		q.setOrderCode(orderCode);
		q.setGoodsCode(goodsCode);
		q.setCategory(category);
		q.setQuestionMemo(questionMemo);
		
		questionService = new QuestionService();
		int row = questionService.addQuestion(q);
		if(row != 1) {
			System.out.println("문의 추가 실패");
			return;
		}
		
		// 내 문의내역으로
		response.sendRedirect(request.getContextPath()+"/QuestionListForCustomerController");
	}

}
