<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html lang="en">
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
	<%@ include file="../includes/header.jsp"%>
	
	<!-- Searching Wine Types -->
	<h3>Wine Type</h3>	
	<div>
		<c:forEach items="${wineTypeList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" name="wine_type" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div><br>
	
	<!-- Price Range -->
	
	<br><br>
	
	
	<!-- Searching User Rating -->
	<div class="star-ratings">
		<div class="star-ratings-fill space-x-2 text-lg" :style="{ width: ratingToPercent + '%' }">
			<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		</div>
		<div class="star-ratings-base space-x-2 text-lg">
			<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		</div>
	</div>
	<div class="star-rating space-x-4 mx-auto">
	<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
	<label for="5-stars" class="star pr-4">★</label>
	<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
	<label for="4-stars" class="star">★</label>
	<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
	<label for="3-stars" class="star">★</label>
	<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
	<label for="2-stars" class="star">★</label>
	<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
	<label for="1-star" class="star">★</label>
	</div>
	<div> 
		<label><input type="radio" name="WineRating" value="1" /><div>4.5</div>Rare & extraordinary</label>
		<label><input type="radio" name="WineRating" value="2" /><div>4.0</div>Very good stuff</label>
		<label><input type="radio" name="WineRating" value="3" /><div>3.5</div>Good stuff</label>
		<label><input type="radio" name="WineRating" value="4" /><div>3.0</div>Average</label>
		<label><input type="radio" name="WineRating" value="5" /><div> </div>Any rating</label>
	</div><br>
	
	<!-- Searching Grapes -->
	<h3>Wine Grapes</h3>	
	<div>
		<c:forEach items="${wineGrapeList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" name="Grapes" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div><br>
	
	<!-- Searching Regions -->
	<h3>Wine Regions</h3>	
	<div>
		<c:forEach items="${wineRegionList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" name="Region" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div><br>
	
	<!-- Searching Countries -->
	<h3>Wine Countries</h3>	
	<div>
		<c:forEach items="${wineCountryList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" name="Region" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div><br>
	
	<!-- Searching Wine Style -->
	<h3>Wine Style</h3>	
	<div>
		<c:forEach items="${wineStyleList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" name="Region" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
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
						str += list[i].wineType + " " + "From" + " "
						str += list[i].country + "<br>"
						
						str += "<p class='card-text'>"
						str += list[i].grapes + "<br>"
						str += list[i].region + "<br>"						
						str += list[i].price  + "<br>"
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
