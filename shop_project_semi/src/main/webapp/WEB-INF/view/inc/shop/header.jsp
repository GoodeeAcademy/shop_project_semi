<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<header class="header-v2">
	<!-- Header desktop -->
	<div class="container-menu-desktop trans-03">
		<div class="wrap-menu-desktop border-bottom border-dark">
			<nav class="d-flex justify-content-between limiter-menu-desktop pe-3">
				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li><a href="#">SHOP</a>
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/goodsList">ALL</a></li>
								<li><a href="${pageContext.request.contextPath}/GoodsListByCategoryController?categoryCode=1">Outwear</a></li> 
								<li><a href="${pageContext.request.contextPath}/GoodsListByCategoryController?categoryCode=2">Top</a></li>
								<li><a href="${pageContext.request.contextPath}/GoodsListByCategoryController?categoryCode=3">Bottom</a></li>
								<li><a href="${pageContext.request.contextPath}/GoodsListByCategoryController?categoryCode=4">Accessories</a></li>
							</ul>
						</li>
						<li><a href="#">ABOUT</a></li>
						<c:if test="${loginCustomer == null && loginEmp == null}">
							<li><a href="${pageContext.request.contextPath}/SignInController">LOGIN</a></li>
						</c:if>
						<c:if test="${loginCustomer != null && loginEmp == null}">
							<li><a href="${pageContext.request.contextPath}/SignOutController">LOGOUT</a></li>
							<li><a href="${pageContext.request.contextPath}/CustomerOneController">MY PAGE</a></li>
						</c:if>
						<li><a href="${pageContext.request.contextPath}/cartList">CART</a></li>
						<li><a href="#" class="js-show-modal-search">SEARCH</a></li>
					</ul>
				</div>
				<!-- Logo desktop -->
				<a href="${pageContext.request.contextPath}/HomeController">
					<img src="${pageContext.request.contextPath}/assets/shop/images/logo.png" alt="logo" style="height: 30px;">
				</a>
			</nav>
		</div>
	</div>

	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<div class="logo-mobile">
			<a href="${pageContext.request.contextPath}/HomeController">
				<img src="${pageContext.request.contextPath}/assets/shop/images/logo.png" alt="logo" style="height: 30px;">
			</a>
		</div>
		<!-- Button show menu -->
		<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
			<span class="hamburger-box"> <span class="hamburger-inner"></span>
			</span>
		</div>
	</div>
	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="main-menu-m p-0 bg-white">
			<li><a href="#" class="text-dark">SHOP</a>
				<ul class="sub-menu-m">
					<li><a href="${pageContext.request.contextPath}/goodsList">ALL</a></li>
					<li><a href="${pageContext.request.contextPath}/GoodsListByCategoryController?categoryCode=1">Outwear</a></li> 
					<li><a href="${pageContext.request.contextPath}/GoodsListByCategoryController?categoryCode=2">Top</a></li>
					<li><a href="${pageContext.request.contextPath}/GoodsListByCategoryController?categoryCode=3">Bottom</a></li>
					<li><a href="${pageContext.request.contextPath}/GoodsListByCategoryController?categoryCode=4">Accessories</a></li>
				</ul> 
				<span class="arrow-main-menu-m"><i class="fa fa-angle-right text-dark" aria-hidden="true"></i></span>
			</li>
			<li><a href="#" class="text-dark">ABOUT</a></li>
			<c:if test="${loginCustomer == null }">
				<li><a href="${pageContext.request.contextPath}/SignInController" class="text-dark">LOGIN</a></li>
			</c:if>
			<c:if test="${loginCustomer != null }">
				<li><a href="${pageContext.request.contextPath}/SignOutController" class="text-dark">LOGOUT</a></li>
				<li><a href="${pageContext.request.contextPath}/CustomerOneController" class="text-dark">MY PAGE</a></li>
			</c:if>
			<li><a href="${pageContext.request.contextPath}/cartList" class="text-dark">CART</a></li>
			<li><a href="#" class="js-show-modal-search text-dark">SEARCH</a></li>
		</ul>
	</div>
	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img src="${pageContext.request.contextPath}/assets/shop/images/icons/icon-close2.png" alt="CLOSE">
			</button>
			<form class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="search" placeholder="Search...">
			</form>
		</div>
	</div>
</header>

<!-- Sidebar -->
<aside class="wrap-sidebar js-sidebar">
	<div class="s-full js-hide-sidebar"></div>

	<div class="sidebar flex-col-l p-t-22 p-b-25">
		<div class="flex-r w-full p-b-30 p-r-27">
			<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-sidebar">
				<i class="zmdi zmdi-close"></i>
			</div>
		</div>

		<div class="sidebar-content flex-w w-full p-lr-65 js-pscroll">
			<ul class="sidebar-link w-full">
				<li class="p-b-13"><a href="${pageContext.request.contextPath}/HomeController" class="stext-102 cl2 hov-cl1 trans-04"> Home </a></li>
				<li class="p-b-13"><a href="${pageContext.request.contextPath}/cartList" class="stext-102 cl2 hov-cl1 trans-04"> CART </a></li>
				<!-- 비회원 -> 로그인창 -->
				<c:if test="${empty session.loginCustomer}">
					<li class="p-b-13"><a href="${pageContext.request.contextPath}/SignInController" class="stext-102 cl2 hov-cl1 trans-04"> ORDER </a></li>
				</c:if>
				<!-- 회원 -> 주문목록 -->
				<c:if test="${not empty session.loginCustomer}">
					<li class="p-b-13"><a href="${pageContext.request.contextPath}/OrderListController" class="stext-102 cl2 hov-cl1 trans-04"> ORDER </a></li>
				</c:if>
			</ul>
			<div class="sidebar-gallery w-full">
				<span class="mtext-101 cl5"> About Us </span>

				<p class="stext-108 cl6 p-t-27">
					쇼핑몰 세미 프로젝트 
				</p>
			</div>
		</div>
	</div>
</aside>