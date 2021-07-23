<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%@include file="../includes/header.jsp"%>
<script type="text/javascript">


var userNick = '${user.userNickName}';
var userNum = '${user.userNum}';

function clickAnswerSellerBoardTitle(_input){
	
	location.href = "/sellerBoard/getAnswer?parentSellerBno=" + _input;
	
};

function clickSellerBoardTitle(_input){
	
	location.href = "/sellerBoard/get?parentSellerBno=" + _input;
	
};
function nonewriter(){
	
	
	alert('해당 작성자만 조회 가능합니다.')

};


</script>
<body>
<!-- Section -->    	
<section class="py-5">
	<div class="container px-5">
		<h1 class="fw-bolder mb-5">특판문의 게시판</h1>
		
		
		<div class="row">
               <div>
                  <table class="table mt-5">
					<thead>
						<tr class="table">
					      <th scope="col">No</th>
					      <th scope="col">제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일</th>
					    </tr>
					</thead>

					<tbody>
						<c:forEach var="sb" items="${list}" varStatus="status">
							<tr>
								<td >${sb.rn}</td>
								
								<td>
									<c:if test="${sb.answerWriter == '관리자' }">
										<i class="bi bi-arrow-return-right"></i>&nbsp;
										<span class="badge bg-danger">답변완료</span>
										<c:if test="${user.userNickName=='관리자' || sb.writer == user.userNickName }">
											<a class="fw-bold text-dark" onclick='clickAnswerSellerBoardTitle("${sb.childSellerBno}")'>${sb.title}</a>
										</c:if>
										<c:if test="${sb.writer != user.userNickName && user.userNickName!='관리자'}">
											<a class="fw-bold text-dark" onclick='nonewriter()'>${sb.title}</a>
										</c:if>
									</c:if>
									
									
									<c:if test="${sb.answerWriter != '관리자' }">
										<c:if test="${user.userNickName=='관리자' ||user.userNickName==sb.writer}">
											<a class="fw-bold text-dark" onclick='clickSellerBoardTitle("${sb.childSellerBno}")'>
											${sb.title}</a>
										</c:if>
										<c:if test="${sb.writer != user.userNickName && user.userNickName!='관리자'}">
											<a class="fw-bold text-dark" onclick='nonewriter()'>${sb.title}</a>
										</c:if>
									</c:if>
									
									
									
								</td>
								<c:if test="${sb.answerWriter == '관리자' }"> 
								<td>${sb.answerWriter}</td>
								</c:if>
								<c:if test="${sb.answerWriter != '관리자' }"> 
								<td>${sb.writer}</td>
								</c:if>
								<td>${sb.regdate}</td>
								
							</tr>
						</c:forEach>
					</tbody>
						
					</tbody>
				</table>
				
				<div align="right">
					<c:if test="${user != null}">
					<button id='regBtn' type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/sellerBoard/register'">글쓰기</button>
					</c:if>				
				</div>
				
			</div>
         </div>
     </div>
</section><!-- Section End -->
            


 <%@include file="../includes/footer.jsp" %>
</body>
</html>

