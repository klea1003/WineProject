<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
<!-- Section-->
<body>
	<%@ include file="../includes/header.jsp"%>
	
	<label><input type="checkbox" name="wine_type" data-id="wine1" value="1" /> Red</label>
	<label><input type="checkbox" name="wine_type" data-id="wine2" value="2" /> White</label>
	<label><input type="checkbox" name="wine_type" data-id="wine3" value="3" /> Sparkling</label>
	<label><input type="checkbox" name="wine_type" data-id="wine4" value="4" /> Rose</label>
	<label><input type="checkbox" name="wine_type" data-id="wine5" value="5" /> Dessert</label>
	<label><input type="checkbox" name="wine_type" data-id="wine6" value="6" /> Fortified</label>
	
	<input type="button" class="temp" value="search" style="width:100px" / >
	
	
	<section class="py-5">
	
		<!-- Wine List-->
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center wine-card-list">
			</div>
		</div>
		<!-- End of Wine List-->

		<!-- Pagination -->
		<div class="pull-right">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" } ">
						<a href='${num}'>${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage + 1}">Next</a></li>
				</c:if>
			</ul>
		</div>
		<!-- End of Pagination -->

	</section>
	<!-- Bootstrap core JS-->
	<form id="actionForm" action="/wine/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>

	<%@include file="../includes/footer.jsp" %>
</body>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/wine_bootstrap/js/wine.js"></script>
<script type="text/javascript">

	$(document).ready(function() {

		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {
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
