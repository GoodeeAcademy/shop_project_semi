<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원페이지</title>
</head>
<body>
	<span>${loginEmp.empName}님</span>
	<a href="${pageContext.request.contextPath}/ModifyEmpController">정보수정</a>
	<a href="${pageContext.request.contextPath}/RemoveEmpController">퇴사처리(관리자)</a>
	<a href="${pageContext.request.contextPath}/EmpListController">직원목록</a>
</body>
</html>