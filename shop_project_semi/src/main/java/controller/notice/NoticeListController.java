package controller.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.notice.NoticeService;
import vo.Notice;


@WebServlet("/notice")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NoticeService noticeService; 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인한 직원은 공지쓰기에 접근 가능
		request.getSession().getAttribute("loginEmp");
		
		noticeService = new NoticeService();
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;	// 한 페이지당 보여줄 공지 개수
		int beginRow = (currentPage-1)*rowPerPage;
		int pageList = 10; // 페이지 10개씩 보여줌
		int startPage = ((currentPage-1)/pageList)*pageList+1;	// n1
		int endRow = startPage + pageList - 1;	// (n+1)0
		int lastPage = (int)Math.ceil(noticeService.getNoticeCount()/(double)rowPerPage);
		
		if(endRow > lastPage){	//마지막 페이지보다 더 큰 숫자의 페이지 존재하지 않도록
			endRow = lastPage;
		}
		
		ArrayList<Notice> list = noticeService.getNoticeList(beginRow, rowPerPage);
		request.setAttribute("list", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endRow", endRow);
		request.setAttribute("lastPage", lastPage);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/notice/noticeList.jsp").forward(request, response);
	}
	
}
