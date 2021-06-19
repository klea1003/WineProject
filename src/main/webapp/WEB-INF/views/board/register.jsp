<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> --%>
<jsp:include page="../includes/header.jsp" flush="false"></jsp:include>
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
</style>

<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		
		console.log("submit clicked");
	});//sumbit button event
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
	var maxSize = 5242880;
	var cloneObj = $(".uploadDiv").clone()
	function checkExtension(fileName, fileSize) {
   		if (fileSize >= maxSize) {
      		alert("파일 크기 초과")
      		return false
      		}
   		if (regex.test(fileName)) {
      		alert("해당 종류의 파일은 업로드 할 수 없음")
      		return false
      		}
   			return true;
		}
	
		 var csrfHeaderName="${_csrf.headerName}"
	     var csrfTokenValue="${_csrf.token}"
	      
	      $("input[type='file']").change(function(e){
	         var formData = new FormData()
	         var inputFile = $('input[name="uploadFile"]')
	         var files = inputFile[0].files
	         console.log(files);
	         for (var i = 0; i < files.length; i++) {
	            if (!checkExtension(files[i].name,   files[i].size)) {
	               return false;}
	         formData.append("uploadFile",files[i])
	         }
	         console.log("files.length : "+ files.length)
	         
	         $.ajax({
	            url : '/uploadAjaxAction',
	            processData : false, /* 전달한 데이터틑 query string으로 만들지 말것 */
	            contentType : false,
	            beforeSend:function(xhr) {
	               xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	            },
	            data : formData,
	            type : 'POST',
	            dataType : 'json',
	            success : function(result) {
	               console.log(result)
	               showUploadedFile(result)
	               //alert("Uploaded")
	                //$(".uploadDiv").html(cloneObj.html())
	                }
	         }); //ajax
	      });
	    
		function showUploadedFile(uploadResultArr) {
	        if(!uploadResultArr||uploadResultArr.length==0){return;} 
	    	var uploadUL = $(".uploadResult ul");
	    	
	    	
	    	var str = ''
	         $(uploadResultArr).each(function(i, obj) {
	            if (!obj.image) {
	            	//이미지가 아닌경우	            	
	            var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid+ "_"+ obj.fileName);
	            str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
	            str +="<span>"+obj.fileName+"</span>";
	            str +="<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	            str +="<img src='/resources/images/attach.png'>"
	            str +="</div></li>";
	            } else {
	               //이미지인 경우
	               var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+ obj.uuid+ "_"+ obj.fileName);
	               str +="<li  data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
	               str +="<span>"+obj.fileName+"</span>";
	               str +="<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	               str +="<img src='/display?fileName="+fileCallPath+"'>";
	               str +="</div></li>";
	            }
	         });
	         uploadUL.append(str);
	      }
		
		$(".uploadResult").on("click", "button", function(e){
			
			console.log("delete file");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url:'/deleteFile',
				data:{fileName:targetFile, type:type},
				beforeSend:function(xhr) {
		                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		             },
				
				dataType:'text',
				type:'post',
					success:function(result){
						alert(result);
						
						targetLi.remove();
				}
			}); //$ajax
		}); //uploadResult
		
		
		$("button[type='submit']").on("click", function(e){
		
			e.preventDefault(); console.log("submit clicked");
			var str="";
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				str +="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str +="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str +="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str +="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			});
			
			formObj.append(str).submit();
		});
		
		
	  
	 
});



</script>

<!-- 위가 header.jsp -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/board/register" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="form-group">
						<label>Title</label><input class="form-control" name='title'>
					</div>
					
					 <div class='form-group'>
                  		<label>Content</label>
                  			<textarea class='form-control' rows='3' name='content'></textarea>
               		 </div>
					
					<div class="form-group">
						<label>Writer</label>
						<input class='form-control' name='writer' value='<sec:authentication property="principal.username"/>'readonly="readonly">

					</div>
					
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="reset" class="btn btn-danger">Reset</button>




				</form>
				<!-- /.table-responsive -->

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- 새로 추가하는 부분 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">File Attach</div>
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
				<!-- end panel body -->
			</div>
		</div>
	</div>

<!-- /.row -->

<!-- /.row -->

<!-- /.row -->
<jsp:include page="../includes/footer.jsp" flush="false"></jsp:include>