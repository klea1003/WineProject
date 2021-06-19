<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>
$(document).ready(function(){
	//리스트 페이지로 이동
	$("#btnSellerList").click(function(){
		location.href="${path}/seller/list";
	});
});
</script>
</head>
<body>

	<h2>Cart</h2>
	<c:choose>
		<c:when test="${map.count == 0 }">
        장바구니에 담긴 상품이 없습니다.
    </c:when>

		<c:otherwise>
			<form id="form1" name="form1" method="post"
				action="${path}/cart/update">
				
				
				<table border="1">
					<tr>
						<th>PRODUCT</th>
						<th>PRICE</th>
						<th>QUANTITY</th>
						<th>TOTAL</th>
						<th>DELETE</th>
					</tr>

					<c:forEach var="row" items="${map.list}" varStatus="i">
						<tr>
							<td>${row.Winetitle}</td>

							<td style="width: 80px" align="right"><fmt:formatNumber
									pattern="#,###,###" value="${row.winePrice}" /></td>

							<td><input type="number" style="width: 40px;" name="cartQty"
								value="${row.cartQty }" min="1"> <input type="hidden"
								name="wineNum" value="${row.wineNum}"></td>

							<td style="width: 100px" align="right">
							<fmt:formatNumber pattern="###,###,###" value="${row.totalPrice}" /></td>

							<td><a href="${path }/cart/delete?cartNum=${row.cartNum}">삭제</a>
							</td>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="5" align="right">장바구니 금액 합계 : 
							<fmt:formatNumber pattern="###,###,###" value="${map.sumTotalPrice}" /><br>
						</td>
					</tr>
				</table>
				<input type="hidden" name="count" value="${map.count }">
				<button type="submit" id="btnCartUpdate">수정</button>

			</form>
		</c:otherwise>
	</c:choose>
	<button type="button" id="btnSellerList">상품목록</button>
	<button type="button" onclick="location.href='/order/orderList'">예약하기</button>
</body>
</html>
