<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/EmpMainController">직원페이지</a>
	<table>
		<tr>
			<th>답변번호</th>
			<th>문의번호</th>
			<th>답변</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="c" items="${list}">
			<tr>
				<td>${c.commentCode}</td>
				<td>${c.questionCode}</td>
				<td>${c.commentMemo}</td>
				<td>${c.createdate}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<div>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/QuestionCommentListController?currentPage=${currentPage-10}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endRow}">
			<c:if test="${i == currentPage}">
				<strong>
					<a href="${pageContext.request.contextPath}/QuestionCommentListController?currentPage=${i}">${i}</a>
				</strong>
			</c:if>
			<c:if test="${i != currentPage}">
					<a href="${pageContext.request.contextPath}/QuestionCommentListController?currentPage=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${currentPage+10 < lastPage}">
			<a href="${pageContext.request.contextPath}/QuestionCommentListController?currentPage=${currentPage+10}">다음</a>
		</c:if>
	</div>
</body>
</html>