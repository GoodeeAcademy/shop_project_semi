package controller.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.customer.CustomerService;
import vo.Customer;

/**
 * Servlet implementation class ModifyCustomerPwController
 */
@WebServlet("/ModifyCustomerPwController")
public class ModifyCustomerPwController extends HttpServlet {
	private CustomerService customerService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyCustomerPwController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) {
			response.sendRedirect(request.getContextPath()+"/SignInController");
			return;
		}
		
		boolean modifyFalse = false;
		if(request.getAttribute("modifyFalse") != null) {
			modifyFalse = (boolean)request.getAttribute("modifyFalse");
		}
		
		request.setAttribute("modifyFalse", modifyFalse);
		
		
		request.getRequestDispatcher("/WEB-INF/view/customer/modifyCustomerPw.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") == null) {
			System.out.println("로그인 안한 상태로 수정페이지 접근");
			response.sendRedirect(request.getContextPath()+"/SignInController");
			return;
		}
		
		if(!request.getParameter("afterPw").equals(request.getParameter("checkPw"))) {
			System.out.println("비밀번호 체크 틀림");
			request.setAttribute("modifyFalse",true);
			
			doGet(request, response);
			return;
		}
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		
		Customer paramCustomer = new Customer();
		paramCustomer.setCustomerId(loginCustomer.getCustomerId());
		paramCustomer.setCustomerPw(request.getParameter("afterPw"));
		
		this.customerService = new CustomerService();
		int result = customerService.getModifyCustomerPw(paramCustomer, request.getParameter("beforePw"));
		if(result == 0) {
			System.out.println("수정 실패");
			request.setAttribute("modifyFalse", true);
			
			doGet(request, response);
			return;
		}
		
		response.sendRedirect(request.getContextPath()+"/CustomerOneController");
	}

}
