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

@WebServlet("/modifyCart")
public class ModifyCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/cartList");
	}
	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비회원 장바구니
		HttpSession session = request.getSession();
		if(session.getAttribute("loginCustomer") == null) {
			if(session.getAttribute("list") != null) {
				ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)session.getAttribute("list");
				
				// 파라미터 수집
				String[] goodsCode = request.getParameterValues("goodsCode");
				String[] quantity = request.getParameterValues("quantity");
				System.out.println(goodsCode.length);
				
				// 장바구니(list)에 담긴 상품정보(m) 비교하여 변경
				for(HashMap<String, Object> m : list) {
					for(int i = 0; i < goodsCode.length; i++) {
						if(m.get("goodsCode").equals(goodsCode[i])) {
							m.put("quantity", quantity[i]);
						}						
					}
				}				
			}
			
			response.sendRedirect(request.getContextPath() + "/cartList");
			return;
		}
		
		// 회원 장바구니
		// 파라미터 수집
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		String customerId = loginCustomer.getCustomerId();
		// 배열 goodsCode 정수로 변환
		String[] goodsCode_ = request.getParameterValues("goodsCode");
		int[] goodsCode = new int[goodsCode_.length];
		for(int i = 0; i < goodsCode_.length; i++) {
			goodsCode[i] = Integer.parseInt(goodsCode_[i]);
		}
		// 배열 quantity 정수로 변환
		String[] quantity_ = request.getParameterValues("quantity");
		int[] quantity = new int[quantity_.length];
		for(int i = 0; i < quantity_.length; i++) {
			quantity[i] = Integer.parseInt(quantity_[i]);
		}
		
		// vo
		ArrayList<Cart> list = new ArrayList<>();
		for(int i = 0; i < goodsCode.length; i++) {
			Cart c = new Cart();
			c.setCustomerId(customerId);
			c.setGoodsCode(goodsCode[i]);
			c.setCartQuantity(quantity[i]);
			list.add(c);
		}
		
		// 서비스 호출
		cartService = new CartService();
		int result = cartService.modifyCart(list);
		
		if(result != 1) {
			System.out.println("장바구니 수정 실패");
			response.sendRedirect(request.getContextPath() + "/cartList");
			return;
		}
		
		System.out.println("장바구니 수정 성공");
		response.sendRedirect(request.getContextPath() + "/cartList");
	}
}
