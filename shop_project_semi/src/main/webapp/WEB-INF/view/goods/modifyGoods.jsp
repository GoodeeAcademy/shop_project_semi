<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modify goods</title>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/modifyGoods" method="post" enctype="multipart/form-data">
			<input type="hidden" name="goodsCode" value="${m.goodsCode}">
			<div>
				<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="200px" height="200px" alt="상품 이미지"/>
				<input type="file" name="filename" accept="image/jpeg, image/png">
			</div>
			<div>
				<input type="hidden" name="oldFilename" value="${m.filename}"/>${m.filename}
			</div>
			<div>
				<input type="text" name="goodsName" value="${m.goodsName}"/>
			</div>
			<div>
				<input type="text" name="goodsPrice" value="${m.goodsPrice}"/>
			</div>
			<div>
				<c:if test="${m.soldOut eq 'Y'}">
					Y<input type="radio" name="soldOut" value="Y" checked="checked"> N<input type="radio" name="soldOut" value="N">
				</c:if>
				<c:if test="${m.soldOut eq 'N'}">
					Y<input type="radio" name="soldOut" value="Y"> N<input type="radio" name="soldOut" value="N" checked="checked">
				</c:if>
			</div>
			<div>
				<input type="number" name="hit" value="${m.hit}">
			</div>
			<button type="submit">modify goods</button>
		</form>
	</body>
</html>