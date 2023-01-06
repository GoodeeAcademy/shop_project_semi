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
				let allCheck = false;
				$('#submitBtn').click(function() {
					console.log('submitBtn 클릭');
					if($('#addId').val().length < 1) {
						alert('ID를 입력해주세요.');
					} else if($('#addPw').val().length < 1) {
						alert('PW를 입력해주세요.');
					} else if($('#addName').val().length < 1) {
						alert('이름을 입력해주세요.');
					} else if($('#addPhone1 option:selected').val().length < 1) {
						alert('지역번호를 선택해주세요.');
					} else if($('#addPhone2').val().length < 3 || $('#addPhone3').val().length < 4) {
						$('#addPhone2').focus();
						alert('올바른 전화번호를 입력하여 주세요.');
					} else {
						allCheck = true;
					}
					
					if(allCheck) {
						$('#addCustomerForm').submit();
					}
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
						<td>
							<select name="addPhone1" id="addPhone1">
								<option value="">==선택==</option>
								<option value="010">02</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="012">031</option>
								<option value="013">032</option>
								<option value="0507">0507</option>
							</select>
							-
							<input type="text" name="addPhone2" id="addPhone2" maxlength="4" 
								oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1').replace(/^0[^.]/, '0');">
							-
							<input type="text" name="addPhone3" id="addPhone3" maxlength="4"
								oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1').replace(/^0[^.]/, '0');">
							<!-- oninput : 해당 input에 숫자를 제외하고는 입력이 불가능하도록 설정함. number가 아닌 이유는 못생겨서 -->
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
		<div>
			<a href="${pageContext.request.contextPath}/SignInController">로그인</a>
		</div>
	</body>
</html>