<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>EMPLOYEE MAIN | TYPESERVICE</title>
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/emp/images/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/emp/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="${pageContext.request.contextPath}/assets/emp/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/emp/css/style.css" rel="stylesheet">
    <style>
    	.colorBlack{
    		color:black;
    	}
    </style>
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
			    	<!-- 방문자 그래프 -->
                    <div class="col-xl-8 col-lg-8 col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">방문자 통계</h4>
                            </div>
                            <div class="card-body">
                            	<div id="curve_chart" class="col-xl-12 col-lg-8" style="height: 400px"></div>
                            </div>
                        </div>
                    </div>
                    <!-- 별점 분포 -->
                    <div class="col-lg-4">
			            <div class="card">
			                <div class="card-header">
			                    <h4 class="card-title">최근 100개 리뷰 별점 분포</h4>
			                </div>
			                <div class="card-body">
			                    <div class="current-progress">
			                        <div class="progress-content py-2">
			                            <div class="row">
			                                <div class="col-lg-4">
			                                    <div class="progress-text">&#11088;</div>
			                                </div>
			                                <div class="col-lg-8">
			                                    <div class="current-progressbar">
			                                        <div class="progress">
			                                            <div class="progress-bar progress-bar-primary w-${starList[0]}" role="progressbar" aria-valuenow="${starList[0]}" aria-valuemin="0" aria-valuemax="100">
		                                              		${starList[0]}
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="progress-content py-2">
			                            <div class="row">
			                                <div class="col-lg-4">
			                                    <div class="progress-text">&#11088;&#11088;</div>
			                                </div>
			                                <div class="col-lg-8">
			                                    <div class="current-progressbar">
			                                        <div class="progress">
			                                            <div class="progress-bar progress-bar-primary w-${starList[1]}" role="progressbar" aria-valuenow="${starList[1]}" aria-valuemin="0" aria-valuemax="100">
		                                              		${starList[1]}
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="progress-content py-2">
			                            <div class="row">
			                                <div class="col-lg-4">
			                                    <div class="progress-text">&#11088;&#11088;&#11088;</div>
			                                </div>
			                                <div class="col-lg-8">
			                                    <div class="current-progressbar">
			                                        <div class="progress">
			                                            <div class="progress-bar progress-bar-primary w-${starList[2]}" role="progressbar" aria-valuenow="${starList[2]}" aria-valuemin="0" aria-valuemax="100">
		                                              		${starList[2]}
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="progress-content py-2">
			                            <div class="row">
			                                <div class="col-lg-4">
			                                    <div class="progress-text">&#11088;&#11088;&#11088;&#11088;</div>
			                                </div>
			                                <div class="col-lg-8">
			                                    <div class="current-progressbar">
			                                        <div class="progress">
			                                            <div class="progress-bar progress-bar-primary w-${starList[3]}" role="progressbar" aria-valuenow="${starList[3]}" aria-valuemin="0" aria-valuemax="100">
		                                              		${starList[3]}
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="progress-content py-2">
			                            <div class="row">
			                                <div class="col-lg-4">
			                                    <div class="progress-text">&#11088;&#11088;&#11088;&#11088;&#11088;</div>
			                                </div>
			                                <div class="col-lg-8">
			                                    <div class="current-progressbar">
			                                        <div class="progress">
			                                            <div class="progress-bar progress-bar-primary w-${starList[4]}" role="progressbar" aria-valuenow="${starList[4]}" aria-valuemin="0" aria-valuemax="100">
		                                              		${starList[4]}
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
                </div>
				<div class="row">
					<!-- 최근 주문 내역 -->	
					<div class="col-lg-6">
					    <div class="card">
					        <div class="card-header">
					            <h4 class="card-title"><a href="${pageContext.request.contextPath}/emp/order/list" class="colorBlack">최근 주문</a></h4>
					        </div>
					        <div class="card-body">
					            <div class="table-responsive">
					                <table class="table mb-0">
					                    <thead>
					                        <tr>
					                            <th>주문번호</th>
												<th>상품번호</th>
												<th>상품</th>
												<th>주문고객</th>
												<th>상태</th>
												<th>주문일자</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                    	<c:forEach var="m" items="${orderList}">
												<tr>
													<td>${m.orderCode}</td>
													<td>${m.goodsCode}</td>
													<td>${m.goodsName}</td>
													<td>${m.customerId}</td>
													<td>
														 <c:if test ="${m.orderState eq '결제전' || m.orderState eq '결제완료' || m.orderState eq '배송준비중'}">
															<span class="badge badge-warning">${m.orderState}</span>
														 </c:if>
														 <c:if test ="${m.orderState eq '배송중' || m.orderState eq '배송완료' || m.orderState eq '구매확정'}">
															 <span class="badge badge-success">${m.orderState}</span>
														 </c:if>
													</td>
													<td>${m.createdate}</td>
												</tr>
											</c:forEach>
					                    </tbody>
					                </table>
					            </div>
					        </div>
					    </div>
					</div>
					<!-- 최근 문의 내역 -->
					<div class="col-lg-6">
					    <div class="card">
					        <div class="card-header">
					            <h4 class="card-title"><a href="${pageContext.request.contextPath}/emp/question" class="colorBlack">최근 문의</a></h4>
					        </div>
					        <div class="card-body">
					            <div class="table-responsive">
					                <table class="table mb-0">
					                    <thead>
					                        <tr>
					                            <th>주문번호</th>
												<th>분류</th>
												<th>제목</th>
												<th>날짜</th>
												<th>답변상태</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                    	<c:forEach var="q" items="${list}">
												<tr>
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
					                    </tbody>
					                </table>
					            </div>
					        </div>
					    </div>
					</div>
				</div>
				<div class="row">
			        <!-- 최근 공지 내역 -->
					<div class="col-lg-12">
					    <div class="card">
					        <div class="card-header">
					            <h4 class="card-title"><a href="${pageContext.request.contextPath}/emp/question" class="colorBlack">최근 공지</a></h4>
					        </div>
					        <div class="card-body">
					            <div class="table-responsive">
					                <table class="table mb-0">
					                    <thead>
					                        <tr>
					                            <th class="w-15">공지번호</th>
												<th>제목</th>
												<th class="w-15">작성자</th>
												<th class="w-15">날짜</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                    	<c:forEach var="n" items="${noticeList}">
												<tr>
													<td>${n.noticeCode}</td>
													<td>
														<a href="${pageContext.request.contextPath}/notice/detail?noticeCode=${n.noticeCode}">${n.noticeTitle}</a>
													</td>
													<td>${n.empName}</td>
													<td>${n.createdate}</td>
												</tr>
											</c:forEach>
					                    </tbody>
					                </table>
					            </div>
					        </div>
					    </div>
					</div>
			     </div>
			</div>
		</div>
	</div>
    <!-- 차트 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['countDate', '방문자 수'],
          ['${countList.get(0).get("countDate")}', ${countList.get(0).get("countNum")}],
          ['${countList.get(1).get("countDate")}', ${countList.get(1).get("countNum")}],
          ['${countList.get(2).get("countDate")}', ${countList.get(2).get("countNum")}],
          ['${countList.get(3).get("countDate")}', ${countList.get(3).get("countNum")}],
          ['${countList.get(4).get("countDate")}', ${countList.get(4).get("countNum")}],
          ['${countList.get(5).get("countDate")}', ${countList.get(5).get("countNum")}],
          ['${countList.get(6).get("countDate")}', ${countList.get(6).get("countNum")}]
        ]);

        var options = {
          curveType: 'function',
          lineWidth: 5,
          vAxis: {
              viewWindow: {
                  min: 0
              }
          },
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
    
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