<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp" %>
<style>
.uploadResult {
   width: 100%;
   background-color: #ddd;
}

.uploadResult ul {
   display: flex;
   flex-flow: row;
   justify-content: center;
   align-items: center;
}

.uploadResult ul li {
   list-style: none;
   padding: 5px;
}

.uploadResult ul li img {
   width: 20px;
}

.uploadResult ul li span {
   color: white;
}

.bigPictureWrapper {
   position: absolute;
   display: none;
   justify-content: center;
   align-items: center;
   top: 0%;
   height: 100%;
   width: 100%;
   background-color: gray;
   z-index: 100;
   background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
   position: relative;
   display: flex;
   justify-content: center;
   align-items: center;
}

.bigPicture img {
   width: 400px;
}

.w-50{
	margin-top: 7%;
	margin-left: 25%;
}
</style>

<script>
$(document).ready(function(e) {
	//form 전송 시 <input type = 'hidden'> 태그들을 첨부된 파일의 수 만큼 생성해서 같이 전송
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log("submit clicked");
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			console.dir(jobj);
			
			str += "<input type = 'hidden' name = 'attachList["+i+"].fileName' value = '" + jobj.data("filename")+"'>";
			str += "<input type = 'hidden' name = 'attachList["+i+"].uuid' value = '" + jobj.data("uuid") + "'>";
			str += "<input type = 'hidden' name = 'attachList["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
			str += "<input type = 'hidden' name = 'attachList["+i+"].fileType' value = '" + jobj.data("type") + "'>";
	
		});
		formObj.append(str).submit();
	});//submit button event
	
	//uploadAjax의 checkExtension 부분 복사
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없음");
			return false;
		}
		return true;
	}//checkExtension
	
   $("input[type='file']").change(function(e){
      //FormData 사용
      var formData = new FormData();
      //선택된 파일
      var inputFile = $("input[name='uploadFile']");
      var files = inputFile[0].files;
      console.log(files);
   
      //formData에 파일데이터 추가
      for(var i = 0; i <files.length;i++){
         //파일의 확장자와 크기 검사
         if(!checkExtension(files[i].name,files[i].size)){
            return false;
         }
         formData.append("uploadFile",files[i]);
      }
      console.log("files.length : "+ files.length);
      
      $.ajax({
         url:'/uploadAjaxAction',
         processData:false,
         contentType:false,
         data:formData,
         type:'POST',
         dataType:'json', 
         success:function(result){
            alert("Uploaded");
            console.log(result)
            showUploadedFile(result);
         }
      });//$.ajax
  
		function showUploadedFile(uploadResultArr){
			  if(!uploadResultArr || uploadResultArr.length == 0){return ;}
			  var uploadUL = $(".uploadResult ul");
			  var str = "";
			$(uploadResultArr).each(function(i, obj) {
				if(!obj.image) {	//이미지가 아닌 경우
					
					  var fileCallPath = encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
					  str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
			          + obj.fileName + "'data-type='" + obj.image + "'><div>";
			          str += "<span> "+ obj.fileName+"</span>";
			          str += "<button type='button' data-file=\'"+ fileCallPath +"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			          str += "<img src='/resources/images/2.png'>";
			          str += "</div></li>";
			        
		    		   
				} else { //이미지인 경우
					
					  var fileCallPath = encodeURIComponent( obj.uploadPath+"/s_"+ obj.uuid +"_"+obj.fileName);            
			          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			          str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
			          + obj.fileName + "'data-type='" + obj.image + "'><div>";				          
			          str += "<span> "+ obj.fileName+"</span>";
			          str += "<button type='button' data-file=\'"+ fileCallPath +"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			          str += "<img src='/display?fileName="+ fileCallPath +"'>";
			          str += "</div></li>";
				}
			});
			uploadUL.append(str);
		}//showUploadedFile
		
	  //'x'표시 이벤트 처리
	  $(".uploadResult").on("click", "button", function(e){
	  var targetFile = $(this).data("file");
	  var type = $(this).data("type");
	  var targetLi = $(this).closest("li");
	  
	  $.ajax({
	  	url : '/deleteFile',
	  	data : {fileName : targetFile, type : type},
	  	dataType : 'text',
	  	type : 'POST',
	  		success : function(result) {
	  			alert(result);
	  			targetLi.remove();
	  		}
	  });//$.ajax
  });//uploadResult
		 
		
   });
    

});//end javascript
</script>

<body>

	<section class="py-5">
		<div class="container px-3 my-3">
			<div class="text-center mb-5">
            <h1 class="fw-bolder">Q&A Register</h1>
            </div>
			<div class="container-fluid">
				<div class="w-50">
					<form role="form" id="form-empty" action="/board/register" method="post" autocomplete="off">
					<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>시큐리티 --%>
					<div class="form-group">
						<h5 class="fw-bold">Title</h5><input class="form-control" name='title'>
					</div><br>
					 <input type="hidden" name="boardType" value="Q&A"/>
					
					 <div class='form-group mb-3'>
                  		<h5 class="fw-bold">Content</h5>
                  			<textarea class='form-control' rows='8' name='content'></textarea>
               		 </div>
					
					<div class="form-group mb-3">
						<h5 class="fw-bold">Writer</h5>
						<input class='form-control' name='writer' value="${user.userNickName }" readonly='readonly'>

					</div>
					
					<!-- File attach -->
					<div class="row mb-3">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<h5 class="fw-bold">File Attach</h5>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="form-group uploadDiv">
										<input type="file" name='uploadFile' multiple>
									</div>
									
									<div class='uploadResult'>
										<ul>
										
										</ul>
									</div>
								
								</div>
							</div>
						</div>
					</div>
					<!-- File attach End -->
					
					<button type="submit" class="btn btn-outline-danger">Submit</button>
					<button type="reset" class="btn btn-outline-dark">Reset</button>
					</form>
				
				</div>
			</div>
		</div>
	
	</section>
	<%@include file="../includes/footer.jsp" %>
</body>
