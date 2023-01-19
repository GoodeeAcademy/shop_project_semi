<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>상품 등록</title>
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/emp/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/emp/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
                                <h4 class="card-title">상품 등록</h4>
                            </div>
                            <div class="auth-form">
								<form action="/shop_project_semi/addGoods" method="post" enctype="multipart/form-data">	
									<div class="form-group">
										<label><strong>상품코드</strong></label>
										자동생성
									</div>
									<div class="form-group">
										<label><strong>카테고리</strong></label>
										<select name="categoryCode" class="form-select custom-select">
											<c:forEach var="c" items="${categoryList}">
												<option value="${c.categoryCode}">${c.categoryName}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label><strong>상품명</strong></label>
										<input type="text" name="goodsName" class="form-control">
									</div>
									<div class="form-group">
										<label><strong>판매가격</strong></label>
										<input type="number" name="goodsPrice" class="form-control">
									</div>
									<div class="form-group">
										<label><strong>판매상태</strong></label>
										<div>
											<label class="radio-inline"><input type="radio" name="soldOut" value="Y">판매함</label>
											<label class="radio-inline"><input type="radio" name="soldOut" value="N">판매안함</label>
										</div>
									</div>
									<div class="form-group">
										<label><strong>추천상품</strong></label>
										<input type="number" name="hit" class="form-control">
									</div>
									<div class="form-group">
										<label><strong>사진등록</strong></label>
										<div>
											<button id="btn-upload0" type="button" class="btn btn-primary">파일 추가</button>
											<input type="file" name="filename0" accept="image/jpeg, image/png" style="display:none;" id="input_file0">
										</div>
										<div id="target1">
										</div>
									</div>
									<div align="center">
										<button type="submit" class="btn btn-primary">등록</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
 <script>
 	// 첫 번째 파일 업로드
	$(function () {
	    $('#btn-upload0').click(function (e) {
	        e.preventDefault();
	        $('#input_file0').click();
	    });
	});
	const fileInput0 = $("#input_file0").get(0);
	fileInput0.onchange = () => {
		/*
	  const selectedFile = fileInput.files[0];
	  console.log(selectedFile);
	  */
	  // 이미지 미리 띄우고
	  
	  // 동적 버튼 생성
		$('#target1').html(`<button id="btn-upload1" type="button" class="btn btn-primary">파일 추가</button>
				<input type="file" name="filename1" accept="image/jpeg, image/png" style="display:none;" id="input_file1">`);
	};
	
	// 두 번째 파일 업로드
	// 동적 버튼 처리
	$(document).on('click', '#btn-upload1', function(e){    // $(document)로 한 번 더 로딩하는 것
		e.preventDefault();
        $('#input_file1').click();
    });
	
	
	
 </script>
 
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