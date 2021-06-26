<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jqeury.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){ 
	$("#datepicker").datepicker({
	dateFormat: 'yy-mm-dd'
	minDate : "+1D",
	maxDate : "+7D"
	}); 
	});
</script>


</head>
<body>

	<div class="orderInfo">
		<form role="form" method="post" autocomplete="off">

			<input type="hidden" name="cartQty" value="${sum}" />

			<div class="inputArea">
				<label for="userRealName">주문인</label> <input type="text" name="" id="userRealName"
					required="required" />
			</div>

			<div class="inputArea">
				<label for="pickUpName">수령인</label> <input type="text" name="" id="pickUpName"
					required="required" />
			</div>

			<div class="inputArea">
				<label for="pickUpPhoneNum">수령인 연락처</label> <input type="text"
					name="pickUpPhoneNum" id="pickUpPhoneNum" required="required" />
			</div>

			<div>
			<p>픽업 일자 : <input type="date" id="datepicker"></p>
			</div>


			<div class="inputArea">
				<button type="submit" class="order_btn">주문</button>
				<button type="button" class="cancel_btn">취소</button>
			</div>

		</form>
	</div>


</body>
</html>