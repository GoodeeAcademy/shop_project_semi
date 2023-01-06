<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cart list</title>
	</head>
	<body>
		<h1>cart list</h1>
		<table border="1">
			<thead>
				<tr>
					<td>PRODUCT</td>
					<td>PRICE</td>
					<td>QUANTITY</td>
					<td>TOTAL</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="m" items="${list}">
						<td>
							<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="50px" height="50px" alt="상품 이미지"/>
							${m.goodsName}
						</td>
						<td>${m.goodsPrice}</td>
						<td>- ${m.quantity} +</td>
						<td>${m.goodsPrice * m.quantity}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</body>
</html>