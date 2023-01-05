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

@WebServlet("/RemoveEmpController")
public class RemoveEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmpService empService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {	// 등급 회의 후 조건 추가
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		String empId = request.getParameter("empId");	// 퇴사 처리할 직원 아이디
		Emp targetEmp = empService.getEmpOne(empId);
		request.setAttribute("targetEmp", targetEmp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {	// 등급 회의 후 조건 추가
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		String adminPw = request.getParameter("adminPw");
		String targetEmpId = request.getParameter("targetEmpId");
		
		// 관리자 비밀번호 일치 확인
		boolean check = empService.getPw(loginEmp, adminPw);
		if(!check) {
			System.out.println("비밀번호 불일치");
			String msg = URLEncoder.encode("비밀번호를 정확히 입력해 주세요.", "UTF-8");
			response.sendRedirect(request.getContextPath()+"/RemoveEmpController?empId="+targetEmpId+"&msg="+msg);
			return;
		}
		System.out.println("비밀번호 일치");
		
		// 직원 삭제 진행
		int row = empService.removeEmp(targetEmpId);
		if(row != 1) {
			System.out.println("직원 삭제 실패");
			String msg = URLEncoder.encode("퇴사 처리에 실패했습니다.", "UTF-8");
			response.sendRedirect(request.getContextPath()+"/RemoveEmpController?empId="+targetEmpId+"&msg="+msg);
			return;
		}
		
		System.out.println("직원 삭제 성공");
		response.sendRedirect(request.getContextPath()+"/EmpMainController");
	}

}