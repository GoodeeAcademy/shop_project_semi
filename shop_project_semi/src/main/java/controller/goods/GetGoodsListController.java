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

@WebServlet("/goodsList")
public class GetGoodsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GoodsService goodsService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 수집
		String search = "";
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		
		// 서비스 호출
		goodsService = new GoodsService();
		ArrayList<HashMap<String, Object>> list = goodsService.getGoodsList(search);
		
		// 객체 바인딩 후 페이지 이동
		request.setAttribute("list", list);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginEmp") == null) {
			request.getRequestDispatcher("/WEB-INF/view/goods/goodsList.jsp").forward(request, response);			
		} else {
			request.getRequestDispatcher("/WEB-INF/view/admin/goodsList.jsp").forward(request, response);
		}
	}
}
