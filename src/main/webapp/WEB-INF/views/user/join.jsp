<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script 
src="https://code.jquery.com/jquery-3.4.1.js"
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
crossorigin="anonymous">
	</script>
	   <!-- Custom fonts for this template-->
    <link href="/resources/user_bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/user_bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
<style>
.id_input_re_1 {
	color: green;
	display: none;
	font-size: 10px;   
	text-align: center;
}
.id_input_re_2 {
	color: red;
	display: none;
 	font-size: 10px; 
 	text-align: center;
}
.nickname_input_re_1 {
	color: green;
	display: none;
	 font-size: 10px;
	 text-align: center;  
}
.nickname_input_re_2 {
	color: red;
	display: none;
	font-size: 10px; 
}
#email_check_input_box_false{
    font-size: 10px;
    text-align: center;
    
}
#email_check_input_box_true{
    background-color:white;
     font-size: 10px;
    text-align: center;
}

.correct{
    color : green;
    font-size: 10px; 
}
.incorrect{
    color : red;
    font-size: 10px; 
}

.final_id_ck{
    display: none;
    font-size: 10px;
    text-align: center;
}
.final_nickname_ck{
    display: none;
    font-size: 10px;
    text-align: center;
}
.final_password_ck{
    display: none;
    font-size: 10px;
    text-align: center;
}
.final_passwordck_ck{
    display: none;
    font-size: 10px;
    text-align: center;
}
.final_realname_ck{
    display: none;
    font-size: 10px;
    text-align: center;
}
.final_birthday_ck{
    display: none;
    font-size: 10px; 
    text-align: center;
}
.final_email_ck{
    display: none;
    font-size: 10px;
    text-align: center;
}
.final_phonenum_ck{
    display: none;
    font-size: 10px; 
    text-align: center;
}

.passwordck_input_re_1{
        color : green;
        display : none;
 		font-size: 10px; 
 		text-align: center;  
}
.passwordck_input_re_2{
        color : red;
        display : none;
        font-size: 10px;
        text-align: center;    
}
#email_check_button{
	margin-top: 8%;
}
</style>

</head>

