<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 | 정보 변경</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/ModifyEmpByAdminController" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					${emp.empId}
					<input type="hidden" name="empId" value="${emp.empId}">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${emp.empName}</td>
			</tr>
			<tr>
				<td>등급</td>
				<td>
					<select name="empAuthCode">
						<c:forEach var="m" items="${authList}">
							<option value="${m.authCode}" <c:if test="${m.authCode eq emp.authCode}">selected="selected"</c:if> >${m.authName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>입사일</td>
				<td>${emp.createdate}</td>
			</tr>
		</table>
		<button type="submit">등급변경</button>
	</form>
</body>
</html>