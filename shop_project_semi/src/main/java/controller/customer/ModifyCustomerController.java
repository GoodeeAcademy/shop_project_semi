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
import vo.CustomerAddress;

/**
 * Servlet implementation class ModifyCustomerController
 */
@WebServlet("/ModifyCustomerController")
public class ModifyCustomerController extends HttpServlet {
	private CustomerService customerService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyCustomerController() {
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
			response.sendRedirect(request.getContextPath()+"/SignInController");
			return;
		}
		
		boolean modifyFalse = false;
		if(request.getAttribute("modifyFalse") != null) {
			modifyFalse = (boolean)request.getAttribute("modifyFalse");
		}
		
		this.customerService = new CustomerService();
		Customer customer = (Customer)session.getAttribute("loginCustomer");
		String[] splitPhone = customer.getCustomerPhone().split("-");
		
		CustomerAddress customerAdd = customerService.getAddress(customer);
		String[] splitAdd = customerAdd.getAddress().split("/");
		
		request.setAttribute("customer", customer);
		request.setAttribute("splitPhone", splitPhone);
		request.setAttribute("splitAdd", splitAdd);
		request.setAttribute("modifyFalse", modifyFalse);
		
		request.getRequestDispatcher("/WEB-INF/view/customer/modifyCustomer.jsp").forward(request, response);
		
		
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
		if(!request.getParameter("customerPw").equals(request.getParameter("checkPw"))) {
			System.out.println("비밀번호 체크 틀림");
			request.setAttribute("modifyFalse",true);
			
			doGet(request, response);
			return;
		}
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		
		Customer paramCustomer = new Customer();
		paramCustomer.setCustomerId(loginCustomer.getCustomerId());
		paramCustomer.setCustomerName(request.getParameter("customerName"));
		paramCustomer.setCustomerPhone(request.getParameter("modifyPhone1")
										+"-"
										+request.getParameter("modifyPhone2")
										+"-"
										+request.getParameter("modifyPhone3"));
		paramCustomer.setCustomerPw(request.getParameter("customerPw"));
		
		String paramAdd = request.getParameter("addAddress1")+"/"+request.getParameter("addAddress2")+"/"+request.getParameter("addAddress3")+"/"+request.getParameter("addAddress4");
		
		
		this.customerService = new CustomerService();
		if(customerService.getModifyCustomer(paramCustomer, paramAdd) == 0) {
			System.out.println("수정 실패\n 예상 사유:비밀번호");
			request.setAttribute("modifyFalse",true);
			
			doGet(request, response);
			return;
		} else {
			loginCustomer = customerService.getSingIn(paramCustomer);
			session.setAttribute("loginCustomer", loginCustomer);
		}
		response.sendRedirect(request.getContextPath()+"/CustomerOneController");
	}

}
