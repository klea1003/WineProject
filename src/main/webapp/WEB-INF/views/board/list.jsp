<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%@include file="../includes/header.jsp"%>
<style>
.pagination {
	display: flex;
	padding-left: 0;
	list-style: none;
}

.page-link {
	position: relative;
	display: block;
	color: #080300;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #dee2e6;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.page-link:hover {
	z-index: 2;
	color: #fff;
	background-color: #b30000;
	border-color: #b30000;
}

.page-link:focus {
	z-index: 3;
	color: #080300;
	background-color: #d7301f;
	outline: 0;
	box-shadow: 0 0 0 0.25rem rgba(179, 0, 0, 0.25);
}

.page-item.active .page-link {
	z-index: 3;
	color: #fff;
	background-color: #b30000;
	border-color: #b30000;
}

.table {
	
	text-align: center;

}
</style>
<script type="text/javascript">
   $(document).ready(function() {//모델 보여주기 추가
      var result = '<c:out value="${boardResult}"/>';
      checkModal(result);
      history.replaceState({},null,null);
      

      function checkModal(result){
         if(result ===''||history.state){
            return;
         }
         if(parseInt(result) > 0){
            $(".modal-body").html(
                  "게시글"+parseInt(result)+"번이 등록 되었습니다.");
         }
         $("#myModal").modal("show");
      }
      
      $("#regBtn").on("click",function(){
         self.location = "/board/register";
      });
      
      
      var actionForm=$("#actionForm");
      $(".page-item a").on("click",function(e){
         e.preventDefault();
         console.log('click');
         actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         actionForm.submit();
      });
      
 
      $(".move").on("click",function(e) {
          e.preventDefault();
          actionForm.append("<input type='hidden' name='boardNum' value=' "
                   + $(this).attr("href")
                   + "'>");
          actionForm.attr("action","/board/get");
          actionForm.submit();

       });
       
      var searchForm =$("#searchForm");
      $("#searchForm button").on("click",function(e){
     /*  if(!searchForm.find("option:selected").val()){
         alert("검색 종류를 선택하세요");
      
      return false;
      }
      if(!searchForm.find("input[name='keyword']").val()){
         alert("키워드를 입력하세요");
      
      return false;
      } */
      searchForm.find("input[name='pageNum']").val("1");
      e.preventDefault();
      searchForm.submit();
     
    });

   });
</script>
<body>
<!-- Section -->    	
<section class="py-5">
	<div class="container px-5">
		<h1 class="fw-bolder mb-5">Q&A</h1>
         <div class="row">
               <div>
                  <table class="table">
					<thead>
						<tr class="table">
					      <th scope="col">No</th>
					      <th scope="col">제목</th>
					      <th scope="col">종류</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일</th>
					      <th scope="col">좋아요 <i class="bi bi-hand-thumbs-up"></i></th>
						 </tr>

					</thead>

					<tbody>
						<c:forEach var="c" items="${boardlist}" varStatus="status">
							<tr>
								<td>${c.boardNum }</td>
								<td><a
									onclick="location.href='/board/get?boardNum=<c:out value="${c.boardNum }"/>'">${c.title}[${ c.replyCnt }]</a></td>
								<%-- <td><a class="move" href="<c:out value='${c.boardNum }'/>"><c:out value="${c.title}"/>[${ c.replyCnt }]</a></td> --%>
								<td>${c.boardType}</td>
								<td>${c.writer}</td>
								<td>${c.regdate}</td>
								<td>${likelist[status.index]}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<p><c:out value='${pageMaker.total }' />개의 게시판이 있습니다.</p>

				<div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action='/board/list' method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type==null?'selected':''}"/>>----</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TCW"
									<c:out value="${pageMaker.cri.type eq'TCW'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
								<option value="P"
									<c:out value="${pageMaker.cri.type eq'P'?'selected':''}"/>>종류</option>
							</select> 
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' /> 
							<input type='hidden' name='pageNum' value="${pageMaker.cri.pageNum }" />
							<input type='hidden' name='amount' value="${pageMaker.cri.amount }" />
							<button type="submit" class='btn btn-outline-danger btn-sm'>search</button>
						</form>
                   		<div align="right">
                   		<button id='regBtn' type="button" class="btn btn-danger btn-sm">글쓰기</button></div>
             		</div>
          		</div>
			</div>
			
			
         </div>
     </div>
</section><!-- Section End -->
            
	<!-- Pagination -->
     
    <div class="Pagination"> 
    	<ul class="pagination justify-content-center">
       		<c:if test="${pageMaker.prev}">
				<li class='paginate_button previous'>
				<a class="page-link" href="${pageMaker.startPage-1 }">Previous</a></li>
			</c:if>
          
            <c:forEach var='num' begin='${pageMaker.startPage }' end='${pageMaker.endPage }'>
				<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : "" } ">
						<a class="page-link" href='${num}'>${num}</a></li>
			</c:forEach>
          	
          	<c:if test="${pageMaker.next }">
				<li class="page-item next">
          		<a class="page-link" href="${pageMaker.endPage+1 }">Next</a></li>
          	</c:if>
       </ul>
    </div>
        
    <form id="actionForm" action="/board/list" method="get">
	    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
	    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	    <input type="hidden" name="type" value="${pageMaker.cri.type }">
	   <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
          
	<!-- End of Pagination -->

<!-- 모달부분 주석 -->
<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModallabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" 
							aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save Changes</button>
								
						</div>
					</div>/. modal-content
				</div>/. modal-dialog
			</div>/. modal fade -->

 <%@include file="../includes/footer.jsp" %>
</body>
</html>

