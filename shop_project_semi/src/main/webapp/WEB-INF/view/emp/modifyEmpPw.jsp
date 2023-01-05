<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/ModifyEmpPwController">
		<table>
			<tr>
				<td>현재 비밀번호</td>
				<td><input type="password" name="currentPw"></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" name="newPw"></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" name="newPwCk"></td>
			</tr>
		</table>
		<button type="submit">변경</button>
	</form>
</body>
</html>