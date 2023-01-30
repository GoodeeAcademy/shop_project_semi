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

@WebServlet("/emp/remove")
public class RemoveEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmpService empService;
    String targetUrl = "/EmpListController";
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {	// 등급 회의 후 조건 추가
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		if(request.getParameter("empId") == null) {
			response.sendRedirect(request.getContextPath()+targetUrl);	// 직원 목록으로
			return;
		}
		String empId = request.getParameter("empId");	// 퇴사 처리할 직원 아이디
		
		empService = new EmpService();
		Emp targetEmp = empService.getEmpOne(empId);
		request.setAttribute("targetEmp", targetEmp);
		
		// view
		request.getRequestDispatcher("WEB-INF/view/emp/removeEmp.jsp").forward(request, response);
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
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('비밀번호를 정확하게 입력해 주세요'); location.href='"+request.getContextPath()+"/RemoveEmpController"+"';</script>"); 
			writer.close();
			response.sendRedirect(request.getContextPath()+targetUrl);
			return;
		}
		System.out.println("비밀번호 일치");
		
		// 직원 삭제 진행
		int row = empService.removeEmp(targetEmpId);
		if(row != 1) {
			System.out.println("직원 삭제 실패");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('퇴사 처리에 실패했습니다'); location.href='"+request.getContextPath()+"/RemoveEmpController?empId="+targetEmpId+"';</script>"); 
			writer.close();
			response.sendRedirect(request.getContextPath()+targetUrl);
			return;
		}
		// outid로 보내기
		int outidRow = empService.addOutEmp(targetEmpId);
		if(outidRow != 1) {
			System.out.println("탈퇴 아이디 처리 실패");
		}
		
		System.out.println("직원 삭제 성공");
		System.out.println("탈퇴 아이디 처리 성공");
		response.sendRedirect(request.getContextPath()+targetUrl);
	}

}