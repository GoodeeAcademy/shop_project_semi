package controller.emp;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.emp.EmpService;

@WebServlet("/emp/active/modify")
public class ModifyEmpActiveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmpService empService = new EmpService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] empId = request.getParameterValues("empId");
		// 값 불러오기 (체크박스는 선택된 값만 넘어온다)
		String[] empActive = request.getParameterValues("empActive");
		System.out.println("활성화 체크한 직원 : "+Arrays.toString(empActive));	// 디버깅
		boolean[] checked = new boolean[empId.length];
		
		// empActive에 들어옴 == 체크됨 == Y로 바꿀 대상 == boolean값 true로
		for(int i = 0; i < empId.length; i++) {
			for(String checkedId : empActive) {	
				if(empId[i].equals(checkedId)) {
					checked[i] = true;
				}
			}
		}
		
		// 활성화 여부 수정
		int row = 0;
		for(int i = 0; i < empId.length; i++) {
			row += empService.modifyEmpActive(empId[i], checked[i]);
		}
		
		// 페이지에 있는 직원들 모두 변경됐는지 확인
		if(row != empId.length) {
			System.out.println("직원 활성화 실패");
			response.sendRedirect(request.getContextPath()+"/EmpListController");
			return;
		}
		
		System.out.println("직원 활성화 성공");
		response.sendRedirect(request.getContextPath()+"/EmpListController");
	}

}
