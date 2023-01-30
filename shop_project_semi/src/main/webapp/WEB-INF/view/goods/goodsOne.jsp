<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DETAIL | TYPESERVICE</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="icon" type="image/png" href="#" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/iconic/css/material-design-iconic-font.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/linearicons-v1.0.0/icon-font.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/css-hamburgers/hamburgers.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/animsition/css/animsition.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/select2/select2.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/daterangepicker/daterangepicker.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/MagnificPopup/magnific-popup.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/perfect-scrollbar/perfect-scrollbar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/main.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/style.css">
		<style>
			.star {
				position: relative;
				font-size: 1.3rem;
				color: #FF923A;
			}
			.select_star {
				font-size: 1.3rem;
				color: #FF923A;
			}
		</style>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>
		<!-- Product Detail -->
		<section class="sec-product-detail bg0 p-t-65 p-b-60">
			<div class="container">
				<!-- 상품 이미지 -->
				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
								<div class="slick3 gallery-lb">
									<c:forEach var="gi" items="${imgList}">
										<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/upload/${gi.filename}">
											<div class="wrap-pic-w pos-relative">
												<img src="${pageContext.request.contextPath}/upload/${gi.filename}" alt="상품 이미지"/>
												<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/upload/${gi.filename}">
													<i class="fa fa-expand"></i>
												</a>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- 상품 정보 -->
					<div class="col-md-6 col-lg-5 p-b-30">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">${m.goodsName}</h4>
						<span class="price mtext-106 cl2"><fmt:formatNumber value="${m.goodsPrice}" type="number"/>원</span>
						<form action="${pageContext.request.contextPath}/member/cart/add" method="post" id="updateForm">
							<input type="hidden" name="goodsCode" value="${m.goodsCode}">
							<input type="hidden" name="filename" value="${m.filename}">
							<input type="hidden" name="goodsName" value="${m.goodsName}">
							<input type="hidden" name="goodsPrice" value="${m.goodsPrice}">
							<%-- <input type="hidden" name="goodsPrice" value="${m.goodsPrice}"> --%>
							<input type="hidden" name="bn" value="false" id="bn">
							<div class="d-flex justify-content-center mb-5">
								<button type="button" class="btn btn-quantity-down">-</button>
								<input type="number" class="quantity w-25 text-center" name="quantity" value="1"/>
								<button type="button" class="btn btn-quantity-up">+</button>
							</div>
							<div class="container text-center">
								<div class="row">
									<div class="col border p-3" style="background-color: black;">
										<button class="text-white" type="submit">ADD TO CART</button>
									</div>
									<c:if test="${loginCustomer != null}">
										<div class="col border p-3" style="background-color: black;">
											<button class="text-white" type="button" id="buyNow">BUY NOW</button>
										</div>
									</c:if>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<hr style="border-bottom: 1px solid rgb(51, 51, 51);;"/>
			<div class="container w-75 mt-5">
				<c:set var="reviewCnt" value="0"/>
				<c:forEach var="m" items="${reviewList}">
					<c:set var="reviewCnt" value="${reviewCnt = reviewCnt+1}"/>
				</c:forEach>
				<h4 style="color:black;">reviews (${reviewCnt})</h4>
				<c:forEach var="m" items="${reviewList}">
					<div class="mt-5">
						<div>
							<div class="customerName">${m.customerId}</div>
							<div class="mb-3">
								<span class="star">${m.star}</span>
								<small>${m.createdate}</small>
							</div>
							<p>${m.reviewMemo}</p>
						</div>
						<hr style="border-bottom: 1px solid rgb(51, 51, 51);;"/>
					</div>
				</c:forEach>
			</div>
		</section>
		<!-- footer -->
		<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!-- 화면 레이아웃 -->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/js/slick-custom.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/js/main.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
		<script>
			$('.gallery-lb').each(function() { 
				$(this).magnificPopup({
			        delegate: 'a', 
			        type: 'image',
			        gallery: {
			        	enabled:true
			        },
			        mainClass: 'mfp-fade'
			    });
			});
		</script>
		<script>
			$(function() {
				var maskingName = function(strName) {
				  if (strName.length > 2) {
				    var originName = strName.split('');
				    originName.forEach(function(name, i) {
				      if (i === 0 || i === originName.length - 1) return;
				      originName[i] = '*';
				    });
				    var joinName = originName.join();
				    return joinName.replace(/,/g, '');
				  } else {
				    var pattern = /.$/; // 정규식
				    return strName.replace(pattern, '*');
				  }
				};
				const customerName = document.querySelectorAll('.customerName');
				for(let i = 0; i < customerName.length; i++) {
					customerName[i].textContent = maskingName(customerName[i].textContent);					
				}
				
				// 별★☆ 코드
				const star = document.querySelectorAll('.star');
				
				for(let i = 0; i < star.length; i++) {
					let starCount = parseInt(star[i].textContent);
					star[i].textContent = '';
					
					for(let j = 0; j < starCount; j++) {
						star[i].textContent += '★';
					}
					for(let k = 0; k < 5 - starCount; k++) {
						star[i].textContent += '☆';	
					}
				}
				
				const quantity = document.querySelector('.quantity');
				const upBtn = document.querySelector('.btn-quantity-up');
				const downBtn = document.querySelector('.btn-quantity-down');
				const price = document.querySelector('.price');
				const updateForm = document.querySelector('#updateForm');
				
				// 상품 수량 증가, 감소 버튼
				// 원 , 제거 하여 정수형으로 변환
				let p = price.textContent.split('원')[0];
				let p_ = parseInt(p.replace(',',''));
				
				// + 버튼
				upBtn.addEventListener('click', function(){
					let q = parseInt(quantity.value); // 수량
					quantity.value = q+1;
					price.textContent = (p_ * (q+1)).toLocaleString('ko-KR') + '원';
			    });
				// -버튼
				downBtn.addEventListener('click', function(){
					let q = parseInt(quantity.value); // 수량
					if(quantity.value > 1) {
						quantity.value = q-1;		
						price.textContent = (p_ * (q-1)).toLocaleString('ko-KR') + '원';
					}
			    });
				
				// 상품 수량 유효성검사
				let tmp = quantity.value;
				quantity.addEventListener('blur', function() {
					if(quantity.value < 1) {
						alert('더 이상 줄일 수 없습니다.');
						quantity.value = 1;
						price.textContent = p + '원';
					} else {		
						price.textContent = (p_ * quantity.value).toLocaleString('ko-KR') + '원'
					}
				})
				
				$('#buyNow').click(function() {
					$('#bn').attr('value', 'true');
					$('#updateForm').submit();
				})
			});
		</script>
	</body>
</html>