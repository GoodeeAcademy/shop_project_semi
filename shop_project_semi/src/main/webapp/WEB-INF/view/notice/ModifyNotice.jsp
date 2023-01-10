<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
</head>
<body>
	<h1>공지수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/ModifyNoticeController">
		<input type="hidden" name="noticeCode" value="${notice.noticeCode}">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeTitle" value="${notice.noticeTitle}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${notice.empName}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="10" name="noticeContent">${notice.noticeContent}</textarea></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>