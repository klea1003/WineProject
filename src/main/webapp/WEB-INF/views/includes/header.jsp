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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
		crossorigin="anonymous" />
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>

	<!-- Bootstrap core JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>

	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
		rel="stylesheet" />

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

.login_warn {
	text-align: center;
	color: red;
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

#email_check_input_box_false {
	font-size: 5px;
	text-align: center;
}

#email_check_input_box_true {
	background-color: white;
	font-size: 5px;
	text-align: center;
}

.correct {
	color: green;
	font-size: 5px;
}

.incorrect {
	color: red;
	font-size: 5px;
}

.final_id_ck {
	display: none;
	font-size: 5px;
	text-align: center;
}

.final_nickname_ck {
	display: none;
	font-size: 5px;
	text-align: center;
}

.final_password_ck {
	display: none;
	font-size: 5px;
	text-align: center;
}

.final_passwordck_ck {
	display: none;
	font-size: 5px;
	text-align: center;
}

.final_realname_ck {
	display: none;
	font-size: 5px;
	text-align: center;
}

.final_birthday_ck {
	display: none;
	font-size: 5px;
	text-align: center;
}

.final_email_ck {
	display: none;
	font-size: 5px;
	text-align: center;
}

.final_phonenum_ck {
	display: none;
	font-size: 5px;
	text-align: center;
}

.passwordck_input_re_1 {
	color: green;
	display: none;
	font-size: 5px;
	text-align: center;
}

.passwordck_input_re_2 {
	color: red;
	display: none;
	font-size: 5px;
	text-align: center;
}

body.modal-open {
	overflow: hidden;
	position: fixed;
	width: 100%;
}

.dropdown-large { 
	padding:1rem; 
}

		
@media all and (min-width: 992px) {
	.dropdown-large{
	min-width:800px;
	}
}	

</style>

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
        <c:if test="${user == null }">
        if(result ==0){
           if (result === '' || history.state) {
			return;
			} 
          	$("#loginModal").modal("show");
        }  
 		</c:if>
        });
  
        document.addEventListener("DOMContentLoaded", function(){
        	// make it as accordion for smaller screens
        	if (window.innerWidth > 992) {

        		document.querySelectorAll('.navbar .nav-item').forEach(function(everyitem){

        			everyitem.addEventListener('mouseover', function(e){

        				let el_link = this.querySelector('a[data-bs-toggle]');

        				if(el_link != null){
        					let nextEl = el_link.nextElementSibling;
        					el_link.classList.add('show');
        					nextEl.classList.add('show');
        				}

        			});
        			everyitem.addEventListener('mouseleave', function(e){
        				let el_link = this.querySelector('a[data-bs-toggle]');

        				if(el_link != null){
        					let nextEl = el_link.nextElementSibling;
        					el_link.classList.remove('show');
        					nextEl.classList.remove('show');
        				}
        			})
        		});

        	}
        	// end if innerWidth
        }); // DOMContentLoaded  end
        
