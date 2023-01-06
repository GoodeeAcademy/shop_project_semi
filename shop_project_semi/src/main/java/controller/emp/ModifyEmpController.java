package controller.emp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.emp.EmpService;
import vo.Emp;


@WebServlet("/ModifyEmpController")
public class ModifyEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmpService empService; 
	
    // 직원 정보 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		boolean check = false;
		if(request.getAttribute("check") != null) {
			check = (boolean)request.getAttribute("check");
		}
		request.setAttribute("check", check);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/emp/modifyEmp.jsp").forward(request, response);
	}

	// 직원 정보 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
				
		request.setCharacterEncoding("UTF-8");	// 한글 인코딩
		
		
		String empPw = request.getParameter("empPw");
		String newName = request.getParameter("newName");
		String empId = loginEmp.getEmpId();
		
		// 비밀번호 일치 확인
		empService = new EmpService();
		boolean check = empService.getPw(loginEmp, empPw);
		if(!check) {
			System.out.println("비밀번호 불일치");
			request.setAttribute("check", true);
			doGet(request, response);
			return;
		}
		
		System.out.println("비밀번호 일치");
		
		// 정보 수정
		int row = empService.modifyEmp(loginEmp, newName);
		if(row != 1) {
			System.out.println("정보 수정 실패");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('정보 수정에 실패했습니다'); location.href='"+request.getContextPath()+"//ModifyEmpController"+"';</script>"); 
			writer.close();
			response.sendRedirect(request.getContextPath()+"/ModifyEmpController");
			return;
		}
		
		System.out.println("정보 수정 성공");
		// 수정한 이름/업데이트 날짜 session에 갱신
		Emp returnEmp = empService.getEmpOne(empId);
		session.setAttribute("loginEmp", returnEmp);
		response.sendRedirect(request.getContextPath()+"/EmpMainController");
	}

}