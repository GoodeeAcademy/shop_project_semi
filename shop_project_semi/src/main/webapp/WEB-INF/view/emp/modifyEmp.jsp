<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>직원 정보</title>
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/emp/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/emp/css/style.css" rel="stylesheet">
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
			if(newName.val().length < 1 || newName.val().trim() == ''){
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
	<div id="main-wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/view/inc/emp/header.jsp"></jsp:include>
		<!-- sidebar -->
		<jsp:include page="/WEB-INF/view/inc/emp/sidebar.jsp"></jsp:include>

		<div class="content-body">
		    <div class="container-fluid">
		    	<div class="row justify-content-center h-100 align-items-center">
		    		<div class="col-lg-6">
		    			<div class="card">
		    				<div class="card-header">
                                <h4 class="card-title">직원 정보</h4>
                            </div>
                            <div class="auth-form">
								<form method="post" action="${pageContext.request.contextPath}/emp/modify" id="modifyEmpForm">
									<div class="form-group">
										<label><strong>아이디</strong></label>
										${loginEmp.empId}
									</div>
									<div class="form-group">
										<label><strong>이름</strong></label>
										<input type="text" name="newName" value="${loginEmp.empName}" id="newName" class="form-control">
									</div>
									<div class="form-group">
										<label><strong>비밀번호</strong></label>
										<input type="password" name="empPw" id="empPw" class="form-control">
										<div style="margin-top: 1%;">
										<a href="${pageContext.request.contextPath}/ModifyEmpPwController">비밀번호 변경</a>
										</div>
									</div>
									<div align="center">
										<button type="button" id="modifyEmpBtn" class="btn btn-primary">수정</button>
									</div>
								</form>
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


    <!-- Vectormap -->
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/morris/morris.min.js"></script>


    <script src="${pageContext.request.contextPath}/assets/emp/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/chart.js/Chart.bundle.min.js"></script>

    <script src="${pageContext.request.contextPath}/assets/emp/vendor/gaugeJS/dist/gauge.min.js"></script>

    <!--  flot-chart js -->
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/flot/jquery.flot.resize.js"></script>

    <!-- Owl Carousel -->
    <script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>

    <!-- Counter Up -->
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/js/jquery.vmap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/jquery.counterup/jquery.counterup.min.js"></script>

    <script src="${pageContext.request.contextPath}/assets/emp/js/dashboard/dashboard-1.js"></script>
</body>
</html>