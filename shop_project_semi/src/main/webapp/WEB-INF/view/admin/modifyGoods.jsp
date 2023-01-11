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
			<table border="1">
				<tr>
					<th>상품코드</th>
					<td>
						<input type="hidden" name="goodsCode" value="${m.goodsCode}">
						${m.goodsCode}
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="goodsName" value="${m.goodsName}"/></td>
				</tr>
				<c:forEach var="i" begin="0" end="${listSize-1}">
					<tr>
						<td>사진</td>
						<td>
							<img src="${pageContext.request.contextPath}/upload/${imgList[i].filename}" width="100px" height="100px" alt="상품 이미지"/>
							<div>
								<input type="file" name="filename${i}" accept="image/jpeg, image/png">
								<input type="hidden" name="oldFilename${i}" value="${imgList[i].filename}"/>${imgList[i].filename}
								<input type="hidden" name="goodsImgCode${i}" value="${imgList[i].goodsImgCode}"/>
								<input type="hidden" name="listSize" value="${listSize-1}"/>
							</div>
						<td>
					</tr>
				</c:forEach>
				<tr>
					<th>판매가격</th>
					<td><input type="text" name="goodsPrice" value="${m.goodsPrice}"/></td>
				</tr>
				<tr>
					<th>판매상태</th>
					<td>
						<c:if test="${m.soldOut eq 'Y'}">
							<input type="radio" name="soldOut" value="Y" checked="checked">판매함 <input type="radio" name="soldOut" value="N">판매안함
						</c:if>
						<c:if test="${m.soldOut eq 'N'}">
							<input type="radio" name="soldOut" value="Y">판매함 <input type="radio" name="soldOut" value="N" checked="checked">판매안함
						</c:if>
					</td>
				</tr>
				<tr>
					<th>추천상품</th>
					<td><input type="number" name="hit" value="${m.hit}"></td>
				</tr>
			</table>
			<button type="submit">상품수정</button>
		</form>
	</body>
</html>