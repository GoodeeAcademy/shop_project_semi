<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
</head>
<body>
	<table>
		<tr>
			<td>상품번호</td>
			<td>${question.goodsCode}</td>
		</tr>
		<tr>	
			<td>종류</td>
			<td>${question.category}</td>
		</tr>
		<tr>	
			<td>작성자</td>
			<td>${question.customerId}</td>
		</tr>
		<tr>	
			<td>날짜</td>
			<td>${question.createdate}</td>
		</tr>
		<tr>	
			<td>문의내용</td>
			<td>${question.questionMemo}</td>
		</tr>
	</table>
</body>
</html>