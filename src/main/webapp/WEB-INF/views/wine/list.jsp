<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
<!-- Section-->
<body>
	<%@ include file="../includes/header.jsp"%>
	
	<section class="py-5">
	
		<!-- Wine List-->
		
		<div class="container">
  			<c:forEach items="${list}" var="wine">
  			<div class="card" style="width: 300px;">
    			<img class="card-img-top" src="http://klea-home.iptime.org:8081/<c:out value="${wine.imageName}" />" alt="Card image" style="width:100%">
    		<div class="card-body">
      			<c:out value="${wine.winenery}" />
      			<h4 class="card-title"><a href='/wine/get?wno=${wine.wno}'>
									<c:out value="${wine.title}" /></a></h4><br>
				<p class="card-text">
					<c:out value="${wine.grapes}" /><br>
					<c:out value="${wine.region}" /><br>
					<c:out value="${wine.country}" /><br>
					<c:out value="${wine.wineStyle}" /><br>
					<c:out value="${wine.price}" />
      			</p>
      			
    		</div>
  			</div>
  			</c:forEach>
  		</div>
  		
		<!-- End of Wine List-->
	
	</section>
		
		<!-- Pagination -->
		
		<div class="Pagination">
			<ul class="pagination justify-content-center">
			  <c:if test="${pageMaker.prev}">
			  	<li class="paginate_button previous">
			  		<a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
			  </c:if>
			  
			  <c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}"><li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" } ">
						<a class="page-link" href='${num}'>${num}</a></li>
			  </c:forEach>
			  
			  
			  <c:if test="${pageMaker.next}">
			  	<li class="paginate_button next">
			  		<a class="page-link" href="${pageMaker.endPage + 1}">Next</a></li>
			  </c:if>
			</ul>
		</div>
		
		<form id="actionForm" action="/wine/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
		
		<!-- End of Pagination -->
	
	<%@ include file="../includes/footer.jsp"%>
</body>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	});
</script>

</html>
