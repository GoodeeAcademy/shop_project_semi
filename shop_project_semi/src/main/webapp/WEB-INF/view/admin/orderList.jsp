<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체 주문내역</title>
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
	
	<!-- 모든 주문 내역(관리자) -->
	<form method="post" action="${pageContext.request.contextPath}/AllOrderListController">
		<table>
			<tr>
				<th>주문번호</th>
				<th>상품번호</th>
				<th colspan="2">상품</th>
				<th>주문고객</th>
				<th>상태</th>
				<th>주문일자</th>
			</tr>
			<c:forEach var="m" items="${orderList}">
				<tr>
					<td>
						${m.orderCode}
						<input type="hidden" name="orderCode" value="${m.orderCode}">
					</td>
					<td>
						${m.goodsCode}
						<input type="hidden" name="goodsCode" value="${m.goodsCode}">
					</td>
					<td><img src="${pageContext.request.contextPath}/upload/${m.filename}" width="50px" height="50px" alt="이미지"></td>
					<td>${m.goodsName}</td>
					<td>${m.customerId}</td>
					<td>
						<select name="orderState">
								<c:forEach var="str" items="${stateList}">
									<option value="${str}" <c:if test ="${str eq m.orderState}">selected="selected"</c:if>>${str}</option>
								</c:forEach>
						</select>
					</td>
					<td>${m.createdate}</td>
				</tr>
			</c:forEach>
		</table>
		<button type="submit">주문상태 변경</button>
	</form>
	
	<!-- 페이징 -->
	<div>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/AllOrderListController?currentPage=${endRow-10}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endRow}">
			<c:if test="${i == currentPage}">
				<strong>
					<a href="${pageContext.request.contextPath}/AllOrderListController?currentPage=${i}">${i}</a>
				</strong>
			</c:if>
			<c:if test="${i != currentPage}">
					<a href="${pageContext.request.contextPath}/AllOrderListController?currentPage=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${beginRow+10 < lastPage}">
			<a href="${pageContext.request.contextPath}/AllOrderListController?currentPage=${beginRow+11}">다음</a>
		</c:if>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
</body>
</html>