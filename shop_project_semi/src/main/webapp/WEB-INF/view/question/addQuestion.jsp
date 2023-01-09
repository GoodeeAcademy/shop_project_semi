<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의하기</title>
</head>
<body>
	<h1>상품 문의하기</h1>
	<form method="post" action="${pageContext.request.contextPath}/AddQuestionController">
		<table>
			<tr>
				<td>주문번호</td>
				<td>
					${orderCode}
					<input type="hidden" name="orderCode" value="${orderCode}">
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>
					${m.goodsName}
					<input type="hidden" name="goodsCode" value="${m.goodsCode}">
				</td>
			</tr>
			<tr>
				<td>문의종류</td>
				<td>
					<select name="category">
						<option value="배송">배송</option>
						<option value="반품">반품</option>
						<option value="교환">교환</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="10" name="questionMemo"></textarea>
				</td>
			</tr>
		</table>
		<button type="submit">문의하기</button>
	</form>
</body>
</html>