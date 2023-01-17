package controller.goods;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.goods.GoodsService;

@WebServlet("/GoodsListByCategoryController")
public class GoodsListByCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GoodsService goodsService = new GoodsService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 카테고리 선택 x -> 상품 전체 목록
		if(request.getParameter("categoryCode") == null) {
			response.sendRedirect(request.getContextPath()+"/goodsList");
			return;
		}
		int categoryCode = Integer.parseInt(request.getParameter("categoryCode"));
		
		ArrayList<HashMap<String, Object>> list = goodsService.getGoodsListByCategory(categoryCode);
		request.setAttribute("list", list);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/goods/goodsListByCategory.jsp").forward(request, response);
	}
}
