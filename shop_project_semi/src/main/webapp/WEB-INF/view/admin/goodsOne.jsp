<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>goods one</title>
	</head>
	<body>
		<h1>상품상세</h1>
		<table border="1">
			<tr>
				<th>상품코드</th>
				<td>${m.goodsCode}</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>
					<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="100px" height="100px" alt="상품 이미지"/>
					${m.goodsName}
				</td>
			</tr>
			<tr>
				<th>판매가격</th>
				<td>${m.goodsPrice}</td>
			</tr>
			<tr>
				<th>판매상태</th>
				<td>
					<c:if test="${m.soldOut eq 'Y'}">
						판매함
					</c:if>
					<c:if test="${m.soldOut eq 'N'}">
						판매안함
					</c:if>
				</td>
			</tr>
			<tr>
				<th>추천상품</th>
				<td>${m.hit}</td>
			</tr>
		</table>
		<a href="${pageContext.request.contextPath}/modifyGoods?goodsCode=${m.goodsCode}">수정</a>
		<a href="${pageContext.request.contextPath}/removeGoods?goodsCode=${m.goodsCode}&filename=${m.filename}">삭제</a>
	</body>
</html>