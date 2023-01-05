package controller.goods;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import service.goods.GoodsService;
import vo.Emp;
import vo.Goods;
import vo.GoodsImg;

@WebServlet("/addGoods")
public class AddGoodsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원이 아니라면 직원 로그인 창으로 페이지 전환
		HttpSession session = request.getSession();
		if(session.getAttribute("loginEmp") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginEmpController");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/goods/addGoods.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원이 아니라면 직원 로그인 창으로 페이지 전환
		HttpSession session = request.getSession();
		if(session.getAttribute("loginEmp") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginEmpController");
			return;
		}
		
		// 파라미터 수집		
		request.setCharacterEncoding("utf-8");
		String dir = request.getServletContext().getRealPath("/upload");
		int maxFileSize = 1024 * 1024 * 100; // 100Mbyte
		DefaultFileRenamePolicy fp = new DefaultFileRenamePolicy();
		MultipartRequest mreq = new MultipartRequest(request, dir, maxFileSize, "utf-8", fp);
		
		String goodsName = mreq.getParameter("goodsName");
		int goodsPrice = Integer.parseInt(mreq.getParameter("goodsPrice"));
		String soldOut = mreq.getParameter("soldOut");
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		String empId = loginEmp.getEmpId();
		int hit = Integer.parseInt(mreq.getParameter("hit"));
		String filename = mreq.getFilesystemName("filename"); // 저장된 이미지 파일 이름
		String originName = mreq.getOriginalFileName("filename"); // 이미지 원본 이름
		String contentType = mreq.getContentType("filename"); // 이미지 파일 검사
		
		if(contentType.equals("image/jpeg") || contentType.equals("image/png")){			
			// goods vo
			Goods goods = new Goods();
			goods.setGoodsName(goodsName);
			goods.setGoodsPrice(goodsPrice);
			goods.setSoldOut(soldOut);
			goods.setEmpId(empId);
			goods.setHit(hit);
			
			// goodsImg vo
			GoodsImg goodsImg = new GoodsImg();
			goodsImg.setFilename(filename);
			goodsImg.setOriginName(originName);
			goodsImg.setContentType(contentType);
			
			// service 호출
			GoodsService goodsService = new GoodsService();
			int result = goodsService.addGoods(goods, goodsImg, dir);
			
			if(result != 1) {
				System.out.println("상품 추가 실패");
			}
		} else {
			System.out.print("*.jpg, *.png파일만 업로드 가능");
			File f = new File(dir + "\\" + mreq.getFilesystemName("fileName"));
			if(f.exists()) {
				f.delete();
			}
		}
		
		response.sendRedirect(request.getContextPath() + "/addGoods");
	}

}
