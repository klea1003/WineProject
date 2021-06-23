<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>

<html lang="en">


<body>
	<%@ include file="../includes/header.jsp"%>
	
	<!-- Section-->
	<section class="py-5">
	
		<!-- Wine List-->
		<div class="container" style="text-align: center;">
  			<c:forEach items="${list}" var="wine">
  			<div style="width: 1000px; height: 500px; margin-bottom: 20px;">
    			<div style="width: 60%; height: 100%; float: left;">
    			<img class="card-img-top" src="http://klea-home.iptime.org:8081/<c:out value="${wine.imageName}" />" alt="Card image" style="width : 164px; height: 500px;" >
	    		</div>
	    		<div class="card-body" style="width: 40%; height: 100%; float: right;">
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
	      			<a href="#" class="btn btn-outline-danger">View shops</a>
	    		</div>
  			</div>
  			</c:forEach>
  		</div>
	</section><!-- End of Wine List-->
		
		<!-- Pagination -->
		
		<div class="Pagination">
			<ul class="pagination justify-content-center">
			  <c:if test="${pageMaker.prev}">
			  	<li class="page-item previous">
			  		<a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
			  </c:if>
			  
			  <c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : "" } ">
						<a class="page-link" href='${num}'>${num}</a></li>
			  </c:forEach>
			  
			  
			  <c:if test="${pageMaker.next}">
			  	<li class="page-item next">
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

		$(".page-item a").on("click", function(e) {
			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	});
</script>

</html>
