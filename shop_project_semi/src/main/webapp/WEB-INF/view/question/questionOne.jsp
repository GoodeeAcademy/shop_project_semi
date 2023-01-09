<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
</head>
<body>
	<!-- 문의 -->
	<h1>문의</h1>
	<table>
		<tr>
			<td>상품번호</td>
			<td>${question.goodsCode}</td>
		</tr>
		<tr>	
			<td>종류</td>
			<td>${question.category}</td>
		</tr>
		<tr>	
			<td>작성자</td>
			<td>${question.customerId}</td>
		</tr>
		<tr>	
			<td>날짜</td>
			<td>${question.createdate}</td>
		</tr>
		<tr>	
			<td>문의내용</td>
			<td>${question.questionMemo}</td>
		</tr>
	</table>
	<!-- 답변 -->
	<h1>답변</h1>
	<c:if test="${comment != null}">
		<table>
			<tr>
				<td>날짜</td>
				<td>${comment.createdate}</td>
			</tr>
			<tr>
				<td>답변</td>
				<td>${comment.commentMemo}</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${comment == null}">
		<span>답변대기</span>
	</c:if>
</body>
</html>