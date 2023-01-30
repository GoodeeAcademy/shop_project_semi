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
 * Servlet implementation class RemoveCustomerController
 */
@WebServlet("/member/remove")
public class RemoveCustomerController extends HttpServlet {
	private CustomerService customerService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginCustomer") == null) {
			System.out.println("로그인 안한 상태로 수정페이지 접근");
			response.sendRedirect(request.getContextPath()+"/member/signin");
			return;
		}
		
		boolean removeFalse = false;
		if(request.getAttribute("modifyFalse") != null) {
			removeFalse = (boolean)request.getAttribute("modifyFalse");
		}
		
		request.setAttribute("removeFalse", removeFalse);
		
		request.getRequestDispatcher("/WEB-INF/view/customer/removeCustomer.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") == null) {
			System.out.println("로그인 안한 상태로 수정페이지 접근");
			response.sendRedirect(request.getContextPath()+"/member/signin");
			return;
		}
		if(!request.getParameter("customerPw").equals(request.getParameter("checkPw"))) {
			System.out.println("비밀번호 체크 틀림");
			request.setAttribute("removeFalse",true);
			
			doGet(request, response);
			return;
		}
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(!request.getParameter("customerId").equals(loginCustomer.getCustomerId())) {
			System.out.println("로그인한 id와 입력한 id가 다름");
			request.setAttribute("removeFalse", true);
			
			doGet(request, response);
			return;
		}
		
		Customer paramCustomer = new Customer();
		paramCustomer.setCustomerId(request.getParameter("customerId"));
		paramCustomer.setCustomerPw(request.getParameter("customerPw"));
		
		this.customerService = new CustomerService();
		if(customerService.getRemoveCustomer(paramCustomer) != 1) {
			System.out.println("삭제 실패");
			request.setAttribute("removeFalse", true);
			
			doGet(request, response);
			return;
		}
		
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/member/signin");
	}

}