<body class="bg-gradient-primary">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form class="user" id="join_form" method="post">
								<div class="form-group">
									<input type="text" class="form-control form-control-user" id="id_input" name="userId" placeholder="아이디를 입력해주세요.">
									<span class="id_input_re_1">사용 가능한 아이디입니다.</span> 
									<span class="id_input_re_2">아이디가 이미 존재합니다.</span> 
									<span class="final_id_ck">아이디를 입력해주세요.</span>
								</div>
								
								<div class="form-group">
									<input type="text" class="form-control form-control-user" id="nickname_input" name="userNickName" placeholder="닉네임을 입력해주세요.">
										 <span
										class="nickname_input_re_1">사용 가능한 닉네임입니다.</span> <span
										class="nickname_input_re_2">닉네임이 이미 존재합니다.</span> <span
										class="final_nickname_ck">닉네임을 입력해주세요.</span>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user" id="password_input" name="userPassword"	placeholder="비밀번호를 입력해주세요.">
										<span class="final_password_ck">비밀번호를 입력해주세요.</span>
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user" id="passwordck_input" placeholder="한번더 비밀번호를 입력해주세요.">
										<span class="final_passwordck_ck">비밀번호 확인을 입력해주세요.</span>
										<span class="passwordck_input_re_1">비밀번호가 일치합니다.</span> 
										<span class="passwordck_input_re_2">비밀번호가 일치하지 않습니다.</span>
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-7 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user" id="realname_input" name="userRealName" placeholder="실명을 입력해주세요.">
										<span class="final_password_ck">실명을 입력해주세요.</span>
									</div>
									<div class="col-sm-5">
										<input type="date" class="form-control form-control-user" id="birthday_input" name="userBirthDay">
										<span class="final_birthday_ck">생년월일 입력해주세요</span>
									</div>
								</div>
								<!-- row  -->

								<div class="form-group row">
									<div class="col-sm-8 mb-3 mb-sm-0">
										<input type="email" class="form-control form-control-user" id="email_input" name="userEmail" placeholder="이메일을 입력해주세요.">
										<span class="final_email_ck">이메일을 입력해주세요</span>
									</div>

									<div class="col-sm-4">
										
										<div class ="btn btn-light btn-icon-split" id="email_check_button">
										<span>인증번호 전송</span>
										</div>
									</div>
								</div>
								<!-- row -->
								<span class="email_input_box_warn"></span>
								<div class="form-group">
									<div class="email_check_input_box" id="email_check_input_box_false">
										<input type="text" class="form-control form-control-user" id="email_check_input" disabled="disabled">
									</div>
								</div>
								<span id="email_check_input_box_warn"></span>
								
								<div class="form-group">
									<input type="text" class="form-control form-control-user" id="phonenum_input" name="userPhoneNum" placeholder="010-1234-5678"> 
									<span class="final_phonenum_ck">핸드폰 번호를 입력해주세요</span>
								</div>
								<input type="button" class="btn btn-primary btn-user btn-block"	id="join_button" value="가입하기">

								<hr>
								<a href="index.html" class="btn btn-google btn-user btn-block">
									<i class="fab fa-google fa-fw"></i> Register with Google
								</a> <a href="index.html"
									class="btn btn-facebook btn-user btn-block"> <i
									class="fab fa-facebook-f fa-fw"></i> Register with Facebook
								</a>
							</form>
							<hr>
								<div class="text-center">
								<a class="small" href="login">Already have an account?	Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>



	<script>
		var code = "";

		var idCheck = false;
		var idckCheck = false;

		var nicknameCheck = false;
		var nicknameckCheck = false;

		var passwordCheck = false;
		var passwordckCheck = false;
		var passwordckcorCheck = false; // 비밀번호 일치/불일치 확인    

		var realnameCheck = false;

		var birthdayCheck = false;

		var emailCheck = false;
		var emailnumCheck = false;

		var phonenumCheck = false

