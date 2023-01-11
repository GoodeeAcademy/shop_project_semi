<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	
	<head>
		<meta charset="UTF-8">
		<title>주문페이지</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				let allCheck = false;
				
				$('#submitBtn').click(function() {
					if($('#orderName').val().length < 1) {
						alert('주문자 성함을 입력해주세요.');
						$('#orderName').focus()
					} else if($('#address').val().length < 1 ) {
						alert('주소를 입력해주세요.');
						$('#address').focus();
					} else if($('#point').val().length < 1) {
						alert('사용할 포인트를 입력해주세요.');
						$('#point').val('0');
						$('#point').focus();
					} else {
						allCheck = true;
					}
					
					if(allCheck) {
						$('#orderPage').submit();
					}
				})
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
						<c:set var="totalPrice" value="0"></c:set>
						<c:forEach var="c" items="${cart}">
							<tr>
								<td>${c['goodsName']}</td>
								<td>${c['quantity']}</td>
								<td>${c['goodsPrice'] * c['quantity']}</td>
							</tr>
							<c:set var="totalPrice" value="${totalPrice+(c['goodsPrice']*c['quantity'])}"></c:set>
						</c:forEach>
						<tr>
							<th colspan="2">총 금액</th>
							<td><c:out value="${totalPrice}"></c:out></td>
						</tr>
					</table>
				</div>
			</form>
			
			<form method="post" id="orderPage" action="${pageContext.request.contextPath}/OrderController">
			<table border="1">
				<tr>
					<th>주문자</th>
					<td><input type="text" id="orderName" name="orderName" value="${loginCustomer.customerName}"></td>
				</tr>
				<!--  
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="phone1" name="phone1" value="${splitPhone[0]}">
						-
						<input type="text" id="phone2" name="phone2" value="${splitPhone[1]}">
						-
						<input type="text" id="phone3" name="phone3" value="${splitPhone[2]}">
					</td>
				</tr>
				-->
				<tr>
					<th>주소</th>
					<td><input type="text" id="address" name="address" value="${address}"></td>
				</tr>
				<tr>
					<th>포인트 할인</th>
					<td><input type="text" name="point" id="point" value="${loginCustomer.point}">원 할인 | <span style="color:red;">${loginCustomer.point}원 사용 가능</span></td>
				</tr>
			</table>
			<button type="button" id="submitBtn">주문하기</button>
			</form>
		</div>
	</body>
	
</html>