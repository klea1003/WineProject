<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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

#price-range { 
	width: 400px; 
	margin: 10px;
} 
.ui-slider-range  { 
	background-color: #990000;
} 
 
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, 
html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
    border: 1px solid #990000;
    background: #990000;
    font-weight: normal;
    color: #990000;
}
</style>

<body>
	<%@ include file="../includes/header.jsp"%>
	
	<input type="hidden" name="wine_keyword" value=<c:out value="${wine_keyword}" />>
	
	<!-- Searching Wine Types -->
	<h3>Wine Type</h3>	
	<div>
		<c:forEach items="${wineTypeList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" class="check_box" name="wine_type" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div><br>
	
	<!-- Price Range -->
	<h3>Price Range</h3>	
	<div class="col-md-4">
		<p>
			<label for="amount">Price range:</label> <input type="text"
				id="amount" readonly
				style="border: 0; color: #990000; font-weight: bold;">
		</p>
		<input type="hidden" id="price_min" value="10000">
		<input type="hidden" id="price_max" value="30000">
		<div id="price-range"></div>
	</div>
	
	
	<!-- Searching User Rating -->
	<h3>User Rating</h3>	
	<div> 
		<label><input type="radio" name="wine_rating" value="1" />
		<span style="color:rgb(156,22,49)" ><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star-half"></i></span>
		<strong> 4.5 </strong>
		<Strong>Rare & extraordinary</Strong>
		</label>
	</div>
	
	<div> 
		<label><input type="radio" name="wine_rating" value="1" />
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(1,1,1, 0.3)"><i class="fa fa-xl fa-star"></i></span>
		<strong> 4.0 </strong>
		<Strong>Very good stuff</Strong>
		</label>
	</div>
	
	<div> 
		<label><input type="radio" name="wine_rating" value="1" />
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star-half"></i></span>
		<span style="color:rgb(1,1,1, 0.3)"><i class="fa fa-xl fa-star"></i></span>
		<strong> 3.5 </strong>
		<Strong>Good stuff</Strong>
		</label>
	</div>
	
	<div> 
		<label><input type="radio" name="wine_rating" value="1" />
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(1,1,1, 0.3)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(1,1,1, 0.3)"><i class="fa fa-xl fa-star"></i></span>
		<strong> 3.0 </strong>
		<Strong>Average</Strong>
		</label>
	</div>
	
	<div> 
		<label><input type="radio" name="wine_rating" value="1" />
		<Strong>Any rating</Strong>
		</label>
	</div>
	
	
	<!-- Searching Grapes -->
	<h3>Wine Grapes</h3>	
	<div>
		<c:forEach items="${wineGrapeList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" class="check_box" name="Grapes" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div><br>
	
	<!-- Searching Regions -->
	<h3>Wine Regions</h3>	
	<div>
		<c:forEach items="${wineRegionList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" class="check_box" name="Region" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div><br>
	
	<!-- Searching Countries -->
	<h3>Wine Countries</h3>	
	<div>
		<c:forEach items="${wineCountryList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" class="check_box" name="Region" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div><br>
	
	<!-- Searching Wine Style -->
	<h3>Wine Style</h3>	
	<div>
		<c:forEach items="${wineStyleList}" var="winePropertyDTO">
			<label>
				<input type="checkbox" class="check_box" name="Region" value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/><c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div><br>


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
		
		$(".check_box").on("click", function(e) {
			console.log('click checkbox btn');
			
			wineDiv.html("");	// to empty
			actionForm.find("input[name='pageNum']").val("1");
			wineService.requestTotalPageNum();
			
			showWineList();
		});
		

		$( function() {
			$( "#price-range" ).slider({
				range: true,
				min: 0,
				max: 100000,
				step: 1000,
				values: [ 10000, 30000 ],
				slide: function( event, ui ) {
		        	$( "#amount" ).val( "￦" + ui.values[ 0 ] + " - ￦" + ui.values[ 1 ] );
		        	$( "#price_min" ).val(ui.values[ 0 ]);
		        	$( "#price_max" ).val(ui.values[ 1 ]);
		        	
	        	},
	        	stop: function(event, ui) {
					wineDiv.html("");	// to empty
					actionForm.find("input[name='pageNum']").val("1");
					wineService.requestTotalPageNum();
					
					showWineList();
				}
			});
			$( "#amount" ).val( "￦" + $( "#price-range" ).slider( "values", 0 ) +
				" - ￦" + $( "#price-range" ).slider( "values", 1 ) );
			$( "#price_min" ).val($( "#price-range" ).slider( "values", 0 ));
			$( "#price_max" ).val($( "#price-range" ).slider( "values", 1 ));
		}); //end jquery price range
	});
</script>

</html>
