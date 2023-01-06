<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				let allCheck = false;
				
				let modifyFalse = ${modifyFalse}
				if(modifyFalse) {
					alert('비밀번호가 일치하지 않습니다.');
				}
				
				$('#submitBtn').click(function() {
					console.log('submitBtn 클릭');
					if($('#customerName').val().length < 1) {
						alert('이름을 입력해주세요.');
					} else if($('#modifyPhone1 option:selected').val().length < 1) {
						alert('지역번호를 선택해주세요.');
					} else if($('#modifyPhone2').val().length < 3 || $('#modifyPhone3').val().length < 4) {
						alert('전화번호를 올바르게 입력해주세요.');
					} else if($('#customerPw').val().length < 1) {
						alert('비밀번호를 입력해주세요.');
					} else if($('#checkPw').val().length < 1) {
						alert('비밀번호 확인을 입력해주세요.');
					} else {
						allCheck = true;
					}
					if(allCheck) {
						$('#modifyCustomerForm').submit();
					}
				});
			})
		</script>
	</head>
	
	<body>
		<form action="${pageContext.request.contextPath}/ModifyCustomerController" method="post" id="modifyCustomerForm">
			<table border="1">
				<tr>
					<th>ID</th>
					<td><span>${customer.customerId}</span></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="customerName" id="customerName" value="${customer.customerName}"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<select name="modifyPhone1" id="modifyPhone1">
							<option value="">==선택==</option>
							<option value="010">02</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="012">031</option>
							<option value="013">032</option>
							<option value="0507">0507</option>
						</select>
						-
						<input type="text" name="modifyPhone2" id="modifyPhone2" maxlength="4" 
							oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1'));"
							value="${splitPhone[1]}">
						-
						<input type="text" name="modifyPhone3" id="modifyPhone3" maxlength="4"
							oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
							value="${splitPhone[2]}">
						<!-- oninput : 해당 input에 숫자를 제외하고는 입력이 불가능하도록 설정함. number가 아닌 이유는 못생겨서 -->
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="customerPw" id="customerPw"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="checkPw" id="checkPw"></td>
				</tr>
			</table>
			<button type="button" id="submitBtn">수정하기</button>
		</form>
		
		<div>
			<a href="${pageContext.request.contextPath}/ModifyCustomerPwController">회원 비밀번호 수정</a>
			<a href="${pageContext.request.contextPath}/RemoveCustomerController">회원탈퇴(미적용)</a>
			<a href="${pageContext.request.contextPath}/CustomerOneController">기본 정보로</a>
		</div>
	</body>
</html>