</script>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0 main-color">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark">
			<div class="container px-5">
				<a class="navbar-brand " href="index.html">
				<span class="title text-dark">너와, IN</span></a>
					<div class="input-group-prepend">
						<button id="button-addon8" type="submit" class="btn btn-danger">
							<i class="bi bi-search"></i>
						</button>
					</div>
					<input type="search" placeholder="Search any wine" aria-describedby="button-addon8" class="form-control"
						style="width: 200px;">
					
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent"></div>
				
					 <!-- 로그인 하지 않은 상태 -->
					 <c:if test="${user == null }">
						<h2><i class="bi bi-person" id="modal_show_login"></i></h2>
					</c:if> 
					

					<!-- 로그인 된 경우 -->
					<c:if test="${user != null }">
						<div class="dropdown text-end">
						<a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> 
							<img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
						</a>
						<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
							<li><a class="dropdown-item" href="#">My wines</a></li>
							<li><a class="dropdown-item" href="#">orders</a></li>
							<li><a class="dropdown-item" href="/user/userpage?userNum=<c:out value="${user.userNum }"/>">profiles</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="/user/logout">Log out</a></li>
						</ul>
						</div>
					</c:if>
				</div>
		</nav>

		<nav class="navbar navbar-expand-lg navbar-dark header-color">
			<div class="container px-5">
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mb-2 mb-lg-0">

					<li class="nav-item dropdown">
					   <a class="nav-link" href="#" data-bs-toggle="dropdown">  wines  </a>
					   <div class="dropdown-menu dropdown-large">
					   		<div class="row g-3">
					   		<div class="col-4">
					   			<ul class="list-unstyled">
								  
								  <li><a class="dropdown-item fw-bold" href="#"> Red </a></li>
								  <li><a class="dropdown-item" href="#"> Southern Italy Red </a></li>
								  <li><a class="dropdown-item" href="#"> Tuscan Red </a></li>
								  <li><a class="dropdown-item" href="#"> Spanish Rioja Red </a></li>
								  <li><a class="dropdown-item" href="#"> South African Pinotage </a></li>
								  <li><a class="dropdown-item" href="#"> Italian Amarone </a></li>
								  
								</ul>
							</div><!-- end col-3 -->
							<div class="col-5">
								<ul class="list-unstyled">
								  
								  <li><a class="dropdown-item fw-bold" href="#"> White </a></li>
								  <li><a class="dropdown-item" href="#"> German Riesling </a></li>
								  <li><a class="dropdown-item" href="#"> Northern Italy white </a></li>
								  <li><a class="dropdown-item" href="#"> German Sauvignon Blanc </a></li>
								  <li><a class="dropdown-item" href="#"> German Grauburgunder </a></li>
								  <li><a class="dropdown-item" href="#"> New Zealand Sauvignon Blanc </a></li>
								  
					    		</ul>
					    	</div><!-- end col-3 -->
					    		
					    	<div class="col-2">
								<ul class="list-unstyled">
								  
								  <li><a class="dropdown-item fw-bold" href="#"> Sparkling </a></li>
								  <li><a class="dropdown-item fw-bold" href="#"> Rosé </a></li>
								  <li><a class="dropdown-item fw-bold" href="#"> Port </a></li>
								  <li><a class="dropdown-item fw-bold" href="#"> Dessert </a></li>
								  
								 </ul>
					    	</div><!-- end col-3 -->
					    	</div><!-- end row -->
					    </div><!-- end dropdown-large -->
					    </li><!-- end Wines -->
					    
					<li class="nav-item dropdown">
					   <a class="nav-link" href="#" data-bs-toggle="dropdown">  Grapes  </a>
					   <div class="dropdown-menu dropdown-large">
					   		<div class="row g-3">
					   		<div class="col-4">
					   			
					    		<ul class="list-unstyled">

								  <li><a class="dropdown-item" href="#"> Cabernet Sauvignon </a></li>
								  <li><a class="dropdown-item" href="#"> Montepulciano </a></li>
								  <li><a class="dropdown-item" href="#"> Chardonnay </a></li>
								  <li><a class="dropdown-item" href="#"> Pinot Noir </a></li>
								  <li><a class="dropdown-item" href="#"> Malbec </a></li>
								</ul>
							</div><!-- end col-3 -->
							<div class="col-5">
								
								<ul class="list-unstyled">
								 
								  <li><a class="dropdown-item" href="#"> Sauvignon Blanc </a></li>
								  <li><a class="dropdown-item" href="#"> Shiraz/Syrah </a></li>
								  <li><a class="dropdown-item" href="#"> Zinfandel </a></li>
								  <li><a class="dropdown-item" href="#"> Nebbiolo </a></li>
								  <li><a class="dropdown-item" href="#"> Sangiovese </a></li>
					    		</ul>
					    	</div><!-- end col-3 -->
					    		
					    	<div class="col-2">
								
								<ul class="list-unstyled">
								 
								  <li><a class="dropdown-item" href="#"> Pinot Grigio </a></li>
								  <li><a class="dropdown-item" href="#"> Riesling </a></li>
								  <li><a class="dropdown-item" href="#"> Grauburgunder </a></li>
								  <li><a class="dropdown-item" href="#"> Tempranillo </a></li>
								  <li><a class="dropdown-item" href="#"> Primitivo </a></li>
								 </ul>
					    	</div><!-- end col-3 -->
					    	</div><!-- end row -->
					    </div><!-- end dropdown-large -->
					    </li><!-- end Grapes -->
						
					<li class="nav-item dropdown">
					   <a class="nav-link" href="#" data-bs-toggle="dropdown">  Regions  </a>
					   <div class="dropdown-menu dropdown-large">
					   		<div class="row g-3">
					   		<div class="col-3">
					   			
					    		<ul class="list-unstyled">
					    		
								  <li><a class="dropdown-item fw-bold" href="#"> Germany </a></li>
								  <li><a class="dropdown-item" href="#"> Mosel </a></li>
								  <li><a class="dropdown-item" href="#"> Pfalz </a></li>
								  <li><a class="dropdown-item" href="#"> Rheingau </a></li>
								
								</ul>
							</div><!-- end col-3 -->
							<div class="col-3">
								
								<ul class="list-unstyled">
								 
								  <li><a class="dropdown-item fw-bold" href="#"> Italy </a></li>
								  <li><a class="dropdown-item" href="#"> Lugana </a></li>
								  <li><a class="dropdown-item" href="#"> Piemonte </a></li>
								  <li><a class="dropdown-item" href="#"> Tuscany </a></li>
								  <li><a class="dropdown-item" href="#"> Puglia </a></li>
								  
					    		</ul>
					    	</div><!-- end col-3 -->
					    		
					    	<div class="col-3">
								
								<ul class="list-unstyled">
								  
								  <li><a class="dropdown-item fw-bold" href="#"> France </a></li>
								  <li><a class="dropdown-item" href="#"> Vin de pays </a></li>
								  <li><a class="dropdown-item" href="#"> Southern Rhone </a></li>
								  <li><a class="dropdown-item" href="#"> Bordeaus </a></li>
								  <li><a class="dropdown-item" href="#"> Burgundy </a></li>
								  
								 </ul>
					    	</div><!-- end col-3 -->
					    	
					    	<div class="col-3">
								
								<ul class="list-unstyled">
								  
								  <li><a class="dropdown-item fw-bold" href="#"> Spain </a></li>
								  <li><a class="dropdown-item fw-bold" href="#"> Portugal </a></li>
								  <li><a class="dropdown-item fw-bold" href="#"> Chile </a></li>
								  <li><a class="dropdown-item fw-bold" href="#"> New Zealand </a></li>
								  <li><a class="dropdown-item fw-bold" href="#"> Australia </a></li>
								  <li><a class="dropdown-item fw-bold" href="#"> USA </a></li>
								 
								  
								 </ul>
					    	</div><!-- end col-3 -->
					    	</div><!-- end row -->
					    </div><!-- end dropdown-large -->
					    </li><!-- end Regions -->
						
					<li class="nav-item"><a class="nav-link" href="#">Seller</a></li>
					<li class="nav-item"><a class="nav-link" href="#">FAQ</a></li>
					
					</ul>
				</div>
			</div>
		</nav>
	</main>

	<!-- login Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Login</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- 로그인 영역  -->
					<form class="user" id="login_form" method="post">
						<div class="mb-3">
							<input type="text" class="form-control "
								placeholder="아이디를 입력해주세요" name="userId">
						</div>
						<div class="mb-3">
							<input type="password" class="form-control"
								id="exampleInputPassword" placeholder="비밀번호를 입력해주세요"
								name="userPassword">
							<c:if test="${result == 0 }">
								<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
							</c:if>
						</div>
						<div class="modal-footer d-block">
							<p class="float-start">
								Not yet account <a class="small" id="modal_show_logintojion">Sign
									Up</a>
							</p>
							<input type="button" id="login_button"
								class="btn btn-warning float-end" value="Login">
						</div>
						<c:set var="path"
									value="${requestScope['javax.servlet.forward.servlet_path']}" />
									<c:set var="query"
									value="${requestScope['javax.servlet.forward.query_string']}" />
								<input type='hidden' name='path'
									value="<c:out value='${path}'/>">	
									<input type='hidden' name='query'
									value="<c:out value='${query}'/>">		
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- join Modal -->

	<div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog" role="document">

			<div class="modal-content">

				<div class="text-center">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" style="float: right;"></button>
					<br> <span style="font-size: 30px;">Welcome!</span>

				</div>

				<div class="modal-body">
					<!-- 회원가입 영역  -->
					<form class="user" id="join_form" method="post">
						<div class="row g-3">
							<div class="col-sm-12">
								<input type="text" class="form-control " id="id_input"
									name="userId" placeholder="아이디 입력"> <span
									class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
									class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
									class="final_id_ck">아이디를 입력해주세요.</span>
							</div>

							<div class="col-sm-12">
								<input type="text" class="form-control" id="nickname_input"
									name="userNickName" placeholder="닉네임 입력"> <span
									class="nickname_input_re_1">사용 가능한 닉네임입니다.</span> <span
									class="nickname_input_re_2">닉네임이 이미 존재합니다.</span> <span
									class="final_nickname_ck">닉네임을 입력해주세요.</span>
							</div>
							<div class="col-sm-6 ">


								<input type="password" class="form-control" id="password_input"
									name="userPassword" placeholder="비밀번호 입력"> <span
									class="final_password_ck">비밀번호를 입력해주세요.</span>
							</div>

							<div class="col-sm-6 ">
								<input type="password" class="form-control "
									id="passwordck_input" placeholder="비밀번호 확인"> <span
									class="final_passwordck_ck">비밀번호 확인을 입력해주세요.</span> <span
									class="passwordck_input_re_1">비밀번호가 일치합니다.</span> <span
									class="passwordck_input_re_2">비밀번호가 일치하지 않습니다.</span>

							</div>

							<div class="col-sm-7">

								<input type="text" class="form-control" id="realname_input"
									name="userRealName" placeholder="실명 입력"> <span
									class="final_password_ck">실명을 입력해주세요.</span>
							</div>

							<div class="col-sm-5">
								<input type="date" class="form-control" id="birthday_input"
									name="userBirthDay"> <span class="final_birthday_ck">생년월일
									입력해주세요</span>

							</div>
							<!-- row  -->

							<div class="col-sm-7">
								<input type="email" class="form-control" id="email_input"
									name="userEmail" placeholder="이메일 입력"> <span
									class="final_email_ck">이메일을 입력해주세요</span> <span
									class="email_input_box_warn"></span>
							</div>
							<div class="col-sm-5">
								<input type="button" class="form-control"
									id="email_check_button" name="userEmail" value="인증번호 전송">
							</div>



							<div class="col-sm-12">
								<div class="email_check_input_box"
									id="email_check_input_box_false">
									<input type="text" class="form-control " id="email_check_input"
										disabled="disabled">
								</div>
								<span id="email_check_input_box_warn"></span>
							</div>

							<div class="col-sm-12">
								<input type="text" class="form-control" id="phonenum_input"
									name="userPhoneNum" placeholder="010-1234-5678"> <span
									class="final_phonenum_ck">핸드폰 번호를 입력해주세요</span>
							</div>
							
								<input type="button" class="btn btn-warning float-end"
									id="join_button" value="가입하기">
								<c:set var="path"
									value="${requestScope['javax.servlet.forward.servlet_path']}" />
									<c:set var="query"
									value="${requestScope['javax.servlet.forward.query_string']}" />
								<input type='hidden' name='path'
									value="<c:out value='${path}'/>">	
									<input type='hidden' name='query'
									value="<c:out value='${query}'/>">						
						</div>
					</form>
					<br>
					<div class="text-center">
						<a class="small" id="modal_show_jointologin">Already have an
							account? Login!</a>
					</div>


				</div>
			</div>

		</div>

	</div>


	<script src="/resources/wine_bootstrap/js/login.js"></script>
	<!-- 회원가입 login -->
	<script src="/resources/wine_bootstrap/js/join.js"></script>
	<!-- 회원가입 js -->

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/wine_bootstrap/js/scripts.js"></script>



</body>
</html>
