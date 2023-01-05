<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 수정</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				let allCheck = false;
				
				let modifyFalse = ${modifyFalse};
				if(modifyFalse) {
					alert('현재 비밀번호가 다르거나 변경할 비밀번호가 일치하지 않습니다.');
				}
				
				$('#submitBtn').click(function() {
					console.log('버튼 클릭');
					if($('#beforePw').val().length < 1) {
						$('#beforePw').focus();
						alert('현재 비밀번호를 입력해주세요.');
					} else if($('#afterPw').val().length < 1) {
						$('#afterPw').focus();
						alert('변경할 비밀번호를 입력해주세요.');
					} else if($('#checkPw').val().length < 1) {
						$('#checkPw').focus();
						alert('변경할 비밀번호 확인을 입력해주세요.');
					} else {
						allCheck = true;
					}
					
					if(allCheck) {
						$('#modifyPwForm').submit();
					}
				})
			})
		</script>
	</head>
	
	<body>
		<form action="${pageContext.request.contextPath}/ModifyCustomerPwController" method="post" id="modifyPwForm">
			<table border="1">
				<tr>
					<th>ID</th>
					<td>${loginCustomer.customerId}</td>
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="beforePw" id="beforePw"></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td><input type="password" name="afterPw" id="afterPw"></td>
				</tr>
				<tr>
					<th>변경할 비밀번호 확인</th>
					<td><input type="password" name="checkPw" id="checkPw"></td>
				</tr>
			</table>
			<button type="button" id="submitBtn">변경하기</button>
		</form>
	</body>
</html>