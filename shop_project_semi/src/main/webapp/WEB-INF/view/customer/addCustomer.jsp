<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
              content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
        <meta name="title" content="SIGN UP"/>
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
		
		<!-- 구글 폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
		<title>SIGN UP｜TYPESERVICE</title>
		<style type="text/css">
			.content{box-sizing:border-box;max-width:700px;margin:0 auto;padding-bottom:100px;line-height:21px}
			.login-member{padding-right:15px;padding-left:15px;}
			.login-form{margin:5px 0 0;padding:0 15px}
			.login-member__form{margin-top:20px}
			.login-input{margin-top:8px;}
			.login-input__input{box-sizing:border-box;width:100%;height:50px;margin-top:8px;padding:0 12px;border-bottom:1px solid #000;background-color:#fff;font-size:15px;color:#000;box-shadow:0 0 0 30px #fff inset!important;transition:border .2s ease-in-out;-webkit-appearance:none;-moz-appearance:none;appearance:none}
			.login-button.login-button--static{margin-top:0;padding-right:0;padding-left:0}
			.login-button__item{display:block;box-sizing:border-box;width:100%;height:50px;padding:14px 16px 15px;border:1px solid #000;border-radius:4px;font-weight:700;color:#000}
			.login-button__item--black{background-color:#000;color:#fff}
			.signin-input__input{box-sizing:content-box;width:30%;height:50px;margin-top:8px;padding:0 12px;border-bottom:1px solid #000;background-color:#fff;font-size:15px;color:#000;box-shadow:0 0 0 30px #fff inset!important;transition:border .2s ease-in-out;-webkit-appearance:none;-moz-appearance:none;appearance:none}
			.signin{box-sizing:content-box;width:5%;height:50px;margin-top:18px;padding:0 12px;background-color:#fff;font-size:15px;color:#000;box-shadow:0 0 0 30px #fff inset!important;transition:border .2s ease-in-out;-webkit-appearance:none;-moz-appearance:none;appearance:none;text-align: center; vertical-align: middle;}
		</style>
	</head>
	
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>
		
		<!-- content -->
		<div class = "container content" style="margin-top: 5%;">
			<div class="login-member">
				<h1 class="login-form" style="color:#000;">SIGN UP</h1>
				<form action="${pageContext.request.contextPath}/AddCustomerController" method="post" id="addCustomerForm" class="login-form">
					<div class="login-member__form">
						<h4 class="login-input" style="color:#000">필수 입력 사항</h4>
						<div class="login-input">
							<input type="text" name="addId" id="addId" class="login-input__input" placeholder="아이디">
						</div>
						<div class="login-input">
							<input type="password" name="addPw" id="addPw" class="login-input__input" placeholder="비밀번호">
						</div>
						<div class="login-input">
							<input type="text" name="addName" id="addName" class="login-input__input" placeholder="이름">
						</div>
						<div class="login-input d-flex flex-row">
							<select name="addPhone1" id="addPhone1" class="signin-input__input" style="text-align: center;">
								<option value="">==선택==</option>
								<option value="010">02</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="012">031</option>
								<option value="013">032</option>
								<option value="0507">0507</option>
							</select>
							<span class="signin">-</span>
							<input type="text" name="addPhone2" id="addPhone2" maxlength="4" 
								oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1').replace(/^0[^.]/, '0');"
								class="signin-input__input" placeholder="전화번호1">
							<span class="signin">-</span>
							<input type="text" name="addPhone3" id="addPhone3" maxlength="4"
								oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1').replace(/^0[^.]/, '0');"
								class="signin-input__input" placeholder="전화번호2">
							<!-- oninput : 해당 input에 숫자를 제외하고는 입력이 불가능하도록 설정함. number가 아닌 이유는 못생겨서 -->
						</div>
					</div>
					<div class="login-member__form" style="margin-top: 8%">
						<h4 class="login-input" style="color:#000">선택 입력 사항</h4>
						<div>
							<input type="text" name="addAddress1" id="addAddress1" class="login-input__input" placeholder="주소지">
						</div>
						<div class="mt-4">
							<button type="button" id="submitBtn" class="login-button__item login-button__item--black">SIGN UP</button>
						</div>
					</div>
				</form>
			</div>
			<div class="mt-2 p-4 text-center">
				<span style="color:blue; margin-right: 10px;">이미 가입한 회원이라면?</span>
				<a href="${pageContext.request.contextPath}/SignInController" class="btn" style="background-color: white; color: blue; height: 30px; outline: 1px solid; align-content:center;">SIGN IN</a>
			</div>
		</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
		<!-- content end -->
		
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/select2/select2.min.js"></script>
		<script>
			$(document).ready(function() {
				let addFalse = ${addFalse};
				if(addFalse) {
					alert('회원가입에 실패하였습니다.');
				}
				
				let allCheck = false;
				$('#submitBtn').click(function() {
					console.log('submitBtn 클릭');
					if($('#addId').val().length < 1) {
						alert('아이디를 입력해주세요.');
					} else if($('#addPw').val().length < 1) {
						alert('비밀번호를 입력해주세요.');
					} else if($('#addName').val().length < 1) {
						alert('이름을 입력해주세요.');
					} else if($('#addPhone1 option:selected').val().length < 1) {
						alert('지역번호를 선택해주세요.');
					} else if($('#addPhone2').val().length < 3 || $('#addPhone3').val().length < 4) {
						$('#addPhone2').focus();
						alert('올바른 전화번호를 입력하여 주세요.');
					} else {
						allCheck = true;
					}
					
					if(allCheck) {
						$('#addCustomerForm').submit();
					}
				});
			})
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