<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html lang="en">
<%@ include file="../includes/header.jsp"%>
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
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
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
</style>

<body>
	
	
	<label><input type="checkbox" name="wine_type" data-id="wine1" value="1" /> Red</label>
	<label><input type="checkbox" name="wine_type" data-id="wine2" value="2" /> White</label>
	<label><input type="checkbox" name="wine_type" data-id="wine3" value="3" /> Sparkling</label>
	<label><input type="checkbox" name="wine_type" data-id="wine4" value="4" /> Rose</label>
	<label><input type="checkbox" name="wine_type" data-id="wine5" value="5" /> Dessert</label>
	<label><input type="checkbox" name="wine_type" data-id="wine6" value="6" /> Fortified</label>
	
	<input type="button" class="temp" value="search" style="width:100px" / >

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
	

	<%@include file="../includes/footer.jsp" %>

</body>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/wine_bootstrap/js/wine.js"></script>
<script type="text/javascript">

	$(document).ready(function() {

		var actionForm = $("#actionForm");

		$(".page-item a").on("click", function(e) {
			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		var wineDiv = $(".wine-card-list")
		
		showWineList();
		
		function showWineList() {
			
			wineService.requestWineList(
				function(list){
					
					var str = "";
					
					if(list == null || list.length ==0){
						wineDiv.html("");
						
						return;
					}
					
					for(var i = 0, len = list.length||0; i < len; i++) {
						//console.log(list[i]);
						
						str += "<div class='card'>";
						
						str += "<div class='card-image'>"
						str += "<img src='http://klea-home.iptime.org:8081/" + list[i].imageName + "' height='246' width='155'>"
						str += "</div>"
						
						str += "<div class='card-info'>"
						str += list[i].winenery
						str += "<a href='/wine/get?wno=" + list[i].wno +"'><h5 class='fw-bolder'>" + list[i].title + "</h5></a>"
						str += list[i].grapes
						str += list[i].region
						str += list[i].country
						str += list[i].wineStyle
						str += list[i].price
						str += "</div>"
						
						str += "</div>"
						
					}
					wineDiv.html(str);
				}		
			
			)
		}
		
		$(".temp").on("click", function(e) {
			e.preventDefault();

			console.log('click search btn');
			
			showWineList();
		});
	});
</script>

</html>
