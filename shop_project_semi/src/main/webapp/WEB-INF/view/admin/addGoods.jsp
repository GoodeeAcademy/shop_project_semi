<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>add goods</title>
	</head>
	<body>
		<h1>상품등록</h1>
		<a href="${pageContext.request.contextPath}/goodsList">상품목록</a>
		<form action="${pageContext.request.contextPath}/addGoods" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>상품코드</th>
					<td>자동생성</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="goodsName"/></td>
				</tr>
				<tr>
					<th>판매가격</th>
					<td><input type="number" name="goodsPrice"/></td>
				</tr>
				<tr>
					<th>판매상태</th>
					<td>
						<input type="radio" name="soldOut" value="Y">판매함 <input type="radio" name="soldOut" value="N">판매안함
					</td>
				</tr>
				<tr>
					<th>추천상품</th>
					<td><input type="number" name="hit"></td>
				</tr>
				<tr>
					<th>사진등록</th>
					<td><input type="file" name="filename" accept="image/jpeg, image/png"></td>
				</tr>
			</table>
			<button type="submit">상품등록</button>
		</form>
	</body>
</html>