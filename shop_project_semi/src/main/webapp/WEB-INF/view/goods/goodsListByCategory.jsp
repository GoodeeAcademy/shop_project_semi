<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>goods list</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="icon" type="image/png" href="images/icons/favicon.png" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/linearicons-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/MagnificPopup/magnific-popup.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/style.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>
	<div class="row isotope-grid">
		<c:if test="${empty list}">
			<div class="d-flex justify-content-center align-items-center" style="height: 100vh; color:black;">등록된 상품이 없습니다.</div>
		</c:if>
		<c:forEach var="m" items="${list}">
			<div class="col-sm-6 col-md-4 col-lg-3 isotope-item p-0 border-bottom border-start border-dark">
				<div class="block2">
					<div class="block2-pic hov-img0">
						<a href="${pageContext.request.contextPath}/goodsOne?goodsCode=${m.goodsCode}">
							<img src="${pageContext.request.contextPath}/upload/${m.filename}" alt="IMG-PRODUCT">
						</a>
					</div>
					<div class="d-flex flex-column align-items-end mr-3">
						<a href="${pageContext.request.contextPath}/goodsOne?goodsCode=${m.goodsCode}" class="text-dark">
							${m.goodsName}
						</a> 
						<span class="text-dark"><fmt:formatNumber value="${m.goodsPrice}" type="number"/>원</span>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- 화면 레이아웃 -->
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/assets/shop/js/main.js"></script>
</body>
</html>