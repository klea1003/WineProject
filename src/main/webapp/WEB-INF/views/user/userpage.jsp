<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너와, IN</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script type="text/javascript"	src="/resources/wine_bootstrap/js/social.js"></script>

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script> 



<style type="text/css">
.login_success_area {
	
}

.login_success_area>span {
	display: block;
	text-align: left;
}

.login_success>div {
	display: block;
	text-align: left;
}
.list-card {
	height:600px;
}

p.card-text {
	margin-bottom: 0;
} 
.swiper-slide { 
	text-align: center; 
	font-size: 18px; 
	background: #fff; 
/* Center slide text vertically */ 
	display: -webkit-box; 
	display: -ms-flexbox;
	display: -webkit-flex; 
	display: flex; 
	-webkit-box-pack: center; 
	-ms-flex-pack: center; 
	-webkit-justify-content: center; 
	justify-content: center; 
	-webkit-box-align: center; 
	-ms-flex-align: center; 
	-webkit-align-items: center; 
	align-items: center; 
} 

.swiper-button-next {
  color: #BDBDBD;
}

.swiper-button-prev {
  
  color: #BDBDBD;
} 

.swiper-container-vertical>.swiper-pagination-bullets { 
	top: unset !important; 
	bottom: 10px; 
	left: 0; 
	width: 100%; 
}
.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet { 
	display : inline-block !important; 
	margin: 6px 2px !important; 
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<!-- Page Content-->
	<div style="display: none">
		<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
		<c:set var="query"	value="${requestScope['javax.servlet.forward.query_string']}" />
		<c:out value='${path}'/>
		<c:out value='${query}'/>	
	</div>
	<section class="py-5">
		<div class="container px-5">
			<h1 class="fw-bolder fs-5 mb-4">
				<span><c:out value='${userpage.userRealName }' />님의 Wine</span>
				<c:if test="${ user != null}">
					<c:if test="${ followck != null}">
						<div class="btn-group">
							<button class="btn btn-outline-secondary btn-sm" id='unfollowBtn' type="button">
								팔로잉<i class="bi bi-person-check-fill"></i>
							</button>
						</div>
					</c:if>
					<c:if test="${ followck == null}">
						<div class="btn-group">
							<button class="btn btn-primary btn-sm" id='followingBtn' type="button">
								팔로우<i class="bi bi-person-plus-fill"></i>
							</button>
						</div>
					</c:if>
				</c:if>				
				<c:if test="${ user == null}">
					<div class="btn-group">
						<button class="btn btn-primary btn-sm" id='followingBtn' type="button">
							팔로우<i class="bi bi-person-plus-fill"></i>
						</button>
					</div>
				</c:if>
			</h1>
		</div>
	</section>
	<section class="py-5 bg-light">
		<div class="container px-5">
			<div class="row gx-5">
				<div class="col-xl-4">
					<div class="card border-0 h-100">
						<div class="card-body ">
							<div class="d-flex h-100 align-items-center justify-content-center">
								<div class="text-center">
									<div class="h6 fw-bolder">
										<c:if test="${ imageck.size() != 0}">
											<div class="row">
												<div class="col-lg-12">
													<div class="panel panel-default">
														<div class="panel-heading">
														</div>
														<div class="panel-body">
															<form role="form" action="/user/userpage"  method="post" name="imageupload">
																	<input type='file' name='uploadFile' class="file-upload" style="display: none;">
																	<input type="hidden" name="userNum" value='<c:out value="${userpage.userNum}"/>'>
																	<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
																	<c:set var="query" value="${requestScope['javax.servlet.forward.query_string']}" />
																	<input type='hidden' name='path' value="<c:out value='${path}'/>">	
																	<input type='hidden' name='query' value="<c:out value='${query}'/>">
																<div class='form-group uploadDiv'>
																	<ul>
																	</ul>
																</div>
																<div class="viewResult">
																</div>
																<c:if test="${ imageck.size() != 0}">
																	<c:if test="${user.userNum == userpage.userNum }">
																		<button type='submit' id='insertimage' class='btn btn-primary btn-sm' style="display:none; margin-left: 31%; margin-bottom: 3%;">Submit</button>
																		<button type='submit' id='removeBtn' data-oper='remove' class='btn btn-danger btn-sm' >Remove</button>
																	</c:if>
																</c:if>
															</form>
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<c:if test="${ imageck.size() == 0}">
											<c:if test="${user.userNum == userpage.userNum }">
												<a href="#"	class="d-block link-dark text-decoration-none dropdown-toggle"	id="dropdownUser1" data-bs-toggle="dropdown"aria-expanded="false"> 
										 			<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							 							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							 							<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
													</svg>
												</a>
												<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
													<li style="text-align: center;">
														<button type="button" onclick=document.all.uploadFile.click();><i class="bi bi-card-image"></i></button>
													</li>														
												</ul>
												<form role="form" action="/user/userpage" method="post"	name="imageupload" >
													<div class='form-group uploadDiv'>
														<input type='file' name='uploadFile' class="file-upload" style="display: none;">
													</div>
													<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
													<c:set var="query"	value="${requestScope['javax.servlet.forward.query_string']}" />
													<input type='hidden' name='path' value="<c:out value='${path}'/>">	
													<input type='hidden' name='query'value="<c:out value='${query}'/>">	
													<button type="submit" id='insertimage' class="btn btn-primary btn-sm" style="display:none; margin-left: 31%;">Submit</button>
												</form>
											</c:if>
											<c:if test="${user.userNum != userpage.userNum }">
												<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						 							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						 							<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
												</svg>
											</c:if>
										</c:if>
										<br>
										<div class="row">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-heading"></div>
													<div class="panel-body">
														<div class="uploadResult">
															<ul>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>																	
									<div class="h6 fw-bolder">	Following &nbsp;&nbsp; 
										<span  id="modal_show_followingList"><c:out value='${followingcnt}'/> </span></div> 
									<div class="h6 fw-bolder">Follower &nbsp;&nbsp;&nbsp;&nbsp; 
										<span id="modal_show_followerList"><c:out value='${followercnt}' /></span></div>
									<br/> 
									<a class="fs-5 px-2 link-dark" href="#!"><i	class="bi-twitter"></i></a> 
									<a class="fs-5 px-2 link-dark" href="#!"><i class="bi-facebook"></i></a> 
									<a class="fs-5 px-2 link-dark" href="#!"><i class="bi-linkedin"></i></a> 
									<a class="fs-5 px-2 link-dark" href="#!"><i class="bi-youtube"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- following Modal -->
				<div class="modal fade" id="followingModal" tabindex="-1" role="dialog"	aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel" style="margin-left: 40%;">Following</h5>
								<button type="button" id="close_following" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<c:forEach items="${followinglist}" var="fli">
									<div class="container ">
										<a class="text-decoration-none" id="modal_show_logintojion" href="/user/userpage?userNum=${fli.userNum}">
										<i style="margin-left: 15%;" class="bi bi-person-circle"></i> &nbsp;<c:out value="${fli.userRealName }"/></a>
										<br>
										<br>
									</div>
								</c:forEach>						
							</div>						
						</div>
					</div>
				</div>				
				<!-- follower Modal -->
				<div class="modal fade" id="followerModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel" style="margin-left: 40%;">Follower</h5>
								<button type="button" id="close_follower" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<c:forEach items="${followerlist}" var="flr">
									<div class="container">
										<a class="text-decoration-none" id="modal_show_logintojion" href="/user/userpage?userNum=${flr.userNum}">
										<i style="margin-left: 15%;" class="bi bi-person-circle"></i> &nbsp;<c:out value="${flr.userRealName }"/></a>
										<br>
										<br>
									</div>
								</c:forEach>						
							</div>						
						</div>
					</div>
				</div>				
				<div class="col-xl-8">
					<h2 class="fw-bolder fs-5 mb-4">Following Reviews</h2>
					<!-- News item-->
					<c:if test="${!empty socialreviewlist}">
						<c:forEach items="${socialreviewlist}" var="socialreview" begin="0" end="2" step="1" varStatus="status">
							<div class="mb-4">
								<div class="small text-muted"><c:out value="${socialreview.reviewDate }"/>
									<div><a class="text-decoration-none" id="modal_show_logintojion" href="/user/userpage?userNum=${socialreview.userNum}">
										<h5><c:out value="${socialreview.userRealName }"/></h5></a>
									</div>
								</div>
								<a class="link-dark" text-decoration-none" href="/wine/get?wno=${socialreview.wineNum}">
									<h4><c:out value="${socialreview.reviewContent }"/></h4>
								</a>
							</div>
						</c:forEach>
						<div class="text-end mb-5 mb-xl-0">
							<span id="modal_show_reviewList">More Reviews</span>
						</div>
					</c:if>					
					<c:if test="${empty socialreviewlist}">
						<h2>팔로잉이 없습니다.</h2>
					</c:if>
				</div>				
				<!-- review Modal -->
				<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel" style="margin-left: 45%;">Reviews</h5>
								<button type="button" id="close_review" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<c:forEach items="${socialreviewlist}" var="socialreview" >
									<div class="mb-4">
										<div class="small text-muted"><c:out value="${socialreview.reviewDate }"/>
											<div><a class="text-decoration-none" id="modal_show_logintojion" href="/user/userpage?userNum=${socialreview.userNum}">
												<h5><c:out value="${socialreview.userRealName }"/></h5></a>
											</div>
										</div>
										<a class="link-dark text-decoration-none" href="/wine/get?wno=${socialreview.wineNum}"><h4><c:out value="${socialreview.reviewContent }"/></h4></a>
									</div>
								</c:forEach>
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
			<!--  Content Row -->			
			<c:if test="${wish !=null}">
	            <div class="row gx-4 gx-lg-5">
	            <!-- swiper슬라이더 메인컨테이너 -->
	            	<div class="swiper-container"> 
	            	 <!-- 보여지는 영역 --> 
	            		<div class="swiper-wrapper"> 
			                <!--  Card One    -->              
			                <c:forEach items="${wish}" var="w">
			                	<div class="swiper-slide"> 
			                   		<div class="col mb-5">
			                    		<div class="card-list">
	                  						<div class="text-center">
	                     						<img src="http://klea-home.iptime.org:8081/<c:out value="${w.wineImageName}" />" height="350" width="150">
	                  						</div>
						                     <div class="card-body">
											      <p class="card-text"><b><c:out value="${w.wineTitle}" /></b></p>
											      <p class="card-text">생산지역 : <c:out value="${w.wineCountry}" /></p>
											      <p class="card-text">와인타입 : <c:out value="${w.wineType}" /></p>
											</div>
						                 	<div class="card-footer">
						                  		<a class="btn btn-outline-dark btn-sm" href="/wine/get?wno=${w.wineNum}">More Info</a>
						                  	</div>
	               						</div>
	                 				  </div>
	                 			  </div>
	             		   </c:forEach>
	               		 </div>
	                     <!-- 방향 버튼 상황에 따라 추가 삭제가능 --> 
	                     <div class="swiper-button-prev"></div> 
	                     <div class="swiper-button-next"></div> 
	               	</div>
            	 </div>
          	</c:if>
     	    <c:if test="${ empty wish}">
        		<h2>등록된 wishList가 없습니다.</h2>
            </c:if>             
		</div>
	</section>
 <script type="text/javascript">
$(document).ready(function() {
	
	$("#modal_show_followingList").click(function() {
     	$("#followingModal").modal("show");
     
     });
      
     $("#close_following").click(function() {
         $("#followingModal").modal("hide");
     });

     $("#modal_show_followerList").click(function() {
      	$("#followerModal").modal("show");
      
      });
       
      $("#close_follower").click(function() {
          $("#followerModal").modal("hide");
      });
      
      $("#modal_show_reviewList").click(function() {
    	  	$("#reviewModal").modal("show");
        
        });
         
        $("#close_review").click(function() {
            $("#reviewModal").modal("hide");
        });
  	
	
	var followingBtn = $("#followingBtn");
	var unfollowBtn = $("#unfollowBtn");
	
	followingBtn.on("click", function(e){
		var social = {
			userFollowingId:"${userpage.userNum }",
			userFollowerId:"${user.userNum}"
			};
		
		if(${user != null}){
			if("${user.userId}" != "${userpage.userId }"){
				socialService.add(social,function(result){
					location.reload();
				})
			}else{
				alert('자기 자신을 팔로잉 할 수 없습니다.')
			}
		}else{
			alert('로그인 후 이용해 주세요.')
			location.reload();
		}
		
		
	})
	
	
	unfollowBtn.on("click", function(e){
		var social = {
			userFollowingId:"${userpage.userNum }",
			userFollowerId:"${user.userNum}"
			};
		if("${user.userId}" != "${userpage.userId }"){
		socialService.remove(social,function(result){
			location.reload();
		})
		}else{
			alert('자기 자신을 팔로잉 할수 없습니다.')
		}
	})
	
	/* 파일 업로드 영역  */
	$("button[type='submit']").on("click",function(e){
		
	e.preventDefault()
		
	console.log("submit clocked")
	
	});
	
	var formObj=$("form[role='form']")
	
	var regex = new RegExp("(.*?)\.(jpg|png|jpeg|svg)$")
	
    var maxSize = 5242880;
    
	var cloneObj = $(".uploadDiv").clone()
	
      function checkExtension(fileName, fileSize) {
         if (fileSize >= maxSize) {
            alert("파일 크기 초과")
            return false
            }
         if (!regex.test(fileName)) {
            alert("jpg, png, jpeg, svg 이미지만 가능합니다.")
            return false
            }
         return true;
      }
	
	 $("input[type='file']").change(function(e){
         var formData = new FormData()
         var inputFile = $('input[name="uploadFile"]')
         var files = inputFile[0].files
         console.log(files);
         for (var i = 0; i < files.length; i++) {
            if (!checkExtension(files[i].name,   files[i].size)) {
               return false;
               }
         formData.append("uploadFile",files[i])
         }
         $.ajax({
             url : '/userupload/uploadAjaxAction',
             processData : false, /* 전달한 데이터틑 query string으로 만들지 말것 */
             contentType : false,
             data : formData,
             type : 'POST',
             dataType : 'json',
             success : function(result) {
                console.log(result)
                showUploadedFile(result)
       
                 }
          }); //$.ajax
	 }); //input change
     
	  function showUploadedFile(uploadResultArr) {
	         if(!uploadResultArr||uploadResultArr.length==0){
	        	 return
	        	 }
	         var uploadUL=$(".uploadResult ul")
			  $('#insertimage').css('display', 'block');
	          $('.uploadResult').css('display', 'none');
	         
	         var str = ''
	         $(uploadResultArr).each(function(i, obj) {
	            if (obj.image) {
	            	var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+ obj.uuid+ "_"+ obj.fileName);	                         
	             	str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>"
	                str +="<span>" +obj.fileName+ "</span>"
	                str +="<button type='button' data-file=\""+fileCallPath+"\" data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
	                str +="<img src='/userupload/display?fileName="+fileCallPath+"'>"
	                str +="</div></li>" 
	            } else {
	            	var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid+ "_"+ obj.fileName);
	                var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	                str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>"
	                str +="<span>" + obj.fileName + "</span>"
	                   str +="<button type='button' data-file=\""+fileCallPath+"\" data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
	                   str +="<img src='/resources/wine_bootstrap/upload_img/attach.png'>"
	                   str +="</div></li>"
	            }
	         })
	         uploadUL.append(str)	
	   }
	 
	  $(".uploadResult").on("click", "button", function(e){
		  console.log("delete file");    
		  var targetFile=$(this).data("file")
	         var type=$(this).data("type")
	         var targetLi=$(this).closest("li")
	         console.log(targetFile)
	         $.ajax({
	            url:'/userupload/deleteFile',
	            data: {fileName: targetFile, type: type},
	            dataType: 'text',
	            type: 'post',
	            success: function(result){
	               alert(result)
	               targetLi.remove()   
	            }
	         })  // $ajax
	      })

	  var formObj=$("form[role='form']")
         
      $('#removeBtn').on("click",function(e){
    	 	e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if(operation ==='remove'){
				formObj.attr("action","/user/imageremove");
				}
			formObj.submit();
		});  	
	  $("#insertimage").on("click",function(e){
		     e.preventDefault()
	         console.log("submit clocked")
	         var str =""
	         $(".uploadResult ul li").each(function(i, obj){
	            var jobj=$(obj)
	            console.dir(jobj)
	           	str +="<input type='hidden' name='profileList["+i+"].userNum' value='${user.userNum}'>"
	            str +="<input type='hidden' name='profileList["+i+"].profileFileName' value='"+jobj.data("filename")+"'>"
	            str +="<input type='hidden' name='profileList["+i+"].profileUuid' value='"+jobj.data("uuid")+"'>"
	            str +="<input type='hidden' name='profileList["+i+"].profileUploadPath' value='"+jobj.data("path")+"'>"
	            str +="<input type='hidden' name='profileList["+i+"].profileFileType' value='"+jobj.data("type")+"'>"
	         })
	         formObj.append(str).submit()
	      }) //파일 보내기
       var userNum ='<c:out value="${userpage.userNum}"/>';
      $.getJSON("/user/getAttachList",{userNum:userNum}, function(arr){
      
      console.log("ARRAY"+ arr);
      var str=''
          $(arr).each(function(i,obj){
        	  console.log("i"+ obj.profileUuid); 
        	  if (obj.profileFileType) {
                       var fileCallPath = encodeURIComponent(obj.profileUploadPath+ "/s_"+ obj.profileUuid+ "_"+ obj.profileFileName);
                       str +="<c:if test='${user.userNum == userpage.userNum }'>"
                       str +="<a href='#' class='d-block link-dark text-decoration-none dropdown-toggle' id='dropdownUser1' data-bs-toggle='dropdown' aria-expanded='false'> "
                       str +="<img src='/userupload/display?fileName="+fileCallPath+"'alt='mdo' width='150' height='150' class='rounded-circle'></a>"
                       str += "<ul class='dropdown-menu text-small' aria-labelledby='dropdownUser1'>"
                       str += "<li style='text-align: center;'><button type='button' onclick=document.all.uploadFile.click();><i class='bi bi-card-image'></i></button></li>"
                       str +="<li data-path='"+obj.profileUploadPath+"' data-uuid='"+obj.profileUuid+"' data-filename='"+obj.profileFileName+"' data-type='"+obj.profileFileType+"'><div>"
   	                   str +="</div></li></ul>"
   	                   str +="</c:if>" 
   	                   str +="<c:if test='${user.userNum != userpage.userNum }'>"
   	                   str +="<img src='/userupload/display?fileName="+fileCallPath+"'alt='mdo' width='150' height='150' class='rounded-circle'>"
   	                   str +="</c:if>"
                       console.log(obj.profileFileType)
                    } else {
                    	 str +="<li data-path='"+obj.profileUploadPath+"' data-uuid='"+obj.profileUuid+"' data-filename='"+obj.profileFileName+"' data-type='"+obj.profileFileType+"'><div>"
      	                 str +="<span>" + obj.profileFileName + "</span>"
       	                 str +="<img src='/resources/wine_bootstrap/upload_img/attach.png'>"
       	                 str +="</div></li>"
       	               console.log(obj.profileFileType)
                    }
               })
               $(".viewResult").html(str);
      }); //eng json
     
      
      
});  //document ready function

const swiper = new Swiper('.swiper-container', {
    //기본 셋팅
    //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
    direction: 'horizontal',
    //한번에 보여지는 페이지 숫자
    slidesPerView: 3,
    //페이지와 페이지 사이의 간격
    spaceBetween: 30,
    //드레그 기능 true 사용가능 false 사용불가
    debugger: false,
    //마우스 휠기능 true 사용가능 false 사용불가
    mousewheel: false,
    //반복 기능 true 사용가능 false 사용불가
    loop: true,
    //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
    centeredSlides: true,
    // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
    // effect: 'fade',
    
    
    //자동 스크를링
    autoplay: {
      //시간 1000 이 1초
      delay: 5000,
      disableOnInteraction: false,
     },
    
    //페이징
    pagination: {
      //페이지 기능
      el: '.swiper-pagination',
      //클릭 가능여부
      clickable: true,
    },

    //방향표
    navigation: {
      //다음페이지 설정
      nextEl: '.swiper-button-next',
      //이전페이지 설정
      prevEl: '.swiper-button-prev',
    },
    
  }); //swiper End

</script>
<%@include file="../includes/footer.jsp"%>
</body>
</html>