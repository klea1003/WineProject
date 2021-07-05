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
			<h1 class="fw-bolder">주문 내역</h1>
			<br>
<section id="content">
 
 <ul class="orderList">
  <c:forEach items="${orderList}" var="orderList" varStatus="i">
  <li>
  <div>
   <p><span>주문번호</span><a href="orderView?n=${orderList.orderNum}&s=${sellerIDList[i.index]}">${orderList.orderNum}</a></p>
   <p><span>수령인</span>${orderList.pickUpName}</p>
   <p><span>수령매장</span>(${sellerIDList[i.index]})</p>
   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.totalPrice}" /> 원</p>
   <hr>
  </div>
  </li>
  </c:forEach>
 </ul>

</section>

<%@include file="../includes/footer.jsp"%>
</body>
</html>