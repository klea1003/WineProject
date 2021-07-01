<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="/resources/wine_bootstrap/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="/resources/wine_bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    
<script  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style>
.login_warn{
    text-align: center;
    color : red;
    font-size: 10px;
}
.bg{
  background-color: skyblue;
  
}

</style>
</head>
<body class="bg">
<div class="container">
 	  <div class="row justify-content-center">
         <div class="col-xl-10 col-lg-12 col-md-9">
             <div class="card o-hidden border-0 shadow-lg my-5">
                 <div class="card-body p-0">
                     <!-- Nested Row within Card Body -->
                     <div class="row">
                         <div class="col-lg-6 d-none d-lg-block ">	<img src="https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2015%2F02%2Fred-wine-600x800.jpg" alt="wine" height="100%" width="100%"></div>
                         <div class="col-lg-6">
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
                                             id="exampleInputPassword" placeholder="비밀번호를 입력해주세요" name="userPassword">
                                      <c:if test = "${result == 0 }">
             								<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
          							</c:if>
                                     </div>
                                     <input type="button" id="login_button" class="btn btn-primary btn-user btn-block" value="login">                               
                                     <hr>
                                     <a href="index.html" class="btn btn-google btn-user btn-block">
                                         <i class="fab fa-google fa-fw"></i> Login with Google </a>
                                     <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                         <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook </a>
                                 </form>
                                 	<hr>
                                     <div class="text-center">
                                     <a class="small" href="join">Create an Account!</a>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
</div>
<script>
    $("#login_button").click(function(){
        $("#login_form").attr("action", "/user/login");
        $("#login_form").submit();
    });
 
</script>

</body>
</html>