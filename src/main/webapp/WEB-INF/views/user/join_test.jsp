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
<style>
.id_input_re_1 {
	color: green;
	display: none;
}
.id_input_re_2 {
	color: red;
	display: none;
}
.nickname_input_re_1 {
	color: green;
	display: none;
}
.nickname_input_re_2 {
	color: red;
	display: none;
}
#email_check_input_box_false{
    background-color:#ebebe4;
}
#email_check_input_box_true{
    background-color:white;
}

.correct{
    color : green;
}
.incorrect{
    color : red;
}

.final_id_ck{
    display: none;
}
.final_nickname_ck{
    display: none;
}
.final_password_ck{
    display: none;
}
.final_passwordck_ck{
    display: none;
}
.final_realname_ck{
    display: none;
}
.final_birthday_ck{
    display: none;
}
.final_email_ck{
    display: none;
}
.final_phonenum_ck{
    display: none;
}

.passwordck_input_re_1{
        color : green;
        display : none;    
}
.passwordck_input_re_2{
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
					<span>회원가입</span></div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="userId"></div>
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span> 
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
					<span class="final_id_ck">아이디를 입력해주세요</span>
				</div>
				
				<div class="nickname_wrap">
					<div class="nickname_name">닉네임</div>
					<div class="nickname_input_box">
						<input class="nickname_input" name="userNickName"></div>
					<span class="nickname_input_re_1">사용 가능한 닉네임입니다.</span> 
					<span class="nickname_input_re_2">닉네임이 이미 존재합니다.</span>
					<span class="final_nickname_ck">닉네임을 입력해주세요</span>
				</div>
			
				<div class="password_wrap">
					<div class="password_name">비밀번호</div>
					<div class="password_input_box">
						<input class="password_input" name="userPassword"></div>
					<span class="final_password_ck">비밀번호를 입력해주세요</span>
				</div>
				
				<div class="passwordck_wrap">
					<div class="passwordck_name">비밀번호 확인</div>
					<div class="passwordck_input_box">
						<input class="passwordck_input"></div>
					<span class="final_passwordck_ck">비밀번호 확인을 입력해주세요</span>
					<span class="passwordck_input_re_1">비밀번호가 일치합니다.</span>
                	<span class="passwordck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>
				
				<div class="realname_wrap">
					<div class="realname_name">실명</div>
					<div class="realname_input_box">
						<input class="realname_input" name="userRealName"></div>
					<span class="final_realname_ck">실명을 입력해주세요</span>
				</div>
			
				<div class="birthday_wrap">
					<div class="birthday_name">생년월일</div>
					<div class="birthday_input_box">
						<input class="birthday_input" name="userBirthDay"></div>
					<span class="final_birthday_ck">생년월일 입력해주세요</span>
				</div>
			
				<div class="email_wrap">
					<div class="email_name">이메일</div>
					<div class="email_input_box">
						<input class="email_input" name="userEmail"></div>
					<span class="final_email_ck">이메일을 입력해주세요</span>
					<span class="email_input_box_warn"></span>
					<div class="email_check_wrap">
						<div class="email_check_input_box" id="email_check_input_box_false">
							<input class="email_check_input"  disabled="disabled"></div>
						<div class="email_check_button">
							<span>인증번호 전송</span></div>
						<div class="clearfix"></div>
						 <span id="email_check_input_box_warn"></span>
					</div>
				</div>
			
				<div class="phonenum_wrap">
					<div class="phonenum_name">핸드폰</div>
					<div class="phonenum_input_box">
						<input class="phonenum_input" name="userPhoneNum"></div>
					<span class="final_phonenum_ck">핸드폰 번호를 입력해주세요</span>
				</div>
			</div>
			<br>
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
			</div>  -->

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
var code = "";  

var idCheck = false;           
var idckCheck = false; 

var nicknameCheck = false;           
var nicknameckCheck = false;

var passwordCheck = false;            
var passwordckCheck = false;           
var passwordckcorCheck = false;       // 비밀번호 일치/불일치 확인    

var realnameCheck = false;

var birthdayCheck = false;

var emailCheck = false;           
var emailnumCheck = false;        

var phonenumCheck = false        

$(document).ready(function() {
	$(".join_button").click(function() {
		
		var id = $('.id_input').val();                
		var nickname = $('.nickname_input').val();              
        var password = $('.password_input').val();             
        var passwordck = $('.passwordck_input').val();          
        var realname = $('.realname_input').val();    
        var birthday = $('.birthday_input').val();   
        var email = $('.email_input').val();
        var phonenum = $('.phonenum_input').val();   
    
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        if(nickname == ""){
            $('.final_nickname_ck').css('display','block');
            nicknameCheck = false;
        }else{
            $('.final_nickname_ck').css('display', 'none');
            nicknameCheck = true;
        }
	    
        if(password == ""){
            $('.final_password_ck').css('display','block');
            passwordCheck = false;
        }else{
            $('.final_password_ck').css('display', 'none');
            passwordCheck = true;
        }
	 
	    if(passwordck == ""){
            $('.final_passwordck_ck').css('display','block');
            passwordckCheck = false;
        }else{
            $('.final_passwordck_ck').css('display', 'none');
            passwordckCheck = true;
        }
	    

        if(realname == ""){
            $('.final_realname_ck').css('display','block');
            realnameCheck = false;
        }else{
            $('.final_realname_ck').css('display', 'none');
            realnameCheck = true;
        }
      
        if(birthday == ""){
            $('.final_birthday_ck').css('display','block');
            birthdayCheck = false;
        }else{
            $('.final_birthday_ck').css('display', 'none');
            birthdayCheck = true;
        }
        
        if(phonenum == ""){
            $('.final_phonenum_ck').css('display','block');
            phonenumCheck = false;
        }else{
            $('.final_phonenum_ck').css('display', 'none');
            phonenumCheck = true;
        }
      
        if(email == ""){
            $('.final_email_ck').css('display','block');
            emailCheck = false;
        }else{
            $('.final_email_ck').css('display', 'none');
            emailCheck = true;
        }
      
        if(idCheck&&idckCheck&&nicknameCheck&&nicknameckCheck&&passwordCheck&&passwordckCheck&&passwordckcorCheck&&realnameCheck&&birthdayCheck&&emailCheck&&emailnumCheck&&phonenumCheck){
        alert('test4')
		$("#join_form").attr("action", "/user/join");
		$("#join_form").submit();
       
        }  
        
        return false;
        
	});
});

$('.id_input').on("propertychange change keyup paste input",function() {
			
	var userId = $('.id_input').val();
	
	var data = {userId : userId}
	
	$.ajax({
		type : "post",
		url : "/user/userIdchk",
		data : data,
		success : function(result) {
			
			if (result != 'fail') {
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");
				idckCheck = true;
			}else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;
			}
			
		}// success 종료

	}); // ajax 종료	

});// function 종료

