<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>TYPESERVICE | 직원 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		console.log('${empId}');
		
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
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/emp/images/favicon.png">
    <link href="${pageContext.request.contextPath}/assets/emp/css/style.css" rel="stylesheet">
</head>
<body class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <form method="post" action="${pageContext.request.contextPath}/AddEmpController" id="addEmpForm">
                                    	<!-- 아이디 -->
                                        <div class="form-group">
                                            <label><strong>아이디</strong></label>
                                            <c:if test="${empId == null}">
												<input type="text" name="empId" id="empId" class="form-control">
											</c:if>
											<c:if test="${empId != null}">
												<input type="text" name="empId" id="empId" value="${empId}" class="form-control">
											</c:if>
											<button type="button" id="idCkBtn" class="btn btn-primary">중복확인</button>
											<c:if test="${empId != null}">
												<span>사용 가능한 아이디입니다</span>
											</c:if>
                                        </div>
                                        <!-- 비밀번호 -->
                                        <div class="form-group">
                                            <label><strong>비밀번호</strong></label>
                                            <input type="password" name="empPw" id="empPw" class="form-control">
                                        </div>
                                        <!-- 비밀번호 확인 -->
                                        <div class="form-group">
                                            <label><strong>비밀번호 확인</strong></label>
                                            <input type="password" name="empPwCk" id="empPwCk" class="form-control">
                                        </div>
                                        <!-- 이름 -->
                                        <div class="form-group">
                                            <label><strong>이름</strong></label>
                                            <input type="text" name="empName" id="empName" class="form-control">
                                        </div>
                                        <!-- 회원가입 버튼 -->
                                        <div class="text-center">
                                            <button type="button" id="addEmpBtn" class="btn btn-primary btn-block">회원가입</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3 text-center">
                                        <p><a href="${pageContext.request.contextPath}/LoginEmpController" class="text-primary">로그인</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/global/global.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/js/quixnav-init.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/js/custom.min.js"></script>
</body>
</html>