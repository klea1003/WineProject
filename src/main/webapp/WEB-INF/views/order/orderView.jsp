<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<section id="content">

 <div class="orderInfo">
  <c:forEach items="${orderView}" var="orderView" varStatus="status">
   
   <c:if test="${status.first}">
    <p><span>수령인</span>${orderView.orderRec}</p>
    <p><span>수령매장</span>(${orderView.sellerId})</p>
    <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.totalPrice}" /> 원</p>
   </c:if>
   
  </c:forEach>
  </div>
 
 <ul class="orderView">
  <c:forEach items="${orderView}" var="orderView">     
  <li>
   <div class="thumb">
    <img src="${orderView.wineImageName}" />
   </div>
   <div class="WineInfo">
    <p>
     <span>product</span>${orderView.wineTitle}<br />
     <span>price</span><fmt:formatNumber pattern="###,###,###" value="${orderView.winePrice}" /> 원<br />
     <span>Qty</span>${orderView.cartQty} 개<br />
     <span>totalPrice</span><fmt:formatNumber pattern="###,###,###" value="${orderView.winePrice * orderView.cartQty}" /> 원                  
    </p>
   </div>
  </li>     
  </c:forEach>
 </ul>
</section>
코드 복사
  


</body>
</html>