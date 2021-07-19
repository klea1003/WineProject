<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	
	<div class="container px-5 text-center">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">수령인</th>
					<th scope="col">수령매장</th>							
					<th scope="col">수령날짜</th>								
					<th scope="col">주문금액</th>														
					<th scope="col">결제수단</th>
					<th scope="col">요청사항</th>						
				</tr>
			</thead>
	
			<tbody>
				<tr>
					<td>${map.order.pickUpName}</td>
					<td><a class="fw-bold text-dark" href="/seller/get?sellerNum=${map.order.sellerNum}">${map.order.storeName}</a></td>
					<td>${map.order.pickUpDate}</td>
					<td><fmt:formatNumber pattern="###,###,###"	value="${map.order.totalPrice}" /> 원</td>
					<td>${map.order.paymentTitle}</td>
					<td>${map.order.orderComment}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<section id="content" class=" mb-5">

	
		<div class="orderView" >
			<div class=" row" style="margin-left: 20%; margin-right: 20%;">
				<c:forEach items="${map.items}" var="item">
					<div class="card mt-4 mb-2" style="height: 220px; width:600px; margin-left: 25%;">
						<div>
							<div class="text-center" style="width: 30%; float:left;">
								<img class="mt-2 " src="http://klea-home.iptime.org:8081/${item.imageName}" height="200" width="60" />
							</div>
							<div class="orderConetent" style="width: 70%; float:left;">
							
								<br><span>상품명 : ${item.title} </span>
								<br><br><span>개당 가격 :  <fmt:formatNumber pattern="###,###,###" value="${item.price}" /> 원 </span>
								<br><br><span>구매수량 : ${item.wineQty} 개 </span>
								
								<br><br><span>총 가격 : <fmt:formatNumber pattern="###,###,###" value="${item.price * item.wineQty}" />원</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<%@include file="../includes/footer.jsp"%>
</body>
</html>