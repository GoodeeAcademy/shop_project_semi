<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	
	<head>
		<meta charset="UTF-8">
		<title>주문페이지</title>
		<script>
			$(document).ready(function() {
				
			})
		</script>
	</head>
	
	<body>
		<h1>주문 페이지</h1>
		<div>
			<form method="post" id="orderGoods">
				<div>
					<table border="1">
						<tr>
							<th>상품명</th>
							<th>수량</th>
							<th>금액</th>
						</tr>
						<c:forEach var="c" items="${cart}">
							<tr>
								<td>${c['goodsName']}</td>
								<td>${c['quantity']}</td>
								<td>${c['goodsPrice']}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</form>
			
			<form method="post" id="orderPage" action="">
			<table border="1">
				<tr>
					<th>주문자</th>
					<td><input type="text" name="customerName" value="${loginCustomer.customerName}"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone1" value="${splitPhone[0]}">
						-
						<input type="text" name="phone2" value="${splitPhone[1]}">
						-
						<input type="text" name="phone3" value="${splitPhone[2]}">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="${address}"></td>
				</tr>
				<tr>
					<th>포인트 할인</th>
					<td><input type="text" name="point">원 할인</td>
				</tr>
			</table>
			<button type="button">주문하기</button>
			</form>
		</div>
	</body>
	
</html>