package controller.cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.cart.CartService;
import vo.Cart;
import vo.Customer;

@WebServlet("/addCart")
public class AddCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CartService cartService;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 수집
		if(request.getParameter("goodsCode") == null || ("").equals(request.getParameter("goodsCode"))
				|| request.getParameter("quantity") == null || ("").equals(request.getParameter("quantity"))) {
			response.sendRedirect(request.getContextPath() + "/goodsList");
			return;
		}
		
		// 비회원 구매기능 미완성
		HttpSession session = request.getSession(); 
		if(session.getAttribute("loginCustomer") == null) {
			System.out.println("비로그인 회원: goodsList");
			response.sendRedirect(request.getContextPath() + "/goodsList");
			return;
		}
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		// vo 
		Cart cart = new Cart();
		cart.setGoodsCode(goodsCode);
		cart.setCustomerId(loginCustomer.getCustomerId());
		cart.setCartQuantity(quantity);
		
		// 서비스 호출
		cartService = new CartService();
		int result = cartService.addCart(cart);
		
		// 1성공 -1중복 0실패
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			System.out.println("장바구니 추가 성공");
			out.println("<script>alert('장바구니 추가'); history.back(); </script>"); 
			out.close();
			return;
		} else if(result == -1){
			System.out.println("장바구니 중복 상품");
			out.println("<script>alert('이미 장바구니에 존재하는 상품입니다.'); history.back(); </script>"); 
			out.close();
			return;
		} else {
			System.out.println("장바구니 추가 실패");
			out.println("<script>alert('장바구니 추가 실패'); history.back(); </script>"); 
			out.close();
			return;
		}
	}
}
