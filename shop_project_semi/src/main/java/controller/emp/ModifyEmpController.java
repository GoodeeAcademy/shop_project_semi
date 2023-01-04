package controller.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.emp.EmpService;


@WebServlet("/ModifyEmpController")
public class ModifyEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmpService empService; 
	
    // 직원 정보 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// view
		request.getRequestDispatcher("/WEB-INF/view/emp/modifyEmp.jsp").forward(request, response);
	}

	// 직원 정보 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	// 한글 인코딩
	}

}