
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

var addressCheck = false 

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
		var addr = $('#address_input_3').val();
		 

		if (id == "") {
			$('.final_id_ck').css('display', 'block');
			idCheck = false;
		} else {
			$('.final_id_ck').css('display', 'none');
			idCheck = true;
		}


		if (nickname == "") {
			$('.final_nickname_ck').css('display', 'block');
			nicknameCheck = false;
		} else {
			$('.final_nickname_ck').css('display', 'none');
			nicknameCheck = true;
		}


		if (password == "") {
			$('.final_password_ck').css('display', 'block');
			passwordCheck = false;
		} else {
			$('.final_password_ck').css('display', 'none');
			passwordCheck = true;
		}


		if (passwordck == "") {
			$('.final_passwordck_ck').css('display', 'block');
			passwordckCheck = false;
		} else {
			$('.final_passwordck_ck').css('display', 'none');
			passwordckCheck = true;
		}

		if (realname == "") {
			$('.final_realname_ck').css('display', 'block');
			realnameCheck = false;
		} else {
			$('.final_realname_ck').css('display', 'none');
			realnameCheck = true;
		}


		if (birthday == "") {
			$('.final_birthday_ck').css('display', 'block');
			birthdayCheck = false;
		} else {
			$('.final_birthday_ck').css('display', 'none');
			birthdayCheck = true;
		}

		if (phonenum == "") {
			$('.final_phonenum_ck').css('display', 'block');
			phonenumCheck = false;
		} else {
			$('.final_phonenum_ck').css('display', 'none');
			phonenumCheck = true;
		}

		if (email == "") {
			$('.final_email_ck').css('display', 'block');
			emailCheck = false;
		} else {
			$('.final_email_ck').css('display', 'none');
			emailCheck = true;
		}
		
        if(addr == ""){
            $('.final_address_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_address_ck').css('display', 'none');
            addressCheck = true;
        }

		if (idCheck && idckCheck && nicknameCheck && nicknameckCheck && passwordCheck && passwordckCheck && passwordckcorCheck && realnameCheck && birthdayCheck && emailCheck && emailnumCheck && phonenumCheck && addressCheck) {
			$("#join_form").attr("action", "/user/join");
			$("#join_form").submit();
			alert(id + '님 회원가입을 축하합니다.')
		}
		return false;
	});
});

$('#id_input').on("propertychange change keyup paste input", function() {

	var userId = $('#id_input').val()

	var data = {
		userId: userId
	}

	$.ajax({
		type: "post",
		url: "/user/userIdchk",
		data: data,
		success: function(result) {

			if (result != 'fail') {
				$('.id_input_re_1').css("display", "inline-block");
				$('.id_input_re_2').css("display", "none");
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display", "inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;
			}

		}// success 종료

	}) // ajax 종료	

});// function 종료

$('#nickname_input').on("propertychange change keyup paste input",
	function() {

		var userNickName = $('#nickname_input').val();

		var data = {
			userNickName: userNickName
		}

		$.ajax({
			type: "post",
			url: "/user/userNickNamechk",
			data: data,
			success: function(result) {

				if (result != 'fail') {
					$('.nickname_input_re_1').css("display", "inline-block");
					$('.nickname_input_re_2').css("display", "none");
					nicknameckCheck = true;
				} else {
					$('.nickname_input_re_2').css("display", "inline-block");
					$('.nickname_input_re_1').css("display", "none");
					nicknameckCheck = false;
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

	if (emailFormCheck(email)) {
		warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
		warnMsg.css("display", "inline-block");
	} else {
		warnMsg.html("올바르지 못한 이메일 형식입니다.");
		warnMsg.css("display", "inline-block");
		return false;
	}

	$.ajax({

		type: "GET",
		url: "emailcheck?email=" + email,
		success: function(data) {
			cehckBox.attr("disabled", false);
			boxWrap.attr("id", "email_check_input_box_true");
			code = data;

		} // success 종료

	}); // ajax 종료

});// function 종료

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