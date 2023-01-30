<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
              content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
        <meta name="title" content="ORDER LIST"/>
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		
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
		
		<!-- 구글 폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
		<title>ORDER LIST｜TYPESERVICE</title>
		
		<style>
			.login-button__item{display:block;box-sizing:border-box;width:120px;height:100px;padding:15px 5px 15px;border:1px solid #000;border-radius:4px;font-weight:700;color:#000}
			.content-one {max-width: 1000px; margin: auto; box-sizing:border-box; margin:0 auto;padding-bottom:100px;line-height:21px;}
			.orderInfo{width: 100%; margin: auto;}
			.infoButton{line-height: 65px; font-size: 15px; margin: 5px;}
			.buttonBox{width:100%; margin-top: 5%; text-align: center; vertical-align: middle;}
			th{text-align: center;}
			.signin-input__input{box-sizing:content-box;width:100px;;height:50px;margin-top:8px;padding:0 12px;border-bottom:1px solid #000;background-color:#fff;font-size:15px;color:#000;text-align:center;box-shadow:0 0 0 30px #fff inset!important;transition:border .2s ease-in-out;-webkit-appearance:none;-moz-appearance:none;appearance:none}
			.signin{box-sizing:content-box;height:50px;margin-top:18px;padding:0 5px;background-color:#fff;font-size:30px;color:#000;box-shadow:0 0 0 30px #fff inset!important;transition:border .2s ease-in-out;-webkit-appearance:none;-moz-appearance:none;appearance:none; vertical-align: middle;}
			.login-button__item{display:block;box-sizing:border-box;width:100%;height:50px;padding:14px 16px 15px;border:1px solid #000;border-radius:4px;font-weight:700;color:#000}
		</style>
	</head>
	
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>
		
		
		<!-- content start -->
		
		<div style="margin: 20px 0 30px; padding: 0 0 15px; border-bottom: 1px solid #000; width: 100%">
			<h2 style="color: #000;">주문 상세 내역</h2>
		</div>
		
		<div class="content-one">
			<div class="orderInfo" style="margin-top: 40px;">
				<table class="table table-bordered">
					<tr>
						<th colspan="2">상품명</th>
						<th>개별금액</th>
						<th>수량</th>
						<th>합계금액</th>
					</tr>
					<c:forEach var="m" items="${orderList}">
						<tr>
							<td class="align-middle col-sm-2 text-center"><img src="${pageContext.request.contextPath}/upload/${m['fileName']}" width="100px" height="100px"></td>
							<td class="align-middle col-sm-5 text-center"><a href="${pageContext.request.contextPath}/goods/detail?goodsCode=${m['goodsCode']}">${m['goodsName']}</a></td>
							<td class="align-middle col-sm-2 text-center"><fmt:formatNumber value="${m['price']}" type="number"/>원</td>
							<td class="align-middle col-sm-1 text-center">${m['quantity']}개</td>
							<td class="align-middle col-sm-2 text-center"><fmt:formatNumber value="${m['price']*m['quantity']}" type="number"/>원</td>
						</tr>
					</c:forEach>
					<tr>
						<th colspan="4">합계</th>
						<td class="align-middle text-center"><fmt:formatNumber value="${totalPrice}" type="number"/>원</td>
					</tr>
				</table>
			</div>	
			
			<div class="orderInfo">
				<h3 style="color: #000; margin-top: 40px; margin-bottom: 20px;">CUSTOMER INFO</h3>
				<table class="table">
					<tr>
						<th class="col-sm-3">주문자</th>
						<td class="col-sm-9 align-middle">${customerInfo['orderName']}</td>
					</tr>
					<tr>
						<th class="col-sm-3">연락처</th>
						<td class="col-sm-9 align-middle">${customerInfo['phone']}</td>
					</tr>
					<tr>
						<th class="col-sm-3">배송 주소</th>
						<td class="col-sm-9 align-middle">${customerInfo['address']}</td>
					</tr>
					<tr>
						<th class="col-sm-3">주문일</th>
						<td class="col-sm-9 align-middle">${customerInfo['createdate'] }</td>
					</tr>
					<tr>
						<th class="col-sm-3">포인트 사용 내역</th>
						<td class="col-sm-9 align-middle"><fmt:formatNumber value="${customerInfo['point']}" type="number"/>원</td>
					</tr>
					<tr>
						<th class="col-sm-3">결제 금액<br>(제품금액 - 포인트사용분)</th>
						<td class="col-sm-9 align-middle"><fmt:formatNumber value="${customerInfo['orderPrice']}" type="number"/>원</td>
					</tr>
				</table>
			</div>	
		</div>
		
		<!-- content end -->

		<!-- footer -->
		<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
		
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/select2/select2.min.js"></script>
		
		<!-- 해당 JQuery 스크립트 작성시 해당에 -->
		
		<script>
			// 상품 상세 정보 select 
			$(".js-select2").each(function() {
				$(this).select2({
					minimumResultsForSearch : 20,
					dropdownParent : $(this).next('.dropDownSelect2')
				});
			})
		</script>
		<!--===============================================================================================-->
		<!-- 화면 레이아웃 -->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/js/slick-custom.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script>
			$('.js-pscroll').each(function() {
				$(this).css('position', 'relative');
				$(this).css('overflow', 'hidden');
				var ps = new PerfectScrollbar(this, {
					wheelSpeed : 1,
					scrollingThreshold : 1000,
					wheelPropagation : false,
				});
	
				$(window).on('resize', function() {
					ps.update();
				})
			});
		</script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/js/main.js"></script>
	</body>
</html>