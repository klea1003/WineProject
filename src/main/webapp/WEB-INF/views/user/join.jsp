<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/user/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<style>
	/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}
</style>

</head>
<body>

	<div class="wrapper">
	  <form id="join_form" method="post">

			<div class="wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="userId">
					</div>
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				</div>
				<div class="nickname_wrap">
					<div class="nickname_name">닉네임</div>
					<div class="nickname_input_box">
						<input class="nickname_input" name="userNickName">
					</div>
				</div>
				<div class="password_wrap">
					<div class="password_name">비밀번호</div>
					<div class="password_input_box">
						<input class="password_input" name="userPassword">
					</div>
				</div>
				<div class="passwordck_wrap">
					<div class="passwordck_name">비밀번호 확인</div>
					<div class="passwordck_input_box">
						<input class="passwordck_input">
					</div>
				</div>
				<div class="realname_wrap">
					<div class="realname_name">실명</div>
					<div class="realname_input_box">
						<input class="realname_input" name="userRealName">
					</div>
				</div>
				<div class="birthday_wrap">
					<div class="birthday_name">생년월일</div>
					<div class="birthday_input_box">
						<input class="birthday_input" name="userBirthDay">
					</div>
				</div>
				<div class="email_wrap">
					<div class="email_name">이메일</div>
					<div class="email_input_box">
						<input class="email_input" name="userEmail">
					</div>
				</div>
				<div class="phonenum_wrap">
					<div class="phonenum_name">핸드폰</div>
					<div class="phonenum_input_box">
						<input class="phonenum_input" name="userPhoneNum">
					</div>
				</div>
			</div>

			<!-- 	<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="userEmail">
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box">
						<input class="mail_check_input">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
				</div>
			</div> -->

			<!-- 	<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1">
					</div>
					<div class="address_button">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2">
					</div>
				</div>
				
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3">
					</div>
				</div>
			</div> -->
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</form>
	</div>
<script>

$(document).ready(function(){
	$(".join_button").click(function(){
		$("#join_form").attr("action", "/user/join");
		
		$("#join_form").submit();
	});
});
$('.id_input').on("propertychange change keyup paste input", function(){
	var userId = $('.id_input').val();	
	var data = {userId : userId}	
	
	$.ajax({
		type : "post",
		url : "/user/userIdchk",
		data : data,
		success : function(result){
			
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");				
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");				
				}
		}// success 종료
		
	}); // ajax 종료	

});// function 종료
</script>

</body>
</html>