<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>add goods</title>
	</head>
	<body>
		<h1>add goods</h1>
		<a href="${pageContext.request.contextPath}/goodsList">goods list</a>
		<form action="${pageContext.request.contextPath}/addGoods" method="post" enctype="multipart/form-data">
			<div>goodsName : <input type="text" name="goodsName"/></div>
			<div>goodsPrice : <input type="number" name="goodsPrice"/></div>
			<div>soldOut : Y<input type="radio" name="soldOut" value="Y"> N<input type="radio" name="soldOut" value="N"></div>
			<div>hit : <input type="number" name="hit"></div>
			<div>file : <input type="file" name="fileName"></div>
			<button type="submit">add goods</button>
		</form>
	</body>
</html>