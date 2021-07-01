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

                  var boardNumValue = '<c:out value="${board.boardNum}"/>';
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
                //댓글 조회
              	//ul태그
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
                                       pageNum=Math.ceil(replyCnt/10.0);
                                       showList(pageNum);
                                       return;
                                    }
                                    var str = "";
                                    if (list == null|| list.length == 0) {
                                       
                                       return;
                                    }
                                    for (var i = 0, len = list.length || 0; i < len; i++) {
                                       str += "<li class='letf clearfix' data-rno='"+list[i].rno+"'>"
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
                  /* <sec:authorize access="isAuthenticated()">
                  replyer='<sec:authentication property="principal.username"/>';
                  </sec:authorize>
                  var csrfHeaderName ="${_csrf.headerName}";
                  var csrfTokenValue="${_csrf.token}"; 시큐리티 기능*/
                  
                  //새로운 댓글 등록 버튼 클릭 시
                  $("#addReplyBtn").on("click",function(e){

                      modal.find("input").val(""); 
                     /* modal.find("input[name='replyer']").val(replyer); 시큐리티*/
                      modalInputReplyDate.closest("div").hide();
                     modal.find("button[id !='modalCloseBtn']").hide();
                     modalRegisterBtn.show();
                     $(".modal").modal("show");
                    /*  showList(1);  */ 
                  });
                  
                 
                  
                /* //ajax에 beforeSend 추가 전송 방식말고 기본설정으로 지정해서 사용
                  $(document).ajaxSend(function(e,xhr,options){
                     xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                  }) 시큐리티 기능*/
                  
                  //새로운 댓글 처리
                  modalRegisterBtn.on("click",function(e){
                           var reply ={
                                 reply:modalInputReply.val(),
                                 replyer:modalInputReply.val(),
                                 /* replyer:modalInputReplyer.val(), */ 
                                 boardNum:boardNumValue
                           };
                           replyService.add(reply,function(result){
                              alert(result);
                              modal.find("input").val("");//댓글등록이 정상적으로 이뤄지면, 내용을 지움
                              modal.modal("hide");//모달창 닫음
                              
                              showList(-1);
                           });
                        });
                  
                //특정 댓글의 클릭 이벤트
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
                //수정
                  modalModBtn.on("click",function(e){
                   /*   var originalReplyer = modalInputReplyer.val(); */
                     var reply={rno:modal.data("rno"), 
                           reply:modalInputReply.val()
                           /*  ,replyer:originalReplyer */ }
                    /*  if(!replyer){
                        alert("로그인 후 수정 가능")
                        modal.modal("hide")
                        return
                     }
                     console.log("original Replyer:"+originalReplyer)
                     if(replyer !=originalReplyer){
                        alert("자신이 작성한 댁글만 수정 가능")
                        modal.modal("hide")
                        return
                     } 시큐리티 기능*/
                     replyService.update(reply,function(result){
                        alert(result);
                        modal.modal("hide");
                        showList(pageNum);
                     });
                  });
                //삭제
                  modalRemoveBtn.on("click", function(e){
                       /*  var originalReplyer = modalInputReplyer.val(); */
                   
                         var rno=modal.data("rno")

                        /*  if(!replyer){
                            alert("로그인 후 삭제 가능")
                            modal.modal("hide")
                            return
                         }
                         console.log("original Replyer:"+originalReplyer)
                         if(replyer !=originalReplyer){
                            alert("자신이 작성한 댁글만 삭제 가능")
                            modal.modal("hide")
                            return
                         } 시큐리티 기능*/
                     replyService.remove(rno/* , originalReplyer */, function(result){
                        alert(result)
                        modal.modal("hide")
                        showList(pageNum)
                     })
                     
                  });
                //댓글의 페이지 번호 처리
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
                  }//showReplyPage
                  
                  //페이지 번호 클릭 시
                  replyPageFooter.on("click","li a",function(e){
                      e.preventDefault();
                      console.log("page click");
                      var targetPageNum =$(this).attr("href");
                      console.log("targetPageNum:"+targetPageNum);
                      pageNum = targetPageNum;
                      showList(pageNum);
                   });
                  
                  //게시물 조회 시 파일 관련 자료를 JSON 데이터로 만들어서 화면에 전송
                  var boardNum ='<c:out value="${board.boardNum}"/>';
                  $.getJSON("/board/getAttachList",{boardNum:boardNum}, function(arr){
                      console.log(arr);
                      console.log(fileCallPath);
                    //게시물 조회 이미지 출력 부분 
                      var str=''
                      $(arr).each(function(i,obj){
                         if (!obj.fileType) {
                           var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid+ "_"+ obj.fileName);              
                              str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>"
                              str +="<img src='/resources/images/attach.png'>"
                              str +="</div></li>"
                           } else {
                              //str +="<li>" + obj.fileName + '</li>'
                              var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+ obj.uuid+ "_"+ obj.fileName);
                              var originPath = obj.uploadPath   + "/"+ obj.uuid+ "_"+ obj.fileName
                              originPath = originPath.replace(new RegExp(/\\/g),"/")
                              str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>"             
                              str +="<img src='/display?fileName="+fileCallPath+"'>"
                              str +="</div></li>"
                           }
                      })
                      $(".uploadResult ul").html(str);
                   });
                   
                   
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
    //썸네일 클릭 시 커짐
      $(".bigPictureWrapper").css("display", "flex").show();
      $(".bigPicture")
            .html(
                  "<img src='/display?fileName="
                        + fileCallPath + "'>").animate({
               width : '100%',
               height : '100%'
            }, 1000);
      
    //커진 사진 클릭 시 다시 작아짐
  	$(".bigPictureWrapper").on("click", function(e){
  		$(".bigPicture").animate({width : '0%', height : '0%'}, 1000);
  		setTimeout(() => {
  			$(this).hide();
  		}, 1000);
  	});//bigPictureWrapper click
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
			<div class="panel-heading">게시글 등록</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>boardNum</label><input class='form-control' name='boardNum'
						value='<c:out value="${board.boardNum }"/>' readonly='readonly'>
				</div>
				<div class="form-group">
					<label>Type</label><input class='form-control' name='type'
						value='<c:out value="${board.boardType }"/>' readonly='readonly'>
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
						<br/>
						 
				</div>
				<!-- board파트 -->

				<%-- <sec:authentication property="principal" var="pinfo"/>
            <sec:authorize access="isAuthenticated()">
            <c:if test="${pinfo.username eq board.writer }">
            <button class='btn btn-success' data-oper='modify'>Modify</button>
            </c:if>
            </sec:authorize> 시큐리티 기능--%>

				<button class='btn btn-success' data-oper='modify'>Modify</button>
				<button class='btn btn-primary' data-oper='list'>List</button>
				<div>${like}</div>
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

				<form id='operForm' action='/board/like' method='post'>
					<input type='hidden' id='boardNum' name='boardNum'
						value='<c:out value="${board.boardNum }" />'> <input
						type='hidden' id='userID' name='userID'
						value='<c:out value="user000"/>'> <input type='submit'
						value='좋아요'>
				</form>
				<form id='operForm' action='/board/dislike' method='post'>
					<input type='hidden' id='boardNum' name='boardNum'
						value='<c:out value="${board.boardNum }" />'> <input
						type='hidden' id='userID' name='userID'
						value='<c:out value="user000"/>'> <input type='submit'
						value='싫어요'>
				</form>

				<!-- /.table-responsive -->
			</div>
			<!-- /.panel-body -->
		</div>
	</div>
