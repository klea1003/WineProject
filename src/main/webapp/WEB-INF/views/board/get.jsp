<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

.w-50 {
	margin-top: 7%;
	margin-left: 25%;
}
</style>
<body>
	<jsp:include page="../includes/header.jsp" flush="false"></jsp:include>
	<script src="/resources/wine_bootstrap/js/reply.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	var operForm = $('#operForm');
	$('button[data-oper="modify"]').on("click",function(e){
		operForm.attr("action","/board/modify").submit();
	});
	
	$('button[data-oper="list"]').on("click",function(e){
		operForm.find("#boardNum").remove();
		operForm.attr("action","/board/list");
		operForm.submit();
	});
	
	$('button[data-oper="boardList"]').on("click",function(e){
		operForm.find("#boardNum").remove();
		operForm.attr("action","/board/boardList");
		operForm.submit();
	});
	
	//reply
	console.log(replyService);
	
	
	var boardNumValue='<c:out value="${board.boardNum}"/>';
	
	
	//댓글 조회
	//ul태그
	var replyUL=$(".chat")
	//showList 함수 호출
	showList(1);
	
	function showList(page) {
        replyService
              .getReplyList(
                    {
                       boardNum : boardNumValue,
                       page : page || 1
                    },
                    function(replyCnt,list) {
                       console.log("replyCnt:"+replyCnt);
                       console.log("list:"+list);
                       if(page==-1){
                          pageNum = Math.ceil(replyCnt/10.0);
                          showList(pageNum);
                          return;
                       }
                       var str = ""
                       if (list == null
                             || list.length == 0) {
                  
                    	 replyUL.html("");
                          return;
                       }
                       for (var i = 0, len = list.length || 0; i < len; i++) {
                          str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>"
                          str += "<div><div class='header'><strong class='primary-font'>"
                                + list[i].replyer
                                + "</strong>"
                          str += "<small class='pull-right text-muted'>"
                                + replyService
                                      .displayTime(list[i].replyDate)
                                + "</small></div>"
                          str += "<p>"
                                + list[i].reply
                                + "</p></div></li>"
                       }
                       replyUL.html(str);
                       showReplyPage(replyCnt);
                    })
     }
	//모달창 팝업
	var modal=$("#myModal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	//작성자 null로 선언
    var replyer = null;
	replyer = '<c:out value="${user.userNickName}"/>';
	var admin = "관리자";
    
	 //새로운 댓글 등록 버튼 클릭 시
	$("#addReplyBtn").on("click",function(e){
		modal.find("input").val("");
		
		 //replyer (security id가 담긴)
		modal.find("input[name='replyer']").val(replyer); 
		
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id!='modalCloseBtn']").hide();
		modalRegisterBtn.show();
		$("#myModal").modal("show");
		showList(1);
	});
	 
	 //새로운 댓글 처리
	modalRegisterBtn.on("click",function(e){
		var reply={
			reply:modalInputReply.val(),
			replyer:modalInputReplyer.val(),
			boardNum:boardNumValue
		};
		replyService.add(reply,function(result){
			alert(result);
			modal.find("input").val(""); //댓글 등록이 정상적으로 이뤄지면 내용을 지움
			modal.modal("hide");//모달 창 닫음
			showList(pageNum); //댓글이 포함된 페이지로 이동

		});
	});
    
   //댓글close창 처리
   $("#modalCloseBtn").on("click",function(e){
	   modal.modal("hide");//모달 창 닫음
		showList(pageNum); //댓글이 포함된 페이지로 이동
	}); 
	
	//특정 댓글의 클릭 이벤트
	$(".chat").on("click","li",function(e){
		var rno = $(this).data("rno");
		replyService.get(rno,function(reply){
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
			.attr("readonly","readonly");
			modal.data("rno",reply.rno);
			
			modal.find("button[id!='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			$("#myModal").modal("show");
		});
	});
	
	// 댓글 수정/삭제 처리 이벤트
	//수정
	modalModBtn.on("click",function(e){
		var originalReplyer = modalInputReplyer.val();
		var reply = {
				rno:modal.data("rno"),
				reply:modalInputReply.val(),
				replyer:modalInputReplyer.val()
				};
		
		 if(!replyer) {
			alert("로그인 후 수정 가능");
			modal.modal("hide");
			return;
		}
		console.log("Original Replyer : " + originalReplyer);
		  if(replyer==admin){
			  alert("관리자 권한으로 접근");
		  }else if(replyer != originalReplyer){
              alert("자신이 작성한 댓글만 수정 가능");
              modal.modal("hide");
              return;
          }
		
		replyService.update(reply,function(result){
			alert(result);
			modal.modal("hide");//모달 창 닫음
			showList(pageNum); //댓글이 포함된 페이지로 이동
		});
	});
	
	//삭제
	modalRemoveBtn.on("click",function(e){
		
		var rno = modal.data("rno"); 
        console.log("rno" + rno);
        console.log("REPLYER : "+ replyer);
        
         if(!replyer){
            alert("로그인 후 삭제 가능");
            modal.modal("hide");
            return;
        }
		
        var originalReplyer = modalInputReplyer.val();
        console.log("Orginal Replyer : " + originalReplyer); //원래 댓글 작성자
        if(replyer == admin){
        	 alert("관리자 접근");
        }
        else if(replyer != originalReplyer){
            alert("자신이 작성한 댓글만 삭제 가능");
            modal.modal("hide");
            return;
        }	 
          	
		replyService.remove(rno, originalReplyer, function(result){
			alert(result);
			modal.modal("hide"); //모달 창 닫음
			showList(pageNum);//댓글이 포함된 페이지로 이동
			});modal.modal("hide");
		
	});
	
	
	//댓글의 페이지 번호 처리
	var pageNum=1;
    var replyPageFooter = $(".panel-footer");
    function showReplyPage(replyCnt){
       console.log("showReplyPage:"+replyCnt);
       var endNum =Math.ceil(pageNum/10.0)*10;
       var startNum =endNum-9;
       var prev =startNum !=1;
       var next =false;
       if(endNum * 10 >= replyCnt){
          endNum = Math.ceil(replyCnt/10.0);
       }
       if(endNum * 10 <replyCnt){
          next = true;
       }
       var str ="<ul class='pagination pull-right'>";
       if(prev){
          str +="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
       }
       for(var i =startNum;i<=endNum;i++){
          var active = pageNum ==i? "active":"";
          str +="<li class='page-itme "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
       }
       if(next){
          str +="<li class='page-itme'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
       }
       str+= "</ul></div>";
       console.log(str);
       replyPageFooter.html(str);
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
    var boardNum = '<c:out value = "${board.boardNum}"/>';
    $.getJSON("/board/getBoardAttachList", {boardNum : boardNum}, function(arr) {
    	console.log(arr);
   
    
    //게시물 조회 이미지 출력 부분
    var str ="";
    $(arr).each(function(i, obj) {
		if(!obj.fileType) {	//이미지가 아닌 경우
			
			  var fileCallPath = encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
			  str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
	          + obj.fileName + "'data-type='" + obj.fileType + "'><div>";
	          str += "<img src='/resources/wine_bootstrap/images/2.png'>";
	          str += "</div></li>";
	        
    		   
		} else { //이미지인 경우
			  var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+ obj.uuid +"_"+obj.fileName);            
	          str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
	          + obj.fileName + "'data-type='" + obj.fileType + "'><div>";				          
	          str += "<img src='/display?fileName="+ fileCallPath +"'>";
	          str += "</div></li>";
		}
	});
	$(".uploadResult ul").html(str);
	});//end getJSON
	
	$(".uploadResult").on("click","li", function(e){  
	       console.log("view image");     
	       var liObj = $(this);      
	       var path = 
	       encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));      
	       if(!liObj.data("type")){
	           //download 
	            self.location ="/download?fileName="+path;
	       }else {
	        showImage(path);
	       }
	     });
	
	$(".bigPictureWrapper").on("click", function(e) {
		$(".bigPicture").animate({width : '0%', height : '0%'}, 1000);
		setTimeout(function() {
			$('.bigPictureWrapper').hide();
		}, 1000);
	});//bigPictureWrapper click

	

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
<body>
	<section class="py-5">
		<div class="container px-3 my-3">
			<div class="text-center mb-5">
				<h1 class="fw-bolder">Q&A</h1>
			</div>

			<div class="container-fluid">
				<div class="w-50">
					<div class="form-group mb-2">
						<label>No</label><input class='form-control' name='boardNum'
							value='<c:out value="${board.boardNum }"/>' readonly='readonly'>
					</div>
					<div class="form-group mb-2">
						<label>종류</label><input class='form-control' name='type'
							value='<c:out value="${board.boardType }"/>' readonly='readonly'>
					</div>
					<div class="form-group mb-2">
						<label>제목</label><input class='form-control' name='title'
							value='<c:out value="${board.title }"/>' readonly='readonly'>
					</div>
					<div class='form-group mb-2'>
						<label>글 내용</label>
						<textarea class='form-control' rows='3' name='content'
							readonly='readonly'><c:out value="${board.content }" /></textarea>
					</div>
					<div class='form-group mb-2'>
						<label>작성자</label><input class='form-control' name='writer'
							value='<c:out value="${board.writer }"/>' readonly='readonly'>
						<br />
					</div>

					<div class="mb-3">
						<c:if
							test="${user.userNickName eq board.writer || user.userNickName eq '관리자'}">
							<button class='btn btn-outline-danger' data-oper='modify'>Modify</button>
						</c:if>
						<button class='btn btn-outline-dark' data-oper='list'>back</button>
					</div>

					<!-- like 영역 -->
					<div class="row">
						<div class="col-md-1">${like}Likes</div>
						&nbsp;

						<div class="col-md-3" style="display: none;">
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
						</div>

						<div class="col-md-1">
							<form id='operForm' action='/board/like' method='post'>
								<input type='hidden' id='boardNum' name='boardNum'
									value='<c:out value="${board.boardNum }" />'> <input
									type='hidden' id='userID' name='userID'
									value='<c:out value="${user.userId }"/>'>
								<!-- <input type='submit' value='좋아요'> -->
								<button type="submit" class='btn btn-outline-primary'>
									<i class="bi bi-hand-thumbs-up"></i>
								</button>
							</form>
						</div>

						<div class="col-md-1">
							<form id='operForm' action='/board/dislike' method='post'>
								<input type='hidden' id='boardNum' name='boardNum'
									value='<c:out value="${board.boardNum }" />'> <input
									type='hidden' id='userID' name='userID'
									value='<c:out value="${user.userId }"/>'>
								<!-- <input type='submit' value='싫어요'> -->
								<button type="submit" class='btn btn-outline-danger'>
									<i class="bi bi-hand-thumbs-down"></i>
								</button>
							</form>
						</div>


					</div>
					<!-- end like -->
					<!-- Files -->
					<div class="row">
						<div class="col-md-12">
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
					<!-- end Files -->
				</div>



				<!-- reply 영역 -->

				<div class="card w-50">
					<div class="card-header bg-light">
						Reply <i class="bi bi-chat-fill"></i>
						<div class="float-end">
							<c:if test="${user.userNickName eq '관리자'}">
								<button id='addReplyBtn' class='btn btn-outline-dark btn-xs'>
									New Reply</button>
							</c:if>
						</div>


					</div>


					<div class="card-body">
						<ul class="chat">
							<!-- start reply -->
							<li class="left clearfix" data-rno="12">
								<div>
									<div class="header"></div>
									<p>Good job</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- end container -->

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
							<label>Replyer</label> <input class='form-control' name='replyer'
								value='New Replyer' readonly='readonly'>
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

	</section>
	<!--    footer 시작      -------------------------------------------------------------- -->
	<%@include file="../includes/footer.jsp"%>
</body>
