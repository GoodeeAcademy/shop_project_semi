package controller.goods;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import service.goods.GoodsService;
import vo.Emp;
import vo.Goods;
import vo.GoodsImg;

@WebServlet("/modifyGoods")
public class ModifyGoodsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GoodsService goodsService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원이 아니라면 직원 로그인 창으로 페이지 전환
		HttpSession session = request.getSession();
		if(session.getAttribute("loginEmp") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginEmpController");
			return;
		}
		
		// 파라미터 수집
		if(request.getParameter("goodsCode") == null || ("").equals(request.getParameter("goodsCode"))) {
			response.sendRedirect(request.getContextPath() + "/goodsList");
			return;
		}
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		
		// 서비스 호출
		goodsService = new GoodsService();
		HashMap<String, Object> m = goodsService.getGoodsOne(goodsCode);
		m.put("dir", request.getServletContext().getRealPath("/upload"));
		
		// 객체 바인딩 후 페이지 이동
		request.setAttribute("m", m);
		request.getRequestDispatcher("/WEB-INF/view/admin/modifyGoods.jsp").forward(request, response);
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
		
		int goodsCode = Integer.parseInt(mreq.getParameter("goodsCode"));
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
			goods.setGoodsCode(goodsCode);
			goods.setGoodsName(goodsName);
			goods.setGoodsPrice(goodsPrice);
			goods.setSoldOut(soldOut);
			goods.setEmpId(empId);
			goods.setHit(hit);
			
			// goodsImg vo
			GoodsImg goodsImg = new GoodsImg();
			goodsImg.setGoodsCode(goodsCode);
			goodsImg.setFilename(filename);
			goodsImg.setOriginName(originName);
			goodsImg.setContentType(contentType);
			
			// service 호출
			GoodsService goodsService = new GoodsService();
			int result = goodsService.modifyGoods(goods, goodsImg, dir);
			
			if(result != 1) {
				System.out.println("ModifyGoodsController: updateGoodsImg fail");
			}
			
			// 수정 완료 시 이전 이미지 파일 삭제
			File f = new File(dir + "\\" + mreq.getParameter("oldFilename"));
			if(f.exists()) {
				f.delete();
			}
		} else {
			System.out.print("*.jpg, *.png파일만 업로드 가능");
			File f = new File(dir + "\\" + mreq.getFilesystemName("fileName"));
			if(f.exists()) {
				f.delete();
			}
		}
		
		response.sendRedirect(request.getContextPath() + "/goodsList");
	}

}
