package controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.order.OrderService;
import vo.Emp;
import vo.OrderGoods;

@WebServlet("/AllOrderListController")
public class AllOrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderService();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 모든 직원 가능
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			response.sendRedirect(request.getContextPath()+"/LoginEmpController");
			return;
		}
		
		// 페이징
		int currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;	// 한 페이지당 보여줄 주문 상품 개수
		int beginRow = (currentPage-1)*rowPerPage;
		int pageList = 10; // 페이지 10개씩 보여줌
		int startPage = ((currentPage-1)/pageList)*pageList+1;	// n1
		int endRow = startPage + pageList - 1;	// (n+1)0
		int lastPage = (int)Math.ceil(orderService.getAllOrderGoodsCount()/(double)rowPerPage);
		
		if(endRow > lastPage){	//마지막 페이지보다 더 큰 숫자의 페이지 존재하지 않도록
			endRow = lastPage;
		}
		
		// 모든 주문 내역
		ArrayList<HashMap<String, Object>> orderList = orderService.getAllOrderList(beginRow, rowPerPage);
		
		// 주문 상태
		ArrayList<String> stateList = new ArrayList<>();
		stateList.add("결제전");
		stateList.add("결제완료");
		stateList.add("취소");
		stateList.add("배송준비중");
		stateList.add("배송중");
		stateList.add("배송완료");
		stateList.add("구매확정");
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endRow", endRow);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("orderList", orderList);
		request.setAttribute("stateList", stateList);
				
		// view
		request.getRequestDispatcher("WEB-INF/view/admin/orderList.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 주문상태 수정
		String[] orderCode = request.getParameterValues("orderCode");
		String[] goodsCode = request.getParameterValues("goodsCode");
		String[] orderState = request.getParameterValues("orderState");
		
		ArrayList<OrderGoods> list = new ArrayList<>();
		for(int i = 0; i < 10; i++){// 한 번에 수정하는 개수 == rowPerPage
			OrderGoods og = new OrderGoods();
			og.setOrderCode(Integer.parseInt(orderCode[i]));
			og.setGoodsCode(Integer.parseInt(goodsCode[i]));
			og.setOrderGoodsState(orderState[i]);
			System.out.println(og.getOrderCode() + " " + og.getGoodsCode() + " " + og.getOrderGoodsState()); // 디버깅
			list.add(og);
		}
		
		int row = orderService.modifyOrderStateByEmp(list);
		System.out.println(row);	// 디버깅
		if(row != 10) {
			System.out.println("주문상태 변경 실패");
			response.sendRedirect(request.getContextPath() + "/AllOrderListController");
			return;
		}
		
		System.out.println("주문상태 변경 성공");
		response.sendRedirect(request.getContextPath() + "/AllOrderListController");
	}

}
