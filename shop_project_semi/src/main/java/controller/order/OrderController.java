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
import service.order.OrderService;
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
	private OrderService orderService;
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
		String orderResult = null;
		if(request.getAttribute("orderResult") != null) {
			orderResult = (String)request.getAttribute("orderResult");
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
		request.setAttribute("orderResult", orderResult);
		request.getRequestDispatcher("/WEB-INF/view/order/orderPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") == null) {
			response.sendRedirect(request.getContextPath()+"/SignInController");
			return;
		}
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		int point = Integer.parseInt(request.getParameter("point"));
		
		/*
		if(point > loginCustomer.getPoint()) {
			doGet(request, response);
			return;
		}
		*/
		
		this.cartService = new CartService();
		ArrayList<HashMap<String,Object>> cart = cartService.getCartList(loginCustomer.getCustomerId());
		int orderPrice = 0;
		
		
		for (HashMap<String, Object> m : cart) {
			orderPrice += ( (int)m.get("goodsPrice") * (int)m.get("quantity") ); 
		}

		orderPrice -= point;

		Orders order = new Orders();
		order.setCustomerId(loginCustomer.getCustomerId());
		order.setOrderName(request.getParameter("orderName"));
		order.setAddress(request.getParameter("address"));
		order.setPhone(request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3"));
		order.setOrderPrice(orderPrice);
		
		this.orderService = new OrderService();
		String orderResult = orderService.addOrder(order, cart, point);
		System.out.println(orderResult);
		if(orderResult == null) {
			request.setAttribute("orderResult", orderResult);
			doGet(request, response);
			return;
		}
		loginCustomer.setPoint(loginCustomer.getPoint()-point);
		session.setAttribute("loginCustomer", loginCustomer);
		
		response.sendRedirect(request.getContextPath()+"/OrderListController");
	}

}
