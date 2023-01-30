<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	.sidebarList{
		color:#bdbdc7;
	}
</style>
</head>
<body>
	<div class="quixnav">
	    <div class="quixnav-scroll">
	        <ul class="metismenu" id="menu">
	            <li class="nav-label first sidebarList">Main Menu</li>
	            	<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	            		<i class="icon icon-home"></i>
	            		<span class="nav-text">Main</span></a>
		                <ul aria-expanded="false">
		                    <li><a href="${pageContext.request.contextPath}/emp/main">Home</a></li>
		                    <li><a href="${pageContext.request.contextPath}/main">Shop</a></li>
		                </ul>
		            </li>
		            
	            <li class="nav-label sidebarList">Employee</li>
		            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
		                        class="icon icon-single-04"></i><span class="nav-text">Profile</span></a>
		                <ul aria-expanded="false">
		                    <li><a href="${pageContext.request.contextPath}/emp/modify">My Profile</a></li>
		                </ul>
		            </li>
	            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                <i class="bi bi-people-fill"></i><span class="nav-text">Employees</span></a>
	                <ul aria-expanded="false">
	                    <li><a href="${pageContext.request.contextPath}/emp/emp">All Employees</a></li>
	                </ul>
	            </li>
	            
	            <li class="nav-label sidebarList">Shop</li>
	            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                <i class="bi bi-bag"></i><span class="nav-text">Goods</span></a>
	                <ul aria-expanded="false">   
	                    <li><a href="${pageContext.request.contextPath}/goods">Goods List</a></li>
	                    <li><a href="${pageContext.request.contextPath}/emp/goods/add">Add Goods</a></li>
	                </ul>
	            </li>
	            
	            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                <i class="bi bi-credit-card"></i><span class="nav-text">Orders</span></a>
	                <ul aria-expanded="false">   
	                    <li><a href="${pageContext.request.contextPath}/emp/order/list">Order List</a></li>
	                </ul>
	            </li>
	            
	            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                <i class="bi bi-question-circle"></i><span class="nav-text">Question</span></a>
	                <ul aria-expanded="false">   
	                    <li><a href="${pageContext.request.contextPath}/emp/question">Question List</a></li>
	                    <li><a href="${pageContext.request.contextPath}/emp/comment">Comment List</a></li>
	                </ul>
	            </li>
	
	            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                <i class="bi bi-chat-square-text"></i><span class="nav-text">Notice</span></a>
	                <ul aria-expanded="false">
	                    <li><a href="${pageContext.request.contextPath}/notice">Notice List</a></li>
	                    <li><a href="${pageContext.request.contextPath}/emp/notice/add">Add Notice</a></li>
	                </ul>
	            </li>

	        </ul>
	    </div>
	</div>
</body>
</html>