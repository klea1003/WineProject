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
	.password_warn {
		text-align: center;
		color: red;
		font-size: 5px;
	}
	.change_passwordck_input_re_1 {
		color: green;
		display: none;
		font-size: 5px;
		text-align: center;
	}

	.change_passwordck_input_re_2 {
		color: red;
		display: none;
		font-size: 5px;
		text-align: center;
	}
	.orginal_passwordck_input_re_1 {
		color: green;
		display: none;
		font-size: 5px;
		text-align: center;
	}

	.orginal_passwordck_input_re_2 {
		color: red;
		display: none;
		font-size: 5px;
		text-align: center;
	}
	.change_nickname_input_re_1 {
		color: green;
		display: none;
		font-size: 5px;
		text-align: center;
	}

	.change_nickname_input_re_2 {
		color: red;
		display: none;
		font-size: 5px;
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
	
	<div class="container">
		<div class="mt-4">
			<div class="col-md-12">
				<h2 class="settings-section-title text-sm-center">Your Settings</h2>
				<p class="text-medium">Below you can configure your account settings. The changes you make here will automatically be transfered to your app settings.</p>
				<p class="text-medium">
					<span class="bold">Have a question?</span>
				 	- Contact us at
					<a href="mailto:choiyepsep@naver.com">choiyepsep@naver.com</a>
				</p>
			</div>
		</div>
		
		<hr>
		
		<section class="section-bordered section-md mt-5">
			<div class="container">
				<h2 class="settings-section-title text-sm">
					NickName
					<span class="text-block header-smaller">Change your login credentials to 너와, In.</span>
				</h2>
				<div class="settings-email-password-field form-group mt-4">
					<h4>
						<label class="semi inflate text-small">NickName</label>
					</h4>
					<div class="row">
						<div class="col-sm-4">
							<div id="settings-email-placeholder"><c:out value='${setting.userNickName }'></c:out></div>
						</div>
						<div class="col-sm-3">
							<button class="btn btn-outline-secondary sm "  id="settings-change-nickname">Change NickName</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		
		<hr>
		
		<form class="user" id="userInfo_modify_form" method="post">
			<section class="section-bordered section-md mt-5">
					<div class="container">
					<h2 class="settings-section-title text-sm">Your RealName</h2>
					<div class="row">
						<div class="col-sm-4 form-group">
							<input type="text" name="userRealName" value="<c:out value='${setting.userRealName }'></c:out>" 
							class="settings-name-input form-control input-lg mt-2" autofocus="autofocus" heap-ignore="true">
						</div>
						<div class="col-sm-4 form-group">
								<button class="btn btn-outline-secondary sm mt-2"  id="settings-change-realname">Change RealName</button>
						</div>
					</div>
				</div>
			</section>
			
			<hr>
			
			<section class="section-bordered section-md mt-5">
				<div class="container">
					<div id="address-settings">					
						<h2>Address &amp; Phone Number
							<div>Can change your address information.</div>
												
						</h2>
						<div class="row">
							<div class="col-sm-7 mt-2">
								<label class="input-group-text" id="inputGroup-sizing-default" for="pickUpPhoneNum" style="display: none;"></label>
					  			<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="userPhoneNum" id="change_phonenum_input"
									pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" maxlength="13"	value="<c:out value='${setting.userPhoneNum }'/>"  onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" >
							</div>
							<div class="col-sm-5 mt-2">
								<button class="btn btn-outline-secondary form-control" id="settings-change-address">Change Address</button>	
							</div>												
							<div class="col-sm-7 mt-2">
								<input class="form-control" id="change_address_input_1" name="userAddress1" readonly="readonly" value="<c:out value='${setting.userAddress1 }'/>">
							</div>
							<div class="col-sm-5 mt-2">
								<input type="button" class="form-control" id="change_address_button" name="addrBtn" value="주소 찾기" onclick="execution_change_address()">
							</div>							
							<div class ="col-sm-12 mt-2">
								<input class="form-control" id="change_address_input_2" name="userAddress2"  value="<c:out value='${setting.userAddress2 }'/>"readonly="readonly">
							</div>							
							<div class ="col-sm-12 mt-2">
								<input class="form-control" id="change_address_input_3" name="userAddress3" value="<c:out value='${setting.userAddress3 }'/>"readonly="readonly">
							</div>
						</div>
					</div>
				</div>
			</section>
			<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
			<c:set var="query"	value="${requestScope['javax.servlet.forward.query_string']}" />
			<input type='hidden' name='path' value="<c:out value='${path}'/>">
			<input type='hidden' name='query' value="<c:out value='${query}'/>">
			<input type='hidden' name='userId' value="<c:out value='${setting.userId}'/>">
			<input type='hidden' name='userNum' value="<c:out value='${user.userNum}'/>">
		</form>
		
		<hr>
		
		<section class="section-bordered section-md mt-5">
			<div class="container">
				<h2 class="settings-section-title text-sm">
					Email &amp; Password
					<span class="text-block header-smaller">Change your login credentials to 너와, In.</span>
				</h2>
				<div class="settings-email-password-field form-group mt-4">
					<h4>
						<label class="semi inflate text-small">Email Address</label>
					</h4>
					<div class="row">
						<div class="col-sm-4">
							<div id="settings-email-placeholder"><c:out value='${setting.userEmail }'></c:out></div>
						</div>
						<div class="col-sm-3">
							<button class="btn btn-outline-secondary sm "  id="settings-change-email">Change Email</button>
						</div>
					</div>
				</div>
				<div class="settings-email-password-field form-group mt-4">
					<h4>
						<label class="semi inflate text-small">Password</label>
					</h4>
					<div class="row">
						<div class="col-sm-4">
							<div id="settings-email-placeholder">* * * * * * * *</div>
						</div>
						<div class="col-sm-3">
							<button class="btn btn-outline-secondary sm "  id="settings-change-password">Change Password</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<hr>
		
		<div class="mt-5" style="text-align: center;">
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
			<div class="mt-4" style="margin-left: 25%;">
				<form role="form" action="/user/settings" method="post"	name="imageupload" >
					<div class='form-group uploadDiv'>
						<div class="col-sm-8 ">
							<div class="input-group mb-5">
								<input type="file" class="form-control" name='uploadFile' >
								<button type="submit" id='insertimage' class="btn btn-outline-danger btn-sm"  >Submit</button>
								<button type='submit' id='removeBtn' data-oper='remove' class='btn btn-outline-secondary btn-sm' >Remove</button>
							</div>
						</div>
					</div>
					<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
					<c:set var="query"	value="${requestScope['javax.servlet.forward.query_string']}" />
					<input type='hidden' name='path' value="<c:out value='${path}'/>">	
					<input type='hidden' name='query'value="<c:out value='${query}'/>">
					<input type="hidden" name="userNum" value='<c:out value="${setting.userNum}"/>'>	
				</form>
			</div>
		</div>	
	</div> <!-- End Container  -->
	
	<!-- Email Modal -->
	<div class="modal fade" id="emailChangeModal" tabindex="-1" role="dialog"aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="margin-left: 7%;">Change your login credentials to 너와, In.</h5>
					<button type="button" id="close_email" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="form-group">
							<h5 >Existing Email</h5>
							<div id="settings-email-update-placeholder"><c:out value='${setting.userEmail }'></c:out></div>
						</div>
						<br>
						<form class="user" id="email_modify_form" method="post">
							<div class="mb-3 mt-2">
								<h5>New Email</h5>
								<input type="text" class="form-control" value="<c:out value='${setting.userEmail }'></c:out>" name="userEmail">
							</div>
							<div class="mb-3 mt-2">
								<h5>PassWord</h5>
								<input type="password" class="form-control" name="userPassword">
								<c:if test="${resultEmail == 0}">
									<div class="password_warn">비밀번호를 잘못 입력하셨습니다.</div>
								</c:if>
							</div>
							<br>
							<div class="mb-3 mt-2">
								<input type="button"  class="btn btn-outline-danger float-end" id="email_modify_button" value="저장하기">
							</div>
							<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
							<c:set var="query"	value="${requestScope['javax.servlet.forward.query_string']}" />
							<input type='hidden' name='path' value="<c:out value='${path}'/>">
							<input type='hidden' name='query' value="<c:out value='${query}'/>">
							<input type='hidden' name='userId' value="<c:out value='${setting.userId}'/>">
							<input type='hidden' name='userNum' value="<c:out value='${user.userNum}'/>">	
						</form>
					</div>
				</div>						
			</div>
		</div>
	</div>  <!-- End Email Modal -->
	
	<!-- Password Modal -->
	<div class="modal fade" id="passwordChangeModal" tabindex="-1" role="dialog"aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="margin-left: 7%;">Change your login credentials to 너와, In.</h5>
					<button type="button" id="close_password" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<br>
						<form class="user" id="password_modify_form" method="post">
							<div class="mb-3 mt-2">
								<h5>CURRENT PASSWORD</h5>
								<input type="password" class="form-control" id="original_password_input" >
								<span class="orginal_passwordck_input_re_1">기존 비밀번호가 일치합니다.</span> 
								<span class="orginal_passwordck_input_re_2">기존 비밀번호가 일치하지 않습니다.</span>
							</div>
							<div class="mb-3 mt-2">
								<h5>NEW PASSWORD</h5>
								<input type="password" class="form-control" id="change_password_input" name="userPassword">
							</div>
							<div class="mb-3 mt-2">
								<h5>PASSWORD CONFIRMATION</h5>
								<input type="password" class="form-control" id="change_passwordck_input" >
								<span class="change_passwordck_input_re_1">비밀번호가 일치합니다.</span> 
								<span class="change_passwordck_input_re_2">비밀번호가 일치하지 않습니다.</span>
							</div>
							<br>
							<div class="mb-3 mt-2">
								<input type="button"  class="btn btn-outline-danger float-end" id="password_modify_button" value="저장하기">
							</div>
							<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
							<c:set var="query"	value="${requestScope['javax.servlet.forward.query_string']}" />
							<input type='hidden' name='path' value="<c:out value='${path}'/>">	
							<input type='hidden' name='query' value="<c:out value='${query}'/>">
							<input type='hidden' name='userId' value="<c:out value='${setting.userId}'/>">
							<input type='hidden' name='userNum' value="<c:out value='${user.userNum}'/>">
						</form>
					</div>
				</div>						
			</div>
		</div>
	</div>	<!-- End Password Modal -->	
	
	<!-- NickName Modal -->
	<div class="modal fade" id="nickNameChangeModal" tabindex="-1" role="dialog"aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="margin-left: 7%;">Change your login credentials to 너와, In.</h5>
					<button type="button" id="close_nickName" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="form-group">
							<h5 >Existing NickName</h5>
							<div id="settings-nickname-update-placeholder"><c:out value='${setting.userNickName }'></c:out></div>
						</div>
						<br>
						<form class="user" id="nickName_modify_form" method="post">
							<div class="mb-3 mt-2">
								<h5>New NickName</h5>
								<input type="text" class="form-control" id="change_nickname_input" value="<c:out value='${setting.userNickName }'></c:out>" name="userNickName">
								<span class="change_nickname_input_re_1">사용 가능한 닉네임입니다.</span> 
								<span class="change_nickname_input_re_2">닉네임이 이미 존재합니다.</span> 
							</div>
							<div class="mb-3 mt-2">
								<h5>PassWord</h5>
								<input type="password" class="form-control" name="userPassword">
								<c:if test="${resultNickName == 0}">
									<div class="password_warn">비밀번호를 잘못 입력하셨습니다.</div>
								</c:if>
							</div>
							<br>
							<div class="mb-3 mt-2">
								<input type="button"  class="btn btn-outline-danger float-end" id="nickName_modify_button" value="저장하기">
							</div>
							<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
							<c:set var="query"	value="${requestScope['javax.servlet.forward.query_string']}" />
							<input type='hidden' name='path' value="<c:out value='${path}'/>">
							<input type='hidden' name='query' value="<c:out value='${query}'/>">
							<input type='hidden' name='userId' value="<c:out value='${setting.userId}'/>">
							<input type='hidden' name='userNum' value="<c:out value='${user.userNum}'/>">	
						</form>
					</div>
				</div>						
			</div>
		</div>
	</div>  <!-- End NickName Modal -->						

<%@include file="../includes/footer.jsp"%>
</body>
<script type="text/javascript">

	$("#settings-change-email").click(function() {
		$("#emailChangeModal").modal("show");
	});
	
	$("#close_email").click(function() {
	    $("#emailChangeModal").modal("hide");
	});
	
	
	$("#settings-change-password").click(function() {
		 $("#passwordChangeModal").modal("show");
	}); 
	 
	$("#close_password").click(function() {
		
	    $("#passwordChangeModal").modal("hide");
	});
	
	$("#settings-change-nickname").click(function() {
		
		$("#nickNameChangeModal").modal("show");
	});
	
	$("#close_nickName").click(function() {
		
	    $("#nickNameChangeModal").modal("hide");
	});
	
	$("#email_modify_button").click(function(){
		
	    $("#email_modify_form").attr("action", "/user/emailModify");
	    
	    $("#email_modify_form").submit();
	    
	});

	$("#password_modify_button").click(function(){
		
		if(changePasswordCheck && changePasswordckcorCheck){
			
	        $("#password_modify_form").attr("action", "/user/passwordModify");
	        
	        $("#password_modify_form").submit(); 
		}
		return false;
	});
	
	$("#settings-change-realname").click(function(){
		
		 $("#userInfo_modify_form").attr("action", "/user/userInfoModify");
	     
	     $("#userInfo_modify_form").submit(); 
	});
	
	$("#settings-change-address").click(function(){
		
		 $("#userInfo_modify_form").attr("action", "/user/userInfoModify");
	     
	     $("#userInfo_modify_form").submit(); 
	});
	
	$("#nickName_modify_button").click(function(){
		
		if(changeNickNameckCheck){
		 
			$("#nickName_modify_form").attr("action", "/user/nickNameModify");
		    
		    $("#nickName_modify_form").submit();
		}
		
		return false;
	    
	});


	var changePasswordCheck = false;
	
	var changePasswordckcorCheck = false; // 비밀번호 일치/불일치 확인   

	var changeNickNameckCheck = false;

	$('#original_password_input').on("propertychange change keyup paste input",function() {
		
		var originalPassword = 	<c:out value='${setting.userPassword}'/>;
		console.log(originalPassword)
		var origianlPasswordInput = $('#original_password_input').val();
		
		if (originalPassword == origianlPasswordInput) {
			$('.orginal_passwordck_input_re_1').css('display', 'block');
			$('.orginal_passwordck_input_re_2').css('display', 'none');
			changePasswordCheck = true;
		} else {
			$('.orginal_passwordck_input_re_1').css('display', 'none');
			$('.orginal_passwordck_input_re_2').css('display', 'block');
			changePasswordCheck = false;
		}
		
	});

	$('#change_passwordck_input').on("propertychange change keyup paste input",function() {
	
		var change_password = $('#change_password_input').val();
		var change_passwordck = $('#change_passwordck_input').val();
	
		if (change_password == change_passwordck) {
			$('.change_passwordck_input_re_1').css('display', 'block');
			$('.change_passwordck_input_re_2').css('display', 'none');
			changePasswordckcorCheck = true;
		} else {
			$('.change_passwordck_input_re_1').css('display', 'none');
			$('.change_passwordck_input_re_2').css('display', 'block');
			changePasswordckcorCheck = false;
		}
	
	});
	
	$('#change_nickname_input').on("propertychange change keyup paste input",
			
		function() {

			var userNickName = $('#change_nickname_input').val();

			var data = {
				userNickName: userNickName
			}

			$.ajax({
				type: "post",
				url: "/user/userNickNamechk",
				data: data,
				success: function(result) {

					if (result != 'fail') {
						$('.change_nickname_input_re_1').css("display", "inline-block");
						$('.change_nickname_input_re_2').css("display", "none");
						changeNickNameckCheck = true;
					} else {
						$('.change_nickname_input_re_2').css("display", "inline-block");
						$('.change_nickname_input_re_1').css("display", "none");
						changeNickNameckCheck = false;
					}
				}// success 종료

			}); // ajax 종료	

		});// function 종료


	$(document).ready(function() {
		
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
		
		var userNum ='<c:out value="${setting.userNum}"/>';
		
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
		   
		var resultNickName = '${resultNickName}'; //d이게 0일때만
		 
		 
		
		if(resultNickName ==0 && resultNickName != ''){
			alert('0번째')
			if (resultNickName === ''|| history.state) {
				alert('1번째 : '+history.state);
				
			return;
			
			} 
			
			$("#nickNameChangeModal").modal("show");
		}   
		
		var resultEmail = '${resultEmail}';
		
		if(resultEmail == 0 && resultEmail !=''){
			
			if (resultEmail === '' || history.state) {
				alert('2번째 : '+history.state);
				
			return;
			
			} 
			
			$("#emailChangeModal").modal("show");
		} 
		
	});  //document ready function
	

	/* 다음 주소 연동 */
	function execution_change_address(){
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
                $("#change_address_input_1").val(data.zonecode);
             
                
                $("#change_address_input_2").val(addr);
                // 커서를 상세주소 필드로 이동한다.
              
                
                $("#change_address_input_3").attr("readonly",false);
             
                $("#change_address_input_3").focus();
	        }
	 
	    }).open();   
	}
</script>
</html>