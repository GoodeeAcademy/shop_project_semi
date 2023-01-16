<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>orderlist</title>
	</head>
	
	<body>
		<h1>주문내역조회</h1>
		<%-- <table border="1">
			<tr>
				<th>주문번호</th>
				<th>대표이미지</th>
				<th>상품명</th>
				<th>금액</th>
				<th>주문상태</th>
				<th>주문일</th>
			</tr>
			
			<c:forEach var="m" items="${orderList}">
				<tr>
					<td>${m['orderCode']}</td>
					<td><img src="${pageContext.request.contextPath}/upload/${m['fileName']}" width="50px" height="50px" alt="이미지"></td>
					<c:if test="${m['quantity'] == 1}">
						<td><a href="${pageContext.request.contextPath}/OrderOneController?orderCode=${m['orderCode']}">${m['goodsName']}</a></td>
					</c:if>
					<c:if test="${m['quantity'] != 1}">
						<td><a href="${pageContext.request.contextPath}/OrderOneController?orderCode=${m['orderCode']}">${m['goodsName']} 외 ${m['quantity'] - 1}건</a></td>
					</c:if>
					<td>${m['orderPrice']}원</td>
					<td>${m['orderState']}</td>
					<td>${m['createdate']}</td>
				</tr>
			</c:forEach>
		</table> --%>
		
		<%--
		<table border="1">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>상품정보</th>
					<th>주문일자</th>
					<th>주문금액(수량)</th>
					<th>주문상태</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="pre" value=""/>
				<c:forEach var="m" items="${orderList}">
					<tr>
						<td rowspan=""><a href="${pageContext.request.contextPath}/OrderOneController?orderCode=${m.orderCode}">${m.orderCode}</a></td>
						<td>
							<div>
								<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="50px" height="50px" alt="이미지">
							</div>
							<div>${m.goodsName}</div>
						</td>
						<td>${m.createdate}</td>
						<td>
							<div>${m.orderGoodsPrice}</div>
							<div>${m.orderGoodsQuantity}개</div>
						</td>
						<td>
							${m.orderState}
							<c:if test="${empty m.check}"> <!-- 리뷰 중복 x -> 리뷰 작성 가능  -->
								<c:if test="${m.orderState.equals('구매확정')}">
									<a href="#none" onclick="window.open('${pageContext.request.contextPath}/addReview?orderCode=${m.orderCode}&goodsCode=${m.goodsCode}&totalPrice=${m.orderGoodsPrice*m.orderGoodsQuantity}', '리뷰팝업', 'width=700px,height=800px,scrollbars=yes');">리뷰쓰기</a>							
								</c:if>
								<c:if test="${m.orderState.equals('배송완료')}">
									<a href="${pageContext.request.contextPath}/modifyOrderState?orderCode=${m.orderCode}&goodsCode=${m.goodsCode}">구매확정</a>
								</c:if>
							</c:if>
							<c:if test="${not empty m.check}">
								<div>${m.check}</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
		 --%>
		
		<table border="1">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문일자</th>
					<th>상품정보</th>
					<th>주문금액(수량)</th>
					<th>주문상태</th>
					<th>문의내역</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="m" items="${testList}">
					<c:forEach var="g" items="${m['goodsList']}" varStatus="d" >
						<c:if test="${d.first}">
							<tr>
								<td rowspan="${m['orderQuantity']}"><a href="${pageContext.request.contextPath}/OrderOneController?orderCode=${m['orderCode']}">${m['orderCode']}</a></td>
								<td rowspan="${m['orderQuantity']}">${m['createdate']}</td>
								<td>
									<div style="height: 100px; width: 200px; text-align: center; vertical-align: middle;">
										<img src="${pageContext.request.contextPath}/upload/${g['fileName']}" width="50px" height="50px" alt="이미지">
										${g['goodsName']}
									</div>
								</td>
								<td>
									<div style="height: 100px; width: 200px; text-align: center; vertical-align: middle;">
										${g['goodsPrice']}원 / ${g['goodsQuantity']}개
									</div>
								</td>
								<td>
									<div>
										${g['goodsState']}
										<c:if test="${empty g['check']}"> <!-- 리뷰 중복 x -> 리뷰 작성 가능  -->
											<c:if test="${g['goodsState'].equals('구매확정')}">
												<a href="#none" onclick="window.open('${pageContext.request.contextPath}/addReview?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}&totalPrice=${g['goodsPrice']*g['goodsQuantity']}', '리뷰팝업', 'width=700px,height=800px,scrollbars=yes');">리뷰쓰기</a>							
											</c:if>
											<c:if test="${g['goodsState'].equals('배송완료')}">
												<a href="${pageContext.request.contextPath}/modifyOrderState?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">구매확정</a>
											</c:if>
										</c:if>
										<c:if test="${not empty g['check']}">
											<div>${g['check']}</div>
										</c:if>
									</div>
								</td>
								<td>
									<c:if test="${empty g['qCheck']}">
										<div>
											<a href="${pageContext.request.contextPath}/AddQuestionController?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">문의하기</a>
										</div>
									</c:if>
									<c:if test="${not empty g['qCheck']}">
										<div>
											<a href="${pageContext.request.contextPath}/AddQuestionController?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">문의하기</a>
										</div>
										<div>
											<a href="${pageContext.request.contextPath}/QuestionListForCustomerController">${g['qCheck']}</a>
										</div>
									</c:if>
								</td>
							</tr>
						</c:if>
						<c:if test="${!d.first}">
							<tr>
								<td>
									<div style="height: 100px; width: 200px; text-align: center; vertical-align: middle;">
										<img src="${pageContext.request.contextPath}/upload/${g['fileName']}" width="50px" height="50px" alt="이미지">
										${g['goodsName']}
									</div>
								</td>
								<td>
									<div style="height: 100px; width: 200px; text-align: center; vertical-align: middle;">
										${g['goodsPrice']}원 / ${g['goodsQuantity']}개
									</div>
								</td>
								<td>
									<div>
										${g['goodsState']}
										<c:if test="${empty g['check']}"> <!-- 리뷰 중복 x -> 리뷰 작성 가능  -->
											<c:if test="${g['goodsState'].equals('구매확정')}">
												<a href="#none" onclick="window.open('${pageContext.request.contextPath}/addReview?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}&totalPrice=${g['goodsPrice']*g['goodsQuantity']}', '리뷰팝업', 'width=700px,height=800px,scrollbars=yes');">리뷰쓰기</a>							
											</c:if>
											<c:if test="${g['goodsState'].equals('배송완료')}">
												<a href="${pageContext.request.contextPath}/modifyOrderState?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">구매확정</a>
											</c:if>
										</c:if>
										<c:if test="${not empty g['check']}">
											<div>${g['check']}</div>
										</c:if>
									</div>
								</td>
								<td>
									<c:if test="${empty g['qCheck']}">
										<div>
											<a href="${pageContext.request.contextPath}/AddQuestionController?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">문의하기</a>
										</div>
									</c:if>
									<c:if test="${not empty g['qCheck']}">
										<div>
											<a href="${pageContext.request.contextPath}/AddQuestionController?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">문의하기</a>
										</div>
										<div>
											<a href="${pageContext.request.contextPath}/QuestionListForCustomerController">${g['qCheck']}</a>
										</div>
									</c:if>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>

	</body>
</html>