<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		console.log(${empId});
		
		let allCheck = false;
		
		let empId = $('#empId');
		let empPw = $('#empPw');
		let empPwCk = $('#empPwCk');
		let empName = $('#empName');
		
		$('#idCkBtn').click(function(){
			if(empId.val().length < 1 || empId.val().indexOf(' ') != -1){
				alert('아이디를 올바르게 입력해 주세요');
				return;
			}
			$('#addEmpForm').submit();
		});
		
		$('#addEmpBtn').click(function(){
			if(empId.val().length < 1 || empId.val().indexOf(' ') != -1){
				alert('아이디를 올바르게 입력해 주세요');
			}else if(empPw.val().length < 1 || empPw.val().indexOf(' ') != -1){
				alert('비밀번호를 올바르게 입력해 주세요');
			}else if(empPw.val() != empPwCk.val()){
				alert('비밀번호가 일치하지 않습니다');
			}else if(empName.val().length < 1 || empName.val().indexOf(' ') != -1){
				alert('이름을 올바르게 입력해 주세요');
			}else {
				allCheck = true;
			}
			if(allCheck){
				$('#addEmpForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/AddEmpController" id="addEmpForm">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<c:if test="${empId == null}">
						<input type="text" name="empId" id="empId">
					</c:if>
					<c:if test="${empId != null}">
						<input type="text" name="empId" id="empId" value="${empId}">
					</c:if>
					<button type="button" id="idCkBtn">중복확인</button>
					<c:if test="${empId != null}">
						<span>사용 가능한 아이디입니다</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="empPw" id="empPw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="empPwCk" id="empPwCk"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="empName" id="empName"></td>
			</tr>
		</table>
		<button type="button" id="addEmpBtn">가입</button>
	</form>
</body>
</html>