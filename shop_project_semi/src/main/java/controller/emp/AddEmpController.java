package controller.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.emp.EmpService;
import vo.Emp;

@WebServlet("/AddEmpController")
public class AddEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmpService empService;

	// 직원가입 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// View
		request.getRequestDispatcher("/WEB-INF/view/emp/addEmp.jsp").forward(request, response);
	}

	// 직원가입 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	// 한글 인코딩

		empService = new EmpService();
		
		String empId = request.getParameter("empId");
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