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
	
	<section id="content" class="container px-5 mb-5">

		<div class="orderInfo">
			<div class="row" style="margin-left: 20%; margin-right: 20%;">
				<p>
					<span>수령인 : ${map.order.pickUpName}</span>
				</p>
				
				<p>
					<span>수령매장 : <a href="/seller/get?sellerNum=${map.order.sellerNum}">(${map.order.storeName})</a> </span>
				</p>
				
				<p>
					<span>수령날짜  : ${map.order.pickUpDate}</span>
				</p>
				<p>
					<span>총 주문금액 : </span>
					<fmt:formatNumber pattern="###,###,###"	value="${map.order.totalPrice}" /> 원
				</p>

			</div>
		</div>

		<div class="orderView">
			<div class="row" style="margin-left: 20%; margin-right: 20%;">
				<c:forEach items="${map.items}" var="item">
					<div class="card mb-2" style="height: 200px;">
						<div>
							<div class="text-center" style="width: 30%; float:left;">
								<img src="http://klea-home.iptime.org:8081/${item.imageName}" height="200" width="60" />
							</div>
							<div class="orderConetent" style="width: 70%; float:left;">
							
								<br><span>상품명 : ${item.title} </span>
								<br><span>개당 가격 :  <fmt:formatNumber pattern="###,###,###" value="${item.price}" /> 원 </span>
								<br><span>구매수량 : ${item.wineQty} 개 </span>
								
								<br><span>총 가격 : <fmt:formatNumber pattern="###,###,###" value="${item.price * item.wineQty}" />원</span>
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