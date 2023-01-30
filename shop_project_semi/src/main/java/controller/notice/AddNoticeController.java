package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.notice.NoticeService;
import vo.Emp;
import vo.Notice;

@WebServlet("/emp/notice/add")
public class AddNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NoticeService noticeService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원 로그인 시에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/HomeController");
			return;
		}
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/notice/AddNotice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원 로그인 시에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/HomeController");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		Notice notice = new Notice();
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		
		noticeService = new NoticeService();
		int row = noticeService.addNotice(notice, loginEmp);
		if(row != 1) {
			System.out.println("공지 추가 실패");
			return;
		}
		
		System.out.println("공지 추가 성공");
		response.sendRedirect(request.getContextPath()+"/NoticeListController");
	}

}
