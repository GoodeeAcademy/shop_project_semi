<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원가입</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/AddEmpController">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="empId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="empPw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" name="empPwCk"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="empName"></td>
			</tr>
		</table>
		<button type="submit">가입</button>
	</form>
</body>
</html>