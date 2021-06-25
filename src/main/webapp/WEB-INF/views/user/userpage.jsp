<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   
<script type= "text/javascript" src="/resources/wine_bootstrap/js/social.js"></script>

<script type="text/javascript">

console.log("============");
console.log("JS TEST");



/* socialService.add(
		
		{userFollowingId:"test" , userFollowerId:"test"}
		,
		function(result){
			alert("RESULT: "+ result);
		}
	);  */
 
/*  socialService.remove(
		 { {userFollowingId:"test",userFollowerId:"test"},},
		 function(result){
        	alert("REMOVE: "+ result);
         
         });  */  

$(document).ready(function() {
	
	var followingBtn = $("#followingBtn");
	var unfollowBtn = $("#unfollowBtn");
	
	followingBtn.on("click", function(e){
		alert('clickfollowing')
		var social = {
			userFollowingId:"${userpage.userNum }",
			userFollowerId:"${user.userId}"
			};
		
		if(${user != null}){
			if("${user.userId}" != "${userpage.userId }"){
				socialService.add(social,function(result){
					alert(result);
				})
			}else{
				alert('자기 자신을 팔로잉 할 수 없습니다.')
			}
		}else{
			alert('로그인 후 이용해 주세요.')
		}
		
		
	})
	
	
	unfollowBtn.on("click", function(e){
		alert('click')
		var social = {
			userFollowingId:"${userpage.userNum }",
			userFollowerId:"${user.userId}"
			};
		if("${user.userId}" != "${userpage.userId }"){
		socialService.remove(social,function(result){
			alert(result);
		})
		}else{
			alert('자기 자신을 팔로잉 할수 없는다.')
		}
	})
});

</script>

<link rel="stylesheet" href="/resources/wine_bootstrap/css/yoseptest.css">

<style type="text/css">
.login_success_area{
   
}
.login_success_area>span{
    display : block;
    text-align: left;
  
}
 
.login_success>div{
    display : block;
    text-align: left;
    
} 
</style>


</head>
<body>


<%@include file="../includes/header.jsp" %>
   <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5">
                    <h1 class="fw-bolder fs-5 mb-4">	
                    	<span><c:out value='${userpage.userNum }'/>님의 Wine</span>
                           
                        <c:if test="${ followck != null}">
						<button class= "btn btn-outline-secondary btn-sm" id='unfollowBtn' type="button" >
						팔로잉<i class="bi bi-person-check-fill"></i></button>
						
						</c:if>
						<c:if test="${ followck == null}">
						<c:out value='${followck.userFollowerId }'/>
						<div class="btn-group">
						
						<button class= "btn btn-primary btn-sm" id='followingBtn' type="button" >
						팔로우<i class="bi bi-person-plus-fill"></i></button>
						</div>
						</c:if></h1>
               
                </div>
            </section>
            <section class="py-5 bg-light">
                <div class="container px-5">
                    <div class="row gx-5">
                        <div class="col-xl-8">
                            <h2 class="fw-bolder fs-5 mb-4">Board News</h2>
                            <!-- News item-->
                            <div class="mb-4">
                                <div class="small text-muted">May 12, 2021</div>
                                <a class="link-dark" href="#!"><h3>Start Bootstrap releases Bootstrap 5 updates for templates and themes</h3></a>
                            </div>
                            <!-- News item-->
                            <div class="mb-5">
                                <div class="small text-muted">May 5, 2021</div>
                                <a class="link-dark" href="#!"><h3>Bootstrap 5 has officially landed</h3></a>
                            </div>
                            <!-- News item-->
                            <div class="mb-5">
                                <div class="small text-muted">Apr 21, 2021</div>
                                <a class="link-dark" href="#!"><h3>This is another news article headline, but this one is a little bit longer</h3></a>
                            </div>
                            <div class="text-end mb-5 mb-xl-0">
                                <a class="text-decoration-none" href="#!">
                                    More news
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="card border-0 h-100">
                                <div class="card-body p-4">
                                    <div class="d-flex h-100 align-items-center justify-content-center">
                                        <div class="text-center">
                                            <div class="h6 fw-bolder">SNS</div>
                                            <p class="text-muted mb-4">
                                            <br/>
                                            </p>
                                            <div class="h6 fw-bolder">Following </div>
                                            <div class="h6 fw-bolder">Follower  </div>
                                            <br/>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-twitter"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-facebook"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-linkedin"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-youtube"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5">
                    <h2 class="fw-bolder fs-5 mb-4">Wish List</h2>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><div class="h5 card-title mb-3">Blog post title</div></a>
                                    <p class="card-text mb-0">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Kelly Rowan</div>
                                                <div class="text-muted">March 12, 2021 &middot; 6 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   </div>                                  
                 </div>
            </section>

<%@include file="../includes/footer.jsp" %>





</body>
</html>