$('.nickname_input').on("propertychange change keyup paste input",function() {
	
	var userNickName= $('.nickname_input').val();
	
	var data = {userNickName : userNickName}
	
	$.ajax({
		type : "post",
		url : "/user/userNickNamechk",
		data : data,
		success : function(result) {

			if (result != 'fail') {
				$('.nickname_input_re_1').css("display","inline-block");
				$('.nickname_input_re_2').css("display", "none");
				nicnameckCheck = true;
			}else {
				$('.nickname_input_re_2').css("display","inline-block");
				$('.nickname_input_re_1').css("display", "none");
				nicknameckCheck = true;
			}
		}// success 종료

	}); // ajax 종료	

});// function 종료
	 
/* 인증번호 이메일 전송 */
$(".email_check_button").click(function(){
	
 	var email = $(".email_input").val(); 
 	// 입력한 이메일
    var cehckBox = $(".email_check_input"); 
 	// 인증번호 입력란
    var boxWrap = $(".email_check_input_box");
 	// 인증번호 입력란 박스
 	var warnMsg = $(".email_input_box_warn");    
 	// 이메일 입력 경고글
 	
    if(emailFormCheck(email)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    }    
 	
	  $.ajax({
	        
	        type:"GET",
	        url:"emailcheck?email=" + email,
	        success:function(data){
        	  cehckBox.attr("disabled",false);
        	  boxWrap.attr("id", "email_check_input_box_true");
        	  code = data;
	        
	        }  // success 종료
	        
		});   // ajax 종료
	    
});// function 종료
	
 $(".email_check_input").blur(function(){

    var inputCode = $(".email_check_input").val();        
    
    var checkResult = $("#email_check_input_box_warn");    

    if(inputCode == code){                            
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct"); 
        emailnumCheck = true;     // 일치할 경우
    } else {                                            
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
        mailnumCheck = false;    // 일치하지 않을 경우
    }   
     
 }); // function 종료
 

 $('.passwordck_input').on("propertychange change keyup paste input", function(){
  
     var password = $('.password_input').val();
     var passwordck = $('.passwordck_input').val();
     $('.final_passwordck_ck').css('display', 'none');
         
     if(password == passwordck){
         $('.passwordck_input_re_1').css('display','block');
         $('.passwordck_input_re_2').css('display','none');
         passwordckcorCheck = true;
     }else{
         $('.passwordck_input_re_1').css('display','none');
         $('.passwordck_input_re_2').css('display','block');
         passwordckcorCheck = false;
     }   
     
 });  
 
function emailFormCheck(email){
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(email);
}
</script>

</body>
</html>