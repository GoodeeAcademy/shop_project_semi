<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<h1>회원 상세 정보</h1>
		<div>
			<table>
				<tr>
					<th>ID</th>
					<td>${loginCustomer.customerId}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${loginCustomer.customerName }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${loginCustomer.customerPhone }</td>
				</tr>
				<tr>
					<th>포인트</th>
					<td>${loginCustomer.point }</td>
				</tr>
			</table>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/ModifyCustomerController">회원정보 수정</a>
			<a href="${pageContext.request.contextPath}/SignOutController">로그아웃</a>
		</div>
	</body>
</html>