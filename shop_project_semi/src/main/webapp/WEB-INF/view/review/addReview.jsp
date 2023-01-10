<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addReview</title>
	</head>
	<body>
		<h1>리뷰쓰기</h1>
		(리뷰 작성 시 포인트 ? 적립)
		<div>
			<div><img src="${pageContext.request.contextPath}/upload/${m.filename}" alt="상품 이미지" width="100px" height="100px"/></div>
			<div>${m.goodsName}</div>
		</div>
		<div>
			<form action="${pageContext.request.contextPath}/addReview" method="post">
				<input type="hidden" name="orderCode" value="${m.orderCode}">
				<input type="hidden" name="goodsCode" value="${m.goodsCode}">
				<div><input type="number" name="star">1~5(임시 -> 자바스크립트)</div>
				<div><textarea rows="5" cols="30" name="reviewMemo"></textarea></div>
				<div>
					<button type="button">취소</button>
					<button type="submit">리뷰 등록</button>
				</div>
			</form>
		</div>
		
	</body>
</html>