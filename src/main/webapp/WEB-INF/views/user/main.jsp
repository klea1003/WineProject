<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet"	href="/resources/wine_bootstrap/css/yoseptest.css">  <!--추후 삭제 예정 -->
<style type="text/css">

.login_success_area {
	height: 62%;
	width: 80%;
	border: 2px solid #7474ad;
	border-radius: 15px;
	margin: 5% auto;
	padding-top: 5%;
}

.login_success_area>span {
	display: block;
	text-align: left;
	margin-left: 10%;
}






.login_warn{
    text-align: center;
    color : red;
     font-size: 5px;
}
.id_input_re_1 {
	color: green;
	display: none;
	 font-size: 5px;   
	text-align: center;
}
.id_input_re_2 {
	color: red;
	display: none;
 	 font-size: 5px;
 	text-align: center;
}
.nickname_input_re_1 {
	color: green;
	display: none;
	 font-size: 5px;
	 text-align: center;  
}
.nickname_input_re_2 {
	color: red;
	display: none;
	 font-size: 5px;
}
#email_check_input_box_false{
     font-size: 5px;
    text-align: center;
    
}
#email_check_input_box_true{
    background-color:white;
     font-size: 5px;
    text-align: center;
}

.correct{
    color : green;
    font-size: 5px;
}
.incorrect{
    color : red;
     font-size: 5px;
}

.final_id_ck{
    display: none;
    font-size: 5px;
    text-align: center;
}
.final_nickname_ck{
    display: none;
    font-size: 5px;
    text-align: center;
}
.final_password_ck{
    display: none;
    font-size: 5px;
    text-align: center;
}
.final_passwordck_ck{
    display: none;
     font-size: 5px;
    text-align: center;
}
.final_realname_ck{
    display: none;
    font-size: 5px;
    text-align: center;
}
.final_birthday_ck{
    display: none;
     font-size: 5px;
    text-align: center;
}
.final_email_ck{
    display: none;
    font-size: 5px;
    text-align: center;
}
.final_phonenum_ck{
    display: none;
    font-size: 5px;
    text-align: center;
}

.passwordck_input_re_1{
        color : green;
        display : none;
 		 font-size: 5px;
 		text-align: center;  
}
.passwordck_input_re_2{
        color : red;
        display : none;
        font-size: 5px;
        text-align: center;    
}
#email_check_button{
	margin-top: 10%;
	
}
body.modal-open {
    overflow: hidden;
    position:fixed;
    width: 100%;
}
</style>
<link href="/resources/wine_bootstrap/css/all.min.css" rel="stylesheet"	type="text/css">    <!-- 로그인, 회원가입 css -->

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> <!-- 로그인, 회원가입 css -->
<link href="/resources/wine_bootstrap/css/sb-admin-2.min.css" rel="stylesheet">   <!-- 로그인, 회원가입 css -->

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script> <!--로그인 회원가입 jquery -->
<!-- 
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> -->
 <script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>  <!-- 모달 css -->

<script>
        $(document).ready(function() {
        	
            var result = '${result}';
            
            console.log(result);
            
             
            $("#modal_show_login").click(function() {
            	$("#loginModal").modal("show");
            
            });
             
            
            
        $("#modal_show_join").click(function() {
          	//$("#loginModal").modal("hide");
        	$('body').css("overflow", "hidden");
            $("#joinModal").modal("show");
            
        });
        $("#modal_show_logintojion").click(function() {
        	$("#loginModal").modal("hide");
        	$('body').css("overflow", "hidden");
            $("#joinModal").modal("show");
            
        });
        $("#modal_show_jointologin").click(function() {
           	 $("#joinModal").modal("hide");
        	$('body').css("overflow", "hidden");
            $("#loginModal").modal("show");
            
        });
        
        if(result ==0){
           if (result === '' || history.state) {
			return;
			} 
          	$("#loginModal").modal("show");
        }  
 
        
    
        
        });
        
    </script>



