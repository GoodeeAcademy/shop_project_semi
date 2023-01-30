package controller.emp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.notice.NoticeService;
import service.order.OrderService;
import service.question.QuestionService;
import service.review.ReviewService;
import service.sitecount.SiteCountService;
import vo.Emp;
import vo.Notice;
import vo.Question;


@WebServlet("/emp/main")
public class EmpMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderService();
	private QuestionService questionService = new QuestionService();
	private ReviewService reviewService = new ReviewService();
	private NoticeService noticeService = new NoticeService();
	private SiteCountService siteCountService = new SiteCountService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		// 페이징
		int beginRow = 0;
		int rowPerPage = 5;	// 한 페이지당 보여줄 개수

		// 최근 주문
		ArrayList<HashMap<String, Object>> orderList = orderService.getAllOrderList(beginRow, rowPerPage);
		// 최근 문의
		ArrayList<Question> list = questionService.getQuestionListForEmp(beginRow, rowPerPage);
		// 별점 분포
		ArrayList<Integer> starList = reviewService.getStar();
		// 최근 공지
		ArrayList<Notice> noticeList = noticeService.getNoticeList(beginRow, rowPerPage);	
		// 방문자수
		int todayCount = siteCountService.getTodayCount();
		System.out.println("오늘 접속자 : "+todayCount);
		int totalCount = siteCountService.getTotalCount();
		
		// 저장
		request.setAttribute("orderList", orderList);
		request.setAttribute("list", list);
		request.setAttribute("starList", starList);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("todayCount", todayCount);
		request.setAttribute("totalCount", totalCount);
		
		// view
		request.getRequestDispatcher("WEB-INF/view/emp/empMain.jsp").forward(request, response);
	}

}