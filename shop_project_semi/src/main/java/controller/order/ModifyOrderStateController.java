package controller.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.order.OrderService;
import vo.Customer;
import vo.OrderGoods;

@WebServlet("/modifyOrderState")
public class ModifyOrderStateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		
		if(loginCustomer == null || request.getParameter("orderCode") == null || request.getParameter("goodsCode") == null) {
			response.sendRedirect(request.getContextPath() + "/goodsList");
			return;
		}
		
		// 파라미터 수집
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		
		// vo
		OrderGoods orderGoods = new OrderGoods();
		orderGoods.setOrderCode(orderCode);
		orderGoods.setGoodsCode(goodsCode);
		
		// 서비스 호출
		orderService = new OrderService();
		int result = orderService.modifyOrderState(orderGoods);
		
		if(result == 1) {
			System.out.println("상품 상태 변경 성공");
			response.sendRedirect(request.getContextPath() + "/OrderListController");
		} else {
			System.out.println("상품 상태 변경 실패");
			response.sendRedirect(request.getContextPath() + "/OrderListController");
		}
	}
}
