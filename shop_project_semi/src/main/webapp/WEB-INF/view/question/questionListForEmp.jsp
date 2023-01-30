<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>EMPLOYEE Q&amp;A｜TYPESERVICE</title>
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
                                <h4 class="card-title">전체 문의 내역</h4>
                            </div>
                            <div class="card-body">
								<table class="table">
									<thead class="thead-primary">
										<tr>
											<th scope="col">번호</th>
											<th scope="col">분류</th>
											<th scope="col">제목</th>
											<th scope="col">날짜</th>
											<th scope="col">답변상태</th>
										</tr>
									</thead>
									<c:forEach var="q" items="${list}">
										<tr class="row_for_text">
											<td>${q.orderCode}</td>
											<td>${q.category}</td>
											<td>	
												<a href="${pageContext.request.contextPath}/emp/question/detail?questionCode=${q.questionCode}">${q.questionTitle}</a>
											</td>
											<td>${q.createdate}</td>
											<td>
												<!-- 답변 여부에 따라 분기 -->
												<c:if test="${!q.commentPresence}">
													<span class="badge badge-warning">답변대기</span>
												</c:if>
												<c:if test="${q.commentPresence}">
													<span class="badge badge-success">답변완료</span>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
								<!-- 페이징 -->
								<ul class="pagination">
									<li class="page-item page-indicator">
										<c:if test="${currentPage > 10}">
											<a href="${pageContext.request.contextPath}/emp/question?currentPage=${startPage-10}" class="page-link"><i class="icon-arrow-left"></i></a>
										</c:if>
									</li>
									<c:forEach var="i" begin="${startPage}" end="${endRow}">
										<li class="page-item active">
											<c:if test="${i == currentPage}">
												<a href="${pageContext.request.contextPath}/emp/question?currentPage=${i}" class="page-link">${i}</a>
											</c:if>
										</li>
										<li class="page-item">
											<c:if test="${i != currentPage}">
												<a href="${pageContext.request.contextPath}/emp/question?currentPage=${i}" class="page-link">${i}</a>
											</c:if>
										</li>
									</c:forEach>
									<li class="page-item page-indicator">
										<c:if test="${beginRow+10 < lastPage}">
											<a href="${pageContext.request.contextPath}/emp/question?currentPage=${startPage+10}" class="page-link"><i class="icon-arrow-right"></i></a>
										</c:if>
									</li>
								</ul>
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