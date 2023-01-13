package controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

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
    private ArrayList<HashMap<String, Object>> list;
    
	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 수집
		if(request.getParameter("goodsCode") == null || ("").equals(request.getParameter("goodsCode"))
				|| request.getParameter("quantity") == null || ("").equals(request.getParameter("quantity"))) {
			response.sendRedirect(request.getContextPath() + "/goodsList");
			return;
		}
		
		// 출력용
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		// 비회원 장바구니
		if(session.getAttribute("loginCustomer") == null) { 
			System.out.println("add cart 비회원 장바구니");
			
			// 파라미터 수집
			int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			
			// 세션에 이미 장바구니가 있다면 이어서 상품 담기
			if(session.getAttribute("list") != null) {
				System.out.println("비회원 세션 장바구니");
				list = (ArrayList<HashMap<String, Object>>)session.getAttribute("list");
				
				// 비회원 장바구니 중복 체크
				for(HashMap<String, Object> m : list) {
					if( (int)m.get("goodsCode") == goodsCode ) {
						System.out.println("장바구니 중복 상품");
						out.println("<script>alert('이미 장바구니에 존재하는 상품입니다.'); history.back(); </script>"); 
						out.close();
						return;
					}
				}				
			} else {
				System.out.println("비회원 세션 빈 장바구니");
				list = new ArrayList<>(); 
			}
			
			cartService = new CartService();
			HashMap<String, Object> m = cartService.addCart(goodsCode);
			m.put("quantity", quantity);
			list.add(m);
			
			// 바인딩 후 페이지 전환
			session.setAttribute("list", list);
			System.out.println("장바구니 추가 성공");
			out.println("<script>alert('장바구니 추가'); history.back(); </script>"); 
			out.close();
			
			return;
		}
		
		// 회원 장바구니
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		System.out.println(request.getParameter("bn"));
		boolean buyNow = Boolean.parseBoolean(request.getParameter("bn")); 
		System.out.println(buyNow);
		
		// vo 
		Cart cart = new Cart();
		cart.setGoodsCode(goodsCode);
		cart.setCustomerId(customerId);
		cart.setCartQuantity(quantity);
		
		// 서비스 호출
		cartService = new CartService();
		int result = cartService.addCart(cart);
		
		// 1성공 -1중복 0실패
		if(result == 1) {
			if(buyNow) { // 회원 바로구매
				response.sendRedirect(request.getContextPath() + "/OrderController");
				return;
			} else {
				System.out.println("장바구니 추가 성공");
				out.println("<script>alert('장바구니 추가'); history.back(); </script>"); 
				out.close();
			}
		} else if(result == -1){
			if(buyNow) { // 회원 바로구매
				response.sendRedirect(request.getContextPath() + "/OrderController");
				return;
			} else {
				System.out.println("장바구니 중복 상품");
				out.println("<script>alert('이미 장바구니에 존재하는 상품입니다.'); history.back(); </script>"); 
				out.close();				
			}
		} else {
			System.out.println("장바구니 추가 실패");
			out.println("<script>alert('장바구니 추가 실패'); history.back(); </script>"); 
			out.close();
		}
	}
}
