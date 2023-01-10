<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 | ${notice.noticeTitle}</title>
</head>
<body>
	<h1>공지</h1>
	<table>
		<tr>
			<td>제목</td>
			<td>${notice.noticeTitle}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${notice.empName}</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>${notice.createdate}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${notice.noticeContent}</td>
		</tr>
	</table>
	<!-- 직원은 공지 수정/삭제 가능 -->
	<c:if test="${loginEmp != null}">
		<a href="${pageContext.request.contextPath}/ModifyNoticeController?noticeCode=${notice.noticeCode}">수정</a>
		<a href="${pageContext.request.contextPath}/RemoveNoticeController?noticeCode=${notice.noticeCode}">삭제</a>
	</c:if>
</body>
</html>