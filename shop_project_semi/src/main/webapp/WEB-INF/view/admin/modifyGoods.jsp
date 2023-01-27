<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>상품 수정</title>
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
                                <h4 class="card-title">상품 수정</h4>
                            </div>
                            <div class="auth-form">
								<form action="${pageContext.request.contextPath}/modifyGoods" method="post" enctype="multipart/form-data" id="form">
									<div class="form-group">
										<label><strong>상품코드</strong></label>
										<input type="hidden" name="goodsCode" value="${m.goodsCode}">
										${m.goodsCode}
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
										<input type="text" name="goodsName" value="${m.goodsName}" id="goodsName" class="form-control"/>
									</div>
									<div class="form-group">
										<label><strong>사진</strong></label>
										<div>
											<span id="currentImg0">
													<img src="${pageContext.request.contextPath}/upload/${imgList[0].filename}" width="100px" height="100px" alt="상품 이미지"/>
												</span>
												<div>
													<button id="currentFileBtn0" type="button" class="btn btn-sm btn-primary mb-1 h-100">대표 사진 변경</button>
													<input type="file" name="filename0" accept="image/jpeg, image/png" style="display: none" id="filename0">
													<input type="hidden" name="oldFilename0" value="${imgList[0].filename}"/><span id="file_name0">${imgList[0].filename}</span>
													<input type="hidden" name="goodsImgCode0" value="${imgList[0].goodsImgCode}"/>
												</div>
											<c:forEach var="i" begin="1" end="${listSize-1}">
												<span id="currentImg${i}">
													<img src="${pageContext.request.contextPath}/upload/${imgList[i].filename}" width="100px" height="100px" alt="상품 이미지"/>
												</span>
												<div>
													<button id="currentFileBtn${i}" type="button" class="btn btn-sm btn-primary mb-1 h-100">사진 변경</button>
													<input type="file" name="filename${i}" accept="image/jpeg, image/png" style="display: none" id="filename${i}">
													<input type="hidden" name="oldFilename${i}" value="${imgList[i].filename}"/><span id="file_name${i}">${imgList[i].filename}</span>
													<input type="hidden" name="goodsImgCode${i}" value="${imgList[i].goodsImgCode}"/>
													<input type="hidden" name="listSize" value="${listSize}"/>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="form-group">
										<label><strong>사진추가</strong></label>
											<div>
												<button id="btn-upload0" type="button" class="btn btn-sm btn-primary mb-1 h-100">사진 추가</button>
												<input type="file" name="addedFilename0" accept="image/jpeg, image/png" id="input_file0" style="display: none"> <span id="fileName0"></span>
												<div id="target"></div>
												<div id="target1"></div>
											</div>
									</div>
									<div class="form-group">
										<label><strong>판매가격</strong></label>
										<input type="text" name="goodsPrice" value="${m.goodsPrice}" id="goodsPrice" class="form-control"/>
									</div>
									<div class="form-group">
										<label><strong>판매상태</strong></label>
										<c:if test="${m.soldOut eq 'Y'}">
											<label class="radio-inline"><input type="radio" name="soldOut" value="Y" checked="checked" class="soldOut">판매</label>
											<label class="radio-inline"><input type="radio" name="soldOut" value="N" class="soldOut">품절</label>
										</c:if>
										<c:if test="${m.soldOut eq 'N'}">
											<label class="radio-inline"><input type="radio" name="soldOut" value="Y" class="soldOut">판매</label>
											<label class="radio-inline"><input type="radio" name="soldOut" value="N" checked="checked" class="soldOut">품절</label>
										</c:if>
									</div>
									<div class="form-group">			
										<label><strong>추천상품</strong></label>
										<input type="number" name="hit" value="${m.hit}" id="hit" class="form-control">
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
	<script>
		// 유효성 검사
		$(document).ready(function(){
			let allCheck = false;
		
			let goodsName = $('#goodsName');
			let goodsPrice = $('#goodsPrice');
			let hit = $('#hit');
			
			$('#btn').click(function(){
				if(goodsName.val().length < 1 || goodsName.val().trim() == ''){	// 공백 입력 방지
					alert('상품명을 입력해 주세요');
				}else if(!$.isNumeric(goodsPrice.val())){
					alert('판매가격을 숫자로 입력해 주세요');
				}else if($('.soldOut:checked').length == 0){
					alert('판매상태를 선택해 주세요');
				}else if(!$.isNumeric(hit.val())){
					alert('추천상품 수치를 입력해 주세요');
				}else {
					allCheck = true;
				}
				if(allCheck){
					$('#form').submit();
				}
			});
		
		});
	
		// 사진 수정
		let len = ${listSize};
		$(function () {
			for(let val = 0; val < len; val++){
				console.log(val);
				$('#currentFileBtn'+val).click(function (e) {
			        e.preventDefault();
			        $('#filename'+val).click(); // 파일 input 열기
			    });
				
				// 파일 이름 갱신
				$('#filename'+val).change(function(e) {
					$('#file_name'+val).html('');	// 지우고
					$('#file_name'+val).html($('#filename'+val).get(0).files[0].name);	// 파일 이름
					$('#currentImg'+val).html(''); // 기존 이미지 보여줬던 것 지우기
				});
				
			};
		});
		
		// 사진 추가
		$(function () {
			// 파일추가 버튼
			$('#btn-upload0').click(function (e) {
		        e.preventDefault();
		        $('#input_file0').click(); // 파일 input 열기
		    });
			$('#input_file0').change(function(e) { // 동적 버튼 생성
				e.preventDefault();
				$('#fileName0').html($('#input_file0').get(0).files[0].name);	// 파일 이름
				$('#target').html(`<button id="btn-upload1" type="button" class="btn btn-sm btn-primary mb-1 h-100">파일 추가</button>
				<input type="file" name="addedFilename1" accept="image/jpeg, image/png" style="display:none;" id="input_file1"> <span id="fileName1"></span>`);			
			})
			
			// 생성된 동적버튼 1 
			$(document).on('click', '#btn-upload1', function(e) {
				e.preventDefault();
				$('#input_file1').click(); // 파일 input 열기
				
				$('#input_file1').change(function() { // 동적 버튼 생성
					$('#fileName1').html($('#input_file1').get(0).files[0].name);	// 파일 이름
					$('#target1').html(`<button id="btn-upload2" type="button" class="btn btn-sm btn-primary h-100">파일 추가</button>
					<input type="file" name="addedFilename2" accept="image/jpeg, image/png" style="display:none;" id="input_file2"> <span id="fileName2"></span>`);			
				})
			});
			
			// 생성된 동적버튼 2
			$(document).on('click', '#btn-upload2', function(e) {
				e.preventDefault();
				$('#input_file2').click(); // 파일 input 열기
				
				$('#input_file2').change(function() {
					$('#fileName2').html($('#input_file2').get(0).files[0].name);	// 파일 이름		
				})
			});
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