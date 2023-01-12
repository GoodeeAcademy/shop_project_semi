<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let allCheck = false;
		
		let adminPw = $('#adminPw');
		
		$('#removeEmpBtn').click(function(){
			if(adminPw.val().length < 1){
				alert('비밀번호를 입력해 주세요');
			}else {
				allCheck = true;
			}
			if(allCheck){
				$('#removeEmpForm').submit();
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
	<h1>직원 퇴사(관리자)</h1>
	<form method="post" action="${pageContext.request.contextPath}/RemoveEmpController" id="removeEmpForm">
		<table>
			<tr>
				<td>사원 번호</td>
				<td>${targetEmp.empCode}</td>
			</tr>
			<tr>
				<td>사원 아이디</td>
				<td>
					${targetEmp.empId}
					<input type="hidden" name="targetEmpId" value="${targetEmp.empId}">
				</td>
			</tr>
			<tr>
				<td>사원 이름</td>
				<td>${targetEmp.empName}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="adminPw" id="adminPw"></td>
			</tr>
		</table>
		<button type="button" id="removeEmpBtn">퇴사처리</button>
	</form>
</body>
</html>