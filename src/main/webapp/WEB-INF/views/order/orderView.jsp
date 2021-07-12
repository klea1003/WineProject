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
			<c:forEach items="${orderView}" var="orderView" varStatus="status">

				<c:if test="${status.first}">
					<p>
						<span>수령인 : </span>${orderView.pickUpName}</p>
					<p>
						<span>수령매장 : </span><a href="/seller/get?sellerNum=${orderView.sellerNum}">(${orderView.sellerId })</a>
					</p>
					<p>
						<span>총 주문금액 : </span>
						<fmt:formatNumber pattern="###,###,###"
							value="${sum}" /> 원
					</p>
				</c:if>
			</c:forEach>
			</div>
		</div>

		<div class="orderView">
			<div class="row" style="margin-left: 20%; margin-right: 20%;">
			<c:forEach items="${orderView}" var="orderView">
			<div class="card mb-2" style="height: 200px;">
				
					<div>
						<div class="text-center" style="width: 30%; float:left;">
							<img src="http://klea-home.iptime.org:8081/${orderView.wineImageName}" height="200" width="60" />
						</div>
						<div class="orderConetent" style="width: 70%; float:left;">
						
							<br><span>상품명 : ${orderView.wineTitle} </span>
							<br><span>개당 가격 :  <fmt:formatNumber pattern="###,###,###" value="${orderView.winePrice}" /> 원 </span>
							<br><span>구매수량 : ${orderView.cartQty} 개 </span>
							<br><span>수령일자 : ${orderView.pickUpDate} </span>
							<br><span>총 가격 : <fmt:formatNumber pattern="###,###,###" value="${orderView.winePrice * orderView.cartQty}" />원</span>
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