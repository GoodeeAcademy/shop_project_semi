<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<div>
			<c:if test="${loginCustomer == null}">
				<a href="${pageContext.request.contextPath}/LoginEmpController">직원</a>
			</c:if>
			<a href="${pageContext.request.contextPath}/goodsList">물품</a>
			<c:if test="${loginEmp == null}">
				<a href="${pageContext.request.contextPath}/CustomerOneController">고객</a>
			</c:if>
		</div>
	</body>
</html>