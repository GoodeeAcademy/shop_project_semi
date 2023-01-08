package controller.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.cart.CartService;
import vo.Cart;
import vo.Customer;

@WebServlet("/removeCart")
public class RemoveCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") == null) {
			response.sendRedirect(request.getContextPath()+"/goodsList");
			return;
		}
		
		// 파라미터 수집
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		
		// vo
		Cart cart = new Cart();
		cart.setCustomerId(customerId);
		cart.setGoodsCode(goodsCode);
		
		// 서비스 호출
		cartService = new CartService();
		int result = cartService.removeCart(cart);
		
		if(result == 1) {
			System.out.println("장바구니 삭제 성공");
		} else {
			System.out.println("장바구니 삭제 실패");
		}
		
		response.sendRedirect(request.getContextPath() + "/cartList");
	}
}
