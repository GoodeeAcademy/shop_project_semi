<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
</head>
<body>
	<h1>공지</h1>
	<!-- 직원은 공지 쓰기 가능 -->
	<c:if test="${loginEmp != null}">
		<a href="${pageContext.request.contextPath}/AddNoticeController">공지쓰기</a>
	</c:if>
	<!-- 공지 목록 -->
	<table>
		<tr>
			<th>공지번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="n" items="${list}">
			<tr>
				<td>${n.noticeCode}</td>
				<td>
					<a href="${pageContext.request.contextPath}/NoticeOneController?noticeCode=${n.noticeCode}">${n.noticeTitle}</a>
				</td>
				<td>${n.empName}</td>
				<td>${n.createdate}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<div>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/NoticeListController?currentPage=${endRow-9}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endRow}">
			<c:if test="${i == currentPage}">
				<strong>
					<a href="${pageContext.request.contextPath}/NoticeListController?currentPage=${i}">${i}</a>
				</strong>
			</c:if>
			<c:if test="${i != currentPage}">
					<a href="${pageContext.request.contextPath}/NoticeListController?currentPage=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${beginRow+10 <= lastPage}">
			<a href="${pageContext.request.contextPath}/NoticeListController?currentPage=${beginRow+11}">다음</a>
		</c:if>
	</div>
</body>
</html>