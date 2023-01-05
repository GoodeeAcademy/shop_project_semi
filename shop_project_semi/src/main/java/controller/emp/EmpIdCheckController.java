package controller.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.emp.EmpService;

@WebServlet("/EmpIdCheckController")
public class EmpIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmpService empService;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		boolean check = empService.getDuplicatedId(empId);
		if(check) {
			System.out.println("아이디 중복");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('중복된 아이디입니다'); location.href='"+request.getContextPath()+"/AddEmpController"+"';</script>"); 
			writer.close();
			response.sendRedirect(request.getContextPath()+"/AddEmpController");
			return;
		}
		*/
	}

}