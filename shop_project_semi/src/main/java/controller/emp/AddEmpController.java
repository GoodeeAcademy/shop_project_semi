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

@WebServlet("/AddEmpController")
public class AddEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmpService empService;
	boolean check = true;

	// 직원가입 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 전에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			response.sendRedirect(request.getContextPath()+"/EmpMainController");
			return;
		}
		
		request.setAttribute("empId", null);
		if(request.getParameter("empId") != null) {
			String empId = request.getParameter("empId");
			request.setAttribute("empId", empId);
		}
		// View
		request.getRequestDispatcher("/WEB-INF/view/emp/addEmp.jsp").forward(request, response);
	}

	// 직원가입 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	// 한글 인코딩

		empService = new EmpService();
		
		String empId = request.getParameter("empId");
		empService = new EmpService();
		boolean check = empService.getDuplicatedId(empId);
		if(check) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('중복된 아이디입니다'); location.href='"+request.getContextPath()+"/AddEmpController"+"';</script>"); 
			writer.close();
			response.sendRedirect(request.getContextPath()+"/AddEmpController");
			return;
		}
		if(request.getParameter("empPw") == null || request.getParameter("empPw").equals("")
			|| request.getParameter("empName") == null || request.getParameter("empName").equals("")) {
			request.setAttribute("empId", empId);
			response.sendRedirect(request.getContextPath()+"/AddEmpController?empId="+empId);
			return;
		}
		String empPw = request.getParameter("empPw");
		String empName = request.getParameter("empName");
		
		Emp emp = new Emp();
		emp.setEmpId(empId);
		emp.setEmpPw(empPw);
		emp.setEmpName(empName);
		
		int row = empService.addEmp(emp);
		
		if(row != 1) {	// 직원 가입 실패
			System.out.println("직원 가입 실패");
			response.sendRedirect(request.getContextPath()+"/AddEmpController");
			return;
		}
		
		System.out.println("직원 가입 성공");
		response.sendRedirect(request.getContextPath()+"/LoginEmpController");
	}

}