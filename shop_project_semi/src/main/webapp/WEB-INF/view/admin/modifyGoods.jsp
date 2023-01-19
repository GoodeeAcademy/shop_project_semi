<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>상품 수정</title>
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/emp/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/emp/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
                                <h4 class="card-title">상품 수정</h4>
                            </div>
                            <div class="auth-form">
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
											<th>카테고리</th>
											<td>
												<select name="categoryCode">
													<c:forEach var="c" items="${categoryList}">
														<option value="${c.categoryCode}">${c.categoryName}</option>
													</c:forEach>
												</select>
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
											<th>사진추가</th>
											<td>
												<c:forEach var="i" begin="0" end="2">
													<div><input type="file" name="addedFilename${i}" accept="image/jpeg, image/png"></div>
												</c:forEach>
											</td>
										</tr>
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