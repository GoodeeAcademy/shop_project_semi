<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의내역</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/HomeController">home</a>
	<a href="${pageContext.request.contextPath}/goodsList">shop</a>
	<a href="${pageContext.request.contextPath}/NoticeListController">notice</a>
	<a href="${pageContext.request.contextPath}/QuestionListForCustomerController">문의</a>
	<a href="${pageContext.request.contextPath}/CustomerOneController">my page</a>
	<table>
		<tr>
			<th>주문번호</th>
			<th>분류</th>
			<th>문의내용</th>
			<th>날짜</th>
			<th>상태</th>
		</tr>
		<c:forEach var="q" items="${list}">
			<tr>
				<td>${q.orderCode}</td>
				<td>${q.category}</td>
				<td>
					<a href="${pageContext.request.contextPath}/QuestionOneController?questionCode=${q.questionCode}">${q.questionMemo}</a>
				</td>
				<td>${q.createdate}</td>
				<!-- 답변 여부에 따라 분기 -->
				<td>
					<span>답변대기</span>
					<a href="${pageContext.request.contextPath}/RemoveQuestionController?questionCode=${q.questionCode}">문의 삭제</a>
				</td>
				<!--  -->
				<td>답변완료</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<div>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/QuestionListForCustomerController?currentPage=${endRow-9}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endRow}">
			<c:if test="${i == currentPage}">
				<strong>
					<a href="${pageContext.request.contextPath}/QuestionListForCustomerController?currentPage=${i}">${i}</a>
				</strong>
			</c:if>
			<c:if test="${i != currentPage}">
					<a href="${pageContext.request.contextPath}/QuestionListForCustomerController?currentPage=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${beginRow+10 <= lastPage}">
			<a href="${pageContext.request.contextPath}/QuestionListForCustomerController?currentPage=${beginRow+11}">다음</a>
		</c:if>
	</div>
</body>
</html>