<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let allCheck = false;
		
		let empId = $('#empId');
		let empPw = $('#empPw');
		
		
		$('#loginEmpBtn').click(function(){
			if(empId.val().length < 1){
				alert('아이디를 입력해 주세요');
			}else if(empPw.val().length < 1){
				alert('비밀번호를 입력해 주세요');
			}else {
				allCheck = true;
			}
			if(allCheck){
				$('#loginEmpForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<a href="${pageContext.request.contextPath}/HomeController">홈</a>
	<h3>로그인</h3>
	<form method="post" action="${pageContext.request.contextPath}/LoginEmpController" id="loginEmpForm">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="empId" id="empId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="empPw" id="empPw"></td>
			</tr>
		</table>
		<button type="button" id="loginEmpBtn">로그인</button>
	</form>
	<a href="${pageContext.request.contextPath}/AddEmpController">회원가입</a>
</body>
</html>