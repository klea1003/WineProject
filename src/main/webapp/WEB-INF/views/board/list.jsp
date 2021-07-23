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
      history.replaceState({},null,null);
      

       
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
      
    
       
      var boardSearchForm =$("#boardSearchForm");
      $("#boardSearchForm button").on("click",function(e){
       if(!boardSearchForm.find("option:selected").val()){
         alert("검색 종류를 선택하세요");
      
      return false;
      }
      if(!boardSearchForm.find("input[name='keyword']").val()){
         alert("키워드를 입력하세요");
      
      return false;
      } 
      boardSearchForm.find("input[name='pageNum']").val("1");
      e.preventDefault();
      boardSearchForm.submit();
     
    });

   });
</script>
<body>
	<!-- Section -->
	<section class="py-5">
		<div class="container px-5">
			<h1 class="fw-bolder mb-5">Q&A</h1>

			<!-- accordion area -->
			<div class="accordion accordion-flush mb-5"
				id="accordionFlushExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
							aria-expanded="false" aria-controls="flush-collapseOne">
							와인은 어떻게 보관해야 하나요?</button>
					</h2>
					<div id="flush-collapseOne" class="accordion-collapse collapse"
						aria-labelledby="flush-headingOne"
						data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							햇빛이 들지 않는 베란다 찬장 같은 곳에
							<code>상온보관</code>
							하시면 좋을 듯 합니다. 레드 와인이라면 위 방법으로 보관하시고 디저트 와인이나 화이트 와인 또는 샴페인이라면
							<code>냉장보관</code>
							해주세요!
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingTwo">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
							aria-expanded="false" aria-controls="flush-collapseTwo">
							개봉 후 와인은 하루나 이틀안에 다 먹어야 하나요?</button>
					</h2>
					<div id="flush-collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="flush-headingTwo"
						data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							개봉된 와인의 보관 기간은 와인의 종류에 따라 다르지만 보통 3~5일 정도입니다. 체력이 강한 종류는 7일 정도까지
							버티기도 하고, 일부 화이트 와인(아이스 와인이나 귀부와인 계통)의 것은 잘 버티면 2주 정도까지도 갑니다.
							일반적으로는 레드가 화이트보다 체력이 강한 편입니다.
							<code>가급적 빨리 드시기를 권장합니다.</code>
							<p>추가로 개봉된 와인의 보관법은 크게 나누면 3가지입니다.
							<p>1. 코르크로 다시 막거나 시중에서 파는 별도의 와인 병 마개 등으로 막아서 냉장보관
							<p>2. 진공마개와 손펌프를 사용하여 내부 공기를 뽑아낸 뒤 냉장보관
							<p>3. 이산화탄소나 질소 가스등 무색 무취의 비활성 가스를 병내에 주입한 뒤 1의 방법으로 보관합니다.
								감사합니다.
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="flush-headingThree">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
							aria-expanded="false" aria-controls="flush-collapseThree">
							와인 숙성 온도가 어떻게 되나요? + 와인 숙성 어떻게 하나요?</button>
					</h2>
					<div id="flush-collapseThree" class="accordion-collapse collapse"
						aria-labelledby="flush-headingThree"
						data-bs-parent="#accordionFlushExample">
						<div class="accordion-body">
							순수하게 보관만 생각했을 때 적정 보관 온도에 대해서는 딱히 정해진 법칙은 없습니다. 기본적인 원칙은
							<code>'온도가 올라갈수록 숙성은 가속되고, 온도가 내려갈수록 숙성은 느려진다.'</code>
							입니다. 즉, 장기 숙성 기간을 얼마나 잡느냐에 따라 온도 보관 방법도 달라질 수 있습니다. 장기 보관을 대부분
							20~30년 정도로 생각하시고 서서히 숙성을 계속하여 20년 정도 시점에서 맛의 정점을 찍을 정도의 보관 온도는 섭씨
							12~14도 정도가 보관 온도로서 적당합니다.
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div>
					<table class="table mt-5">
						<thead>
							<tr class="table">
								<th scope="col">No</th>
								<th scope="col">제목</th>
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
									<td>${c.writer}</td>
									<td>${c.regdate}</td>
									<td>${likelist[status.index]}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<p>
						<c:out value='${pageMaker.total }' />
						개의 게시판이 있습니다.
					</p>

					<div class='row'>
						<div class="col-lg-12">
							<form id='boardSearchForm' action='/board/list' method='get'>
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
									<%-- <option value="P"
									<c:out value="${pageMaker.cri.type eq'P'?'selected':''}"/>>종류</option> --%>
								</select> <input type='text' name='keyword'
									value='<c:out value="${pageMaker.cri.keyword }"/>' /> <input
									type='hidden' name='pageNum' value="${pageMaker.cri.pageNum }" />
								<input type='hidden' name='amount'
									value="${pageMaker.cri.amount }" />
								<button class='btn btn-outline-danger btn-sm'>search</button>
							</form>
							<c:if test="${pageMaker.cri.type != null}">
								<c:if test="${pageMaker.cri.type != ''}">
									<a href="/board/list">목록으로 돌아가기</a>
								</c:if>
							</c:if>
							<div align="right">
								<c:if test="${user.userNickName != null}">
									<button id='regBtn' type="button" class="btn btn-danger btn-sm">글쓰기</button>
							</div>
							</c:if>

						</div>
					</div>
				</div>


			</div>
		</div>
	</section>
	<!-- Section End -->

	<!-- Pagination -->

	<div class="Pagination">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class='page-item previous'><a class="page-link"
					href="${pageMaker.startPage-1 }">앞으로</a></li>
			</c:if>

			<c:forEach var='num' begin='${pageMaker.startPage }'
				end='${pageMaker.endPage }'>
				<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : "" } ">
					<a class="page-link" href='${num}'>${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<li class="page-item next"><a class="page-link"
					href="${pageMaker.endPage+1 }">뒤로</a></li>
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



	<%@include file="../includes/footer.jsp"%>
</body>
</html>

