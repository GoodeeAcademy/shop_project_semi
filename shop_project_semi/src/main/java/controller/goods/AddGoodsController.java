package controller.goods;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
import vo.Category;
import vo.Emp;
import vo.Goods;
import vo.GoodsImg;

@WebServlet("/emp/goods/add")
public class AddGoodsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GoodsService goodsService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원이 아니라면 직원 로그인 창으로 페이지 전환
		HttpSession session = request.getSession();
		if(session.getAttribute("loginEmp") == null) {
			response.sendRedirect(request.getContextPath() + "/emp/signin");
			return;
		}
		
		goodsService = new GoodsService();
		ArrayList<Category> list = goodsService.getCategoryList();
		request.setAttribute("categoryList", list);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/addGoods.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원이 아니라면 직원 로그인 창으로 페이지 전환
		HttpSession session = request.getSession();
		if(session.getAttribute("loginEmp") == null) {
			response.sendRedirect(request.getContextPath() + "/emp/signin");
			return;
		}
		
		// 파라미터 수집		
		request.setCharacterEncoding("utf-8");
		String dir = request.getServletContext().getRealPath("/upload");
		int maxFileSize = 1024 * 1024 * 100; // 100Mbyte
		DefaultFileRenamePolicy fp = new DefaultFileRenamePolicy();
		MultipartRequest mreq = new MultipartRequest(request, dir, maxFileSize, "utf-8", fp);

		int categoryCode = Integer.parseInt(mreq.getParameter("categoryCode"));
		String goodsName = mreq.getParameter("goodsName");
		int goodsPrice = Integer.parseInt(mreq.getParameter("goodsPrice"));
		String soldOut = mreq.getParameter("soldOut");
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		String empId = loginEmp.getEmpId();
		int hit = Integer.parseInt(mreq.getParameter("hit"));

		ArrayList<HashMap<String, Object>> fileList = new ArrayList<>();
		int fileSeq = 0;
		while(true) {
			HashMap<String, Object> fileMap = new HashMap<String, Object>();
			
			fileMap.put("filename", mreq.getFilesystemName("filename"+fileSeq));	// 저장된 이미지 파일명
			fileMap.put("originName", mreq.getOriginalFileName("filename"+fileSeq));	// 파일 원본명
			fileMap.put("contentType", mreq.getContentType("filename"+fileSeq));	// 파일 확장자
			System.out.println("맵에 들어가는지 - 파일 확장자"+fileSeq+": " + mreq.getContentType("filename"+fileSeq));
			
			fileSeq++;
			if(fileMap.get("contentType") == null) {	// null값 들어오면 반복문 종료
				break;
			}
			fileList.add(fileMap);
		}

		
		// goods vo
		Goods goods = new Goods();
		goods.setCategoryCode(categoryCode);
		goods.setGoodsName(goodsName);
		goods.setGoodsPrice(goodsPrice);
		goods.setSoldOut(soldOut);
		goods.setEmpId(empId);
		goods.setHit(hit);
		ArrayList<GoodsImg> list = new ArrayList<GoodsImg>();
		for(HashMap<String, Object> m : fileList) {
			String contentType = (String)m.get("contentType");
			if(contentType.equals("image/jpeg") || contentType.equals("image/png")){
				
				// goodsImg vo
				GoodsImg goodsImg = new GoodsImg();
				goodsImg.setFilename((String)m.get("filename"));
				goodsImg.setOriginName((String)m.get("originName"));
				goodsImg.setContentType((String)m.get("contentType"));
				list.add(goodsImg);
			}else {
				System.out.print("*.jpg, *.png파일만 업로드 가능");
				File f = new File(dir + "\\" + m.get("filename"));
				if(f.exists()) {
					f.delete();
				}
			}
		}
		
		// service 호출
		goodsService = new GoodsService();
		int autoKey = goodsService.addGoods(goods, list, dir);
		
		if(autoKey == 0) {
			System.out.println("상품 추가 실패");
		}

		response.sendRedirect(request.getContextPath() + "/goods/detail?goodsCode="+autoKey);
	}

}
