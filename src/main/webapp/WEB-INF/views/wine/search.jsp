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

	<div class="container px-5 my-5">
		<div class="text-center">
            <h1 class="fw-bolder">Search List</h1>
        </div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-8 wineListArea">
			
				<!-- Section-->
				<section class="py-5">
					<!-- Wine List-->
			        <div class="container" style="margin-left: 25%;">
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
				<input type="hidden" name="wine_keyword" value=<c:out value="${wine_keyword}" />>
					
				<!-- Price Range -->
				<input type="hidden" id="price_min" value="0">
				<input type="hidden" id="price_max" value="200000">
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
						str += "<div class='row mb-2'>"
						
						str += "<div class='col-3 bg-light'>"
						str += "<img class='card-img-top' src='http://klea-home.iptime.org:8081/" + list[i].imageName + "' alt='Card image' style='width : 80px; height: 280px; ' />"
						str += "</div>"
						
						str += "<div class='col-4 card-body'>"
						str += list[i].winenery
						str += "<h4 class='card-title'><a href='/wine/get?wno=" + list[i].wno + "'>" + list[i].title + " </a></h4><br>"
						str += list[i].wineType + " " + "From" + " "
						str += list[i].country + "<br>"
						
							
						str += "<span style='color:rgb(156,22,49)''><i class='fa fa-xl fa-star'> </i></span>"
						if(list[i].avgRating != null) {
							str += "&nbsp;"+list[i].avgRating + "<br>"
						} else {
							str += "&nbsp;Not Rating<br>"
						}		
						str += "<h5> ￦ " + list[i].price  + "</h5>"
						
						str += "<div class='mt-5'>"
						str += "<a href='/seller/list' class='btn btn-outline-danger'>"
						str += "view shops"
						str += "</a>"
						str += "&nbsp;<button type='button' class='btn btn-outline-dark'>"
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