$(document).ready(function() {
	$("#join_button").click(function() {
				var id = $('#id_input').val();
				var nickname = $('#nickname_input').val();
				var password = $('#password_input').val();
				var passwordck = $('#passwordck_input').val();
				var realname = $('#realname_input').val();
				var birthday = $('#birthday_input').val();
				var email = $('#email_input').val();
				var phonenum = $('#phonenum_input').val();

				if (id == "") {
					$('.final_id_ck').css('display',
							'block');
					idCheck = false;
				} else {
					$('.final_id_ck').css('display',
							'none');
					idCheck = true;
				}

				if (nickname == "") {
					$('.final_nickname_ck').css(
							'display', 'block');
					nicknameCheck = false;
				} else {
					$('.final_nickname_ck').css(
							'display', 'none');
					nicknameCheck = true;
				}

				if (password == "") {
					$('.final_password_ck').css(
							'display', 'block');
					passwordCheck = false;
				} else {
					$('.final_password_ck').css(
							'display', 'none');
					passwordCheck = true;
				}

				if (passwordck == "") {
					$('.final_passwordck_ck').css(
							'display', 'block');
					passwordckCheck = false;
				} else {
					$('.final_passwordck_ck').css(
							'display', 'none');
					passwordckCheck = true;
				}

				if (realname == "") {
					$('.final_realname_ck').css(
							'display', 'block');
					realnameCheck = false;
				} else {
					$('.final_realname_ck').css(
							'display', 'none');
					realnameCheck = true;
				}

				if (birthday == "") {
					$('.final_birthday_ck').css(
							'display', 'block');
					birthdayCheck = false;
				} else {
					$('.final_birthday_ck').css(
							'display', 'none');
					birthdayCheck = true;
				}

				if (phonenum == "") {
					$('.final_phonenum_ck').css(
							'display', 'block');
					phonenumCheck = false;
				} else {
					$('.final_phonenum_ck').css(
							'display', 'none');
					phonenumCheck = true;
				}

				if (email == "") {
					$('.final_email_ck').css('display',
							'block');
					emailCheck = false;
				} else {
					$('.final_email_ck').css('display',
							'none');
					emailCheck = true;
				}

				if (idCheck && idckCheck
						&& nicknameCheck
						&& nicknameckCheck
						&& passwordCheck
						&& passwordckCheck
						&& passwordckcorCheck
						&& realnameCheck
						&& birthdayCheck && emailCheck
						&& emailnumCheck
						&& phonenumCheck) {
					$("#join_form").attr("action",
							"/user/join");
					$("#join_form").submit();

					}
		return false;
	});
});

		$('#id_input').on(
				"propertychange change keyup paste input",
				function() {

					var userId = $('#id_input').val();

					var data = {
						userId : userId
					}

					$.ajax({
						type : "post",
						url : "/user/userIdchk",
						data : data,
						success : function(result) {

							if (result != 'fail') {
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
								idckCheck = true;
							} else {
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
								idckCheck = false;
							}

						}// success 종료

					}); // ajax 종료	

				});// function 종료

		$('#nickname_input').on(
				"propertychange change keyup paste input",
				function() {

					var userNickName = $('#nickname_input').val();

					var data = {
						userNickName : userNickName
					}

					$.ajax({
						type : "post",
						url : "/user/userNickNamechk",
						data : data,
						success : function(result) {

							if (result != 'fail') {
								$('.nickname_input_re_1').css("display",
										"inline-block");
								$('.nickname_input_re_2')
										.css("display", "none");
								nicnameckCheck = true;
							} else {
								$('.nickname_input_re_2').css("display",
										"inline-block");
								$('.nickname_input_re_1')
										.css("display", "none");
								nicknameckCheck = true;
							}
						}// success 종료

					}); // ajax 종료	

				});// function 종료

		$("#email_check_button").click(function() {

			var email = $("#email_input").val();
			// 입력한 이메일
			var cehckBox = $("#email_check_input");
			// 인증번호 입력란
			var boxWrap = $(".email_check_input_box");
			// 인증번호 입력란 박스
			var warnMsg = $(".email_input_box_warn");
			// 이메일 입력 경고글
			alert('test email2')
			if (emailFormCheck(email)) {
				warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
				warnMsg.css("display", "inline-block");
			} else {
				warnMsg.html("올바르지 못한 이메일 형식입니다.");
				warnMsg.css("display", "inline-block");
				return false;
			}

			$.ajax({

				type : "GET",
				url : "emailcheck?email=" + email,
				success : function(data) {
					cehckBox.attr("disabled", false);
					boxWrap.attr("id", "email_check_input_box_true");
					code = data;

				} // success 종료

			}); // ajax 종료

		});// function 종료

		$("#email_check_input").blur(function() {

			var inputCode = $("#email_check_input").val();

			var checkResult = $("#email_check_input_box_warn");

			if (inputCode == code) {
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("id", "correct");
				emailnumCheck = true;
			} else {
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("id", "incorrect");
				mailnumCheck = false;
			}

		}); // function 종료

		$('#passwordck_input').on("propertychange change keyup paste input",
				function() {

					var password = $('#password_input').val();
					var passwordck = $('#passwordck_input').val();
					$('.final_passwordck_ck').css('display', 'none');

					if (password == passwordck) {
						$('.passwordck_input_re_1').css('display', 'block');
						$('.passwordck_input_re_2').css('display', 'none');
						passwordckcorCheck = true;
					} else {
						$('.passwordck_input_re_1').css('display', 'none');
						$('.passwordck_input_re_2').css('display', 'block');
						passwordckcorCheck = false;
					}

				});

		function emailFormCheck(email) {
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}
		
	</script>

</body>
</html>