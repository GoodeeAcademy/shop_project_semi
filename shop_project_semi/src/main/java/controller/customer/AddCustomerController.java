package controller.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.customer.CustomerService;
import vo.Customer;

/**
 * Servlet implementation class AddCustomerController
 */
@WebServlet("/AddCustomerController")
public class AddCustomerController extends HttpServlet {
	private CustomerService customerService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/view/customer/addCustomer.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//addCustomer.jsp에서 입력받은 값
		String paramId = request.getParameter("addId");
		String paramPw = request.getParameter("addPw");
		String paramName = request.getParameter("addName");
		String paramPhone = request.getParameter("addPhone1")+"-"
							+request.getParameter("addPhone2")+"-"
							+request.getParameter("addPhone3");
		//String paramAddress = request.getParameter("addAddress1");
		
		//입력받은 값 -> customer 저장
		Customer paramCustomer = new Customer();
		paramCustomer.setCustomerId(paramId);
		paramCustomer.setCustomerPw(paramPw);
		paramCustomer.setCustomerName(paramName);
		paramCustomer.setCustomerPhone(paramPhone);
		
		//addCustomer 서비스 호출
		this.customerService = new CustomerService();
		int result = customerService.addCustomerService(paramCustomer);
		
		if(result != 1) {
			System.out.println("회원가입 실패");
			response.sendRedirect(request.getContextPath()+"/AddCustomerController");
			return;
		}
		
		
		//추후 Home 대신 login 컨트롤러로 이동으로 수정
		response.sendRedirect(request.getContextPath()+"/HomeController");
	}

}
