<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>EMPLOYEE ALL ORDER LIST | TYPESERVICE</title>
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/emp/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/emp/css/style.css" rel="stylesheet">
</head>
<body>
	<div id="main-wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/view/inc/emp/header.jsp"></jsp:include>
		<!-- sidebar -->
		<jsp:include page="/WEB-INF/view/inc/emp/sidebar.jsp"></jsp:include>
		
		<div class="content-body">
		    <div class="container-fluid">
		    	<div class="row">
		    		<div class="col-lg-12">
		    			<div class="card">
		    				<div class="card-header">
                                <h4 class="card-title">전체 주문 내역</h4>
                            </div>
                            <div class="card-body">
								<!-- 모든 주문 내역(관리자) -->
								<form method="post" action="${pageContext.request.contextPath}/emp/order/list">
									<table class="table">
										<thead class="thead-primary">
											<tr>
												<th scope="col">주문번호</th>
												<th scope="col">상품번호</th>
												<th colspan="2" scope="col" class="text-center">상품</th>
												<th scope="col">주문고객</th>
												<th scope="col" style="width: 200px;">상태</th>
												<th scope="col">주문일자</th>
											</tr>
										</thead>
										<c:forEach var="m" items="${orderList}">
											<tr>
												<td>
													${m.orderCode}
													<input type="hidden" name="orderCode" value="${m.orderCode}">
												</td>
												<td>
													${m.goodsCode}
													<input type="hidden" name="goodsCode" value="${m.goodsCode}">
												</td>
												<td><img src="${pageContext.request.contextPath}/upload/${m.filename}" width="50px" height="50px" alt="이미지"></td>
												<td>${m.goodsName}</td>
												<td>${m.customerId}</td>
												<td>
													<select name="orderState" class="form-select custom-select">
															<c:if test="${m.orderState eq '구매확정'}">	
																<option value="${m.orderState}"> ${m.orderState} </option>
															</c:if>
															<c:forEach var="str" items="${stateList}">
																<c:if test="${m.orderState eq '결제전' || m.orderState eq '결제완료' || m.orderState eq '취소' || m.orderState eq '배송준비중' || m.orderState eq '배송중' || m.orderState eq '배송완료'}">	
																	<option value="${str}" <c:if test ="${str eq m.orderState}">selected="selected"</c:if>>
																		${str}
																	</option>
																</c:if>
															</c:forEach>
													</select>
												</td>
												<td>${m.createdate}</td>
											</tr>
										</c:forEach>
									</table>
									<div align="right">
										<button type="submit" class="btn btn-primary">주문 상태 변경</button>
									</div>
								</form>
								
								<!-- 페이징 -->
								<ul class="pagination">
									<li class="page-item page-indicator">
										<c:if test="${currentPage > 10}">
											<a href="${pageContext.request.contextPath}/emp/order/list?currentPage=${startPage-10}" class="page-link"><i class="icon-arrow-left"></i></a>
										</c:if>
									</li>
									<c:forEach var="i" begin="${startPage}" end="${endRow}">
										<li class="page-item active">
											<c:if test="${i == currentPage}">
												<a href="${pageContext.request.contextPath}/emp/order/list?currentPage=${i}" class="page-link">${i}</a>
											</c:if>
										</li>
										<li class="page-item">
											<c:if test="${i != currentPage}">
												<a href="${pageContext.request.contextPath}/emp/order/list?currentPage=${i}" class="page-link">${i}</a>
											</c:if>
										</li>
									</c:forEach>
									<li class="page-item page-indicator">
										<c:if test="${beginRow+10 < lastPage}">
											<a href="${pageContext.request.contextPath}/emp/order/list?currentPage=${startPage+10}" class="page-link"><i class="icon-arrow-right"></i></a>
										</c:if>
									</li>
								</ul>
								<!--  -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/global/global.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/js/quixnav-init.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/js/custom.min.js"></script>


    <!-- Vectormap -->
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/morris/morris.min.js"></script>


    <script src="${pageContext.request.contextPath}/assets/emp/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/chart.js/Chart.bundle.min.js"></script>

    <script src="${pageContext.request.contextPath}/assets/emp/vendor/gaugeJS/dist/gauge.min.js"></script>

    <!--  flot-chart js -->
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/flot/jquery.flot.resize.js"></script>

    <!-- Owl Carousel -->
    <script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>

    <!-- Counter Up -->
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/js/jquery.vmap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
    <script src="${pageContext.request.contextPath}/assets/emp/vendor/jquery.counterup/jquery.counterup.min.js"></script>

    <script src="${pageContext.request.contextPath}/assets/emp/js/dashboard/dashboard-1.js"></script>
</body>
</html>