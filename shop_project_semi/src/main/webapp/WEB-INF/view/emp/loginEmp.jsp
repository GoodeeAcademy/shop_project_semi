<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>TYPESERVICE | 직원 로그인</title>
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
                                    <form method="post" action="${pageContext.request.contextPath}//emp/signin" id="loginEmpForm">
                                        <div class="form-group">
                                            <label><strong>아이디</strong></label>
                                            <input type="text" name="empId" id="empId" class="form-control" value="admin">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>비밀번호</strong></label>
                                            <input type="password" name="empPw" id="empPw" class="form-control" value="1234">
                                        </div>

                                        <div class="text-center">
                                            <button type="button" id="loginEmpBtn" class="btn btn-primary btn-block">로그인</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3 text-center">
                                        <p><a href="${pageContext.request.contextPath}/emp/add/emp" class="text-primary">회원가입</a></p>
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