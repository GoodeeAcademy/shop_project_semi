<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
              content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
        <meta name="title" content="로그인"/>
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/customer/login.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/customer/common.css">
		<script src="${pageContext.request.contextPath}/assets/customer/common-appinterface.js" type="text/javascript"></script>
		
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
		
		<title>로그인</title>
		<style type="text/css">
			.login-member{padding-right:15px;padding-left:15px;}
			.login-form{margin:5px 0 0;padding:0 15px}
			.login-member__form{margin-top:20px}
			.login-input{margin-top:8px}
			.login-input__input{box-sizing:border-box;width:100%;height:50px;margin-top:8px;padding:0 12px;border-bottom:1px solid #000;border-radius:4px;background-color:#fff;font-size:15px;color:#000;box-shadow:0 0 0 30px #fff inset!important;transition:border .2s ease-in-out;-webkit-appearance:none;-moz-appearance:none;appearance:none}
			.login-button.login-button--static{margin-top:0;padding-right:0;padding-left:0}
			.login-button__item{display:block;box-sizing:border-box;width:100%;height:50px;padding:14px 16px 15px;border:1px solid #000;border-radius:4px;font-weight:700;color:#000}
			.login-button__item--black{background-color:#000;color:#fff}
		</style>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>
		<!-- content start -->
		<div class="container" style="margin-top: 10%">
			<div class="login-member">
				<h1 class="login-form" style="color:#000">SIGN IN</h1>
				<form method="post" action="${pageContext.request.contextPath}/SignInController" id="loginForm" class="login-form">
				<div class="login-member__form">
					<div class="login-input">
						<input type="text" name="loginId" id="loginId" placeholder="아이디" class="login-input__input">
					</div>
					<div class="login-input">
						<input type="password" name="loginPw" id="loginPw" placeholder="비밀번호" class="login-input__input">
					</div>
					<div class="mt-4">
						<button type="button" id="submitBtn" class="login-button__item login-button__item--black">SIGN IN</button>
					</div>
				</div>
				</form>
			</div>
			<div class="mt-2 p-4 text-center">
				<span style="color:blue;">가입 시 구매금액 1% 적립</span>
				<a href="${pageContext.request.contextPath}/AddCustomerController" class="btn" style="background-color: white; color: blue; height: 30px; outline: 1px solid;">회원가입</a>
			</div>
		</div>
		<!-- content end -->
		
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/select2/select2.min.js"></script>
		
		<script>
			$(document).ready(function() {
				let allCheck = false;
				$('#submitBtn').click(function() {
					if($('#loginId').val().length < 1) {
						$('#loginId').focus();
						alert('ID를 입력해주세요.');
					} else if($('#loginPw').val().length < 1) {
						$('#loginPw').focus();
						alert('Password를 입력해주세요.');
					} else {
						allCheck = true;
					}
					
					if(allCheck) {
						$('#loginForm').submit();
					}
				});
			});
		</script>
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