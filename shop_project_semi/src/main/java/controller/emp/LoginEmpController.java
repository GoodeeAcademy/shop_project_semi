package controller.emp;

import java.io.IOException;

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
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		// 로그인 성공 --> session에 값 넣기
		System.out.println("로그인 성공");
		session.setAttribute("loginEmp", loginEmp);
		response.sendRedirect(request.getContextPath()+"/EmpMainController");
	}

}
