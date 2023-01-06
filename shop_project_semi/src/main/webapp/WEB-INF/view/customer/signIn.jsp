<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SIGN IN</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				let allCheck = false;
				$('#submitBtn').click(function() {
					if($('#loginId').val().length < 1) {
						$('#loginId').focus();
						alert('ID를 입력해주세요.');
					} else if($('#loginPw').val().length < 1) {
						$('#loginPw').focus();
						alert('Password를 입력해주세요.');
					} else {
						allCheck = true;
					}
					
					if(allCheck) {
						$('#loginForm').submit();
					}
				});
			});
		</script>
	</head>
	
	<body>
		<form method="post" action="${pageContext.request.contextPath}/SignInController" id="loginForm">
			<h3>SIGN IN</h3>
			<table border="1">
				<tr>
					<th>ID</th>
					<td><input type="text" name="loginId" id="loginId"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="loginPw" id="loginPw"></td>
				</tr>
			</table>
			<button type="button" id="submitBtn">SIGN IN</button>
		</form>
		<div>
			<a href="${pageContext.request.contextPath}/AddCustomerController">회원가입</a>
		</div>
	</body>
</html>