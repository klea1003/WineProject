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
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
	<!-- Address API -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 	
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
		rel="stylesheet" />

	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/resources/wine_bootstrap/css/styles.css" rel="stylesheet" />
	
	<!-- jquery-UI -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- swiper -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	 
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

#correct {
	color: green;
	font-size: 5px;
	text-align: center;
	display: none;
	
}

#incorrect {
	color: red;
	font-size: 5px;
	text-align: center;
	display: none;
	
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
.final_address_ck {
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

.bubble {
	z-index:100;
	position: relative;
	height: auto;
	padding: 10px 10px 10px 10px;
	background: #FFFFFF;
	border-radius: 5px;
	border: #7F7F7F solid 1px;
	position: absolute;
	font-size: 16px;
	text-align: left;
	margin-left:50%;
	margin-top: 5%;
	}
	
	.bubble:after{
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 16px 20px 17.5px;
	border-color: #FFFFFF transparent;
	display: block;
	width: 0;
	z-index: 1;
	top: -18.5px; 
	left: 49px; 
	}
	
	.bubble:before 
	{
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 16px 20px 17.5px;
	border-color: #7F7F7F transparent;
	display: block;
	width: 0;
	z-index: 0;
	top: -20px;
	left: 49px;
	}

</style>

<script>
$(document).ready(function() {
		
	var userNum ='<c:out value="${user.userNum}"/>';
		
	var headerck = '${headerck.size()}'
	
	if(headerck >= 1){
		if(userNum !=null && userNum !=''){
			$.getJSON("/user/getAttachList",{userNum:userNum}, function(arr){	  
				
				console.log("불러오기 성공");
				
				console.log("ARRAY"+ arr);
				
				var str=''
				
				$(arr).each(function(i,obj){
					console.log("i"+ obj.profileUuid); 
					if (obj.profileFileType) {
						var fileCallPath = encodeURIComponent(obj.profileUploadPath+ "/s_"+ obj.profileUuid+ "_"+ obj.profileFileName);
						str +="<img src='/userupload/display?fileName="+fileCallPath+"'alt='mdo' width='32' height='32' class='rounded-circle'>"
						console.log(obj.profileFileType)
					} else {
						str +="<li data-path='"+obj.profileUploadPath+"' data-uuid='"+obj.profileUuid+"' data-filename='"+obj.profileFileName+"' data-type='"+obj.profileFileType+"'><div>"
						str +="<span>" + obj.profileFileName + "</span>"
						str +="<img src='/resources/wine_bootstrap/upload_img/attach.png'>"
						str +="</div></li>"
						console.log(obj.profileFileType)
					}
				})
				$(".profileImage").html(str);
			}); //eng json
				
		}
	}
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
	
	
	
	if(result ==1 ){
		$('.bubble').show();	
		setTimeout(function() {
			$('.bubble').hide();
		},3000);
	} 
	
	
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
		<header style="height: 112px; width: 100%;">
		<div class="navbar navbar-expand navbar-dark" style="height: 50%; width: 100%;">
			<div class="container px-5">
				<a class="navbar-brand " href="/wine/main">
				<span class="title text-dark fw-bold">너와, IN</span></a>
				<div class="input-group-prepend">
					<form id='searchForm' action="/wine/search" method='get'>
						<div style="float:left;">
							<input type="search" name='keyword' placeholder="Search any wine" aria-describedby="button-addon8" class="form-control"	style="width: 200px;"></div>
						<div style="float:right;">
							<button class="btn btn-danger">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</form>					
				</div>			
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent"></div>
					 <!-- 로그인 하지 않은 상태 -->
					 <c:if test="${user == null }">
						<h2><i class="bi bi-person" id="modal_show_login"></i></h2>
					</c:if> 
					<!-- 로그인 된 경우 -->
					<c:if test="${user != null }">
						<div class="bubble" style="display:none">${user.userNickName }님 환영합니다. </div>
						<div class="dropdown text-end mx-2">
							<div class="dropdown">
								<div class="row">
									<div class="col-6 ">								
										
										<a href="#" class="d-block link-dark text-decoration-none dropdown-toggle profileImage" id="dropdownUser1" data-bs-toggle="dropdown"
											aria-expanded="false">
										 	<c:if test='${headerck.size() == 0 }'>
												<svg xmlns='http://www.w3.org/2000/svg' width='32' height='32' fill='currentColor' class='bi bi-person-circle' viewBox='0 0 16 16'>"
													<path d='M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z'/>"
													<path fill-rule='evenodd' d='M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z'/>"
												</svg>
											</c:if>								
										</a>						
												
										<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
											<li><a class="dropdown-item" href="/wishList/list">My wines</a></li>
											<li><a class="dropdown-item" href="/order/list">orders</a></li>
											<li><a class="dropdown-item" href="/user/userpage?userNum=<c:out value="${user.userNum }"/>">profiles</a></li>
											<li><a class="dropdown-item" href="/user/settings?userNum=<c:out value="${user.userNum }"/>">Settings</a></li>
											<li><hr class="dropdown-divider"></li>
											<li><a class="dropdown-item" href="/user/logout">Log out</a></li>
										</ul>
									</div>										
									<div class="col-2">
										<a href="/cart/list" class="d-block link-dark text-decoration-none" aria-expanded="false">
											<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
												<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 
												.491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
											</svg>
										</a>
									</div>
								</div>							
							</div>
						</div>
					</c:if>
				</div>
			</div>
		<div class="navbar navbar-expand navbar-dark header-color" style="height: 50%; width: 100%;">
			<div class="container px-5">
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mb-2 mb-lg-0">
						<li class="nav-item dropdown">
					   		<a class="nav-link" href="main" data-bs-toggle="dropdown">Wines</a>
					   		<div class="dropdown-menu dropdown-large">
					   			<div class="row g-3">
							   		<div class="col-4">
							   			<ul class="list-unstyled">
										  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_type_ids=1"> Red </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=1"> Argentinian Malbec </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=2"> Tuscan Red </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=3"> Spanish Rioja Red </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=4"> South African Pinotage </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=5"> Italian Amarone </a></li>
										</ul>
									</div><!-- end col-3 -->
									<div class="col-5">
										<ul class="list-unstyled">
										  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_type_ids=2"> White </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=6"> German Riesling </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=7"> Northern Italy white </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=8"> German Sauvignon Blanc </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=9"> German Grauburgunder </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_style_ids=10"> New Zealand Sauvignon Blanc </a></li>
										 </ul>
							    	</div><!-- end col-3 -->
							    	<div class="col-2">
										<ul class="list-unstyled">
										  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_type_ids=3"> Sparkling </a></li>
										  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_type_ids=4"> Rosé </a></li>
										  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_type_ids=6"> Fortified </a></li>
										  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_type_ids=5"> Dessert </a></li>
									 	 </ul>
							    	</div><!-- end col-3 -->
					    		</div><!-- end row -->
					    	</div><!-- end dropdown-large -->
					    </li><!-- end Wines -->
					<!-- Grapes dropdown -->
					<li class="nav-item dropdown">
					   <a class="nav-link" href="#" data-bs-toggle="dropdown">  Grapes  </a>
					   		<div class="dropdown-menu dropdown-large">
					   			<div class="row g-3">
					   				<div class="col-4">
					   					<ul class="list-unstyled">
					   					  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=1"> Cabernet Franc </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=2"> Cabernet Sauvignon </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=3"> Chardonnay </a></li>	
										</ul>
									</div><!-- end col-3 -->
									<div class="col-3">
					   					<ul class="list-unstyled">					   					  
										  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=4"> Grenache </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=5"> Malbec </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=6"> Merlot </a></li>
										</ul>
									</div><!-- end col-3 -->
									<div class="col-3">
										<ul class="list-unstyled">										  
										  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=7"> Pinot Noir </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=8"> Riesling </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=9"> Sauvignon Blanc </a></li>
										  <li><a class="dropdown-item" href="/wine/list?wine_grape_ids=10"> Shiraz/Syrah </a></li>
							    		</ul>
							    	</div><!-- end col-3 -->
					    		</div><!-- end row -->
					    	</div><!-- end dropdown-large -->
					    </li><!-- end Grapes -->
					<!-- Regions dropdown -->
					<li class="nav-item dropdown">
					   <a class="nav-link" href="#" data-bs-toggle="dropdown">Regions</a>
					  	 <div class="dropdown-menu dropdown-large">
					   		<div class="row g-3">
					   			<div class="col-3">
					   				<ul class="list-unstyled">
						    		  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_country_ids=1"> Argentina </a></li>
									  <li><a class="dropdown-item" href="/wine/list?wine_country_ids=2"> Australia </a></li>
									  <li><a class="dropdown-item" href="/wine/list?wine_country_ids=3"> Austria </a></li>
									  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_country_ids=4"> Chile </a></li>
									</ul>
								</div><!-- end col-3 -->
								<div class="col-3">									
									<ul class="list-unstyled">									 
									  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_country_ids=5"> France </a></li>
									  <li><a class="dropdown-item" href="/wine/list?wine_region_ids=1"> Bordeaux </a></li>
									  <li><a class="dropdown-item" href="/wine/list?wine_region_ids=2"> Bourgogne </a></li>
									  <li><a class="dropdown-item" href="/wine/list?wine_region_ids=5"> Rhone Valley </a></li>
									  								  
						    		</ul>
						    	</div><!-- end col-3 -->					    		
						    	<div class="col-3">									
									<ul class="list-unstyled">									  
									  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_country_ids=4"> Italy </a></li>
									  <li><a class="dropdown-item" href="/wine/list?wine_region_ids=4"> Piemonte </a></li>
									  <li><a class="dropdown-item" href="/wine/list?wine_region_ids=6"> Toscana </a></li>								  
									</ul>
						    	</div><!-- end col-3 -->					    	
						    	<div class="col-3">								
									<ul class="list-unstyled">
									  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_country_ids=6"> Germany </a></li>
									  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_country_ids=8"> Portugal </a></li>								  
									  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_country_ids=9"> Spain </a></li>
									  <li><a class="dropdown-item fw-bold" href="/wine/list?wine_country_ids=10"> USA </a></li>	
									</ul>
						    	</div><!-- end col-3 -->
					    	</div><!-- end row -->
					    </div><!-- end dropdown-large -->
					</li><!-- end Regions -->
					
					<!-- Notice dropdown -->
					<li class="nav-item dropdown">
				   	<a class="nav-link" href="#" data-bs-toggle="dropdown"> Notice </a>
				  	 <div class="dropdown-menu">
				   		<ul class="list-unstyled">
					    		  <li><a class="dropdown-item" href="/board/list"> Q&A </a></li>
								  <li><a class="dropdown-item" href="/board/boardList"> Board </a></li>
								  <li><a class="dropdown-item" href="/board/event"> Event </a></li>
								</ul>
					</div><!-- end dropdown -->
					</li><!-- end Notice -->
						
					<!-- About dropdown -->
					<li class="nav-item">
					<a class="nav-link" href="#" data-bs-toggle="dropdown"> About </a>
						<div class="dropdown-menu">
			   				<ul class="list-unstyled">
				    		  <li><a class="dropdown-item" href="/seller/companyInfo"> About </a></li>
							  <li><a class="dropdown-item" href="/seller/list"> Shop </a></li>
							  <li><a class="dropdown-item" href="/sellerBoard/list"> Special Order </a></li>
							</ul>
						</div><!-- end dropdown -->
					</li><!-- About End -->
					</ul>
				</div>
			</div>
		</div>
	</header>
</main>
	
	<!-- login Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="margin-left: 45%;">Login</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
				</div>
				<div class="modal-body">
					
					<!-- 로그인 영역  -->
					<form class="user" id="login_form" method="post">
						<div class="mb-3">
							<input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="userId">
						</div>
						<div class="mb-3">
							<input type="password" class="form-control"	id="exampleInputPassword" placeholder="비밀번호를 입력해주세요" name="userPassword">
							<c:if test="${result == 0 }">
								<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
							</c:if>
						</div>
						<div class="modal-footer d-block">
							<p class="float-start">Not yet account <a class="small" id="modal_show_logintojion">Sign Up</a>
							</p>
							<input type="button" id="login_button" class="btn btn-outline-danger float-end" value="Login">
						</div>
						<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
						<c:set var="query"	value="${requestScope['javax.servlet.forward.query_string']}" />
						<input type='hidden' name='path' value="<c:out value='${path}'/>">	
						<input type='hidden' name='query' value="<c:out value='${query}'/>">		
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- join Modal -->
	<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="text-center">
					<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close" style="float: right;"></button>
					<br> 
					<span style="font-size: 30px;">Welcome!</span>
				</div>
				
				<div class="modal-body">
					<!-- 회원가입 영역  -->
					<form class="user" id="join_form" method="post">
						<div class="row g-3">
							<div class="col-sm-12">
								<input type="text" class="form-control " id="id_input"name="userId" placeholder="아이디 입력"> 
								<span class="id_input_re_1">사용 가능한 아이디입니다.</span> 
								<span class="id_input_re_2">아이디가 이미 존재합니다.</span> 
								<span class="final_id_ck">아이디를 입력해주세요.</span>
							</div>
							<div class="col-sm-12">
								<input type="text" class="form-control" id="nickname_input"	name="userNickName" placeholder="닉네임 입력"> 
								<span class="nickname_input_re_1">사용 가능한 닉네임입니다.</span> 
								<span class="nickname_input_re_2">닉네임이 이미 존재합니다.</span> 
								<span class="final_nickname_ck">닉네임을 입력해주세요.</span>
							</div>
							<div class="col-sm-6 ">
								<input type="password" class="form-control" id="password_input" name="userPassword" placeholder="비밀번호 입력"> 
								<span class="final_password_ck">비밀번호를 입력해주세요.</span>
							</div>

							<div class="col-sm-6 ">
								<input type="password" class="form-control "id="passwordck_input" placeholder="비밀번호 확인"> 
								<span class="final_passwordck_ck">비밀번호 확인을 입력해주세요.</span> 
								<span class="passwordck_input_re_1">비밀번호가 일치합니다.</span> 
								<span class="passwordck_input_re_2">비밀번호가 일치하지 않습니다.</span>
							</div>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="realname_input"	name="userRealName" placeholder="실명 입력"> 
								<span	class="final_password_ck">실명을 입력해주세요.</span>
							</div>

							<div class="col-sm-5">
								<input type="date" class="form-control" id="birthday_input"	name="userBirthDay"> 
								<span class="final_birthday_ck">생년월일 입력해주세요</span>
							</div>
							
							<!-- row  -->
							<div class="col-sm-7">
								<input type="email" class="form-control" id="email_input" name="userEmail" placeholder="이메일 입력"> 
								<span class="final_email_ck">이메일을 입력해주세요</span>
								<span class="email_input_box_warn"></span>
								
							</div>
							<div class="col-sm-5">
								<input type="button" class="form-control" id="email_check_button" name="userEmail" value="인증번호 전송">
							</div>
							<div class="col-sm-12">
								<div class="email_check_input_box" id="email_check_input_box_false">
									<input type="text" class="form-control " id="email_check_input"	disabled="disabled">
									<span id ="correct">인증번호가 일치 합니다.</span>
									<span id ="incorrect">인증번호를 다시 입력해주세요.</span>
								</div>
								
							</div>
							<div class="col-sm-12">
								<label class="input-group-text" id="inputGroup-sizing-default" for="pickUpPhoneNum" style="display: none;"></label>
					  			<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="userPhoneNum" id="phonenum_input"
									pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" maxlength="13"	placeholder="예) 010-1234-5678" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" >
								<span class="final_phonenum_ck">핸드폰 번호를 입력해주세요</span>
							</div>
												
							<div class="col-sm-7">
								<input class="form-control" id="address_input_1" name="userAddress1" readonly="readonly" placeholder="주소">
							</div>
							<div class="col-sm-5">
								<input type="button" class="form-control" id="address_button" name="addrBtn" value="주소 찾기" onclick="execution_daum_address()">
							</div>
								<!-- <div class="clearfix"></div> -->
							
							<div class ="col-sm-12">
								<input class="form-control" id="address_input_2" name="userAddress2" readonly="readonly">
							</div>
							
							<div class ="col-sm-12">
								<input class="form-control" id="address_input_3" name="userAddress3" readonly="readonly">
								<span class="final_address_ck">주소를 입력해주세요.</span>
							</div>
							
							<input type="button" class="btn btn-outline-danger float-end" id="join_button" value="가입하기">
							<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
							<c:set var="query"	value="${requestScope['javax.servlet.forward.query_string']}" />
							<input type='hidden' name='path' value="<c:out value='${path}'/>">	
							<input type='hidden' name='query' value="<c:out value='${query}'/>">						
						</div>
					</form>
					<br>
					<div class="text-center">
						<a class="small" id="modal_show_jointologin">Already have an account? Login!</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/wine_bootstrap/js/login.js"></script>
	<!-- 로그인 js -->
	<script src="/resources/wine_bootstrap/js/join.js"></script>
	<!-- 회원가입 js -->
</body>
<script type="text/javascript">   

	$("#email_check_input").on("propertychange change keyup paste input",
		function() {

		var inputCode = $("#email_check_input").val();

		if (inputCode == code) {
			$('#correct').css('display', 'block');
			$('#incorrect').css('display', 'none');
			emailnumCheck = true;
		} else {
			$('#incorrect').css('display', 'block');
			$('#correct').css('display', 'none');
			emailnumCheck = false;
		}

	}); // function 종료


	var searchForm = $("#searchForm");
	
	$('#searchForm button').on("click", function(e){
		e.preventDefault;
		
		console.log("searchForm button clicked")
	});
	
	/* 다음 주소 연동 */
	function execution_daum_address(){
		 new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            
		            
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		        	var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#address_input_1").val(data.zonecode);
	             
	                
	                $("#address_input_2").val(addr);
	                // 커서를 상세주소 필드로 이동한다.
	              
	                
	                $("#address_input_3").attr("readonly",false);
	             
	                $("#address_input_3").focus();
		        }
		 
		    }).open();   
	}

</script>
</html>
