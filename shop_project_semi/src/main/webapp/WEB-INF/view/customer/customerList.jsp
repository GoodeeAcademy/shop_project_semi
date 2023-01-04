<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<h1>고객리스트 전체</h1>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>이름</td>
				<td>번호</td>
				<td>포인트</td>
				<td>가입일</td>
			</tr>
			<c:forEach var="c" items="${customerList}">
				<td>${c.customerId}</td>
				<td>${c.customerName}</td>
				<td>${c.customerPhone}</td>
				<td>${c.point}</td>
				<td>${c.createdate}</td>
			</c:forEach>
		</table>
	</body>
</html>