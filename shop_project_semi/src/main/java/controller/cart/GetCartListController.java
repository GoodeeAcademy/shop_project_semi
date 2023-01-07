package controller.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.cart.CartService;
import vo.Customer;

@WebServlet("/cartList")
public class GetCartListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 수집
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") == null) {
			System.out.println("비로그인 회원: goodsList");
			response.sendRedirect(request.getContextPath() + "/goodsList");
			return;
		}
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		
		// 서비스 호출
		cartService = new CartService();
		ArrayList<HashMap<String, Object>> list = cartService.getCartList(customerId);
		
		// 객체 바인딩 후 페이지 이동
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/cart/cartList.jsp").forward(request, response);
	}
}
