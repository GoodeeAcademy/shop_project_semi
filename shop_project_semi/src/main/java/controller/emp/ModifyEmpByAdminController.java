package controller.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.emp.EmpService;
import vo.Emp;

@WebServlet("/emp/admin/modify")
public class ModifyEmpByAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmpService empService = new EmpService();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 최고관리자만 접근 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null || loginEmp.getAuthCode() > 1) {
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}

		// 해당 직원 정보 불러오기
		String empId = request.getParameter("empId");
		Emp emp = new Emp();
		emp = empService.getEmpOne(empId);
		
		// 모든 관리자 등급
		ArrayList<HashMap<String, Object>> authList = empService.getAuthCodeList();
		for(HashMap<String, Object> m : authList) {
			System.out.println(m.get("authCode") +" "+ m.get("authName"));
		}
		// 값 넘기기
		request.setAttribute("emp", emp);
		request.setAttribute("authList", authList);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/emp/modifyEmpByAdmin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어온 값
		String empId = request.getParameter("empId");
		int authCode = Integer.parseInt(request.getParameter("empAuthCode"));
		
		// 변경된 관리자 등급 저장
		Emp changedEmp = empService.getEmpOne(empId);
		System.out.println(changedEmp.getEmpCode()+" "+changedEmp.getEmpId()+" "+changedEmp.getEmpName());
		changedEmp.setAuthCode(authCode);
		
		// 정보 수정
		int row = empService.modifyEmp(changedEmp);
		if(row != 1) {
			System.out.println("정보 수정 실패");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('정보 수정에 실패했습니다'); location.href='"+request.getContextPath()+"//ModifyEmpController"+"';</script>"); 
			writer.close();
			response.sendRedirect(request.getContextPath()+"/EmpListController");
			return;
		}
		
		System.out.println("정보 수정 성공");
		response.sendRedirect(request.getContextPath()+"/EmpListController");
	}

}
