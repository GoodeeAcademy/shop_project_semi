<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>EMPLOYEE GOODS ONE | TYPESERVICE</title>
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
	
	
		<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/emp/images/favicon.png">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.carousel.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.theme.default.min.css">
	    <link href="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/assets/emp/css/style.css" rel="stylesheet">
</head>
<body>
	<div id="main-wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/view/inc/emp/header.jsp"></jsp:include>
		<!-- sidebar -->
		<jsp:include page="/WEB-INF/view/inc/emp/sidebar.jsp"></jsp:include>
		
		<div class="content-body">
			<!-- Product Detail -->
			<section class="sec-product-detail bg0 p-t-65 p-b-60">
				<div class="container">
					<!-- 상품 이미지 -->
					<div class="row">
						<div class="col-md-6 col-lg-7 p-b-30">
							<div class="p-l-25 p-r-30 p-lr-0-lg">
								<div class="wrap-slick3 flex-sb flex-w">
									<div class="wrap-slick3-dots"></div>
									<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
									<div class="slick3 gallery-lb">
										<c:forEach var="gi" items="${imgList}">
											<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/upload/${gi.filename}">
												<div class="wrap-pic-w pos-relative">
													<img src="${pageContext.request.contextPath}/upload/${gi.filename}" alt="상품 이미지"/>
													<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/upload/${gi.filename}">
														<i class="fa fa-expand"></i>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<!-- 상품 정보 -->
						<div class="col-md-6 col-lg-5 p-b-30">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">${m.goodsName}</h4>
							<span class="price mtext-106 cl2"><fmt:formatNumber value="${m.goodsPrice}" type="number"/>원</span>
							<div>
								<c:if test="${m.soldOut eq 'N'}">
									<span class="price mtext-106 cl2">판매중</span>
								</c:if>
								<c:if test="${m.soldOut eq 'Y'}">
									<span class="price mtext-106 cl2">품절</span>
								</c:if>
							</div>
							<div>
								<span class="price mtext-106 cl2">추천상품 ${m.hit}</span>
							</div>
							<div style="margin-top: 10%;">
								<a href="${pageContext.request.contextPath}/emp/goods/modify?goodsCode=${m.goodsCode}" class="price mtext-106 cl2">수정</a>
								<a href="${pageContext.request.contextPath}/emp/goods/remove?goodsCode=${m.goodsCode}&filename=${m.filename}" class="price mtext-106 cl2">삭제</a>
							</div>
						</div>
						
					</div>
				</div>
				<div class="bor10 m-t-50 p-t-43 p-b-40">
					<!-- Tab -->
					<div class="tab01">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<!-- 탭 추가 -->
							<li class="nav-item p-b-10"><a class="nav-link " data-toggle="tab" href="#description" role="tab">Reviews</a></li>
						</ul>
						<c:forEach var="m" items="${list}">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- 리뷰 -->
										<div class="flex-w flex-t p-b-68">
											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">${m.customerId}</span> 
													<span class="fs-18 cl11">${m.star}</span>
												</div>
												<p class="stext-102 cl6">${m.reviewMemo}</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</div>
	</div>
	
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
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { 
			$(this).magnificPopup({
		        delegate: 'a', 
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
	
	<!--**********************************
	       Scripts
	   ***********************************-->
	   <!-- Required vendors -->
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/global/global.min.js"></script>
	   <script src="${pageContext.request.contextPath}/assets/emp/js/quixnav-init.js"></script>
	   <script src="${pageContext.request.contextPath}/assets/emp/js/custom.min.js"></script>
	
	
	   <!-- Vectormap -->
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/raphael/raphael.min.js"></script>
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/morris/morris.min.js"></script>
	
	
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/circle-progress/circle-progress.min.js"></script>
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/chart.js/Chart.bundle.min.js"></script>
	
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/gaugeJS/dist/gauge.min.js"></script>
	
	   <!--  flot-chart js -->
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/flot/jquery.flot.js"></script>
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/flot/jquery.flot.resize.js"></script>
	
	   <!-- Owl Carousel -->
	   <script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>
	
	   <!-- Counter Up -->
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/js/jquery.vmap.min.js"></script>
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
	   <script src="${pageContext.request.contextPath}/assets/emp/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	
	   <script src="${pageContext.request.contextPath}/assets/emp/js/dashboard/dashboard-1.js"></script>
</body>
</html>