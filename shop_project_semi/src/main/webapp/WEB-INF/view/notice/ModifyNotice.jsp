<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>EMPLOYEE MODIFY NOTICE | TYPESERVICE</title>
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/emp/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/emp/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let allCheck = false;
	
		let noticeTitle = $('#noticeTitle');
		let noticeContent = $('#noticeContent');
		
		$('#btn').click(function(){
			if(noticeTitle.val().length < 1 || noticeTitle.val().trim() == ''){	// 공백 입력 방지
				alert('제목을 입력해 주세요');
			}else if(noticeContent.val().length < 1 || noticeContent.val().trim() == ''){
				alert('내용을 입력해 주세요');
			}else {
				allCheck = true;
			}
			if(allCheck){
				$('#form').submit();
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
                                <h4 class="card-title">공지 수정</h4>
                            </div>
                            <div class="auth-form">
								<form method="post" action="${pageContext.request.contextPath}/emp/notice/modify" id="form">
									<input type="hidden" name="noticeCode" value="${notice.noticeCode}">
									<div class="form-group">
										<label><strong>제목</strong></label>
										<input type="text" name="noticeTitle" value="${notice.noticeTitle}" class="form-control" id="noticeTitle">
									</div>
									<div class="form-group">
										<label><strong>작성자</strong></label>
										<span>${notice.empName}</span>
									</div>
									<div class="form-group">
										<label><strong>내용</strong></label>
										<textarea rows="15" name="noticeContent" class="form-control" id="noticeContent">${notice.noticeContent}</textarea>
									</div>
									<div align="center">
										<button type="button" class="btn btn-primary" id="btn">수정</button>
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