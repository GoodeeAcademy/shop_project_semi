<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의 | ${question.questionMemo}</title>
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
	<style>
		.row_for_text{
			height: 60px;
		}
		.row_for_content{
			height: 400px;
		}
		.col_exceptContent {
			width: 15%;
		}
	</style>
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
			Question & Answer
		</h2>
	</section>
	
	<!-- 문의 -->
	<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto" style="margin-top: 5%; margin-bottom: 5%;">
		<div class="row p-b-25">
			<table class="table-shopping-cart">
				<tr class="row_for_text">
					<td class="col_exceptContent">상품명</td>
					<td>${m.goodsName}</td>
				</tr>
				<tr class="row_for_text">	
					<td class="col_exceptContent">종류</td>
					<td>${question.category}</td>
				</tr>
				<tr class="row_for_text">
					<td class="col_exceptContent">작성자</td>
					<td>${question.customerId}</td>
				</tr>
				<tr class="row_for_text">	
					<td class="col_exceptContent">날짜</td>
					<td>${question.createdate}</td>
				</tr>
				<tr class="row_for_text">
					<td class="col_exceptContent">제목</td>
					<td>${question.questionTitle}</td>
				</tr>
				<tr class="row_for_content">	
					<td></td>
					<td>${question.questionMemo}</td>
				</tr>
			</table>
		</div>
		
		<!-- 답변 -->
		<div style="margin-top: 5%; margin-bottom: 5%;">
			<div class="row p-b-25">
				<c:if test="${comment != null}">
					<table class="table-shopping-cart">
						<tr class="row_for_text">
							<td class="col_exceptContent">답변날짜</td>
							<td>${comment.createdate}</td>
						</tr>
						<tr class="row_for_content">	
							<td></td>
							<td>${comment.commentMemo}</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${comment == null}">
					<!-- 고객 -->
					<c:if test="${loginEmp == null}">	
						<span>답변대기</span>
					</c:if>
					<!-- 직원 -->
					<c:if test="${loginCustomer == null}">
					<form method="post" action="${pageContext.request.contextPath}/AddCommentController">
						<div class="row p-b-25">
							<div class="col-sm-6 p-b-5">
								<label class="stext-102 cl3">문의번호</label>
								<span>
									${question.goodsCode}
									<input type="hidden" name="questionCode" value="${question.questionCode}">
								</span>
							</div>
							<div class="col-12 p-b-5">
								<label class="stext-102 cl3">내용</label>
								<textarea rows="10" cols="10" name="commentMemo" class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"></textarea>
							</div>
						</div>
						<button type="submit" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">등록</button>
					</form>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
</body>
</html>