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
				<th>합계금액</th>
			</tr>
			<c:forEach var="m" items="${orderList}">
				<tr>
					<td><img src="${pageContext.request.contextPath}/upload/${m['fileName']}"></td>
					<td><a href="${pageContext.request.contextPath}/goodsOne?goodsCode=${m['goodsCode']}">${m['goodsName']}</a></td>
					<td>${m['price']}원</td>
					<td>${m['quantity']}개</td>
					<td>${m['price']*m['quantity']}원</td>
				</tr>
			</c:forEach>
			<tr>
				<th colspan="4">총 금액</th>
				<td>${totalPrice}원</td>
			</tr>
		</table>
		<div>
			<h3>고객 정보</h3>
			<table border="1">
				<tr>
					<th>주문자</th>
					<td>${customerInfo['orderName']}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${customerInfo['phone']}</td>
				</tr>
				<tr>
					<th>배송 주소</th>
					<td>${customerInfo['address']}</td>
				</tr>
				<tr>
					<th>주문일</th>
					<td>${customerInfo['createdate'] }</td>
				</tr>
				<tr>
					<th>포인트 사용 내역</th>
					<td>${customerInfo['point']}원</td>
				</tr>
				<tr>
					<th>결제 금액(제품금액 - 포인트사용분)</th>
					<td>${customerInfo['orderPrice']}원</td>
				</tr>
			</table>
		</div>
	</body>
</html>