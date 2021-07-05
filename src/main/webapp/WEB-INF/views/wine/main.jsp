<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<style>
.card {
	height: 450px;
	width: 230px;
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

.welcome-repeat {
	background-image: url("/resources/images/wineMainImg.jpg");
	background-repeat: repeat repeat;
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
 
</style>

<body>
	
	<!-- Header-->
	<header class="bg py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="bg-white text-dark">
				<h1 class="display-4 fw-bolder">Top Lists in your area</h1>
				
				<div>
					<label><input type="checkbox" name="top list" value="20000">
						20000</label> <label><input type="checkbox" name="top list"
						value="40000"> 40000</label> <label><input type="checkbox"
						name="top list" value="60000"> 60000</label> <label><input
						type="checkbox" name="top list" value="80000"> 80000</label>
				</div>
			</div>
		</div>
	</header>

	<!-- Section-->
	<section class="py-5">
		<div class="container">

			<div class="row justify-content-center">
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
		</div>
	</section>
	
	<!-- wineMainImg -->
	<div class="col mb-5 welcome-repeat">
		<img src="/resources/images/wineMainImg.jpg" alt="Responsive image"
			style="height: 400px;">
	</div>
	
	<!-- range area -->
	<div class="container">
		<div class="row">
			
			<div class="col-md-2 dropdown">
				<button class="btn dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">Red Wine</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="#">Red Wine</a></li>
					<li><a class="dropdown-item" href="#">White Wine</a></li>
					<li><a class="dropdown-item" href="#">Sparkling Wine</a></li>
					<li><a class="dropdown-item" href="#">Rosé Wine</a></li>
					<li><a class="dropdown-item" href="#">Dessert Wine</a></li>
					<li><a class="dropdown-item" href="#">Port Wine</a></li>
				</ul>
			</div>
			
			<div class="col-md-4">
				<p>
					<label for="amount">Price range:</label> <input type="text"
						id="amount" readonly
						style="border: 0; color: #990000; font-weight: bold;">
				</p>
				<div id="price-range"></div>
			</div>
			
			<div class="col-md-4">
				<p>
					<label for="rating">Rating:</label> <input type="text" id="rating"
						readonly style="border: 0; color: #990000; font-weight: bold;">
				</p>
				<div id="rating-range"></div>
			</div>
			
			<div class="col-md-2">
				<button type="button" class="btn btn-outline-danger btn-lg">Show
					wines</button>
			</div>
			
		</div>
	</div><!-- end range area -->
	
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
    spaceBetween: 0,
    //드레그 기능 true 사용가능 false 사용불가
    debugger: false,
    //마우스 휠기능 true 사용가능 false 사용불가
    mousewheel: false,
    //반복 기능 true 사용가능 false 사용불가
    loop: false,
    //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
    centeredSlides: false,
    // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
    // effect: 'fade',
    observer: true,
    
    //자동 스크를링
    autoplay: {
      //시간 1000 이 1초
      delay: 1000,
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

		var actionForm = $("#actionForm");
		
		console.log(actionForm.find("input[name='totalPageNum']").val());

		$(".page-item a").on("click", function(e) {
			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		var wineDiv = $(".swiper-wrapper")
		
		wineDiv.html("");
		
		
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
						str += "<div class='swiper-slide'>"
						str += "<div class='col mb-5'>"
						str += "<div class='card wine'>"
						str += "<!-- Product image-->"
						str += "<img class='card-img-top'"
						str += "src='https://dummyimage.com/450x300/dee2e6/6c757d.jpg'"
						str += "alt=''...'' />"
						str += "<div class='card-body p-5'>"
						str += "<div class='text-center'>"
						str += "<h5 class='fw-bolder'>Special Item</h5>"
						str += "<div class='d-flex justify-content-center small text-warning mb-2'>"
						str += "<div class='bi-star-fill'></div>"
						str += "<div class='bi-star-fill'></div>"
						str += "<div class='bi-star-fill'></div>"
						str += "<div class='bi-star-fill'></div>"
						str += "<div class='bi-star-fill'></div>"
						str += "</div>"
						str += "</div>"
						str += "</div>"
						str += "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>"
						str += "<div class='text-center'>"
						str += "<a class='btn btn-outline-danger mt-auto' href='#'>$10.00</a>"
						str += "</div>"
						str += "</div>"
						str += "</div>"
						str += "</div>"
						str += "</div>"
					}
					
					wineDiv.append(str);
				}		
			)
		}
	
	});
</script>

</html>
