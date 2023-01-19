package controller.goods;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.goods.GoodsService;
import vo.GoodsImg;

@WebServlet("/goodsOne")
public class GetGoodsOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GoodsService goodsService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 수집
		if(request.getParameter("goodsCode") == null || ("").equals(request.getParameter("goodsCode"))) {
			response.sendRedirect(request.getContextPath() + "/goodsList");
			return;
		}
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		
		// 서비스 호출
		goodsService = new GoodsService();
		HashMap<String, Object> m = goodsService.getGoodsOne(goodsCode);
		ArrayList<GoodsImg> imgList = goodsService.getAllGoodsImg(goodsCode);
		ArrayList<HashMap<String, Object>> reviewList = goodsService.getReviewByGoods(goodsCode);
		
		// 객체 바인딩 후 페이지 이동
		request.setAttribute("m", m); // 상품 상세 정보
		request.setAttribute("imgList", imgList);	// 상품 전체 사진
		request.setAttribute("reviewList", reviewList); // 리뷰 리스트
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginEmp") == null) {
			request.getRequestDispatcher("/WEB-INF/view/goods/goodsOne.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/WEB-INF/view/admin/goodsOne.jsp").forward(request, response);
		}
	}
}
