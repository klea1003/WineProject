<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>

<jsp:include page="../includes/header.jsp"></jsp:include>
<script src="/resources/js/reply.js"></script>
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
   padding: 10px;
}

.uploadResult ul li img {
   width: 20px;
}

.uploadResult li span {
   color: white;
}

.bigPictureWrapper {
   position: absolute;
   display: none;
   justify-content: center;
   align-items: center;
   top: 0%;
   width: 100%;
   height: 100%;
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
<script type="text/javascript">
   $(document)
         .ready(
               function() {
                 

                  var operForm = $("#operForm");
                  $('button[data-oper="modify"]').on(
                        "click",
                        function(e) {
                           operForm.attr("action", "/board/modify")
                                 .submit();
                        });
                  $('button[data-oper="list"]').on("click", function(e) {
                     operForm.find("#boardNum").remove();
                     operForm.attr("action", "/board/list");
                     operForm.submit();
                  });
                  console.log(replyService);

                  /* 리플라이 */

                  var boardNumValue = '<c:out value="${board.boardNum}"/>'
              /*          replyService.add({
                          reply : "JS TEST",
                          replyer : "js tester",
                          boardNum : boardNumValue
                       }, function(result) {
                          alert("RESULT : " + result);
                       });  */

                  /*       replyService.getList(
                           {boardNum:boardNumValue,page:1}
                        ,function(list){
                           for(var i =0, len=list.length||0; i<len; i++){
                              console.log(list[i]);
                           }
                        }); */

                  /* replyService.remove(32
                   ,function(count){
                   console.log(count);
                   if(count==="success"){
                   alert("REMOVED");}
                   },function(err){
                   alert('error occurred...');
                   }); */

                  /*  replyService.update({
                       rno:22,
                       boardNum:boardNumValue,
                       reply:"modify reply...."
                    }, function(result){
                       alert("수정완료")
                    }); */

                  /* replyService.get(23, function(data) {
                     console.log(data);
                  }); */

                  var replyUL = $(".chat");
                  showList(1);
                  function showList(page) {
                     replyService
                           .getList(
                                 {
                                    boardNum : boardNumValue,
                                    page : page || 1
                                 },
                                 function(replyCnt,list) {
                                   console.log("replyCnt : "+ replyCnt)
                                   console.log("list: "+list)
                                    if(page==-1) {
                                       pageNum=Math.ceil(replyCnt/10.0)
                                       showList(pageNum)
                                       return
                                    }
                                    var str = "";
                                    if (list == null|| list.length == 0) {
                                       
                                       return;
                                    }
                                    for (var i = 0, len = list.length || 0; i < len; i++) {
                                       str += "<li class='letf clearfix' data-rno='"+list[i].rno+"'>";
                                       str += "<div><div class='header'><strong class='primary-font'>"
                                             + list[i].replyer
                                             + "</strong>";
                                       str += "<small class='pull-right text-muted'>"
                                             + replyService
                                                   .displayTime(list[i].replyDate)
                                             + "</small><div>";
                                       str += "<p>"
                                             + list[i].reply
                                             + "</p><div></li>";
                                    }
                                    replyUL.html(str);
                                    showReplyPage(replyCnt);
                                 });
                  } //end  showList
                  
                  var modal =$(".modal");
                  var modalInputReply =modal.find("input[name='reply']");
                  var modalInputReplyer =  modal.find("input[name='replyer']");
                  var modalInputReplyDate =  modal.find("input[name='replyDate']");
                  
                  var modalModBtn = $("#modalModBtn");
                  var modalRemoveBtn = $("#modalRemoveBtn");
                  var modalRegisterBtn = $("#modalRegisterBtn");
                  var replyer=null;
                  <sec:authorize access="isAuthenticated()">
                  replyer='<sec:authentication property="principal.username"/>';
                  </sec:authorize>
                 var csrfHeaderName ="${_csrf.headerName}";
              var csrfTokenValue="${_csrf.token}";
              
                  $("#addReplyBtn").on("click",function(e){
                     modal.find("input").val("");
                     modal.find("input[name='replyer']").val(replyer);
                     modalInputReplyDate.closest("div").hide();
                     modal.find("button[id !='modalCloseBtn']").hide();
                     
                     modalRegisterBtn.show();
                     $(".modal").modal("show");
                     showList(1);
                  });
                  $(document).ajaxSend(function(e,xhr,options){
                     xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                  })
                  modalRegisterBtn.on("click",function(e){
                           var reply ={
                                 reply:modalInputReply.val(),
                                 replyer:modalInputReplyer.val(),
                                 boardNum:boardNumValue
                           };
                           replyService.add(reply,function(result){
                              alert(result);
                              modal.find("input").val("");//댓글등록이 정상적으로 이뤄지면, 내용을 지움
                              modal.modal("hide");//모달창 닫음
                              
                              showList(-1);
                           });
                        });
                  
                  $(".chat").on("click","li",function(e){
                     var rno = $(this).data("rno");
                     replyService.get(rno,function(reply){
                        modalInputReply.val(reply.reply)
                        modalInputReplyer.val(reply.replyer)
                        modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly")
                        modal.data("rno",reply.rno)
                        
                        modal.find("button[id!='modalCloseBtn']").hide()
                        modalModBtn.show()
                        modalRemoveBtn.show()
                        $(".modal").modal("show")
                     })
                     console.log(rno);
                  });
                  
                  modalModBtn.on("click",function(e){
                     var originalReplyer = modalInputReplyer.val();
                     var reply={rno:modal.data("rno"), 
                           reply:modalInputReply.val(),
                           replyer:originalReplyer}
                     if(!replyer){
                        alert("로그인 후 수정 가능")
                        modal.modal("hide")
                        return
                     }
                     console.log("original Replyer:"+originalReplyer)
                     if(replyer !=originalReplyer){
                        alert("자신이 작성한 댁글만 수정 가능")
                        modal.modal("hide")
                        return
                     }
                     replyService.update(reply,function(result){
                        alert(result)
                        modal.modal("hide")
                        showList(pageNum)
                     })
                  });
                  
                  modalRemoveBtn.on("click", function(e){
                        var originalReplyer = modalInputReplyer.val();
                   
                         var rno=modal.data("rno")

                         if(!replyer){
                            alert("로그인 후 삭제 가능")
                            modal.modal("hide")
                            return
                         }
                         console.log("original Replyer:"+originalReplyer)
                         if(replyer !=originalReplyer){
                            alert("자신이 작성한 댁글만 삭제 가능")
                            modal.modal("hide")
                            return
                         }
                     replyService.remove(rno, originalReplyer, function(result){
                        alert(result)
                        modal.modal("hide")
                        showList(pageNum)
                     })
                     
                  });
                  
                  var pageNum=1
                  var replyPageFooter= $(".panel-footer")
                  function showReplyPage(replyCnt){
                     console.log("showReplyPage: " + replyCnt)
                     var endNum=Math.ceil(pageNum/10.0)*10
                     var startNum=endNum-9
                     var prev=startNum!=1
                     var next=false
                     if(endNum*10>replyCnt){endNum=Math.ceil(replyCnt/10.0)}
                     if(endNum*10<replyCnt){next=true}
                     var str="<ul class='pagination pull-right'>"
                     if(prev) {
                        str+="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>"
                     }
                     for(var i=startNum; i<=endNum; i++) {
                        var active =pageNum ==i?"active":"";
                        str +="<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>"
                        }
                     if(next){
                        str +="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>NEXT</a></li>"
                     }
                     str +="</ul></div>"
                     console.log(str)
                     replyPageFooter.html(str)
                  }
                  
                  replyPageFooter.on("click","li a",function(e){
                      e.preventDefault();
                      console.log("page click");
                      var targetPageNum =$(this).attr("href");
                      console.log("targetPageNum:"+targetPageNum);
                      pageNum = targetPageNum;
                      showList(pageNum);
                   });
                  var boardNum ='<c:out value="${board.boardNum}"/>';
                  $.getJSON("/board/getAttachList",{boardNum:boardNum}, function(arr){
                      console.log(arr)
                      var str=''
                      $(arr).each(function(i,obj){
                         if (!obj.fileType) {
                           var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid+ "_"+ obj.fileName);
                           /* str += "<li><div><a href='/download?fileName="+ fileCallPath+ "'><img src='/resources/images/attach.png'>"+ obj.fileName
                              + "</a><span data-file=\""+fileCallPath+"\" data-type='file'>X</span></div></li>" */
                              str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>"
                              str +="<img src='/resources/images/attach.png'>"
                              str +="</div></li>"
                           } else {
                              //str +="<li>" + obj.fileName + '</li>'
                              var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+ obj.uuid+ "_"+ obj.fileName);
                              var originPath = obj.uploadPath   + "/"+ obj.uuid+ "_"+ obj.fileName
                              originPath = originPath.replace(new RegExp(/\\/g),"/")
                              /* str += "<li><a href=\"javascript:showImage(\'"+ originPath+ "\')\"><img src='/display?fileName="+ fileCallPath
                                    + "'></a><span data-file=\""+fileCallPath+"\" data-type='image'>X</span></li>" */
                              str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>"             
                              str +="<img src='/display?fileName="+fileCallPath+"'>"
                              str +="</div></li>"
                           }
                      })
                      $(".uploadResult ul").html(str);
                   })
                   $(".uploadResult").on("click", "li", function(e) {
                      console.log("view image");
                     var liObj = $(this);
                     var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
                     if(!liObj.data("type")){
                        self.location="/download?fileName="+path;
                     }else{
                        showImage(path);
                     }
                     
                  })
                   $(".bigPictureWrapper").on("click", function(e) {
                        $(".bigPicture").animate({
                           width : '0%',
                           height : '0%'
                        }, 1000);
                        setTimeout(function() {
                           $(".bigPictureWrapper").hide();
                        }, 1000);
                     });
                  
               });
     function showImage(fileCallPath) {
      alert(fileCallPath);
      $(".bigPictureWrapper").css("display", "flex").show();
      $(".bigPicture")
            .html(
                  "<img src='/display?fileName="
                        + fileCallPath + "'>").animate({
               width : '100%',
               height : '100%'
            }, 1000);
     }
