package controller.emp;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.emp.EmpService;
import vo.Emp;

@WebServlet("/emp/emp")
public class EmpListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmpService empService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/emp/signin");
			return;
		}
		
		empService = new EmpService();
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 5;	// 한 페이지당 보여줄 직원 수
		int beginRow = (currentPage-1)*rowPerPage;
		int pageList = 10; // 페이지 10개씩 보여줌
		int startPage = ((currentPage-1)/pageList)*pageList+1;	// n1
		int endRow = startPage + pageList - 1;	// (n+1)0
		int lastPage = (int)Math.ceil(empService.getCountEmpList()/(double)rowPerPage);
		
		if(endRow > lastPage){	//마지막 페이지보다 더 큰 숫자의 페이지 존재하지 않도록
			endRow = lastPage;
		}
		
		ArrayList<Emp> list = empService.getEmpList(beginRow, rowPerPage);
		request.setAttribute("list", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endRow", endRow);
		request.setAttribute("lastPage", lastPage);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/emp/empList.jsp").forward(request, response);
	}

}
