<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cart-list{
	padding-left:10%;
	padding-right: 10%;
}
.btn-position{
float:right;
}
</style>

<!--  <script>
$(document).ready(function(){
	//리스트 페이지로 이동
	$("#btnSellerList").click(function(){
		location.href="${path}/seller/list";
	});
});
</script>-->
</head>
<body>
<%@include file="../includes/header.jsp" %>
	<div class="container px-5 my-5">
		<div class="text-center mb-5">
            <h1 class="fw-bolder">Your Cart</h1>
        </div>
	</div>
	
	<div class="cart-list">
	<c:choose>
		<c:when test="${map.count == 0 }">
        장바구니에 담긴 상품이 없습니다.
    	</c:when>
	 
	<c:otherwise>
		<form id="form1" name="form1" method="post" action="${path}/cart/update">
		
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">SELLER</th>
				      <th scope="col">PRODUCT</th>
				      <th scope="col">ITEM PRICE</th>
				      <th scope="col">QTY</th>
				      <th scope="col">TOTAL</th>
				      <th scope="col">DELETE</th>
				    </tr>
				  </thead>
				  
				  <tbody>
				    <c:forEach var="row" items="${map.list}" varStatus="i">
				    <tr>
				      <td>${row.sellerId}</td>
				      <th scope="row">${row.wineTitle}</th>
				      <td><fmt:formatNumber pattern="#,###,###" value="${row.winePrice}" /></td>
				      <td><input type="number" style="width: 40px;" name="cartQty" value="${row.cartQty }" min="1"> 
				      <input type="hidden"	name="wineNum" value="${row.wineNum}">
					  <button type="submit" class="btn btn-outline-secondary btn-sm" id="btnCartUpdate">수정</button>
					  <input type="hidden" name="count" value="${map.count }"></td>
				      <td><fmt:formatNumber pattern="###,###,###" value="${row.totalPrice}" /></td>
				      <td><a href="${path }/cart/delete?cartNum=${row.cartNum}">삭제</a></td>
				    </tr>
				    </c:forEach>
				    
				  	<tr>
						<td colspan="6" align="right">장바구니 금액 합계 : 	<fmt:formatNumber pattern="###,###,###" value="${map.sumTotalPrice}" /><br>
						</td>
					</tr>
				  </tbody>
				</table>
				
				<button type="button" class="btn btn-outline-dark" onclick="location.href='/seller/list'">상품목록</button>
				<!--  -<button type="button" id="btnSellerList">상품목록</button> -->
			<div class="btn-position">
				<button type="button" class="btn btn-outline-danger" onclick="location.href='/order/orderList'">예약하기</button>
			</div>
		</form>
	</c:otherwise>
	</c:choose>
	</div>
		
	
<%@include file="../includes/footer.jsp" %>
</body>
</html>
