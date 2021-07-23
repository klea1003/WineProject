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

.card {
	
	height:500px;
	
} 

/* swiper css  */
.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-button-next {
	color: #BDBDBD;
}

.swiper-button-prev {
	color: #BDBDBD;
}

.swiper-container-vertical>.swiper-pagination-bullets {
	top: unset !important;
	bottom: 10px;
	left: 0;
	width: 100%;
}

.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet
	{
	display: inline-block !important;
	margin: 6px 2px !important;
}

.wineMainImg{
	
	background: url("/resources/images/wineMainImg.png");
	height: 400px;
	display: flex;
    justify-content: center;
    align-items: center;
    opacity: 0.8;
    color: #fff;

}

/* Range Slider CSS*/

#price-range, #rating-range { 
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

.btn-outline-danger {
 
  color: #fff;
  background-color: #990000;
  border-radius: 35px;
  border: 1px solid rgb(153, 0, 0, 0.75);   
  margin-right: 5px;  
 
}
 
</style>

<body>
	
	<!-- Header-->
	<header class="bg py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="bg-white text-dark">
				<h1 class="display-4 fw-bolder">New Arrival</h1><br>				
				
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <div>
				  <input type="radio" class="btn-check" name="priceCheck" id="1" autocomplete="off" value="1" checked>
				  <label class="btn btn-outline-danger" for="1">￦ 20,000</label>
				  </div>
				
				  <div>
				  <input type="radio" class="btn-check" name="priceCheck" id="2" autocomplete="off" value="2">
				  <label class="btn btn-outline-danger" for="2">￦ 40,000</label>
				  </div>
				
				  <div>
				  <input type="radio" class="btn-check" name="priceCheck" id="3" autocomplete="off" value="3">
				  <label class="btn btn-outline-danger" for="3">￦ 60,000</label>
				  </div>
				    
				  <div>
				  <input type="radio" class="btn-check" name="priceCheck" id="4" autocomplete="off" value="4">
				  <label class="btn btn-outline-danger" for="4">￦ 80,000</label>
				  </div>
				</div>
				
			</div>
		</div>
	</header>

	<!-- Section-->
	<section class="py-5">
		<div class="container">
			<!-- swiper슬라이더 메인컨테이너 -->
			<div class="swiper-container">
				<!-- 보여지는 영역 -->
				<div class="swiper-wrapper">
				</div>
				<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>
	</section>
	
	<!-- wineMainImg -->
	<div class="col mb-5">
		<h1 class="wineMainImg fw-bold">Discover the Right Wine</h1>
	</div>

	<!-- range area -->
	<div class="container mt-2 mb-5">
		
			
			<form id='searchForm' action="/wine/list" method='get'>
				<div class="row">
				<div class="col-2 dropdown">
					<button class="btn dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Red Wine</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item wine-select" href=1>Red Wine</a></li>
						<li><a class="dropdown-item wine-select" href=2>White Wine</a></li>
						<li><a class="dropdown-item wine-select" href=3>Sparkling Wine</a></li>
						<li><a class="dropdown-item wine-select" href=4>Rosé Wine</a></li>
						<li><a class="dropdown-item wine-select" href=5>Dessert Wine</a></li>
						<li><a class="dropdown-item wine-select" href=6>Port Wine</a></li>
					</ul>
				</div>
				
				<input type="hidden" name="wine_type_ids" id='wine_type' value=1>
				
				<div class="col-4">
					<p>
						<label for="amount">Price range:</label> <input type="text"
							id="amount" readonly
							style="border: 0; color: #990000; font-weight: bold;">
					</p>
					<div id="price-range"></div>
				</div>
				
				<div class="col-4">
					<p>
						<label for="rating">Rating:</label> <input type="text" id="rating"
							readonly style="border: 0; color: #990000; font-weight: bold;">
					</p>
					<input type="hidden" name="wine_price_min" id="wine_price_min" value="10000">
					<input type="hidden" name="wine_price_max" id="wine_price_max" value="30000">
					<div id="rating-range"></div>
				
				</div>
				<div class="col-2">
					<button type="submit" class="btn btn-outline-danger btn-lg">Show wines</button>
				</div>
			</div>
			</form>
	</div>			

	
	<form id="actionForm" action="/wine/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="totalPageNum" value="${pageMaker.totalPageNum}">
	</form>
	
	<input type="hidden" id="price_min" value="10000">
	<input type="hidden" id="price_max" value="30000">

<%@ include file="../includes/footer.jsp"%>
</body>
<script type="text/javascript">
	const swiper = new Swiper('.swiper-container', {
    //기본 셋팅
    //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
    direction: 'horizontal',
    //한번에 보여지는 페이지 숫자
    slidesPerView: 5,
    //페이지와 페이지 사이의 간격
    spaceBetween: 30,
    //드레그 기능 true 사용가능 false 사용불가
    debugger: false,
    //마우스 휠기능 true 사용가능 false 사용불가
    mousewheel: false,
    //반복 기능 true 사용가능 false 사용불가
    loop: false,
    //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가
    centeredSlides: false,
    // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
    // effect: 'fade',
    observer: true,
    
    //자동 스크를링
    autoplay: {
      //시간 1000 이 1초
      delay: 5000,
      disableOnInteraction: false,
     },
    
    //페이징
    pagination: {
      //페이지 기능
      el: '.swiper-pagination',
      //클릭 가능여부
      clickable: true,
    },

    //방향표
    navigation: {
      //다음페이지 설정
      nextEl: '.swiper-button-next',
      //이전페이지 설정
      prevEl: '.swiper-button-prev',
    },
    
  }); //swiper End
  
