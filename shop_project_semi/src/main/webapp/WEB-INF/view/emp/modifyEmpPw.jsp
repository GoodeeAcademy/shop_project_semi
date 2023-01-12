<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let check = ${check};
		if(check){
			console.log("체크 true");
			alert('현재 비밀번호를 확인해 주세요');
		}
		
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
	<a href="${pageContext.request.contextPath}/HomeController">home</a>
	<a href="${pageContext.request.contextPath}/goodsList">shop</a>
	<a href="${pageContext.request.contextPath}/EmpMainController">직원페이지</a>
	<a href="${pageContext.request.contextPath}/NoticeListController">notice</a>
	<a href="${pageContext.request.contextPath}/QuestionListForEmpController">문의(직원)</a>
	<h1>직원 비밀번호 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/ModifyEmpPwController" id="modifyEmpPwForm">
		<table>
			<tr>
				<td>현재 비밀번호</td>
				<td><input type="password" name="currentPw" id="currentPw"></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" name="newPw" id="newPw"></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" name="newPwCk" id="newPwCk"></td>
			</tr>
		</table>
		<button type="button" id="modifyEmpPwBtn">변경</button>
	</form>
</body>
</html>