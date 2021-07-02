<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
   width: 400px;
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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
   $(document).ready(function() {
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

      $('#uploadBtn').on("click",function(e) {
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
            url : '/userupload/uploadAjaxAction',
            processData : false, /* 전달한 데이터틑 query string으로 만들지 말것 */
            contentType : false,
            data : formData,
            type : 'POST',
            dataType : 'json',
            success : function(result) {
               console.log(result)
               showUploadedFile(result)
               //alert("Uploaded")
               $(".uploadDiv").html(cloneObj.html())}
         })
      })

      var uploadResult = $(".uploadResult ul")
      function showUploadedFile(uploadResultArr) {
         var str = ''
         $(uploadResultArr).each(function(i, obj) {
            if (!obj.image) {
            var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid+ "_"+ obj.fileName);
            str += "<li><div><a href='/userupload/download?fileName="+ fileCallPath+ "'><img src='/resources/wine_bootstrap/upload_img/attach.png'>"+ obj.fileName
               + "</a><span data-file=\""+fileCallPath+"\" data-type='file'>X</span></div></li>"
            } else {
               //str +="<li>" + obj.fileName + '</li>'
               var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+ obj.uuid+ "_"+ obj.fileName);
               var originPath = obj.uploadPath   + "/"+ obj.uuid+ "_"+ obj.fileName
               originPath = originPath.replace(new RegExp(/\\/g),"/")
               str += "<li><a href=\"javascript:showImage(\'"+ originPath+ "\')\"><img src='/userupload/display?fileName="+ fileCallPath
                     + "'></a><span data-file=\""+fileCallPath+"\" data-type='image'>X</span></li>"
            }
         })
         uploadResult.append(str)
      }
                  
      $(".uploadResult").on("click", "span", function(e){
         var targetFile=$(this).data("file")
         var type=$(this).data("type")
         console.log(targetFile)
         $.ajax({
            url:'/userupload/deleteFile',
            data: {fileName: targetFile, type: type},
            dataType: 'text',
            type: 'post',
            success: function(result){alert(result)}
         })
      })

   })

   function showImage(fileCallPath) {
      //alert(fileCallPath)
      $(".bigPictureWrapper").css("display", "flex").show()
      $(".bigPicture").html("<img src='/userupload/display?fileName="+ encodeURI(fileCallPath) + "'>").animate({width : '100%',height : '100%'}, 1000)
      $(".bigPictureWrapper").on("click",function(e){
         $(".bigPicture").animate({width:'0%', height:'0%'},1000)
         setTimeout(function(){
            $('.bigPictureWrapper').hide()
         },1000)
      })
   }
</script>
<!-- <script>
function showImage(fileCallPath) {
	alert(fileCallPath)
	 $(".bigPictureWrapper").css("display", "flex").show()
      $(".bigPicture").html("<img src='/userupload/display?fileName="+ encodeURI(fileCallPath) + "'>").animate({width : '100%',height : '100%'}, 1000);
	  $(".bigPictureWrapper").on("click",function(e){
	         $(".bigPicture").animate({width:'0%', height:'0%'},1000)
	         setTimeout(function(){
	            $('.bigPictureWrapper').hide()
	         },1000)
	      }) //544
	
  }
   $(document).ready(function() {
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

      $('#uploadBtn').on("click",function(e) {
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
            url : '/userupload/uploadAjaxAction',
            processData : false, /* 전달한 데이터틑 query string으로 만들지 말것 */
            contentType : false,
            data : formData,
            type : 'POST',
            dataType : 'json',
            success : function(result) {
               console.log(result)
               showUploadedFile(result)
               $(".uploadDiv").html(cloneObj.html())}
         })
      })

      var uploadResult = $(".uploadResult ul")
   		function showUploadedFile(uploadResultArr) {
         var str = ''
         $(uploadResultArr).each(function(i, obj) {
            if (!obj.image) {
            var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid+ "_"+ obj.fileName);
            str += "<li><div><a href='/userupload/download?fileName="+ fileCallPath+ "'><img src='/resources/wine_bootstrap/upload_img/attach.png'>"+ obj.fileName
               + "</a><span data-file=\""+fileCallPath+"\" data-type='file'>X</span></div></li>"
            } else {
               //str +="<li>" + obj.fileName + '</li>'
               var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+ obj.uuid+ "_"+ obj.fileName);
               var originPath = obj.uploadPath   + "/"+ obj.uuid+ "_"+ obj.fileName
               originPath = originPath.replace(new RegExp(/\\/g),"/")
               str += "<li><a href=\"javascript:showImage(\'"+ originPath+ "\')\"><img src='/userupload/display?fileName="+ fileCallPath
                     + "'></a><span data-file=\""+fileCallPath+"\" data-type='image'>X</span></li>"
            }
         })
         uploadResult.append(str)
      } //528 내가 사용할썸네일
         
      
      $(".uploadResult").on("click", "span", function(e){
          var targetFile=$(this).data("file")
          var type=$(this).data("type")
          console.log(targetFile)
          $.ajax({
             url:'/userupload/deleteFile',
             data: {fileName: targetFile, type: type},
             dataType: 'text',
             type: 'post',
             success: function(result){
             	alert(result)
             }
          })
       })
      
   })

</script> -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class='uploadDiv'>
      <input type='file' name='uploadFile' multiple>
   </div>
   <div class='uploadResult'>
      <ul></ul>
   </div>
   <div class='bigPictureWrapper'>
      <div class="bigPicture"></div>
   </div>
   <button id='uploadBtn'>Upload</button>
</body>
</html>