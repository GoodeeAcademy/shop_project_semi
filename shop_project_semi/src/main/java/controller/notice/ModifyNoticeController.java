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

@WebServlet("/ModifyNoticeController")
public class ModifyNoticeController extends HttpServlet {
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
		
		noticeService = new NoticeService();
		
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		Notice notice = noticeService.getNoticeOne(noticeCode);
		request.setAttribute("notice", notice);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/notice/ModifyNotice.jsp").forward(request, response);
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
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		notice.setNoticeCode(noticeCode);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		int row = noticeService.motifyNotice(noticeCode, notice);
		if(row != 1) {
			System.out.println("공지 수정 실패");
			// 오류 안내
			return;
		}
		
		System.out.println("공지 수정 성공");
		response.sendRedirect(request.getContextPath()+"/NoticeOneController?noticeCode="+noticeCode);
	}

}
