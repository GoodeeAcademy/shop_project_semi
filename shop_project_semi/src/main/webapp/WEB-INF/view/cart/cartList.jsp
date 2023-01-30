<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>CARTLIST | TYPESERVICE</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="icon" type="image/png" href="images/icons/favicon.png" />
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
	</head>
	<body oncopy="return false" oncut="return false" onpaste="return false">
		<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>
		<div class="container p-3">
			<form action="${pageContext.request.contextPath}/member/cart/modify" method="post" id="updateForm">
				<table class="table">
					<thead>
						<tr>
							<td class="text-center">PRODUCT</td>
							<td>PRICE</td>
							<td class="text-center">QUANTITY</td>
							<td>TOTAL</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${list}">
							<c:if test="${m.soldOut eq 'N'}">
								<tr>
									<td>
										<a class="btn" href="${pageContext.request.contextPath}/member/cart/remove?goodsCode=${m.goodsCode}">X</a>
										<input type="hidden" name="goodsCode" value="${m.goodsCode}">
										<a class="text-dark" href="${pageContext.request.contextPath}/goods/detail?goodsCode=${m.goodsCode}">
											<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="50px" height="50px" alt="상품 이미지"/>
											${m.goodsName}
										</a>
									</td>
									<td>
										<span class="price">
											<fmt:formatNumber value="${m.goodsPrice}" type="number"/>
										</span></td>
									<td>
										<div class="d-flex justify-content-center">
											<button type="button" class="btn btn-quantity-down">-</button>
											<input type="number" class="quantity w-25 text-center" name="quantity" value="${m.quantity}"/>
											<button type="button" class="btn btn-quantity-up">+</button>
										</div>
									</td>
									<td>
										<span class="totalPrice">
											<fmt:formatNumber value="${m.goodsPrice * m.quantity}" type="number"/>
										</span>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</form>
			<!-- 주문 버튼 -->
			<form class="text-center mt-5" action="${pageContext.request.contextPath}/member/order" method="get">
				<button class="btn btn-lg p-2 w-25" type="submit" style="background-color: black; color:white;">ORDER</button>
			</form>
			
			<!-- 품절 -->
			<table class="table">
				<!-- 장바구니에 품절 항목이 하나라도 있으면 테이블 헤드 보여주기 -->
				<c:forEach var="m" items="${list}">
					<c:if test="${m.soldOut eq 'Y'}">
						<c:set var="count" value="1"/>
					</c:if>			
				</c:forEach>
				<c:if test="${count eq 1}">
					<div class="mt-5 fw-bold">품절된 상품</div>
						<thead>
							<tr>
								<td class="text-center">PRODUCT</td>
								<td>PRICE</td>
								<td class="text-center">QUANTITY</td>
								<td>TOTAL</td>
							</tr>
						</thead>
				</c:if>
				<c:forEach var="m" items="${list}">
					<c:if test="${m.soldOut eq 'Y'}">
						<tbody>
							<tr>
								<td>
									<a class="btn" href="${pageContext.request.contextPath}/member/cart/remove?goodsCode=${m.goodsCode}">X</a>
									<input type="hidden" name="goodsCode" value="${m.goodsCode}">
									<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="50px" height="50px" alt="상품 이미지"/>
									${m.goodsName}
								</td>
								<td>
									<span class="price">
										<fmt:formatNumber value="${m.goodsPrice}" type="number"/>
									</span></td>
								<td>
									<div class="d-flex justify-content-center">
										<button type="button" class="btn">-</button>
										<input type="number" class="w-25 text-center" value="0" disabled="disabled"/>
										<button type="button" class="btn">+</button>
									</div>
								</td>
								<td>
									<span class="totalPrice">
										<fmt:formatNumber value="${m.goodsPrice * m.quantity}" type="number"/>
									</span>
								</td>
							</tr>
						</tbody>
					</c:if>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		<!-- 화면 레이아웃 -->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/js/slick-custom.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/js/main.js"></script>
		<script>
			$(function() {
				const quantity = document.querySelectorAll('.quantity');
				const upBtn = document.querySelectorAll('.btn-quantity-up');
				const downBtn = document.querySelectorAll('.btn-quantity-down');
				const price = document.querySelectorAll('.price');
				const totalPrice = document.querySelectorAll('.totalPrice');
				const updateForm = document.querySelector('#updateForm');
				
				// 상품 수량 증가, 감소 버튼
				for(let i = 0; i < quantity.length; i++) {
					// + 버튼
					upBtn[i].addEventListener('click', function(){
						let q = parseInt(document.querySelectorAll('.quantity')[i].value); // 수량 
						quantity[i].value = q+1;
						totalPrice[i].textContent = parseInt(price[i].textContent) * (q+1);
						alert('수량이 변경되었습니다.');
						updateForm.submit();
				    });
					// -버튼
					downBtn[i].addEventListener('click', function(){
						let q = parseInt(document.querySelectorAll('.quantity')[i].value);
						if(quantity[i].value > 1) {
							quantity[i].value = q-1;		
							totalPrice[i].textContent = parseInt(price[i].textContent) * (q-1);
							alert('수량이 변경되었습니다.');
							updateForm.submit();
						}
				    });
				}
				
				// 상품 수량 유효성검사
				for(let i = 0; i < quantity.length; i++) {
					let tmp = quantity[i].value;
					
					quantity[i].addEventListener('blur', function() {
						if(quantity[i].value < 1) {
							alert('더 이상 줄일 수 없습니다.');
							quantity[i].value = 1;
							totalPrice[i].textContent = price[i].textContent;
						} else if(quantity[i].value != tmp){
							alert('수량이 변경되었습니다.');
							updateForm.submit();							
						}
					})
				}
			});
		</script>
	</body>
</html>