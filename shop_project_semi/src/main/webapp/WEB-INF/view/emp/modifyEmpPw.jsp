<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let allCheck = false;
		
		let currentPw = $('#currentPw');
		let newPw = $('#newPw');
		let newPwCk = $('#newPwCk');
		
		$('#modifyEmpPwBtn').click(function(){
			if(currentPw.val().length < 1 || currentPw.val().indexOf(' ') != -1){
				alert('현재 비밀번호를 입력해 주세요');
			}else if(newPw.val().length < 1 || newPw.val().indexOf(' ') != -1){
				alert('새 비밀번호를 올바르게 입력해 주세요');
			}else if(newPw.val() != newPwCk.val()){
				alert('비밀번호가 일치하지 않습니다');
			}else {
				allCheck = true;
			}
			if(allCheck){
				$('#modifyEmpPwForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/ModifyEmpPwController" id="modifyEmpPwForm">
		<table>
			<tr>
				<td>현재 비밀번호</td>
				<td><input type="password" id="currentPw"></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" id="newPw"></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" id="newPwCk"></td>
			</tr>
		</table>
		<button type="button" id="modifyEmpPwBtn">변경</button>
	</form>
</body>
</html>