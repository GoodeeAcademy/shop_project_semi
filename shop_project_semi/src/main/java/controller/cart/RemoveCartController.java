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
import vo.Cart;
import vo.Customer;

@WebServlet("/removeCart")
public class RemoveCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService;
	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		// 비회원 장바구니 
		if(session.getAttribute("loginCustomer") == null) {
			if(session.getAttribute("list") != null) {
				ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)session.getAttribute("list");
				
				// 파라미터 수집
				String goodsCode = request.getParameter("goodsCode");
				/*
				for(int i = list.size() - 1; i >= 0; i--) {
					if(list.get(i).get("goodsCode").equals(goodsCode)) {
						list.remove(list.get(i));	
					}
				}
				*/
				// 장바구니(list)에 담긴 상품정보(m) 비교하여 변경 (for문에서 삭제 하면 일부 요소가 순회되지 않을 수 있다. -> 임시 저장 후 for문 밖에서 삭제)
				ArrayList<HashMap<String, Object>> removed = new ArrayList<>();
				for(HashMap<String, Object> m : list) {
					if(m.get("goodsCode").equals(goodsCode)) {
						removed.add(m);	
					}					
				}
				list.removeAll(removed);
			}
			
			response.sendRedirect(request.getContextPath() + "/cartList");
			return;
		}
		
		// 회원 장바구니
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