</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<h1>gnb area</h1>
			</div>
			<div class="top_area">
				<div class="logo_area">
					<h1>logo area</h1>
				</div>
				<div class="search_area">
					<h1>Search area</h1>
				</div>
				<div class="login_area">
					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${user == null }">
						
							<span><a  id="modal_show_login">로그인</a></span>
						
						<span><a id="modal_show_join">회원가입</a></span>
					


					</c:if>

					<!-- 로그인한 상태 -->
					<c:if test="${ user != null }">
						<div class="login_success_area">
							<span>번호 : ${user.userNum}</span> <span>닉네임 :
								${user.userNickName}</span> <span>실명 : ${user.userRealName}</span> <span>핸드폰번호
								: ${user.userPhoneNum}</span>
						</div>
					</c:if>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="navi_bar_area">
				<h1>navi area</h1>
			</div>
			<div class="content_area">
				<h1>content area</h1>
				<span><a href="/user/userlist">리스트</a></span>
			</div>
		</div>
	</div>
	<!-- login Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document" >

			<div class="modal-content">

				<div class="modal-body">
					<!-- 로그인 영역  -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block ">
							<img
								src="https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2015%2F02%2Fred-wine-600x800.jpg"
								alt="wine" height="100%" width="100%">
						</div>
						<div class="col-lg-6">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">너 와, IN</h1>

								</div>
								<form class="user" id="login_form" method="post">
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											placeholder="아이디를 입력해주세요" name="userId">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-user"
											id="exampleInputPassword" placeholder="비밀번호를 입력해주세요"
											name="userPassword">
										<c:if test="${result == 0 }">
											<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
										</c:if>
									</div>
									<input type="button" id="login_button"
										class="btn btn-primary btn-user btn-block" value="Login">
									<hr>
									<a href="index.html" class="btn btn-google btn-user btn-block">
									 Login with Google
									</a> <a href="index.html"
										class="btn btn-facebook btn-user btn-block">  Login with Facebook
									</a>
								</form>
								<hr>
								<div class="text-center">
								 <a class="small" id="modal_show_logintojion">Create an Account!</a>
								
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- join Modal -->
	<div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog" role="document"  >

			<div class="modal-content">

				<div class="modal-body">
					<!-- 회원가입 영역  -->
					<div class="row">
						
						<div class="col-lg-12">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div >
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
								</div>
								<form class="user" id="join_form" method="post">
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											id="id_input" name="userId" placeholder="아이디 입력">
										<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
											class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
											class="final_id_ck">아이디를 입력해주세요.</span>
									</div>

									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											id="nickname_input" name="userNickName"
											placeholder="닉네임 입력"> <span
											class="nickname_input_re_1">사용 가능한 닉네임입니다.</span> <span
											class="nickname_input_re_2">닉네임이 이미 존재합니다.</span> <span
											class="final_nickname_ck">닉네임을 입력해주세요.</span>
									</div>

									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="password" class="form-control form-control-user"
												id="password_input" name="userPassword"
												placeholder="비밀번호 입력"> <span
												class="final_password_ck">비밀번호를 입력해주세요.</span>
										</div>
										<div class="col-sm-6">
											<input type="password" class="form-control form-control-user"
												id="passwordck_input" placeholder="비밀번호 확인">
											<span class="final_passwordck_ck">비밀번호 확인을 입력해주세요.</span> <span
												class="passwordck_input_re_1">비밀번호가 일치합니다.</span> <span
												class="passwordck_input_re_2">비밀번호가 일치하지 않습니다.</span>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-sm-7 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="realname_input" name="userRealName"
												placeholder="실명 입력"> <span
												class="final_password_ck">실명을 입력해주세요.</span>
										</div>
										<div class="col-sm-5">
											<input type="date" class="form-control form-control-user"
												id="birthday_input" name="userBirthDay"> <span
												class="final_birthday_ck">생년월일 입력해주세요</span>
										</div>
									</div>
									<!-- row  -->

									<div class="form-group row">
										<div class="col-sm-8 mb-3 mb-sm-0">
											<input type="email" class="form-control form-control-user"
												id="email_input" name="userEmail" placeholder="이메일 입력">
											<span class="final_email_ck">이메일을 입력해주세요</span>
										</div>

										<div class="col-sm-4">
											<div class="btn btn-light btn-icon-split" id="email_check_button">
												<span>인증번호 전송</span>
											</div>
										</div>
									</div>
									<!-- row -->
									<span class="email_input_box_warn"></span>
									<div class="form-group">
										<div class="email_check_input_box"
											id="email_check_input_box_false">
											<input type="text" class="form-control form-control-user"
												id="email_check_input" disabled="disabled">
										</div>
									</div>
									<span id="email_check_input_box_warn"></span>

									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											id="phonenum_input" name="userPhoneNum"
											placeholder="010-1234-5678"> <span
											class="final_phonenum_ck">핸드폰 번호를 입력해주세요</span>
									</div>
									<input type="button" class="btn btn-primary btn-user btn-block"
										id="join_button" value="가입하기">

									<hr><div >
									 <a href="index.html"class="btn btn-google btn-user btn-block col-lg-6" style="float:left; margin-top: 8px;" > 
										Register with Google
									</a> <a href="index.html"class="btn btn-facebook btn-user btn-block col-lg-6"style="float:right;"> 
									Register with Facebook
									</a></div>
								</form>
								<hr>
								<div class="text-center">
									<a class="small" id="modal_show_jointologin">Already have an account?	Login!</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
<script src = "/resources/wine_bootstrap/js/login.js"></script> <!-- 회원가입 login -->
<script src = "/resources/wine_bootstrap/js/join.js"></script> <!-- 회원가입 js -->
</body>
</html>