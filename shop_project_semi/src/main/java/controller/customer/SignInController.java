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
 * Servlet implementation class SignInController
 */
@WebServlet("/SignInController")
public class SignInController extends HttpServlet {
	private CustomerService customerService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		request.getRequestDispatcher("/WEB-INF/view/customer/signIn.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Customer paramCustomer = new Customer();
		paramCustomer.setCustomerId(request.getParameter("loginId"));
		paramCustomer.setCustomerPw(request.getParameter("loginPw"));
		
		this.customerService = new CustomerService();
		Customer loginCustomer = customerService.getSingIn(paramCustomer);
		if(loginCustomer == null) {
			System.out.println("로그인 실패");
			response.sendRedirect(request.getContextPath()+"/SignInController");
			return;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginCustomer", loginCustomer);
		
		//추후 homeController로 이동하도록 수정하기!
		response.sendRedirect(request.getContextPath()+"/CustomerOneController");
	}

}
