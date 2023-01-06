<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>goods one</title>
	</head>
	<body>
		<div>
			<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="200px" height="200px" alt="상품 이미지"/>
		</div>
		<div>${m.goodsName}</div>
		<div>${m.goodsPrice}</div>
		
		<form action="${pageContext.request.contextPath}/addCart" method="get">
			<input type="hidden" name="goodsCode" value="${m.goodsCode}">
			<div>
				<span>-</span> <input type="number" name="quantity"> <span>+</span>
			</div>
			<button type="submit">ADD CART</button>
		</form>
		
		<c:if test="${not empty loginEmp}">
			<a href="${pageContext.request.contextPath}/modifyGoods?goodsCode=${m.goodsCode}">수정</a>
			<a href="${pageContext.request.contextPath}/removeGoods?goodsCode=${m.goodsCode}&filename=${m.filename}">삭제</a>
		</c:if>
	</body>
</html>