<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>

</style>
<body>
<%@include file="../includes/header.jsp"%>
	<div class="container px-5 my-5">
		<div class="text-center mb-5">
           <h1 class="fw-bolder">ORDER LIST</h1>
       </div>
	</div>

	<div class="container px-5">
		<table class="table">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>수령인</th>
					<th>수령매장</th>
					<th>가격</th>
					<th>결제 수단</th>
				</tr>
			</thead>
		
			<tbody>
				<c:forEach items="${orderList}" var="order" varStatus="i">
					<tr>
						<td class="fw-bold"><a class="text-dark" href="/order/detail?n=${order.orderNum}">${order.orderName}</a></td>
						<td>${order.pickUpName}</td>
						<td>${order.storeName}</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${order.totalPrice}" /> 원</td>
						<td>${order.paymentTitle}</td>
		
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" class="btn btn-outline-danger" onclick="location.href='/wine/list'">와인 더 보러가기</button>
	</div>
	

<%@include file="../includes/footer.jsp"%>
</body>
</html>