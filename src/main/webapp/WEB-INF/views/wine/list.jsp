<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>

<html lang="en">


<body>
	<%@ include file="../includes/header.jsp"%>
	
	<label><input type="checkbox" name="wine_type" value="Red wine" /> Red</label>
	<label><input type="checkbox" name="wine_type" value="White wine" /> White</label>
	<!-- 아래의 value는 추후 크롤링 DB 입력 후 변경해야 됨 -->
	<label><input type="checkbox" name="wine_type" value="3" /> Sparkling</label>
	<label><input type="checkbox" name="wine_type" value="4" /> Rosé</label>
	<label><input type="checkbox" name="wine_type" value="5" /> Dessert</label>
	<label><input type="checkbox" name="wine_type" value="6" /> Fortified</label>
	
	<input type="button" class="temp" value="search" style="width:100px" / >

	<!-- Section-->
	<section class="py-5">
		
		<!-- Wine List-->
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center wine-card-list">
            </div>
        </div>
        <!-- End of Wine List-->
		
	</section>
		
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
						
						str += "<div style='width: 1000px; height: 500px; margin-bottom: 20px;'>";				
						
						str += "<div style='width: 60%; height: 100%; float: left;'>"
						str += "<img class='card-img-top' src='http://klea-home.iptime.org:8081/" + list[i].imageName + "' alt='Card image' style='width : 164px; height: 500px;' />"
						str += "</div>"
						
						str += "<div class='card-body' style='width: 40%; height: 100%; float: right;'>"
						str += list[i].winenery
						str += "<h4 class='card-title'><a href='/wine/get?wno=" + list[i].wno + "'>" + list[i].title + " </a></h4><br>"
						str += "<p class='card-text'>"
						str += list[i].grapes + "<br>"
						str += list[i].region + "<br>"
						str += list[i].country + "<br>"
						str += list[i].wineStyle + "<br>"
						str += list[i].price + "<br>"
						str += "</p>"
							
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
