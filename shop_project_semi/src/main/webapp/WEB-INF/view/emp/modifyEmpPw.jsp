<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>직원 비밀번호 변경</title>
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
		
		let currentPw = $('#currentPw');
		let newPw = $('#newPw');
		let newPwCk = $('#newPwCk');
		
		$('#modifyEmpPwBtn').click(function(){
			if(currentPw.val().length < 1 || currentPw.val().indexOf(' ') != -1){
				alert('현재 비밀번호를 입력해 주세요');
			}else if(newPw.val().length < 1 || newPw.val().val().trim() == ''){
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
	<div id="main-wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/view/inc/emp/header.jsp"></jsp:include>
		<!-- sidebar -->
		<jsp:include page="/WEB-INF/view/inc/emp/sidebar.jsp"></jsp:include>

		<div class="content-body">
		    <div class="container-fluid">
		    	<div class="row">
		    		<div class="col-lg-12">
		    			<div class="card">
		    				<div class="card-header">
                                <h4 class="card-title">직원 비밀번호 변경</h4>
                            </div>
                            <div class="auth-form">
								<form method="post" action="${pageContext.request.contextPath}/ModifyEmpPwController" id="modifyEmpPwForm">
									<div class="form-group">
										<label><strong>현재 비밀번호</strong></label>
										<input type="password" name="currentPw" id="currentPw" class="form-control">
									</div>
									<div class="form-group">
										<label><strong>새 비밀번호</strong></label>
										<input type="password" name="newPw" id="newPw" class="form-control">
									</div>
									<div class="form-group">
										<label><strong>새 비밀번호 확인</strong></label>
										<input type="password" name="newPwCk" id="newPwCk" class="form-control">
									</div>
									<div align="center">
										<button type="button" id="modifyEmpPwBtn" class="btn btn-primary">변경</button>
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