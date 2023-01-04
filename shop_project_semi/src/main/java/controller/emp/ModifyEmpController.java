package controller.emp;

import java.io.IOException;
import java.net.URLEncoder;

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
		// view
		request.getRequestDispatcher("/WEB-INF/view/emp/modifyEmp.jsp").forward(request, response);
	}

	// 직원 정보 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	// 한글 인코딩
		
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		
		String empPw = request.getParameter("empPw");
		String newName = request.getParameter("newName");
		
		// 비밀번호 일치 확인
		empService = new EmpService();
		boolean check = empService.getPw(loginEmp, empPw);
		if(!check) {
			System.out.println("비밀번호 불일치");
			String msg = URLEncoder.encode("비밀번호를 정확하게 입력해 주세요.", "UTF-8");
			response.sendRedirect(request.getContextPath()+"/ModifyEmpController?msg="+msg);
			return;
		}
		
		System.out.println("비밀번호 일치");
		
		// 정보 수정
		int row = empService.modifyEmp(loginEmp, newName);
		if(row != 1) {
			System.out.println("정보 수정 실패");
			String msg = URLEncoder.encode("정보 수정에 실패했습니다.", "UTF-8");
			response.sendRedirect(request.getContextPath()+"/ModifyEmpController?msg="+msg);
			return;
		}
		
		System.out.println("정보 수정 성공");
		response.sendRedirect(request.getContextPath()+"/ModifyEmpController");
	}

}