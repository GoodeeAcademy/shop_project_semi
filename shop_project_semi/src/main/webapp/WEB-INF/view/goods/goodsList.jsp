<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>goods list</title>
	</head>
	<body>
		<h1>goods list</h1>
		<c:if test="${not empty loginEmp}">
			<a href="${pageContext.request.contextPath}/addGoods">add goods</a>
		</c:if>
		<c:forEach var="m" items="${list}">
			<div>
				<a href="${pageContext.request.contextPath}/goodsOne?goodsCode=${m.goodsCode}">
					<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="200px" height="200px" alt="상품 이미지"/>
				</a>
			</div>
			<div>${m.goodsName}</div>
			<div>${m.goodsPrice}</div>
		</c:forEach>
	</body>
</html>