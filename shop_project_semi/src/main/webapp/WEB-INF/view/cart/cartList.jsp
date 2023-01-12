<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cart list</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	</head>
	<body oncopy="return false" oncut="return false" onpaste="return false">
		<h1>cart list</h1>
		<form action="${pageContext.request.contextPath}/modifyCart" method="post" id="updateForm">
			<table border="1">
				<thead>
					<tr>
						<td>PRODUCT</td>
						<td>PRICE</td>
						<td>QUANTITY</td>
						<td>TOTAL</td>
						<td>MANAGEMENT</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="m" items="${list}">
						<tr>
							<td>
								<input type="hidden" name="goodsCode" value="${m.goodsCode}">
								<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="50px" height="50px" alt="상품 이미지"/>
								${m.goodsName}
							</td>
							<td><span class="price">${m.goodsPrice}</span></td>
							<td>
								<button type="button" class="btn-quantity-down">-</button>
									<input type="number" class="quantity" name="quantity" value="${m.quantity}"/>
								<button type="button" class="btn-quantity-up">+</button>
							</td>
							<td><span class="totalPrice">${m.goodsPrice * m.quantity}</span></td>
							<td><a href="${pageContext.request.contextPath}/removeCart?goodsCode=${m.goodsCode}">delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<form action="${pageContext.request.contextPath}/OrderController" method="get">
			<button type="submit">주문하기</button>
		</form>
		
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