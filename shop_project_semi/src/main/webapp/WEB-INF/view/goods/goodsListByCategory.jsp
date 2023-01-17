<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>goods list</title>
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
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>

	<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/js/main.js"></script>

	<h1>goods list</h1>
	<c:forEach var="m" items="${list}">
		<div>
			<a href="${pageContext.request.contextPath}/goodsOne?goodsCode=${m.goodsCode}">
				<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="200px" height="200px" alt="상품 이미지"/>
			</a>
		</div>
		<div>${m.goodsName}</div>
		<div>${m.goodsPrice}</div>
	</c:forEach>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
</body>
</html>