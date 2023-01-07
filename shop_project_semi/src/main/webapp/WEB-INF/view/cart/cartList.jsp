<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cart list</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	</head>
	<body>
		<h1>cart list</h1>
		<form action="${pageContext.request.contextPath}/modifyCart" method="post">
			<table border="1">
				<thead>
					<tr>
						<td>PRODUCT</td>
						<td>PRICE</td>
						<td>QUANTITY</td>
						<td>TOTAL</td>
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
							<td>${m.goodsPrice}</td>
							<td>
								<button type="button" class="btn-quantity-down">-</button>
									<input type="number" class="quantity" name="quantity" value="${m.quantity}"/>
								<button type="button" class="btn-quantity-up">+</button>
							</td>
							<td>${m.goodsPrice * m.quantity}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4"><button type="submit">UPDATE CART</button></td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<script>
			$(function() {
				const quantity = document.querySelectorAll('.quantity');
				const upBtn = document.querySelectorAll('.btn-quantity-up');
				const downBtn = document.querySelectorAll('.btn-quantity-down');
				
				for(let i = 0; i < quantity.length; i++) {
					upBtn[i].addEventListener('click', function(){
						let q = parseInt(document.querySelectorAll('.quantity')[i].value);
						quantity[i].value = q+1;		
				    });
					downBtn[i].addEventListener('click', function(){
						let q = parseInt(document.querySelectorAll('.quantity')[i].value);
						if(quantity[i].value > 1) {
							quantity[i].value = q-1;					
						}
				    });
				}
			});
		</script>
	</body>
</html>