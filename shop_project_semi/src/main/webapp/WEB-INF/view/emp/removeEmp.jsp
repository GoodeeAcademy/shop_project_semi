<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 관리</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/RemoveEmpController">
		<table>
			<tr>
				<td>사원 번호</td>
				<td>${taretEmp.empCode}</td>
			</tr>
			<tr>
				<td>사원 아이디</td>
				<td>
					${taretEmp.empId}
					<input type="hidden" name="targetEmpId" value="${taretEmp.empId}">
				</td>
			</tr>
			<tr>
				<td>사원 이름</td>
				<td>${taretEmp.empName}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="adminPw"></td>
			</tr>
		</table>
		<button type="submit">퇴사처리</button>
	</form>
</body>
</html>