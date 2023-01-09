package controller.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.cart.CartService;
import service.customer.CustomerService;
import vo.Customer;
import vo.CustomerAddress;
import vo.Orders;

import java.util.*;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/OrderController")
public class OrderController extends HttpServlet {
	private CartService cartService;
	private CustomerService customerService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
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
			response.sendRedirect(request.getContextPath()+"/SignInController");
			return;
		}
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String[] splitPhone = loginCustomer.getCustomerPhone().split("-");
		this.customerService = new CustomerService();
		CustomerAddress cuAdd = customerService.getAddress(loginCustomer);
		
		String CustomerAdd = "";
		if(cuAdd != null) {
			CustomerAdd = cuAdd.getAddress();
		}
		
		this.cartService = new CartService();
		ArrayList<HashMap<String,Object>> cart = cartService.getCartList(loginCustomer.getCustomerId());
		
		request.setAttribute("splitPhone", splitPhone);
		request.setAttribute("cart", cart);
		request.setAttribute("address", CustomerAdd);
		request.getRequestDispatcher("/WEB-INF/view/order/orderPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") != null) {
			response.sendRedirect(request.getContextPath()+"/SingInController");
			return;
		}
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		CustomerAddress cuAdd = customerService.getAddress(loginCustomer);
		
		this.cartService = new CartService();
		ArrayList<HashMap<String,Object>> cart = cartService.getCartList(loginCustomer.getCustomerId());
		
		
		Orders order = new Orders();
		order.setAddressCode(cuAdd.getAddressCode());
		order.setCustomerId(loginCustomer.getCustomerId());
		//DB 재 설계 후 작업 시작하기
		
		
		order.setCustomerId(loginCustomer.getCustomerId());
		
		//order에 추가
	}

}