</div>
	
	<!-- Files -->
		<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-info">
						<div class="panel-heading">Files</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="panel-body">
								<div class="form-group uploadDiv"></div>

								<div class="uploadResult">
									<ul></ul>
								</div>
								<div class="bigPictureWrapper">
									<div class="bigPicture"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- /.panel -->
			<!-- /.panel-heading reply 영역시작 -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>Reply
					<!-- <sec:authorize access="isAuthenticated()">
            <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
               Reply</button>
               </sec:authorize> 시큐리티-->
					<button id="addReplyBtn" class='btn btn-primary btn-xs pull-right'>New
						Reply</button>
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
							<button type='button' class='close' data-dismiss='modal'
								aria-hidden='ture'>&times;</button>
							<h4 class='modal-title' id='myModalLabel'>REPLY MODAL</h4>
						</div>
						<div class='modal-body'>
							<div class='form-group'>
								<label>Reply</label> <input class='form-control' name='reply'
									value='New Reply'>
							</div>
							<div class='form-group'>
								<label>Replyer</label> <input class='form-control'
									name='replyer' value='New Replyer'>
							</div>
							<div class='form-group'>
								<label>ReplyDate</label> <input class='form-control'
									name='replyDate' value=''>
							</div>
						</div>
						<div class='modal-footer'>
							<button id='modalModBtn' type='button' class='btn btn-info'>Modify</button>
							<button id='modalRemoveBtn' type='button' class='btn btn-info'>Remove</button>
							<button id='modalRegisterBtn' type='button' class='btn btn-info'
								data-dismiss='modal'>Register</button>
							<button id='modalCloseBtn' type='button' class='btn btn-info'
								data-dismiss='modal'>Close</button>
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