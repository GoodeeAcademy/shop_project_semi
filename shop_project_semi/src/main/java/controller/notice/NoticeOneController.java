package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.notice.NoticeService;
import vo.Notice;

@WebServlet("/notice/detail")
public class NoticeOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인한 직원은 공지 수정/삭제에 접근 가능
		request.getSession().getAttribute("loginEmp");
		
		if(request.getParameter("noticeCode") == null) {
			response.sendRedirect(request.getContextPath()+"/notice");
			return;
		}
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		
		noticeService = new NoticeService();
		Notice notice = noticeService.getNoticeOne(noticeCode);
		HttpSession session = request.getSession();
		session.setAttribute("notice", notice);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/notice/noticeOne.jsp").forward(request, response);
	}

}
