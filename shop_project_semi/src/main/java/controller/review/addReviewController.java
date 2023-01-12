package controller.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.review.ReviewService;
import vo.Customer;
import vo.PointHistory;
import vo.Review;

@WebServlet("/addReview")
public class addReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService reviewService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		
		if(loginCustomer == null || request.getParameter("orderCode") == null 
				|| request.getParameter("goodsCode") == null || request.getParameter("totalPrice") == null) {
			response.sendRedirect(request.getContextPath() + "/goodsList");
			return;
		}
		
		// 파라미터 수집
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice")); // 수량*가격
		final float ACCUMULATION_RATE = (float)0.01; // 적립률
		int point = (int)(totalPrice * ACCUMULATION_RATE);
		System.out.println(point);
		
		// vo 
		Review review = new Review();
		review.setOrderCode(orderCode);
		review.setGoodsCode(goodsCode);
		
		// 서비스 호출
		reviewService = new ReviewService();
		HashMap<String, Object> m = reviewService.getGoodsOneByReview(review);
		m.put("point", point);
		
		// 객체 바인딩
		request.setAttribute("m", m);
		request.getRequestDispatcher("/WEB-INF/view/review/addReview.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		
		if(loginCustomer == null) {
			response.sendRedirect(request.getContextPath() + "/goodsList");
			return;
		}
		
		// 파라미터 수집
		request.setCharacterEncoding("utf-8");

		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		int star = Integer.parseInt(request.getParameter("star"));
		String reviewMemo = request.getParameter("reviewMemo");
		String customerId = loginCustomer.getCustomerId();
		int point = Integer.parseInt(request.getParameter("point")); // 적립 포인트
		
		// vo 
		Review review = new Review();
		review.setOrderCode(orderCode);
		review.setGoodsCode(goodsCode);
		review.setStar(star);
		review.setReviewMemo(reviewMemo);
		// 리뷰 포인트
		Customer customer = new Customer();
		customer.setCustomerId(customerId);
		customer.setPoint(point);
		PointHistory pointHistory = new PointHistory();
		pointHistory.setOrderCode(orderCode);
		pointHistory.setPoint(point);
		
		// 서비스 호출
		reviewService = new ReviewService();
		int result = reviewService.addReview(review, customer, pointHistory);
		
		// 출력용
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			System.out.println("리뷰 등록 성공");
			out.println("<script>alert('리뷰 등록 성공'); window.opener.parent.location.reload();</script>");
			out.println("<script>window.close();</script>");			
			out.close();
		} else {
			System.out.println("리뷰 등록 실패");
			out.println("<script>alert('리뷰 등록 실패'); window.opener.parent.location.reload();</script>"); 
			out.println("<script>window.close(); </script>"); 
			out.close();
		}
	}
}
