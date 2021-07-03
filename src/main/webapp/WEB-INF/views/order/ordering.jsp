<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<%@include file="../includes/header.jsp"%>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : +1,
			maxDate : "+7d"
		});
	});
</script>


</head>
<body>

	<div class="container px-5 my-5">
		<div class="text-left mb-5">
			<h1 class="fw-bolder">예약하기</h1>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">SELLER</th>
						<th scope="col">WINE</th>
						<th scope="col">PRODUCT</th>
						<th scope="col">ITEM PRICE</th>
						<th scope="col">QTY</th>
						<th scope="col">TOTAL</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}" varStatus="i">
						<tr>
							<td>${row.sellerId}(${row.sellerNum})</td>
							<th scope="row">${row.wineTitle}</th>
							<td><img
								src="http://klea-home.iptime.org:8081/<c:out value="${row.wineImageName}" />"
								height="80" width="50"></td>
							<td><fmt:formatNumber pattern="#,###,###"
									value="${row.winePrice}" /></td>
							<td><input type="number" style="width: 40px;" name="cartQty"
								value="${row.cartQty }" min="1" readonly>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${row.totalPrice}" /></td>
						</tr>
					</c:forEach>




				</tbody>
			</table>
			<hr>
			<br>
			<div class="orderInfo">
				<form role="form" method="post" autocomplete="off">
					<input type="hidden" name="sellerNum"
						value="<%=request.getParameter("sellerNum")%>">
					<div class="inputArea">
						<label for="pickUpName">수령인</label> <input type="text" size=10
							name="pickUpName" id="pickUpName" required="required" />
					</div>

					<div class="inputArea">
						<label for="pickUpPhoneNum">수령인 연락처 : </label> <input type="text"
							name="pickUpPhoneNum" id="pickUpPhoneNum"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" maxlength="13"
							placeholder="예) 010-1234-5678"
							onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" />
					</div>

					<div>
						<p>
							픽업 일자 : <input type="text" id="datepicker" name="pickUpDate"
								placeholder="날짜를 선택하세요">
						<p style="font-size: 10px">*당일 픽업은 불가하며, 픽업일자는 주문일자로부터 7일 이내에서
							선택 가능합니다.</p>
					
						
					</div>
				 <hr>
					<div>
						<p>주문하시기 전 꼭 읽어주세요!</p>
						<pre>
- 주문하려는 상품이 맞는지 다시 한 번 확인해 주세요.
- 만 19세 미만의 미성년자는 구매가 불가합니다.
- 픽업 시 수령인의 신분증 확인 후 결제 및 수령이 가능합니다. 신분증이 없을 경우 수령이 불가하오니 필히 지참 바랍니다.
- 수령하시는 매장의 정보를 확인해 주세요.(잘못 선택하셨을 경우 주문 취소 후 재주문 바랍니다.)
- 수령이 불가할 경우 지정한 픽업 날짜 1일 전까지 취소가 가능합니다.
- 환불 및 교환은 수령 매장에서 가능하므로 매장으로 문의주시기 바랍니다.
			</pre> 
					</div>  
					<div class="inputArea">
						<button type="submit" class="order_btn">주문</button>
						<button type="button" class="btn btn-outline-danger"
							onclick="location.href='/cart/list'">취소</button>
					</div>

				</form>
			</div>
		</div>
	</div> 
	<%@include file="../includes/footer.jsp"%>
</body>
</html>