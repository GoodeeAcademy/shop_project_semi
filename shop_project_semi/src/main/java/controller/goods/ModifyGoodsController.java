package controller.goods;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
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
		ArrayList<GoodsImg> imgList = goodsService.getAllGoodsImg(goodsCode);
		
		// 객체 바인딩 후 페이지 이동
		request.setAttribute("m", m);
		request.setAttribute("imgList", imgList);
		request.setAttribute("listSize", imgList.size());
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
		
		ArrayList<HashMap<String, Object>> fileList = new ArrayList<>();
		Enumeration<?> files = mreq.getFileNames();
		int fileSeq = 0;
		int listSize = Integer.parseInt(mreq.getParameter("listSize"));
		while(files.hasMoreElements()) {
			HashMap<String, Object> fileMap = new HashMap<String, Object>();
			
			String goodsImgCode = mreq.getParameter("goodsImgCode"+fileSeq);
			fileMap.put("goodsImgCode", goodsImgCode);
			fileMap.put("filename", mreq.getFilesystemName("filename"+fileSeq));	// 저장된 이미지 파일명
			fileMap.put("originName", mreq.getOriginalFileName("filename"+fileSeq));	// 파일 원본명
			fileMap.put("contentType", mreq.getContentType("filename"+fileSeq));	// 파일 확장자

			fileMap.put("seq", fileSeq);	//기존 이미지 삭제를 위해 ①
			fileSeq++;
			if(fileMap.get("contentType") == null) {
				continue;
			}
			fileMap.put("check", true);	// 기존 이미지 삭제를 위해 ②
			fileList.add(fileMap);
			if(fileSeq >= listSize) {
				break;
			}
		}
		
		// goods vo
		Goods goods = new Goods();
		goods.setGoodsCode(goodsCode);
		goods.setGoodsName(goodsName);
		goods.setGoodsPrice(goodsPrice);
		goods.setSoldOut(soldOut);
		goods.setEmpId(empId);
		goods.setHit(hit);
		
		ArrayList<GoodsImg> list = new ArrayList<GoodsImg>();
		System.out.println(fileList.size()+"<-----수정할 파일 개수");
		for(HashMap<String, Object> m : fileList) {
			String contentType = (String)m.get("contentType");
			System.out.println(contentType+"<-------이미지 유형");
			if(contentType.equals("image/jpeg") || contentType.equals("image/png")){
				// goodsImg vo
				GoodsImg goodsImg = new GoodsImg();
				int goodsImgCode = Integer.parseInt((String)m.get("goodsImgCode"));
				goodsImg.setGoodsImgCode(goodsImgCode);
				goodsImg.setGoodsCode(goodsCode);
				goodsImg.setFilename((String)m.get("filename"));
				goodsImg.setOriginName((String)m.get("originName"));
				goodsImg.setContentType((String)m.get("contentType"));
				list.add(goodsImg);
				
			} else {
				System.out.print("*.jpg, *.png파일만 업로드 가능");
				File f = new File(dir + "\\" + (String)m.get("filename"));
				if(f.exists()) {
					f.delete();
				}
			}		
		}
		
		// service 호출
		GoodsService goodsService = new GoodsService();
		int result = goodsService.modifyGoods(goods, list, dir);
		
		if(result < 1) {
			System.out.println("ModifyGoodsController: updateGoodsImg fail");
		}
		
		// 수정 완료 시 이전 이미지 파일 삭제
		for(HashMap<String, Object> m : fileList) {
			if((boolean)m.get("check")) {	// 수정한 이미지 파일이라면	
				System.out.println("들어는 옴?");
				File f = new File(dir + "\\" + mreq.getParameter("oldFilename"+(int)m.get("seq")));
				if(f.exists()) {
					f.delete();
					System.out.println("ModifyGoodsController : 기존 파일 삭제 완료");
				}
			}
		}
		
		response.sendRedirect(request.getContextPath() + "/goodsList");
	}

}
