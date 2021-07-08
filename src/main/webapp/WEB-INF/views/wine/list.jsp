<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
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

input[type=radio]{
	color: #990000;
}

.card-img-top{

	display: block; 
	margin: 0px auto;

}

</style>

<body>
	<div class="text-center mt-5 mb-5">
		<h3>Showing 822 Red wines between ₩10000 - ₩40000 rated above 3.5 stars</h3>
	</div>


<div class="container">
	<div class="row">
	<div class="col-4 typeArea">
	
	<input type="hidden" name="wine_keyword" value=<c:out value="${wine_keyword}" />>
		
	<!-- Searching Wine Types -->
	<h3>Wine Type</h3>	
	
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
		<div>
		<c:forEach items="${wineTypeList}" var="winePropertyDTO" varStatus="status" begin="0" step="1" end="2">
				<input type="checkbox" class="btn-check" name="wine_type" id="<c:out value="wine_type${status.index}"/>"
				value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
				<label class="btn btn-outline-danger btn-sm" for="<c:out value="wine_type${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
				</label>			
		</c:forEach>
		<br><br>
		<c:forEach items="${wineTypeList}" var="winePropertyDTO" varStatus="status" begin="3" step="1" end="5">
				<input type="checkbox" class="btn-check" name="wine_type" id="<c:out value="wine_type${status.index}"/>"
				value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
				<label class="btn btn-outline-danger btn-sm" for="<c:out value="wine_type${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
				</label>			
		</c:forEach>
		</div>
	</div>
	
	
	<!-- Price Range -->
	<h3>Price Range</h3>	
	<div class="col-3">
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
		<label><input type="radio" class="check_box" name="wine_rating" value="1" <c:if test='${wine_rating eq 1}'>checked</c:if>/>
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
		<label><input type="radio" class="check_box" name="wine_rating" value="2" <c:if test='${wine_rating eq 2}'>checked</c:if>/>
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
		<label><input type="radio" class="check_box" name="wine_rating" value="3" <c:if test='${wine_rating eq 3}'>checked</c:if>/>
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
		<label><input type="radio" class="check_box" name="wine_rating" value="4" <c:if test='${wine_rating eq 4}'>checked</c:if>/>
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
		<label><input type="radio" class="check_box" name="wine_rating" value="5" <c:if test='${wine_rating eq 5}'>checked</c:if>/>
		<Strong>Any rating</Strong>
		</label>
	</div>
	
	
	<!-- Searching Grapes -->
	<h3>Wine Grapes</h3>	
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div>
		<c:forEach items="${wineGrapeList}" var="winePropertyDTO" varStatus="status" begin="0" end="2" step="1">
			<input type="checkbox" class="btn-check" name="grapes" id="<c:out value="grapes${status.index}"/>" 
				value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="grapes${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
		<br>
		<br>
		<c:forEach items="${wineGrapeList}" var="winePropertyDTO" varStatus="status" begin="3" end="5" step="1">
			<input type="checkbox" class="btn-check" name="grapes" id="<c:out value="grapes${status.index}"/>" 
				value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="grapes${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
		<br>
		<br>
		<c:forEach items="${wineGrapeList}" var="winePropertyDTO" varStatus="status" begin="6" end="8" step="1">
			<input type="checkbox" class="btn-check" name="grapes" id="<c:out value="grapes${status.index}"/>" 
				value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="grapes${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div>
	</div>
	<br>
	
	<!-- Searching Regions -->
	<h3>Wine Regions</h3>	
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div>
		<c:forEach items="${wineRegionList}" var="winePropertyDTO" varStatus="status" begin="0" end="2" step="1">
			<input type="checkbox" class="btn-check" name="region" id="<c:out value="region${status.index}"/>" 
			value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
			<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="region${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
		<br>
		<br>
			<c:forEach items="${wineRegionList}" var="winePropertyDTO" varStatus="status" begin="3" end="6" step="1">
			<input type="checkbox" class="btn-check" name="region" id="<c:out value="region${status.index}"/>" 
			value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
			<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="region${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div>
	</div><br>
	
	<!-- Searching Countries -->
	<h3>Wine Countries</h3>
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">	
	<div>
		<c:forEach items="${wineCountryList}" var="winePropertyDTO" varStatus="status" begin="0" end="4" step="1">
			<input type="checkbox" class="btn-check" name="country" id="<c:out value="country${status.index}"/>"
			value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="country${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
		<br> <br>
		
				<c:forEach items="${wineCountryList}" var="winePropertyDTO" varStatus="status" begin="5" end="9" step="1">
			<input type="checkbox" class="btn-check" name="country" id="<c:out value="country${status.index}"/>"
			value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="country${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div>
	</div><br>
	
	<!-- Searching Wine Style -->
	<h3>Wine Style</h3>	
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div>
		<c:forEach items="${wineStyleList}" var="winePropertyDTO" varStatus="status" begin="0" end="1" step="1">
			<input type="checkbox" class="btn-check" name="wine_style" id="<c:out value="wine_style${status.index}"/>"
			 value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="wine_style${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
		<br><br>
		<c:forEach items="${wineStyleList}" var="winePropertyDTO" varStatus="status" begin="2" end="3" step="1">
			<input type="checkbox" class="btn-check" name="wine_style" id="<c:out value="wine_style${status.index}"/>"
			 value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="wine_style${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
		<br><br>
		<c:forEach items="${wineStyleList}" var="winePropertyDTO" varStatus="status" begin="4" end="5" step="1">
			<input type="checkbox" class="btn-check" name="wine_style" id="<c:out value="wine_style${status.index}"/>"
			 value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="wine_style${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
	</div>
	</div><br>
	</div>
	
	
		<div class="col-8 wineListArea">
		<!-- Section-->
		<section class="py-5">
			<!-- Wine List-->
	        <div class="containe px-lg-5">
	            <div class="wine-card-list">
	           
	           
	           </div>
	        </div>
	        <!-- End of Wine List-->
			
		</section>

	<form id="actionForm" action="/wine/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="totalPageNum" value="${pageMaker.totalPageNum}">
	</form>
		</div><!-- end wineListArea -->
	</div><!-- end row -->
</div><!-- end container -->
	<%@include file="../includes/footer.jsp" %>

</body>

<script src="/resources/wine_bootstrap/js/wine.js"></script>
<script type="text/javascript">   

	$(document).ready(function() {

		var actionForm = $("#actionForm");
		
		console.log(actionForm.find("input[name='totalPageNum']").val());
		
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
						
						str += "<div class='container'>";				
						str += "<div class='row mb-5'>"
						
						str += "<div class='col-3 bg-light'>"
						str += "<img class='card-img-top' src='http://klea-home.iptime.org:8081/" + list[i].imageName + "' alt='Card image' style='width : 80px; height: 280px; ' />"
						str += "</div>"
						
						str += "<div class='col-4 card-body'>"
						str += list[i].winenery
						str += "<h4 class='card-title'><a href='/wine/get?wno=" + list[i].wno + "'>" + list[i].title + " </a></h4><br>"
						str += list[i].wineType + " " + "From" + " "
						str += list[i].country + "<br>"
						
							
						str += "<span style='color:rgb(156,22,49)''><i class='fa fa-xl fa-star'> </i></span>"
						str += "&nbsp;"+list[i].avgRating + "<br>"
						str += "<h5> ￦ " + list[i].price  + "</h5>"
						
						str += "<div class='mt-5'>"
						str += "<a href='/seller/list' class='btn btn-outline-danger btn-lg'>"
						str += "view shops"
						str += "</a>"
						str += "&nbsp;<button type='button' class='btn btn-outline-dark btn-lg'>"
						str += "Wish"
						str += "</button>"
						str += "</div>"
						
						str += "</div>"
						str += "</div>"
						str += "</div>"
						
					}
					
					wineDiv.append(str);
				}		
			)
		}
		
		$(".btn-check").on("click", function(e) {
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
				values: [ <c:out value="${winePriceMin}" />, <c:out value="${winePriceMax}" /> ],
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
