<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%@include file="../includes/header.jsp"%>
<style>

.table {
	
	text-align: center;

}
</style>

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
								<td>${sb.sellerBno}</td>
								<td><a onclick="location.href='/sellerBoard/get?boardNum=<c:out value="${sb.sellerBno}"/>'">${sb.title}</a></td> 
								
								<td>${sb.writer}</td>
								<td>${sb.regdate}</td>
								
							</tr>
						</c:forEach>
					</tbody>
						
					</tbody>
				</table>

				
			</div>
         </div>
     </div>
</section><!-- Section End -->
            


 <%@include file="../includes/footer.jsp" %>
</body>
</html>

