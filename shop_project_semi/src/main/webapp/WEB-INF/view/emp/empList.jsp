<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>직원 목록</title>
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
                                <h4 class="card-title">전체 직원 목록</h4>
                            </div>
                            <div class="card-body">
								<form method="post" action="${pageContext.request.contextPath}/emp/active/modify">
									<table class="table">
										<thead class="thead-primary">
											<tr>
												<th scope="col">사원번호</th>
												<th scope="col">아이디</th>
												<th scope="col">이름</th>
												<!-- 중간 관리자 => 활성화 가능 -->
												<c:if test="${loginEmp.authCode < 3}">
													<th scope="col">활성화</th>
												</c:if>
												<!-- 최고 관리자 => 모든 기능 가능 -->
												<c:if test="${loginEmp.authCode < 2}">
													<th scope="col">등급조정</th>
													<th scope="col">삭제</th>
												</c:if>
											</tr>
										</thead>
										<c:forEach var="e" items="${list}">
											<tr>
												<td>${e.empCode}</td>
												<td>
													${e.empId}
													<input type="hidden" name="empId" value="${e.empId}">
												</td>
												<td>${e.empName}</td>
												<c:if test="${loginEmp.authCode < 3}">
													<td>
														<input type="checkbox" name="empActive" value="${e.empId}" <c:if test="${e.active eq 'Y'}">checked</c:if>>
													</td>
												</c:if>
												<c:if test="${loginEmp.authCode < 2}">
													<td><a href="${pageContext.request.contextPath}/emp/admin/modify?empId=${e.empId}">등급조정</a></td>
													<td><a href="${pageContext.request.contextPath}/emp/remove?empId=${e.empId}">퇴사</a></td>
												</c:if>
											</tr>
										</c:forEach>
									</table>
									<div align="right">
									<c:if test="${loginEmp.authCode < 3}">
										<button type="submit" class="btn btn-primary">활성화</button>
									</c:if>
									</div>
								</form>
								<!-- 페이징 -->
								<ul class="pagination">
									<li class="page-item page-indicator">
										<c:if test="${currentPage > 10}">
											<a href="${pageContext.request.contextPath}/emp/emp?currentPage=${startPage-10}" class="page-link"><i class="icon-arrow-left"></i></a>
										</c:if>
									</li>
									<c:forEach var="i" begin="${startPage}" end="${endRow}">
										<li class="page-item active">
											<c:if test="${i == currentPage}">
												<a href="${pageContext.request.contextPath}/emp/emp?currentPage=${i}" class="page-link">${i}</a>
											</c:if>
										</li>
										<li class="page-item">
											<c:if test="${i != currentPage}">
												<a href="${pageContext.request.contextPath}/emp/emp?currentPage=${i}" class="page-link">${i}</a>
											</c:if>
										</li>
									</c:forEach>
									<li class="page-item page-indicator">
										<c:if test="${beginRow+10 < lastPage}">
											<a href="${pageContext.request.contextPath}/emp/emp?currentPage=${startPage+10}" class="page-link"><i class="icon-arrow-right"></i></a>
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