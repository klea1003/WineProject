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
	width: 350px; 
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

.btn-outline-danger {
 
  color: #990000;
  background-color: #fff;
  border-radius: 35px;
  border: 1px solid rgb(153, 0, 0, 0.75);   
  font-size: 15px;
  line-height: normal;
  font-weight: 400;
  justify-content: center;
  text-decoration: none;
  min-width: 70px;
  padding: 8px;

 
}

.btn-outline-dark {
	
  border-radius: 35px;
  border: 1px solid rgb(0, 0, 0);
  font-size: 15px;   

}

.card-title a {
	
	color: #000000;
	text-decoration: none;
	
}

.wine-card-list {

	border: 1px solid #d9d9d9;
	box-shadow: 0 0 7px 0 rgb(0 0 0 / 6%);
    background: #fff;
    border-radius: 4px;
	padding-top: 10px;
		
}


</style>

<body>
	<div class="text-center mt-5 mb-5">
		<h3 id=title></h3>
	</div>


<div class="container">
	<div class="row">
	<div class="col-4 typeArea">
	
	<input type="hidden" name="wine_keyword" value=<c:out value="${wine_keyword}" />>
		
	<!-- Searching Wine Types -->
	<h3 class="fw-bold">Wine Type</h3><br>		
	
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
		<div class="mt-3 mb-5">
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
	<h3 class="fw-bold">Price Range</h3><br>		
	<div class="col-3 mt-3 mb-5">
		<p>
			<input type="text" id="amount" readonly style="border: 0; color: #990000; font-weight: bold;">
		</p>
		<input type="hidden" id="price_min" value=<c:out value="${winePriceMin}" />>
		<input type="hidden" id="price_max" value=<c:out value="${winePriceMax}" />>
		<div id="price-range"></div>
	</div>
	
	
	<!-- Searching User Rating -->
	<h3 class="fw-bold">User Rating</h3><br>		
	<div> 
		<label><input type="radio" class="check_box" name="wine_rating" value="1" <c:if test='${wine_rating eq 1}'>checked</c:if>/>
		<span style="color:rgb(156,22,49)" ><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star-half"></i></span>
		<strong> 4.5 Rare & extraordinary</strong>
		</label>
	</div>
	
	<div> 
		<label><input type="radio" class="check_box" name="wine_rating" value="2" <c:if test='${wine_rating eq 2}'>checked</c:if>/>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(1,1,1, 0.3)"><i class="fa fa-xl fa-star"></i></span>
		<strong> 4.0 Very good stuff</strong>
		</label>
	</div>
	
	<div> 
		<label><input type="radio" class="check_box" name="wine_rating" value="3" <c:if test='${wine_rating eq 3}'>checked</c:if>/>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star-half"></i></span>
		<span style="color:rgb(1,1,1, 0.3)"><i class="fa fa-xl fa-star"></i></span>
		<strong> 3.5 Good stuff</strong>
		</label>
	</div>
	
	<div> 
		<label><input type="radio" class="check_box" name="wine_rating" value="4" <c:if test='${wine_rating eq 4}'>checked</c:if>/>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(156,22,49)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(1,1,1, 0.3)"><i class="fa fa-xl fa-star"></i></span>
		<span style="color:rgb(1,1,1, 0.3)"><i class="fa fa-xl fa-star"></i></span>
		<strong> 3.0 Average</strong>
		</label>
	</div>
	
	<div class="mb-5"> 
		<label><input type="radio" class="check_box" name="wine_rating" value="5" <c:if test='${wine_rating eq 5}'>checked</c:if>/>
		<Strong>Any rating</Strong>
		</label>
	</div>
	
	
	<!-- Searching Grapes -->
	<h3 class="fw-bold">Wine Grapes</h3><br>		
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div class="mt-3 mb-5">
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
	
	<!-- Searching Regions -->
	<h3 class="fw-bold">Wine Regions</h3><br>		
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div class="mt-3 mb-5">
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
	</div>
	
	<!-- Searching Countries -->
	<h3 class="fw-bold">Wine Countries</h3><br>	
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">	
	<div class="mt-3 mb-5">
		<c:forEach items="${wineCountryList}" var="winePropertyDTO" varStatus="status" begin="0" end="3" step="1">
			<input type="checkbox" class="btn-check" name="country" id="<c:out value="country${status.index}"/>"
			value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="country${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
		<br><br>
		
		<c:forEach items="${wineCountryList}" var="winePropertyDTO" varStatus="status" begin="4" end="7" step="1">
			<input type="checkbox" class="btn-check" name="country" id="<c:out value="country${status.index}"/>"
			value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="country${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
		<br><br>
		
		<c:forEach items="${wineCountryList}" var="winePropertyDTO" varStatus="status" begin="8" end="10" step="1">
			<input type="checkbox" class="btn-check" name="country" id="<c:out value="country${status.index}"/>"
			value="<c:out value="${winePropertyDTO.wineProperty.keyValue}" />"
				<c:if test='${winePropertyDTO.flag eq true}'>checked</c:if>/>
			<label class="btn btn-outline-danger btn-sm" for="<c:out value="country${status.index}"/>">
				<c:out value="${winePropertyDTO.wineProperty.displayText}" />
			</label>			
		</c:forEach>
		
	</div>
	</div>
	
	<!-- Searching Wine Style -->
	<h3 class="fw-bold">Wine Style</h3><br>	
	<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div class="mt-3 mb-5">
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
	</div>
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


	var user = '${user}';
	
	
	function addWish(_input){
		
		if(user == null || user ==''){
			
			$("#loginModal").modal("show");
			
			return
		}
		
		if(user != null || user !=''){
			
			console.log("add wish button clicked" + _input)
			
			location.href = "/wishList/insert?wno=" + _input;
		}
	};
	
	function addCart(_input){
		
		if(user == null || user ==''){
			
			$("#loginModal").modal("show");
			
			return
		}
		
		if(user != null || user !=''){
			
		console.log("add cart button clicked" + _input)
		
		location.href = "/cart/insert?wineNum=" + _input + "&wineQty=1";
		
		}
		
	};

	$(document).ready(function() {

		var actionForm = $("#actionForm");
		
		console.log(actionForm.find("input[name='totalPageNum']").val());
		
		$(window).scroll(function() {
			
			//console.log("scrolling window.scrollTop: " + $(window).scrollTop() + " document.height " + $(document).height() + " window.height " + $(window).height())
		
			// scroll 감지
			if($(window).scrollTop() >= $(document).height() - $(window).height() - 1.0){	// float 문제 때문에 -1.0을 더해서 계산
				console.log("scroll update");
				
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
		
		wineService.requestTotalPageNum();
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
						str += "<div class='row mb-2'>"
						
						str += "<div class='col-3 bg-light'>"
						str += "<img class='card-img-top' src='http://klea-home.iptime.org:8081/" + list[i].imageName + "' alt='Card image' style='width : 80px; height: 280px; ' />"
						str += "</div>"
						
						str += "<div class='col-4 card-body'>"
						str += list[i].winenery
						str += "<h4 class='card-title'><a href='/wine/get?wno=" + list[i].wno + "'>" + list[i].title + " </a></h4><br>"
						str += list[i].wineType + " " + "From" + " "
						str += list[i].country + "<br>"
						str += list[i].grapes + "<br>"
						
							
						str += "<span style='color:rgb(156,22,49)''><i class='fa fa-xl fa-star'> </i></span>"
						if(list[i].avgRating != null) {
							str += "&nbsp;"+list[i].avgRating + "<br>"
						} else {
							str += "&nbsp;Not Rating<br>"
						}						
						str += "<h5> ￦ " + wineUtil.numberWithCommas(list[i].price)  + "</h5>"
						
						str += "<div class='mt-5'>"
						
						str += "&nbsp;<button type='button' class='btn btn-outline-danger' onclick='addCart(" + list[i].wno + ");'>"
						str += "Add cart"
						str += "</button>"
						
						str += "&nbsp;<button type='button' class='btn btn-outline-dark' onclick='addWish(" + list[i].wno + ");'>"
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
				max: 200000,
				step: 1000,
				values: [ <c:out value="${winePriceMin}" />, <c:out value="${winePriceMax}" /> ],
				slide: function( event, ui ) {
		        	$( "#amount" ).val( "￦" + wineUtil.numberWithCommas(ui.values[ 0 ]) + " - ￦" + wineUtil.numberWithCommas(ui.values[ 1 ]) );
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
			$( "#amount" ).val( "￦" + wineUtil.numberWithCommas($( "#price-range" ).slider( "values", 0 )) +
				" - ￦" + wineUtil.numberWithCommas($( "#price-range" ).slider( "values", 1 )) );
			$( "#price_min" ).val($( "#price-range" ).slider( "values", 0 ));
			$( "#price_max" ).val($( "#price-range" ).slider( "values", 1 ));
		}); //end jquery price range
	});
</script>

</html>
