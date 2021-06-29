<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title>너와, IN</title>
        
        <!-- Bootstrap core CSS -->
   		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
   
   		<!-- jQuery -->
   		<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   
   		<!-- Bootstrap core JS -->
   		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/wine_bootstrap/css/styles.css" rel="stylesheet" />
    </head>
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

 <script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>  <!-- 모달 css -->

<script>
        $(document).ready(function() {
        	
            var result = '${result}';
            
            console.log(result);
            
             
            $("#modal_show_login").click(function() {
            	$("#loginModal").modal("show");
            
            });
             
            $("#close_login").click(function() {
                $("#loginModal").modal("hide");
            });

            
        $("#modal_show_join").click(function() {
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
        $("#close_join").click(function() {
            $("#joinModal").modal("hide");
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
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0 main-color">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark ">
                <div class="container px-5">
                    <a class="navbar-brand " href="index.html"><span class="title-color">너와, IN</span></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent"></div>
                </div>
            </nav>
            
            <nav class="navbar navbar-expand-lg navbar-dark header-color">
                <div class="container px-5">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                                                        
                            <li class="nav-item"><a class="nav-link" href="index.html">Wines</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.html">Grapes</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Regions</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">Seller</a></li>
                            <li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
                            
                       </ul>
                        
                    <div class="input-group-prepend">
              			<button id="button-addon8" type="submit" class="btn btn-danger">
              			<i class="bi bi-search"></i></button>
            		</div>
            		<input type="search" placeholder="Search any wine" aria-describedby="button-addon8" class="form-control" style="width: 200px;">
						
                    </div>
          		
          
          			<div class="dropdown text-end">
          			<!-- 로그인 된 경우 -->
          				<!-- 로그인 하지 않은 상태 -->
					<c:if test="${user == null }">
					<span><a  id="modal_show_login">로그인</a></span>
						
					<span><a id="modal_show_join">회원가입</a></span>
					
					</c:if>
          			
          			<c:if test="${user != null }">
			          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
			            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
			          </a>
			          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
			            <li><a class="dropdown-item" href="#">My wines</a></li>
			            <li><a class="dropdown-item" href="#">orders</a></li>
			            <li><a class="dropdown-item" href="#">profiles</a></li>
			            <li><a class="dropdown-item" href="#">Settings</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="#">Log out</a></li>
			          </ul>
        			</c:if>
        			</div>
        			
                 </div>
            </nav>
        </main>
        
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
								aria-label="Close"id="close_login">
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
									<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
          							 <input type='hidden' name='path' value="<c:out value='${path}'/>">
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
								aria-label="Close" id="close_join">
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
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
		<script src="/resources/wine_bootstrap/js/scripts.js"></script>

        
  
    </body>
</html>
