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

@WebServlet("/ModifyEmpPwController")
public class ModifyEmpPwController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmpService empService;
    
	// 비밀번호 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/emp/modifyEmpPw.jsp").forward(request, response);
	}

	// 비밀번호 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		request.setCharacterEncoding("UTF-8");	// 한글 인코딩
		
		String currentPw = request.getParameter("currentPw");
		String newPw = request.getParameter("newPw");
		String empId = loginEmp.getEmpId();
		
		// 비밀번호 일치 확인
		empService = new EmpService();
		boolean check = empService.getPw(loginEmp, currentPw);
		if(!check) {
			System.out.println("비밀번호 불일치");
			String msg = URLEncoder.encode("비밀번호를 정확하게 입력해 주세요.", "UTF-8");
			response.sendRedirect(request.getContextPath()+"/ModifyEmpPwController?msg="+msg);
			return;
		}
		System.out.println("비밀번호 일치");
		
		// 비밀번호 수정
		int row = empService.modifyEmpPw(loginEmp, newPw);
		if(row != 1) {
			System.out.println("비밀번호 수정 실패");
			String msg = URLEncoder.encode("비밀번호 수정에 실패했습니다.", "UTF-8");
			response.sendRedirect(request.getContextPath()+"/ModifyEmpPwController?msg="+msg);
			return;
		}
		
		System.out.println("비밀번호 수정 성공");
		// 수정한 비밀번호/업데이트 날짜 session에 갱신
		Emp returnEmp = empService.getEmpOne(empId);
		session.setAttribute("loginEmp", returnEmp);
		response.sendRedirect(request.getContextPath()+"/EmpMainController");
		
	}

}
