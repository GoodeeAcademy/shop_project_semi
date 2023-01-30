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

@WebServlet("/emp/notice/remove")
public class RemoveNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NoticeService noticeService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원 로그인 시에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/main");
			return;
		}
		
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		
		noticeService = new NoticeService();
		int row = noticeService.removeNotice(noticeCode);
		if(row != 1) {
			System.out.println("공지 삭제 실패");
			// 오류 안내
			return;
		}
		
		System.out.println("공지 삭제 성공");
		response.sendRedirect(request.getContextPath()+"/notice");
	}

}
