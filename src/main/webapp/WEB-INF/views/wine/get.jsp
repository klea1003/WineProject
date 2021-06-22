<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
<body>
	<%@ include file="../includes/header.jsp"%>
	
	<section>
		<!-- row -->
		<div>
			<h1 class="page-header">Wine Detail</h1>
		</div>
		<!--  -->
		<div>
			<div>
				<img
					src="http://klea-home.iptime.org:8081/<c:out value="${wine.imageName}" />"
					height="246" width="155">
			</div>
			<div>
				<c:out value="${wine.winenery}" />
				<br>
				<c:out value="${wine.title}" />
				<br>
				<c:out value="${wine.grapes}" />
				<br>
				<c:out value="${wine.region}" />
				<br>
				<c:out value="${wine.country}" />
				<br>
				<c:out value="${wine.wineStyle}" />
				<br>
				<!-- Product price-->
				<c:out value="${wine.price}" />
				<br>
			</div>
		</div>
	</section>
	<%@include file="../includes/footer.jsp" %>		
</body>
<script src="/resources/js/scripts.js"></script>
</html>