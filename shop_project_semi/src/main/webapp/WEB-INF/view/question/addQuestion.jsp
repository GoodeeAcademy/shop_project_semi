<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Q&amp;A｜TYPESERVICE</title>
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
<script>
	$(document).ready(function(){
		let allCheck = false;
	
		let questionTitle = $('#questionTitle');
		let questionMemo = $('#questionMemo');
		
		$('#btn').click(function(){
			if(questionTitle.val().length < 1 || questionTitle.val().trim() == ''){	// 공백 입력 방지
				alert('제목을 입력해 주세요');
			}else if(questionMemo.val().length < 1 || questionMemo.val().trim() == ''){
				alert('내용을 입력해 주세요');
			}else {
				allCheck = true;
			}
			if(allCheck){
				$('#form').submit();
			}
		});
		
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/shop/js/main.js"></script>
	
	<!-- 사진 파일 변경 필요 -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${pageContext.request.contextPath}/assets/shop/images/bg-03.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Question
		</h2>
	</section>	
	
	<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto" style="margin-top: 5%; margin-bottom: 5%;">
		<div class="p-b-30 m-lr-15-sm">
			<form method="post" action="${pageContext.request.contextPath}/member/question/add" id="form">
				<div class="row p-b-25">
					<div class="col-sm-6 p-b-5">
							<input type="hidden" name="orderCode" value="${orderCode}">
						<label class="stext-102 cl3">제목</label>
						<input type="text" name="questionTitle" class="size-111 bor8 stext-102 cl2 p-lr-20" id="questionTitle">
					</div>
					<div class="col-sm-6 p-b-5">
						<label class="stext-102 cl3">문의종류</label>
							<select name="category">
								<option value="배송">배송</option>
								<option value="반품">반품</option>
								<option value="교환">교환</option>
								<option value="기타">기타</option>
							</select>
						<label class="stext-102 cl3">상품명</label>
							${m.goodsName}
							<input type="hidden" name="goodsCode" value="${m.goodsCode}">
					</div>
					<div class="col-12 p-b-5">
						<label class="stext-102 cl3">내용</label>
						<textarea rows="10" cols="10" name="questionMemo" class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="questionMemo"></textarea>
					</div>
				</div>
				<button type="button" id="btn" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">문의하기</button>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
</body>
</html>