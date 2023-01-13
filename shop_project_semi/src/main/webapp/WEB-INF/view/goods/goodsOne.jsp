<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>goods one</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	</head>
	<body>
		<a href="${pageContext.request.contextPath}/HomeController">home</a>
		<a href="${pageContext.request.contextPath}/goodsList">shop</a>
		<a href="${pageContext.request.contextPath}/NoticeListController">notice</a>
		<a href="${pageContext.request.contextPath}/QuestionListForCustomerController">문의</a>
		<a href="${pageContext.request.contextPath}/CustomerOneController">my page</a>
		<div>
			<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="200px" height="200px" alt="상품 이미지"/>
		</div>
		<div>${m.goodsName}</div>
		<div class="price">${m.goodsPrice}</div>
		
		<form action="${pageContext.request.contextPath}/addCart" method="get" id="updateForm">
			<input type="hidden" name="goodsCode" value="${m.goodsCode}">
			<input type="hidden" name="filename" value="${m.filename}">
			<input type="hidden" name="goodsName" value="${m.goodsName}">
			<input type="hidden" name="goodsPrice" value="${m.goodsPrice}">
			<input type="hidden" name="goodsPrice" value="${m.goodsPrice}">
			<input type="hidden" name="bn" value="false" id="bn">
			<div>
				<button type="button" class="btn-quantity-down">-</button>
				<input type="number" class="quantity" name="quantity" value="1"/>
				<button type="button" class="btn-quantity-up">+</button>
			</div>
			<button type="submit">ADD TO CART</button>
			<button type="button" id="buyNow">BUY NOW</button>
		</form>
		
		<!-- 상품 전체 이미지 -->
		<table>
			<c:forEach var="gi" items="${imgList}">
			<tr>
				<td><img src="${pageContext.request.contextPath}/upload/${gi.filename}" width="100px" height="100px" alt="상품 이미지"/></td>
			</tr>
			</c:forEach>
		</table>
		
		<h4>리뷰</h4>
		<c:forEach var="m" items="${list}">
			<div>
				<div>
					<span>${m.customerId}</span>
					<span>${m.star}</span>
				</div>
				<div>
					<p>
						${m.reviewMemo}
					</p>
				</div>
			</div>		
		</c:forEach>
		
		<script>
			$(function() {
				const quantity = document.querySelector('.quantity');
				const upBtn = document.querySelector('.btn-quantity-up');
				const downBtn = document.querySelector('.btn-quantity-down');
				const price = document.querySelector('.price');
				const updateForm = document.querySelector('#updateForm');
				
				// 상품 수량 증가, 감소 버튼
				// + 버튼
				let p = parseInt(price.textContent); // 가격
				
				upBtn.addEventListener('click', function(){
					let q = parseInt(quantity.value); // 수량
					quantity.value = q+1;
					price.textContent = p * (q+1);
			    });
				// -버튼
				downBtn.addEventListener('click', function(){
					let q = parseInt(quantity.value); // 수량
					if(quantity.value > 1) {
						quantity.value = q-1;		
						price.textContent = p * (q-1);
					}
			    });
				
				// 상품 수량 유효성검사
				let tmp = quantity.value;
				quantity.addEventListener('blur', function() {
					if(quantity.value < 1) {
						alert('더 이상 줄일 수 없습니다.');
						quantity.value = 1;
						price.textContent = p;
					} else {		
						price.textContent = p * quantity.value;
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