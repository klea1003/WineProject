<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

</head>
<body>
<%@include file="../includes/header.jsp"%>
	<div class="container px-5 my-5">
		<div class="text-center mb-5">
            <h1 class="fw-bolder">ORDER LIST</h1>
        </div>
	</div>

<section id="content" class="container px-5 mb-5">
 
	 <ul class="orderList">
	  <c:forEach items="${orderList}" var="order" varStatus="i">
	  <li>
	  <div>
		<p><span>주문번호&nbsp;</span><a href="/order/detail?n=${order.orderNum}">${order.orderName}</a></p>
		<p><span>수령인 : </span>${order.pickUpName}</p>
		<p><span>수령매장 : </span>${order.storeName}</p>
		<p><span>가격 : </span><fmt:formatNumber pattern="###,###,###" value="${order.totalPrice}" /> 원</p>
		<hr>
	  </div>
	  </li>
	  </c:forEach>
	 </ul>

</section>

<%@include file="../includes/footer.jsp"%>
</body>
</html>