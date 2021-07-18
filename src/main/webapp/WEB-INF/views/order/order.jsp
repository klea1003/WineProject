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
			
			<label class="fw-bold mt-5 mb-3" for="sellers"> (필수) 구매예약 매장을 선택하세요</label>

			<c:forEach var="row" items="${map.sellerList}" varStatus="status">
				<div class="mb-2">
					<input type="radio" name="sellerNum" value='<c:out value="${row.sellerNum}" />' <c:if test="${status.index eq 0}">required</c:if>>
					<b><c:out value="${row.sellerStoreName}" /></b> (<c:out value="${row.sellerBusinessHour}" />)
				</div>
			</c:forEach>
			
			
			<p class="mt-3 fw-bold text-danger">너와, IN 구매 예약 상품은 주류통신 판매 행정고시에 따라 1) 택배*퀵 발송 2) 주문 완료 후 '수령지 정보' 변경이 불가합니다.</p>
			<hr>
				
				<div class="fw-bold">
				<span>(필수) 예약자 정보를 입력해주세요</span></br>
				<span> - 구매예약시 본인확인을 위해 정확하게 기재해주시기 바랍니다</span></br>
				<span> - 당일 픽업은 불가하며, 픽업일자는 주문일자로부터 7일 이내에서 선택 가능합니다.</span>
				</div>
			<div class="inputArea input-group mt-3 mb-3" style="width: 300px;">
  				<label class="input-group-text" id="inputGroup-sizing-default" for="pickUpName">수령인</label>
  				<input type="text" class="form-control" aria-label="Sizing example input" 
  				aria-describedby="inputGroup-sizing-default" name="pickUpName" id="pickUpName" required="required">
			</div>
			
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
			
			<div class="inputArea input-group mb-3" style="width: 600px; height: 250px;">
  				<label class="input-group-text" id="inputGroup-sizing-default" for="orderCommnet">구매자 요구 사항</label>
  				<input type="text" class="form-control" aria-label="Sizing example input" 
  				aria-describedby="inputGroup-sizing-default" name="orderComment" id="orderComment">
			</div>
			<hr>

			<div class="mb-2">
				<span class="fw-bold" style="margin-right: 15px;">결제수단 선택</span>
				<input type="radio" name=paymentNum value='1' required>
				<label for='신용카드'>신용카드</label>
				
				<input type="radio" name=paymentNum value='2' >
				<label for='현금'>현금</label>
			</div>

				
					<hr>
					<div>
						<p class="fw-bold text-danger">주문하시기 전 꼭 읽어주세요!</p>
						<div>
							<ul>
								<li> - 주문하려는 상품이 맞는지 다시 한 번 확인해 주세요.</li>
								<li> - 만 19세 미만의 미성년자는 구매가 불가합니다.</li>
								<li> - 픽업 시 수령인의 신분증 확인 후 결제 및 수령이 가능합니다. 신분증이 없을 경우 수령이 불가하오니 필히 지참 바랍니다.</li>
								<li> - 수령하시는 매장의 정보를 확인해 주세요.(잘못 선택하셨을 경우 주문 취소 후 재주문 바랍니다.)</li>
								<li> - 수령이 불가할 경우 지정한 픽업 날짜 1일 전까지 취소가 가능합니다.</li>
								<li> - 환불 및 교환은 수령 매장에서 가능하므로 매장으로 문의주시기 바랍니다.</li>
								<hr>
								<li><b>주류 상품의 수령일 안내</b></li>
								<li>① 14시까지의 결제완료 건은 익일 17시부터 수령 가능합니다.</li>
								<li>② 14시이후의 결제완료 건은 익익일 17시부터 수령 가능합니다.</li>
								<li>③ 금요일 14시까지의 결제완료 건은 토/일/월 수령 가능합니다. (일요일 코엑스점만 가능)</li>
								<li class="fw-bold text-danger">④ 금요일 14시이후~월요일 14시까지의 결제완료 건은 화요일 17시부터 수령 가능합니다.</li>
								<li>⑤ 수령일이 휴점일,공휴일,국경일인 경우 익일 수령 가능합니다.</li>
								
								<li>액세서리 상품의 배송은 결제완료일로부터 평균 3~6일 정도 소요됩니다. (토요일, 공휴일,국경일 제외)</li>
							</ul>
						</div> 
					</div>  
					<div class="mt-5 inputArea">
						<button type="submit" class="order_btn btn btn-outline-danger">주문</button>
						<button type="button" class="btn btn-outline-dark"
							onclick="location.href='/cart/list'">취소</button>
					</div>

				</form>
			</div>
		
	<%@include file="../includes/footer.jsp"%>
</body>
</html>