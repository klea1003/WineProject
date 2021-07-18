<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너와, IN</title>
<script type="text/javascript"	src="/resources/wine_bootstrap/js/social.js"></script>


<style type="text/css">

.rating {
	
	color: #ffcc00;
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
.rating_text{
 display: -webkit-box;
 overflow: hidden; 
 text-overflow: ellipsis; 
 white-space: normal;
 -webkit-line-clamp: 2;
 -webkit-box-orient: vertical;
}
.socialBtn{
	border-radius: 80px;
    background: #a11122;
    color: #fff;
    width: 7rem;
    height: 3rem;
    border: 1px solid #fff;
    
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
				<span style="font: italic bold 1em/0.5em Georgia, serif ;"><c:out value='${userpage.userNickName }' />님의 Wine</span>
				<c:if test="${ user != null}">
					<c:if test="${ followck != null}">
						<div class="btn-group">
							<button class="socialBtn" id='unfollowBtn' type="button">
								팔로잉<i class="bi bi-person-check-fill"></i>
							</button>
						</div>
					</c:if>
					<c:if test="${ followck == null}">
						<div class="btn-group">
							<button class="socialBtn" id='followingBtn' type="button">
								팔로우<i class="bi bi-person-plus-fill"></i>
							</button>
						</div>
					</c:if>
				</c:if>				
				<c:if test="${ user == null}">
					<div class="btn-group">
						<button class="socialBtn" id='followingBtn' type="button">
							팔로우<i class="bi bi-person-plus-fill"></i>
						</button>
					</div>
				</c:if>
			</h1>
		</div>
	</section>
	<section class="py-5 bg-light" >
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
															<div class="viewResult">
															</div>																
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<c:if test="${ imageck.size() == 0}">											
								 			<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					 							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					 							<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
											</svg>					
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
									<div>	
										<button  id="modal_show_followingList" type="button" class="fw-bolder btn btn-outline-dark rounded-pill" >
											Following <span class="badge rounded-pill bg-light text-dark">
											<c:out value='${followingcnt}'/> </span>
										</button>									
										<button  id="modal_show_followerList" type="button" class="fw-bolder btn btn-outline-dark rounded-pill" >
											Follower <span class="badge rounded-pill bg-light text-dark">
											<c:out value='${followercnt}' /></span>
										</button>
									</div>
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
										<i style="margin-left: 15%;" class="bi bi-person-circle"></i> &nbsp;<c:out value="${fli.userNickName }"/></a>
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
										<i style="margin-left: 15%;" class="bi bi-person-circle"></i> &nbsp;<c:out value="${flr.userNickName }"/></a>
										<br>
										<br>
									</div>
								</c:forEach>						
							</div>						
						</div>
					</div>
				</div>				
				<div class="col-xl-8">
					<h2 class="fw-bolder fs-5 mb-4">Following Ratings</h2>
					<!-- Rating item-->
					<c:if test="${!empty socialreviewlist}">
						<c:forEach items="${socialreviewlist}" var="socialreview" begin="0" end="2" step="1" varStatus="status">
							<div class="mb-2" style="width: 800px; height:130px; ">
								<div >
									<h5><span style="font: italic bold 1em/0.5em Georgia, serif ;"><c:out value="${socialreview.wineTitle }"/></span></h5>
								</div>
								
								<div style="float:left; margin-left: 20px;">
									<img src="http://klea-home.iptime.org:8081/<c:out value="${socialreview.wineImageName}" />"  height="70" width="30">
								</div>
								<div class="rating_text" style="float:right; margin-top:5px; width: 730px;">
									<h5><c:out value="${socialreview.reviewContent }"/></h5>
								</div>
							</div>
						</c:forEach>
						<div class="text-end mb-5 mb-xl-0">
							<button type="button" id="modal_show_reviewList" class="btn btn-outline-secondary sm">More Rating</button>
						</div>
					</c:if>					
					<c:if test="${empty socialreviewlist}">
						<h4>This user hasn't following listed and any users yet</h4>
					</c:if>
				</div>				
				<!-- Rating Modal -->
				<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h2 class="modal-title fw-bolder" id="exampleModalLabel" style="margin-left: 45%;">Ratings</h2>
								<button type="button" id="close_review" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class=" modal-body followingreview">
					
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
							<c:if test="${ getWishListCnt < 4 }">              
				                <c:forEach items="${wish}" var="w">
				                	<div style="width: 344px; margin-left: 90px;"> 
				                   		<div class="col mb-5">
				                    		<div class="card-list">
		                  						<div class="text-center">
		                     						<img src="http://klea-home.iptime.org:8081/<c:out value="${w.wineImageName}" />" height="350" width="150">
		                  						</div>
							                     <div class="card-body">
												      <p ><b><c:out value="${w.wineTitle}" /></b></p>
												      <p ><h6>생산지역 : <c:out value="${w.wineCountry}" /></h6></p>
												      <p ><h6>와인타입 : <c:out value="${w.wineType}" /></h6></p>
												</div>
							                 	<div class="card-footer text-center">
							                  		<button class="btn btn-outline-danger btn-sm" type="button" onclick="location.href='/wine/get?wno=${w.wineNum}'">
							                  		More Info</button>
							                  		<button class="btn btn-outline-secondary btn-sm" type="button" onclick="location.href='/cart/insert?wineNum=${w.wineNum}&wineQty=1'">
													Add Cart</button>
							                  	</div>
		               						</div>
		                 				</div>
		                 			</div>
								</c:forEach>
							</c:if>
							<c:if test="${ getWishListCnt > 3 }">
				         	   <c:forEach items="${wish}" var="w">
			                	<div class="swiper-slide"> 
			                   		<div class="col mb-5">
			                    		<div class="card-list">
	                  						<div class="text-center">
	                     						<img src="http://klea-home.iptime.org:8081/<c:out value="${w.wineImageName}" />" height="350" width="150">
	                  						</div>
						                     <div class="card-body">
											      <p ><b><c:out value="${w.wineTitle}" /></b></p>
											      <p ><h6>생산지역 : <c:out value="${w.wineCountry}" /></h6></p>
											      <p ><h6>와인타입 : <c:out value="${w.wineType}" /></h6></p>
											</div>
						                 	<div class="card-footer">
						                  		<button class="btn btn-outline-danger btn-sm" type="button" onclick="location.href='/wine/get?wno=${w.wineNum}'">
						                  		More Info</button>
						                  		<button class="btn btn-outline-secondary btn-sm" type="button" onclick="location.href='/cart/insert?wineNum=${w.wineNum}&wineQty=1'">
												Add Cart</button>
						                  	</div>
	               						</div>
	                 				  </div>
	                 			  </div>
				             	</c:forEach>							
							</c:if> 		             		  
	               		 </div>
	               		 <c:if test="${ getWishListCnt > 3 }">
	                     <!-- 방향 버튼 상황에 따라 추가 삭제가능 --> 
	                     	<div class="swiper-button-prev"></div> 
	                     	<div class="swiper-button-next"></div>
	                     </c:if> 
	               	</div>
            	 </div>
          	</c:if>
     	    <c:if test="${ empty wish}">
        		<h4 style="font-style: bold;">This user hasn't wish listed any wines yet</h4>
            </c:if>             
		</div>
	</section>
 	<form id="actionForm" action="/user/userpage" method="get">
		<input type="hidden" name="pageNum" value="${pageReviewMaker.crire.pageNum}">
		<input type="hidden" name="amount" value="${pageReviewMaker.crire.amount}">
		<input type="hidden" name="totalPageNum" value="${pageReviewMaker.totalPageNum}">
	</form>
<%@include file="../includes/footer.jsp"%>
</body>
<script type="text/javascript">
$(document).ready(function() {
	
	var followingcnt = <c:out value='${followingcnt}'/>;
	
	var followercnt = <c:out value='${followercnt}' />;
	
	if(followingcnt != 0){
		$("#modal_show_followingList").click(function() {
	    	$("#followingModal").modal("show");
		});
	}
	
    $("#close_following").click(function() {
        $("#followingModal").modal("hide");
	});

    if(followercnt !=0){
    	$("#modal_show_followerList").click(function() {
     		$("#followerModal").modal("show");
		});
    }

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
	
	var userNumValue = '<c:out value="${userpage.userNum}"/>'
	
	var ratingUL = $(".followingreview");
		
	showList(1);	
	
	function getListRating(param, callback, error) {
		var userNum = param.userNum;
		var page = param.page || 1;
		
		$.getJSON("/social/pages/" + userNum + "/" + page + ".json",
			function(data) {
					
				if (callback) {
				   callback(data.socialReviewCnt, data.list);
				}
			}).fail(function(xhr, status, err) {
		if (error) {
			error();
			}
		});
	} 
	
	function showList(page) {
		
		getListRating({userNum :userNumValue,page : page|| 1},			
		
		function(socialReviewCnt, list) {
			console.log("socialReviewCnt: "+ socialReviewCnt)
			console.log("list: "+list)
	      		
			if(page==-1) {
				pageNum=Math.ceil(socialReviewCnt/10.0)
				showList(pageNum)
				return
	        } 
			var str = "";
	            
			if (list == null|| list.length == 0) {
				return;
			}
			for (var i = 0, len = list.length || 0; i < len; i++) {
				
				str += "<div class='card mb-4'style='padding-bottom:2%;'>" //카드 영역
				
				str += "<div class='small text-muted mt-4 mb-4' style='padding-left: 2%;' data-reviewNum="+list[i].reviewNum+"> "; //타이틀 영역
				str += "<a class='text-dark' href='/wine/get?wno="+list[i].wineNum+"'>"; //타이틀 a태그 영역
				str += "<span class='fw-bold' style='font: italic bold 2em/1em Georgia, serif ;'> "+list[i].wineTitle+"</span></a>"; //타이틀 a태그 영역 끝
				str +="</div>"; //타이틀 영역 끝
				 
				str += "<div>"; //우측에 대한 영역
				
				str += "<div style='height: 350px; width:23%; margin-left:2%; float:left;'>"; //이미지 영역
				str += "<a href='/wine/get?wno="+list[i].wineNum+"'>";
				str +=" <img src='http://klea-home.iptime.org:8081/" +list[i].wineImageName+ "'  height='350' width='150'>";
	           	str += "</a>";
				str += "</div>";  //이미지 영역 끝
				
				str += "<div  style='text-align:left; margin-right:2%; '>"; //닉네임, 리뷰데이트 우측 정렬 영역
				str += "<span class='rating fw-bold'><i class='bi bi-star-fill'></i>"+list[i].reviewRating+"</span>";
				str +=" <a class='text-decoration-none text-dark' id='modal_show_logintojion' href='/user/userpage?userNum="+list[i].userNum+"'>";
				str +="<span class='fw-bold' style='font: italic bold 1.3em/1em Georgia, serif ;'>"+list[i].userNickName+"<span></a>";
				str += "<span class='fw-bold'>("+list[i].ratingCnt+" ratings)</span>";
				str +=" <div style='text-align:right;'> "+list[i].reviewDate+"</div>";
				str +="</div>";  //닉네임, 리뷰데이트 우측 정렬 영역 끝
				
				str += "<div class='card bg-light p-2 mt-2' style='height: 290px; width:73%; margin-right:2%; float:left'> "; //리뷰 컨텐츠 영역
	          	str += "<h5>"+list[i].reviewContent+"</h5> "; 
	           	str += "</div>"; //리뷰 컨텐츠 영역 끝
	           	
	           
	            str += "</div>"; //우측에 대한 영역 끝
	            
	            str += "</div>"; //카드 영역 끝
			}
			ratingUL.append(str);
		});
			
	}// end showList
	
	
	
	var actionForm = $("#actionForm");
		 
	$('#reviewModal').scroll(function() {
	
		console.log("modalscroll");
		if($(this).scrollTop() + $(this).innerHeight() + 1 >= $(this)[0].scrollHeight){
			
			console.log("modaltest");
	
			
			var currentPageNum = parseInt(actionForm.find("input[name='pageNum']").val());
			var totalPageNum = parseInt(actionForm.find("input[name='totalPageNum']").val());
			
			if(currentPageNum +1 <= totalPageNum){	
				
				actionForm.find("input[name='pageNum']").val(currentPageNum +1);
				
				var currentPageNum = parseInt(actionForm.find("input[name='pageNum']").val());
				
				showList(currentPageNum)
			}
		}
	})
	
	$('#reviewModal').on('hidden.bs.modal', function (e) {
		
		actionForm.find("input[name='pageNum']").val(currentPageNum = 1);
		
		var currentPageNum = parseInt(actionForm.find("input[name='pageNum']").val());
		
		ratingUL.empty();
		
		showList(1);
		
	});
	 
	/* 파일 업로드 영역  */
	$("button[type='submit']").on("click",function(e){
		
		e.preventDefault()
		
		console.log("submit clocked")
	
	});
	
	var formObj=$("form[role='form']")
	
	var regex = new RegExp("(.*?)\.(jpg|png|jpeg|svg|PNG)$")
	
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
		
		console.log("불러오기 성공");
		
		console.log("ARRAY"+ arr);
		
		var str=''
		
		$(arr).each(function(i,obj){
			console.log("i"+ obj.profileUuid); 
			if (obj.profileFileType) {
				var fileCallPath = encodeURIComponent(obj.profileUploadPath+ "/s_"+ obj.profileUuid+ "_"+ obj.profileFileName);
				str +="<div data-path='"+obj.profileUploadPath+"' data-uuid='"+obj.profileUuid+"' data-filename='"+obj.profileFileName+"' data-type='"+obj.profileFileType+"'></div><div>"
				str +="<img src='/userupload/display?fileName="+fileCallPath+"'alt='mdo' width='150' height='150' class='rounded-circle'>"
				str +="</div>"
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
</html>