</script>


<!--       ------------------------------------------------------------------------------- -->
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
         <div class="panel-heading"'>게시글 등록</div>
         <!-- /.panel-heading -->
         <div class="panel-body">
            <div class="form-group">
               <label>boardNum</label><input class='form-control' name='boardNum'
                  value='<c:out value="${board.boardNum }"/>' readonly='readonly'>
            </div>
            <div class="form-group">
               <label>Title</label><input class='form-control' name='title'
                  value='<c:out value="${board.title }"/>' readonly='readonly'>
            </div>
            <div class='form-group'>
               <label>Content</label>
               <textarea class='form-control' rows='3' name='content'
                  readonly='readonly'><c:out value="${board.content }" /></textarea>
            </div>
            <div class='form-group'>
               <label>writer</label><input class='form-control' name='writer'
                  value='<c:out value="${board.writer }"/>' readonly='readonly'>
            </div>
            <sec:authentication property="principal" var="pinfo"/>
            <sec:authorize access="isAuthenticated()">
            <c:if test="${pinfo.username eq board.writer }">
            <button class='btn btn-success' data-oper='modify'>Modify</button>
            </c:if>
            </sec:authorize>
            <button class='btn btn-primary' data-oper='list'>List</button>
            <form id='operForm' action='/board/modify' method='get'>
               <input type='hidden' id='boardNum' name='boardNum'
                  value='<c:out value="${board.boardNum }" />'> <input
                  type='hidden' name='pageNum'
                  value='<c:out value="${cri.pageNum }"/>'> <input
                  type='hidden' name='amount'
                  value='<c:out value="${cri.amount }"/>'> <input
                  type="hidden" name="type" value="${cri.type }"> <input
                  type="hidden" name="keyword" value="${cri.keyword }">
            </form>

            <!-- /.table-responsive -->
         </div>
         <!-- /.panel-body -->
      </div>
      <div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">File Attach</div>
         <div class="panel-body">
            
            <div class="uploadResult">
               <ul>
               </ul>
            </div>
         </div>
      </div>
   </div>

