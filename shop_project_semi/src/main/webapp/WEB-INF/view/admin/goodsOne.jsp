<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>goods one</title>
	</head>
	<a href="${pageContext.request.contextPath}/HomeController">home</a>
	<a href="${pageContext.request.contextPath}/EmpMainController">직원페이지</a>
	<a href="${pageContext.request.contextPath}/goodsList">shop</a>
	<a href="${pageContext.request.contextPath}/NoticeListController">notice</a>
	<a href="${pageContext.request.contextPath}/QuestionListForEmpController">문의(직원)</a>
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

		<!-- 상품 전체 이미지 -->
		<table>
			<c:forEach var="gi" items="${imgList}">
			<tr>
				<td><img src="${pageContext.request.contextPath}/upload/${gi.filename}" width="100px" height="100px" alt="상품 이미지"/></td>
			</tr>
			</c:forEach>
		</table>
		
		<h4>리뷰</h4>
		<c:forEach var="m" items="${list}">
			<div>
				<div>
					<span>${m.customerId}</span>
					<span>${m.star}</span>
				</div>
				<div>
					<p>
						${m.reviewMemo}
					</p>
				</div>
			</div>		
		</c:forEach>
	</body>
</html>