<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지쓰기</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/HomeController">home</a>
	<a href="${pageContext.request.contextPath}/EmpMainController">직원페이지</a>
	<a href="${pageContext.request.contextPath}/goodsList">shop</a>
	<a href="${pageContext.request.contextPath}/NoticeListController">notice</a>
	<a href="${pageContext.request.contextPath}/QuestionListForEmpController">문의(직원)</a>
	<h1>공지추가</h1>
	<form method="post" action="${pageContext.request.contextPath}/AddNoticeController">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${loginEmp.empName}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="10" name="noticeContent"></textarea></td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>