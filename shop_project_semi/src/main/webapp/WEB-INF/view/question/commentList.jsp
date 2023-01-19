<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>답변 목록</title>
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
		.col_small {
			width: 4%;
		}
		.col_date {
			width: 16%;	
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
			Answer
		</h2>
	</section>
	
	<!-- 답변 목록 -->
	<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto" style="margin-top: 5%; margin-bottom: 5%;">
		<div class="row p-b-25">
			<table class="table-shopping-cart">
				<tr class="table_head">
					<th class="col_small">답변번호</th>
					<th class="col_small">문의번호</th>
					<th>답변</th>
					<th class="col_date">날짜</th>
				</tr>
				<c:forEach var="c" items="${list}">
					<tr class="row_for_text">
						<td>${c.commentCode}</td>
						<td>${c.questionCode}</td>
						<td>${c.commentMemo}</td>
						<td>${c.createdate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 페이징 -->
		<div class="flex-c-m flex-w w-full p-t-38">
			<c:if test="${currentPage > 10}">
				<a href="${pageContext.request.contextPath}/QuestionCommentListController?currentPage=${startPage-10}" class="flex-c-m how-pagination1 trans-04 m-all-7">이전</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endRow}">
				<c:if test="${i == currentPage}">
						<a href="${pageContext.request.contextPath}/QuestionCommentListController?currentPage=${i}" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${i}</a>
				</c:if>
				<c:if test="${i != currentPage}">
						<a href="${pageContext.request.contextPath}/QuestionCommentListController?currentPage=${i}" class="flex-c-m how-pagination1 trans-04 m-all-7">${i}</a>
				</c:if>
			</c:forEach>
			<c:if test="${beginRow+10 < lastPage}">
				<a href="${pageContext.request.contextPath}/QuestionCommentListController?currentPage=${startPage+10}" class="flex-c-m how-pagination1 trans-04 m-all-7">다음</a>
			</c:if>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
</body>
</html>