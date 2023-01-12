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


@WebServlet("/LoginEmpController")
public class LoginEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmpService empService;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 전에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			response.sendRedirect(request.getContextPath()+"/EmpMainController");
			return;
		}
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/emp/loginEmp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String empId = request.getParameter("empId");
		String empPw = request.getParameter("empPw");
		
		Emp emp = new Emp();
		emp.setEmpId(empId);
		emp.setEmpPw(empPw);
		
		this.empService = new EmpService();
		Emp loginEmp = empService.login(emp);
		
		if(loginEmp == null) {
			System.out.println("로그인 실패");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('아이디와 비밀번호를 정확히 입력해 주세요'); location.href='"+request.getContextPath()+"/LoginEmpController';</script>"); 
			writer.close();
			//response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		if(loginEmp.getActive().equals("N")) {
			System.out.println("비 활성화 ID");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('비활성화 된 ID입니다.'); location.href='"+request.getContextPath()+"/LoginEmpController');</script>");
			writer.close();
			//response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		// 로그인 성공 --> session에 값 넣기
		System.out.println("로그인 성공");
		session.setAttribute("loginEmp", loginEmp);
		response.sendRedirect(request.getContextPath()+"/EmpMainController");
	}

}