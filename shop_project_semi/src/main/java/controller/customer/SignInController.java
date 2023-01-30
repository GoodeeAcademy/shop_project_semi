package controller.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.cart.CartService;
import service.customer.CustomerService;
import vo.Cart;
import vo.Customer;
import java.util.*;

/**
 * Servlet implementation class SignInController
 */
@WebServlet("/member/signin")
public class SignInController extends HttpServlet {
	private CustomerService customerService;
	private CartService cartService;
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
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") != null) {
			response.sendRedirect(request.getContextPath()+"/main");
			return;
		}
		
		boolean loginFalse = false;
		if(request.getAttribute("loginFalse") != null) {
			loginFalse = (boolean)request.getAttribute("loginFalse");
		}
		
		request.setAttribute("loginFalse", loginFalse);
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
			request.setAttribute("loginFalse", true);
			doGet(request, response);
			return;
		}
		
		HttpSession session = request.getSession();
		if(session.getAttribute("list") != null) {
			@SuppressWarnings("unchecked")
			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)session.getAttribute("list");
			for (HashMap<String, Object> hashMap : list) {
				Cart cart = new Cart();
				cart.setGoodsCode((int)hashMap.get("goodsCode"));
				cart.setCustomerId(loginCustomer.getCustomerId());
				cart.setCartQuantity((int)hashMap.get("quantity"));
				this.cartService = new CartService();
				if(cartService.addCart(cart) == 0) {
					System.out.println("장바구니 세션 에러");
				}
				System.out.println("비회원 장바구니 -> 회원 장바구니 성공");
			}
			
		}
		session.setAttribute("loginCustomer", loginCustomer);
		
		//추후 homeController로 이동하도록 수정하기!
		response.sendRedirect(request.getContextPath()+"/main");
	}

}