</div>
   <div class="bigPictureWrapper">
      <div class="bigPicture"></div>
   </div>
      
      <!-- /.panel -->
      <!-- /.panel-heading reply 영역시작 -->
      <div class="panel panel-default">
         <div class="panel-heading">
            <i class="fa fa-comments fa-fw"></i>Reply
            <sec:authorize access="isAuthenticated()">
            <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
               Reply</button>
               </sec:authorize>
         </div>
         <div class="panel-body">
            <ul class="chat">
               <li class="left clearfix" data-rno="12">
                  <div>
                     <div class="header">
                        <!-- <strong class="primary-font"> user00</strong> <small
                           class="pull-right text-muted">2021-05-18-13:13</small> -->
                     </div>
                     <!-- <p>Good job</p> -->
                  </div>
               </li>
            </ul>
         </div>
               <!-- FOOTER영역 -->
         <div class='panel-footer'></div>
      </div>
      <!-- reply 영역 -->
      <!-- 모달영역 -->
      <div class='modal fade' id='myModal' tabindex='-1' role='dialog'
         aria-labelledby='myModallabel' aria-hidden='true'>
         <div class='modal-dialog'>
            <div class='modal-content'>
               <div class='modal-header'>
                  <button type='button' class='close' data-dismiss='modal' aria-hidden='ture'>&times;</button>
                  <h4 class='modal-title' id='myModalLabel'>REPLY MODAL</h4>
               </div>
               <div class='modal-body'>
                  <div class='form-group'>
                     <label>Reply</label>
                     <input class='form-control' name='reply' value='New Reply'>
                  </div>
                  <div class='form-group'>
                     <label>Replyer</label>
                     <input class='form-control' name='replyer' value='New Replyer'>
                  </div>
                  <div class='form-group'>
                     <label>ReplyDate</label>
                     <input class='form-control' name='replyDate' value=''>
                  </div>
               </div>
               <div class='modal-footer'>
                  <button id='modalModBtn' type='button' class='btn btn-info'>Modify</button>
                  <button id='modalRemoveBtn' type='button' class='btn btn-info'>Remove</button>
                  <button id='modalRegisterBtn' type='button' class='btn btn-info' data-dismiss='modal'>Register</button>
                  <button id='modalCloseBtn' type='button' class='btn btn-info' data-dismiss='modal'>Close</button>
               </div>
            </div>
         </div>
      </div>
      <!-- 모달영역 -->
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- /.row -->

<!-- /.row -->
<!--    footer 시작      -------------------------------------------------------------- -->
<jsp:include page="../includes/footer.jsp"></jsp:include>