<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<h1 class="fw-bolder">주문 상세내역</h1>

	<section id="content">

		<div class="orderInfo">
			<c:forEach items="${orderView}" var="orderView" varStatus="status">

				<c:if test="${status.first}">
					<p>
						<span>수령인 : </span>${orderView.pickUpName}</p>
					<p>
						<span>수령매장 : </span>(${sellerId })
					</p>
					<p>
						<span>총 주문금액 : </span>
						<fmt:formatNumber pattern="###,###,###"
							value="${orderView.totalPrice}" />
						원
					</p>
				</c:if>
			</c:forEach>
		</div>

		<ul class="orderView">
			<c:forEach items="${orderView}" var="orderView">
				<li>
					<div class="thumb">
						<img
							src="http://klea-home.iptime.org:8081/${orderView.wineImageName}"
							height="80" width="50" />
					</div>
					<div class="WineInfo">
						<p>
							<span>상품명 : </span>${orderView.wineTitle}<br/>
							<span>개당 가격 : </span> <fmt:formatNumber pattern="###,###,###" value="${orderView.winePrice}" /> 원<br />
							<span>구매수량 : </span>${orderView.cartQty} 개<br/>
							<span>수령일자 : </span>${orderView.pickUpDate}<br/>
							<span>총 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${orderView.winePrice * orderView.cartQty}" />원
						</p>
					</div>
				</li>
			</c:forEach>
		</ul>
	</section>



	<%@include file="../includes/footer.jsp"%>
</body>
</html>