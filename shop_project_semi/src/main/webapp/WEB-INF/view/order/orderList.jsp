<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
              content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
        <meta name="title" content="ORDER LIST"/>
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="icon" type="image/png" href="images/icons/favicon.png" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/iconic/css/material-design-iconic-font.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/fonts/linearicons-v1.0.0/icon-font.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/css-hamburgers/hamburgers.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/animsition/css/animsition.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/select2/select2.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/daterangepicker/daterangepicker.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/MagnificPopup/magnific-popup.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/vendor/perfect-scrollbar/perfect-scrollbar.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/main.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/shop/css/style.css">
		
		<!-- ?????? ?????? -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
		<title>ORDER LIST???TYPESERVICE</title>
		<style>
			th, td{text-align: center;}
		</style>
	</head>
	
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/view/inc/shop/header.jsp"></jsp:include>
		
		
		<!-- content start -->
		
		<div style="margin: 20px 0 30px; padding: 0 0 15px; border-bottom: 1px solid #000; width: 100%">
			<h2 style="color: #000;">?????? / ????????????</h2>
		</div>
		
		<div style="width: 100%; max-width: 80%; margin: auto;">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>????????????</th>
						<th>????????????</th>
						<th colspan="2">????????????</th>
						<th>????????????(??????)</th>
						<th>????????????</th>
						<th>????????????</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="m" items="${testList}">
						<c:forEach var="g" items="${m['goodsList']}" varStatus="d" >
							<c:if test="${d.first}">
								<tr class="align-middle">
									<td rowspan="${m['orderQuantity']}" class="align-middle col-sm-1"><a class="text-dark text-decoration-underline" href="${pageContext.request.contextPath}/member/order/detail?orderCode=${m['orderCode']}">${m['orderCode']}</a></td>
									<td rowspan="${m['orderQuantity']}" class="align-middle col-sm-2">${m['createdate']}</td>
									<td class="align-middle col-sm-1">
										<img src="${pageContext.request.contextPath}/upload/${g['fileName']}" width="50px" height="50px" alt="?????????" >
									</td>
									<td class="align-middle col-sm-2">
										<span>${g['goodsName']}</span>
									</td>
									<td class="align-middle col-sm-2">
										<div>
											<span>
												<fmt:formatNumber value="${g['goodsPrice']}" type="number"/>???(${g['goodsQuantity']}???)
											</span>
										</div>
									</td>
									<td class="align-middle col-sm-2">
										<div>
											${g['goodsState']}
											<c:if test="${empty g['check']}"> <!-- ?????? ?????? x -> ?????? ?????? ??????  -->
												<c:if test="${g['goodsState'].equals('????????????')}">
													<a class="text-dark text-decoration-underline" href="#none" onclick="window.open('${pageContext.request.contextPath}/member/review/add?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}&totalPrice=${g['goodsPrice']*g['goodsQuantity']}', '????????????', 'width=700px,height=800px,scrollbars=yes');">????????????</a>							
												</c:if>
												<c:if test="${g['goodsState'].equals('????????????')}">
													<a class="text-dark text-decoration-underline" href="${pageContext.request.contextPath}/member/order/modify?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">????????????</a>
												</c:if>
											</c:if>
											<c:if test="${not empty g['check']}">
												<div>${g['check']}</div>
											</c:if>
										</div>
									</td>
									<td class="align-middle col-sm-2">
										<c:if test="${empty g['qCheck']}">
											<div>
												<a class="text-dark text-decoration-underline" href="${pageContext.request.contextPath}/member/question/add?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">????????????</a>
											</div>
										</c:if>
										<c:if test="${not empty g['qCheck']}">
											<div>
												<a class="text-dark text-decoration-underline" href="${pageContext.request.contextPath}/member/question/add?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">????????????</a>
											</div>
											<div>
												<a class="text-dark text-decoration-underline" href="${pageContext.request.contextPath}/member/question">${g['qCheck']}</a>
											</div>
										</c:if>
									</td>
								</tr>
							</c:if>
							<c:if test="${!d.first}">
								<tr>
									<td class="align-middle col-sm-1">
										<img src="${pageContext.request.contextPath}/upload/${g['fileName']}" width="50px" height="50px" alt="?????????" >
									</td>
									<td class="align-middle col-sm-2">
										<span>${g['goodsName']}</span>
									</td>
									<td class="align-middle col-sm-2">
										<div>
											<span>
												<fmt:formatNumber value="${g['goodsPrice']}" type="number"/>???(${g['goodsQuantity']}???) 
											</span>
										</div>
									</td>
									<td class="align-middle col-sm-2">
										<div>
											${g['goodsState']}
											<c:if test="${empty g['check']}"> <!-- ?????? ?????? x -> ?????? ?????? ??????  -->
												<c:if test="${g['goodsState'].equals('????????????')}">
													<a class="text-dark text-decoration-underline" href="#none" onclick="window.open('${pageContext.request.contextPath}/member/review/add?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}&totalPrice=${g['goodsPrice']*g['goodsQuantity']}', '????????????', 'width=700px,height=800px,scrollbars=yes');">????????????</a>							
												</c:if>
												<c:if test="${g['goodsState'].equals('????????????')}">
													<a class="text-dark text-decoration-underline" href="${pageContext.request.contextPath}/member/order/modify?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">????????????</a>
												</c:if>
											</c:if>
											<c:if test="${not empty g['check']}">
												<div>${g['check']}</div>
											</c:if>
										</div>
									</td>
									<td class="align-middle col-sm-2">
										<c:if test="${empty g['qCheck']}">
											<div>
												<a class="text-dark text-decoration-underline" href="${pageContext.request.contextPath}/member/question/add?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">????????????</a>
											</div>
										</c:if>
										<c:if test="${not empty g['qCheck']}">
											<div>
												<a class="text-dark text-decoration-underline" href="${pageContext.request.contextPath}/member/question/add?orderCode=${m['orderCode']}&goodsCode=${g['goodsCode']}">????????????</a>
											</div>
											<div>
												<a class="text-dark text-decoration-underline" href="${pageContext.request.contextPath}/member/question">${g['qCheck']}</a>
											</div>
										</c:if>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<!-- ???????????? ????????? -->
		<div class="text-center" style="margin-bottom: 20px;">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a href="${pageContext.request.contextPath}/member/order/list?currentPage=1" class="page-link">??????</a>
				</li>
				<c:if test="${currentPage > 1}">
					<li class="page-item">
						<a href="${pageContext.request.contextPath}/member/order/list?currentPage=${currentPage-1}" class="page-link">??????</a>
					</li>
				</c:if>
				<c:if test="${endPage <= lastPage}">
					<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
						<c:if test="${currentPage == i}">
							<li class="page-item active">
								<a href="${pageContext.request.contextPath}/member/order/list?currentPage=${i}" class="page-link">${i}</a>
							</li>
						</c:if>
						<c:if test="${currentPage != i}">
							<li class="page-item">
								<a href="${pageContext.request.contextPath}/member/order/list?currentPage=${i}" class="page-link">${i}</a>
							</li>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${endPage > lastPage}">
					<c:forEach var="i" begin="${beginPage}" end="${lastPage}" step="1">
						<c:if test="${currentPage == i}">
							<li class="page-item active">
								<a href="${pageContext.request.contextPath}/member/order/list?currentPage=${i}" class="page-link">${i}</a>
							</li>
						</c:if>
						<c:if test="${currentPage != i}">
							<li class="page-item">
								<a href="${pageContext.request.contextPath}/member/order/list?currentPage=${i}" class="page-link">${i}</a>
							</li>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${currentPage < lastPage}">
					<li class="page-item">
						<a href="${pageContext.request.contextPath}/member/order/list?currentPage=${currentPage+1}" class="page-link">??????</a>
					</li>
				</c:if>
				<li class="page-item">
					<a href="${pageContext.request.contextPath}/member/order/list?currentPage=${lastPage}" class="page-link">?????????</a>
				</li>
			</ul>
		</div>
		
		<!-- content end -->

		<!-- footer -->
		<jsp:include page="/WEB-INF/view/inc/shop/footer.jsp"></jsp:include>
		
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/jquery/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/animsition/js/animsition.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/select2/select2.min.js"></script>
		
		<!-- ?????? JQuery ???????????? ????????? ????????? -->
		
		<script>
			// ?????? ?????? ?????? select 
			$(".js-select2").each(function() {
				$(this).select2({
					minimumResultsForSearch : 20,
					dropdownParent : $(this).next('.dropDownSelect2')
				});
			})
		</script>
		<!--===============================================================================================-->
		<!-- ?????? ???????????? -->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/slick/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/shop/js/slick-custom.js"></script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script>
			$('.js-pscroll').each(function() {
				$(this).css('position', 'relative');
				$(this).css('overflow', 'hidden');
				var ps = new PerfectScrollbar(this, {
					wheelSpeed : 1,
					scrollingThreshold : 1000,
					wheelPropagation : false,
				});
	
				$(window).on('resize', function() {
					ps.update();
				})
			});
		</script>
		<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath}/assets/shop/js/main.js"></script>
	</body>
</html>