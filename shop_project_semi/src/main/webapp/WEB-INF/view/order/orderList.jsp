<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<h1>주문목록(개인)</h1>
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>대표이미지</th>
				<th>상품명</th>
				<th>금액</th>
				<th>주문상태</th>
				<th>주문일</th>
			</tr>
			
			<c:forEach var="m" items="${orderList}">
				<tr>
					<td>${m['orderCode']}</td>
					<td><img src="${pageContext.request.contextPath}/upload/${m['fileName']}" width="50px" height="50px" alt="이미지"></td>
					<c:if test="${m['quantity'] == 1}">
						<td>${m['goodsName']}</td>
					</c:if>
					<c:if test="${m['quantity'] != 1}">
						<td>${m['goodsName']} 외 ${m['quantity'] - 1}건</td>
					</c:if>
					<td>${m['orderPrice']}원</td>
					<td>${m['orderState']}</td>
					<td>${m['createdate']}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>