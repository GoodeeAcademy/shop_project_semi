<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 목록</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/ModifyEmpActiveController">
		<table>
			<tr>
				<td>사원번호</td>
				<td>아이디</td>
				<td>이름</td>
				<!-- 중간 관리자 => 활성화 가능 -->
				<c:if test="${loginEmp.authCode < 3}">
					<td>활성화</td>
				</c:if>
				<!-- 최고 관리자 => 모든 기능 가능 -->
				<c:if test="${loginEmp.authCode < 2}">
					<td>등급조정</td>
					<td>삭제</td>
				</c:if>
			</tr>
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
						<td><a href="${pageContext.request.contextPath}/ModifyEmpByAdminController?empId=${e.empId}">등급조정</a></td>
						<td><a href="${pageContext.request.contextPath}/RemoveEmpController?empId=${e.empId}">퇴사</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${loginEmp.authCode < 3}">
			<button type="submit">활성화</button>
		</c:if>
	</form>
	<!-- 페이징 -->
	<div>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/EmpListController?currentPage=${endRow-10}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endRow}">
			<c:if test="${i == currentPage}">
				<strong>
					<a href="${pageContext.request.contextPath}/EmpListController?currentPage=${i}">${i}</a>
				</strong>
			</c:if>
			<c:if test="${i != currentPage}">
					<a href="${pageContext.request.contextPath}/EmpListController?currentPage=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${beginRow+10 < lastPage}">
			<a href="${pageContext.request.contextPath}/EmpListController?currentPage=${beginRow+11}">다음</a>
		</c:if>
	</div>
</body>
</html>