//jquery price range 
  $( function() {
    $( "#price-range" ).slider({
      range: true,
      min: 0,
      max: 500000,
      step: 1000,
      values: [ 20000, 200000 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "￦" + ui.values[ 0 ] + " - ￦" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "￦" + $( "#price-range" ).slider( "values", 0 ) +
      " - ￦" + $( "#price-range" ).slider( "values", 1 ) );
  } ); //end jquery price range

  //jquery rating-range
  $( function() {
  	    $( "#rating-range" ).slider({
  	      range: true,
  	      min: 0,
  	      max: 5,
  	      values: [ 0, 5 ],
  	      slide: function( event, ui ) {
  	        $( "#rating" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
  	      }
  	    });
  	    $( "#rating" ).val( "" + $( "#rating-range" ).slider( "values", 0 ) +
  	      " - " + $( "#rating-range" ).slider( "values", 1 ) );
  	  } ); //end jquery rating-range


</script>

<script src="/resources/wine_bootstrap/js/wine.js"></script>
<script type="text/javascript">   

	$(document).ready(function() {
		
		var swiperDiv = $(".swiper-wrapper")
		
		showWineList();
		
		function showWineList() {
			
			wineService.requestWineList(
				function(list){
					
					var str = "";
					
					if(list == null || list.length ==0){
						swiperDiv.html("");
						
						return;
					}
					
					for(var i = 0, len = list.length||0; i < len; i++) {
						
						str += "<div class='swiper-slide'>"
						
						str += "<div class='card wine pt-5' style='text-align: center; display: block;'>"
						str += "<img src='http://klea-home.iptime.org:8081/" + list[i].imageName + "' style='width : 40px; height: 140px;'/>"
						
						str += "<div class='card-body mb-5'>"
						
						str += "<div class='mt-5' style='height:54px; width:180px;'>"
						str += "<p>" 
						str += "<a class='fw-bold text-dark' href='/wine/get?wno="+ list[i].wno + "'>" +list[i].title +" </a></p>"
						str += "</div>"
						
						str += "<div class='mt-4'>"
						if(list[i].avgRating != null) {
							str += wineUtil.starFromRating(list[i].avgRating) + "<br>"
							str += list[i].avgRating 	
						} else {
							str += "&nbsp;Not Rating<br><br>"							
						}
						str += "</div>"
						
						
						str += "</div>"
						
						str += "<div>"
						str += "<a class='btn btn-outline-danger' href='#'> ￦ " + wineUtil.numberWithCommas(list[i].price) + " </a>"
						str += "</div>"
						
						str += "</div>"
						
						str += "</div>"
						
					}
					
					swiperDiv.append(str);
				}		
			)
		}
		
		var actionForm = $("#actionForm");
		
		// top price list select
		$(".btn-check").on("click", function(e) {
			console.log('click checkbox btn');
			
			if ($(this).val() == 1){
				$( "#price_min" ).val(0);
				$( "#price_max" ).val(20000);
			} else if ($(this).val() == 2){
				$( "#price_min" ).val(20000);
				$( "#price_max" ).val(40000);
			} else if ($(this).val() == 3){
				$( "#price_min" ).val(40000);
				$( "#price_max" ).val(80000);
			} else if ($(this).val() == 4){
				$( "#price_min" ).val(80000);
				$( "#price_max" ).val(200000);
			}

			swiperDiv.html("");	// to empty
			actionForm.find("input[name='pageNum']").val("1");
			wineService.requestTotalPageNum();
			
			showWineList();
		});
		
		var searchForm = $("#searchForm");
		
		$(".wine-select").on("click", function(e) {
			e.preventDefault();
			
			console.log($('#wine_type').val($(this).attr("href")));			
			//searchForm.find("input[name='wine_type_ids']").val($(this).attr("href"));		
			
			$('#dropdownMenuButton1').text($(this).text());
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
		        	$( "#wine_price_min" ).val(ui.values[ 0 ]);
		        	$( "#wine_price_max" ).val(ui.values[ 1 ]);
		        	
	        	}
			});
			$( "#amount" ).val( "￦" + $( "#price-range" ).slider( "values", 0 ) +
				" - ￦" + $( "#price-range" ).slider( "values", 1 ) );
			$( "#wine_price_min" ).val($( "#price-range" ).slider( "values", 0 ));
			$( "#wine_price_max" ).val($( "#price-range" ).slider( "values", 1 ));
		}); //end jquery price range
	
	});
</script>

</html>
