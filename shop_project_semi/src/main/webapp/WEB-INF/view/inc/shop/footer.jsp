<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Footer -->
<footer class="bg3 p-b-32 bg-white border-top border-dark">
	<div class="ml-5">
		<div class="row mt-5">
			<div class="col-sm-6 col-lg-4 p-b-50">
				<h4 class="stext-301 cl0 p-b-30 text-dark">SHOP PROJECT</h4>
				<ul class="p-0">
					<c:if test="${loginCustomer == null}">
						<li>
							<a href="${pageContext.request.contextPath}/LoginEmpController" class="stext-107 cl7 hov-cl1 trans-04 text-dark fw-bold">
								<img src="https://img.icons8.com/material-rounded/24/null/github.png"/>&nbsp;&nbsp;쇼핑몰 관리자페이지
							</a>
						</li>
					</c:if>
					<li class="p-b-10">
						<a href="https://github.com/GoodeeAcademy/shop_project_semi.git" class="stext-107 cl7 hov-cl1 trans-04 text-dark fw-bold">
							<img src="https://img.icons8.com/material-rounded/24/null/github.png"/>&nbsp;&nbsp;PROJECT URL
						</a>
					</li>
				</ul>
			</div>
			<div class="col-sm-6 col-lg-4 p-b-50">
				<h4 class="stext-301 cl0 p-b-30 text-dark">Contributors (GitHub)</h4>
				<ul class="p-0">
					<li class="p-b-10">
						<a href="https://github.com/AndreaJo1201" class="stext-107 cl7 hov-cl1 trans-04 text-dark fw-bold">
							<img src="https://img.icons8.com/material-rounded/24/null/github.png"/>&nbsp;&nbsp;AndreaJo1201 조건희
						</a>
					</li>
					<li class="p-b-10">
						<a href="https://github.com/M1nsong-Kim" class="stext-107 cl7 hov-cl1 trans-04 text-dark fw-bold">
							<img src="https://img.icons8.com/material-rounded/24/null/github.png"/>&nbsp;&nbsp;M1nsong-Kim 김민송
						</a>
					</li>
					<li class="p-b-10">
						<a href="https://github.com/Cduboo" class="stext-107 cl7 hov-cl1 trans-04 text-dark fw-bold">
							<img src="https://img.icons8.com/material-rounded/24/null/github.png"/>&nbsp;&nbsp;Cduboo 최정헌
						</a>
					</li>
				</ul>
			</div>
			<div class="col-sm-12 col-lg-4 p-b-50">
				<h4 class="stext-301 cl0 p-b-30 text-dark">README</h4>
				<p class="stext-107 cl7 size-201 text-dark fw-bold">
					쇼핑몰 프로젝트
				</p>
			</div>
		</div>
	</div>
		<div class="p-t-40">
			<p class="stext-107 cl6 txt-center text-dark">
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> 
				by <a href="https://colorlib.com" target="_blank">Colorlib</a>
				&amp; distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
			</p>
		</div>
</footer>