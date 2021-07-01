<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function(){ 
	$("#datepicker").datepicker({
	dateFormat: 'yy-mm-dd',
	minDate : +1 ,
	maxDate : "+6d"
	}); 
});
</script>


</head>
<body>

	<div class="orderInfo">
		<form role="form" method="post" autocomplete="off">

			<div class="inputArea">
				<label for="pickUpName">수령인</label> <input type="text" name="" id="pickUpName"
					required="required" />
			</div>

			<div class="inputArea">
				<label for="pickUpPhoneNum">수령인 연락처</label> 
				<input type="text"  name="pickUpPhoneNum" id="pickUpPhoneNum" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" maxlength="13" placeholder="예) 010-1234-5678" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>

			</div>


			<div>
			<p>픽업 일자 : <input type="text" id="datepicker"></p>
			</div>


			<div class="inputArea">
				<button type="submit" class="order_btn">주문</button>
				<button type="button" class="cancel_btn">취소</button>
			</div>

		</form>
	</div>


</body>
</html>