<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<%@include file="../includes/header.jsp"%>
<head>
<meta charset="UTF-8">

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
		<div class="text-center mb-5">
			<h1 class="fw-bolder">ORDER</h1>
		</div>
	</div>
		
	<div class="container px-5 mb-5">
		<form role="form" method="get" action="/order/complete" autocomplete="off">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">WINE</th>
						<th scope="col">TITLE</th>
						<th scope="col">PRICE</th>
						<th scope="col">QTY</th>
						<th scope="col">TOTAL</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${map.list}" varStatus="status">
						<tr>
							<td><img
								src="http://klea-home.iptime.org:8081/<c:out value="${row.imageName}" />"
								height="100" width="30"></td>
							<td><h5 class="fw-bold">${row.title}</h5></td>
							<td><fmt:formatNumber pattern="#,###,###"
									value="${row.price}" /></td>
							<td><input type="number" style="width: 40px;" name="cartQty"
								value="${row.wineQty }" min="1" readonly>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${row.totalPrice}" /></td>
							<input type="hidden" name="cartNumArr" value="${row.cartNum}" >
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="inputArea input-group mb-3" style="width: 300px;">
  				<label class="input-group-text" id="inputGroup-sizing-default" for="pickUpName">수령인</label>
  				<input type="text" class="form-control" aria-label="Sizing example input" 
  				aria-describedby="inputGroup-sizing-default" name="pickUpName" id="pickUpName" required="required">
			</div><span>구매예약시 본인확인을 위해 정확하게 기재해주시기 바랍니다</span>
			
			<div class="inputArea input-group mb-3" style="width: 300px;">
  				<label class="input-group-text" id="inputGroup-sizing-default" for="pickUpPhoneNum">수령인 연락처</label>
  				<input type="text" class="form-control" aria-label="Sizing example input" 
  				aria-describedby="inputGroup-sizing-default" name="pickUpPhoneNum" id="pickUpPhoneNum"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" maxlength="13"
							placeholder="예) 010-1234-5678"
							onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" >
			</div>
			
			<div class="inputArea input-group mb-3" style="width: 300px;">
  				<span class="input-group-text" id="inputGroup-sizing-default">수령 일자</span>
  				<input type="text" class="form-control" aria-label="Sizing example input" 
  				aria-describedby="inputGroup-sizing-default" id="datepicker" name="pickUpDate" placeholder="날짜를 선택하세요">
			</div>
				<h6>※ 당일 픽업은 불가하며, 픽업일자는 주문일자로부터 7일 이내에서 선택 가능합니다.</h6>
					<hr>
					<div>
						<p>주문하시기 전 꼭 읽어주세요!</p>
						<div>
							<ul>
								<li>주문하려는 상품이 맞는지 다시 한 번 확인해 주세요.</li>
								<li>만 19세 미만의 미성년자는 구매가 불가합니다.</li>
								<li>픽업 시 수령인의 신분증 확인 후 결제 및 수령이 가능합니다. 신분증이 없을 경우 수령이 불가하오니 필히 지참 바랍니다.</li>
								<li>수령하시는 매장의 정보를 확인해 주세요.(잘못 선택하셨을 경우 주문 취소 후 재주문 바랍니다.)</li>
								<li>수령이 불가할 경우 지정한 픽업 날짜 1일 전까지 취소가 가능합니다.</li>
								<li>환불 및 교환은 수령 매장에서 가능하므로 매장으로 문의주시기 바랍니다.</li>
							</ul>
						</div> 
					</div>  
					<div class="inputArea">
						<button type="submit" class="order_btn btn btn-outline-danger">주문</button>
						<button type="button" class="btn btn-outline-dark"
							onclick="location.href='/cart/list'">취소</button>
					</div>

				</form>
			</div>
		
	<%@include file="../includes/footer.jsp"%>
</body>
</html>