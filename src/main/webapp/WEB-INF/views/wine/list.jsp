<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>

<html lang="en">


<body>
	<%@ include file="../includes/header.jsp"%>
	<!-- Searching Wine Types -->
	<div>
		<label><input type="checkbox" name="wine_type" value="Red wine" /> Red</label>
		<label><input type="checkbox" name="wine_type" value="White wine" /> White</label>
		<!-- 아래의 value는 추후 크롤링 DB 입력 후 변경해야 됨 -->
		<label><input type="checkbox" name="wine_type" value="3" /> Sparkling</label>
		<label><input type="checkbox" name="wine_type" value="4" /> Rosé</label>
		<label><input type="checkbox" name="wine_type" value="5" /> Dessert</label>
		<label><input type="checkbox" name="wine_type" value="6" /> Fortified</label>
	</div><br>
	
	<!-- Searching Grapes -->
	<div>
		<label><input type="checkbox" name="Grapes" value="Cabernet Franc" /> Cabernet Franc</label>
		<label><input type="checkbox" name="Grapes" value="Cabernet Sauvignon" /> Cabernet Sauvignon</label>
		<label><input type="checkbox" name="Grapes" value="Chardonnay" /> Chardonnay</label>
		<label><input type="checkbox" name="Grapes" value="Grenache" /> Grenache</label>
		<label><input type="checkbox" name="Grapes" value="Malbec" /> Malbec</label>
		<label><input type="checkbox" name="Grapes" value="Merlot" /> Merlot</label>
		<label><input type="checkbox" name="Grapes" value="Pinot Noir" /> Pinot Noir</label>
		<label><input type="checkbox" name="Grapes" value="Riesling" /> Riesling</label>
		<label><input type="checkbox" name="Grapes" value="Sauvignon Blanc" /> Sauvignon Blanc</label>
	</div><br>
	
	<!-- Searching Regions -->
	<div> 
		<label><input type="checkbox" name="Region" value="Bordeaux" /> Bordeaux</label>
		<label><input type="checkbox" name="Region" value="Bourgogne" /> Bourgogne</label>
		<label><input type="checkbox" name="Region" value="Napa Valley" /> Napa Valley</label>
		<label><input type="checkbox" name="Region" value="Piemonte" /> Piemonte</label>
		<label><input type="checkbox" name="Region" value="Rhone Valley" /> Rhone Valley</label>
		<label><input type="checkbox" name="Region" value="Toscana" /> Toscana</label>
		<label><input type="checkbox" name="Region" value="Spain" /> Spain</label>				
	</div><br>
	
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

	<form id="actionForm" action="/wine/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="totalPageNum" value="${pageMaker.totalPageNum}">
	</form>
	

	<%@include file="../includes/footer.jsp" %>

</body>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/wine_bootstrap/js/wine.js"></script>
<script type="text/javascript">

	$(document).ready(function() {

		var actionForm = $("#actionForm");
		
		console.log(actionForm.find("input[name='totalPageNum']").val());

		$(".page-item a").on("click", function(e) {
			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(window).scroll(function() {
		
			// scroll 감지
			if($(window).scrollTop() == $(document).height() - $(window).height()){
				console.log("scrolling");
				
				
				var currentPageNum = parseInt(actionForm.find("input[name='pageNum']").val());
				var totalPageNum = parseInt(actionForm.find("input[name='totalPageNum']").val());
				
				if (currentPageNum + 1 <= totalPageNum) {
					
					console.log("update last")
				
					actionForm.find("input[name='pageNum']").val(currentPageNum + 1);
				
					showWineList();
				}
			}
		})
		
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
					
					wineDiv.append(str);
				}		
			)
		}
		
		$(".temp").on("click", function(e) {
			e.preventDefault();

			console.log('click search btn');
			
			wineDiv.html("");	// to empty
			actionForm.find("input[name='pageNum']").val("1");
			wineService.requestTotalPageNum();
			
			showWineList();
		});
	});
</script>

</html>
