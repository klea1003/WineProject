<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</script>


</head>
<body>

<section id="content">
 
 <ul class="orderList">
  <c:forEach items="${orderList}" var="orderList">
  <li>
  <div>
   <p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderNum}">${orderList.orderNum}</a></p>
   <p><span>주문인</span>${orderList.userRealName }</p>
   <p><span>수령인</span>${orderList.pickUpName}</p>
   <p><span>수령매장</span>(${orderList.sellerId})</p>
   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.totalPrice}" /> 원</p>
  </div>
  </li>
  </c:forEach>
 </ul>

</section>


</body>
</html>