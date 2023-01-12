<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let check = ${check};
		if(check){
			console.log("체크 true");
			alert('현재 비밀번호를 확인해 주세요');
		}
		
		let allCheck = false;
		
		let newName = $('#newName');
		let empPw = $('#empPw');
		
		
		$('#modifyEmpBtn').click(function(){
			if(newName.val().length < 1){
				alert('변경할 이름을 입력해 주세요');
			}else if(empPw.val().length < 1){
				alert('비밀번호를 입력해 주세요');
			}else {
				allCheck = true;
			}
			if(allCheck){
				$('#modifyEmpForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<a href="${pageContext.request.contextPath}/HomeController">home</a>
	<a href="${pageContext.request.contextPath}/goodsList">shop</a>
	<a href="${pageContext.request.contextPath}/NoticeListController">notice</a>
	<a href="${pageContext.request.contextPath}/QuestionListForEmpController">문의(직원)</a>
	<h1>직원 정보 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/ModifyEmpController" id="modifyEmpForm">
		<table>
			<tr>
				<td>아이디</td>
				<td>${loginEmp.empId}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="newName" value="${loginEmp.empName}" id="newName">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="empPw" id="empPw">
					<a href="${pageContext.request.contextPath}/ModifyEmpPwController">비밀번호 변경</a>
				</td>
			</tr>
		</table>
		<button type="button" id="modifyEmpBtn">수정</button>
	</form>
</body>
</html>