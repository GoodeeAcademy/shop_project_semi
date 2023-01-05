<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/ModifyEmpController">
		<table>
			<tr>
				<td>아이디</td>
				<td>${loginEmp.empId}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="newName" value="${loginEmp.empName}">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="empPw">
					<a href="${pageContext.request.contextPath}/ModifyEmpPwController">비밀번호 변경</a>
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>