<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				let 
				$('#submitBtn').click(function() {
					
				});
			})
		</script>
	</head>
	
	<body>
		<form action="${pageContext.request.contextPath}/AddCustomerController" method="post" id="addCustomerForm">
			<div>
			<h4>필수 입력 사항</h4>
				<table border="1">
					<tr>
						<th>ID</th>
						<td><input type="text" name="addId" id="addId"></td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input type="password" name="addPw" id="addPw"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="addName" id="addName"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="addPhone1" id="addPhone1">
							-
							<input type="text" name="addPhone2" id="addPhone2">
							-
							<input type="text" name="addPhone3" id="addPhone3">
						</td>
					</tr>
				</table>
			</div>
			
			<div>
				<h4>선택 입력 사항</h4>
				<table border="1">
					<tr>
						<th>주소</th>
						<td><input type="text" name="addAddress1" id="addAddress1"></td>
					</tr>
				</table>
			</div>
			<button type="button" id="submitBtn">가입하기</button>
		</form>
	</body>
</html>