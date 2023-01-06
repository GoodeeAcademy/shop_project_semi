<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				let allCheck = false;
				
				let removeFalse = ${removeFalse}
				if(removeFalse) {
					alert('ID 또는 비밀번호가 일치하지않습니다.');
				}
				
				$('#submitBtn').click(function() {
					console.log('submitBtn 클릭');
					if($('#cuId').val().length < 1) {
						alert('ID를 입력해주세요.');
					} else if($('#cuPw').val().length < 1) {
						alert('비밀번호를 입력해주세요.');
					} else if($('#checkPw').val().length < 1) {
						alert('비밀번호 확인을 입력해주세요.');
					} else {
						allCheck = true;
					}
					if(allCheck) {
						$('#removeCustomerForm').submit();
					}
				});
			})
		</script>
	</head>
	
	<body>
		<form action="${pageContext.request.contextPath}/RemoveCustomerController" method="post" id="removeCustomerForm">
			<table border="1">
				<tr>
					<th>ID</th>
					<td><input type="text" name="customerId" id="cuId"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="customerPw" id="cuPw"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="checkPw" id="checkPw"></td>
				</tr>
			</table>
			<button type="button" id="submitBtn">탈퇴하기</button>
		</form>
	</body>
</html>