<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<h1>주문목록 상세</h1>
		<table border="1">
			<tr>
				<th>이미지</th>
				<th>상품명</th>
				<th>개별금액</th>
				<th>수량</th>
				<th>리뷰</th>
			</tr>
			<c:forEach var="m" items="${orderList}">
				<tr>
					<th><img src="${pageContext.request.contextPath}/upload/${m['fileName']}"></th>
					<th>${m['goodsName']}</th>
					<th>${m['price']}</th>
					<th>${m['quantity']}</th>
					<th>리뷰앵커</th>
				</tr>
			</c:forEach>
			<tr>
				<th colspan="4">총 금액</th>
				<td>${totalPrice}</td>
			</tr>
		</table>
	</body>
</html>