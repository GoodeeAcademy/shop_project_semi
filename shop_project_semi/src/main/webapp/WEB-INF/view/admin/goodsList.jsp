<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>goods list</title>
	</head>
	<body>
		<h1>상품목록</h1>
		<a href="${pageContext.request.contextPath}/HomeController">홈</a>
		<a href="${pageContext.request.contextPath}/addGoods">상품등록</a>
		
		<table border="1">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>판매가</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${list}">
					<tr>
						<td>${m.goodsCode}</td>
						<td>
							<a href="${pageContext.request.contextPath}/goodsOne?goodsCode=${m.goodsCode}">
								<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="100px" height="100px" alt="상품 이미지"/>
								${m.goodsName}
							</a>
						</td>
						<td>${m.goodsPrice}</td>
						<td>
							<a href="${pageContext.request.contextPath}/removeGoods?goodsCode=${m.goodsCode}&filename=${m.filename}">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>