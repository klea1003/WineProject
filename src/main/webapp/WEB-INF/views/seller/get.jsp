<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../includes/header.jsp" flush="false"/>
<!DOCTYPE html>
<html>
<head>
    
</head>

<style>
.list-card {
	height:600px;
}

p.card-text {
	margin-bottom: 0;
} 
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
.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet { 
	display : inline-block !important; 
	margin: 6px 2px !important; 
}
</style>


 <body>

       
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7">
                   
                   <!-- Map API  -->
                   <p style="margin-top:-12px">
                   <em class="link">
                       <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
                           혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
                       </a>
                   </em>
               </p>
               
               <div id="map" style="width:700px; height:400px;"></div>

             </div><!-- Map End -->
                
                <div class="col-lg-5">
                   <h1 class="font-weight-light">${seller.sellerStoreName}</h1>
                   <a class="btn btn-danger" href="#!">예약현황</a>
                </div>
            </div>
            
            <!-- Introduce Seller Wine Card-->
            <div class="card my-5 py-4 text-center">
                <div class="card-body"><p class="text-dark m-0">▼ 판매자가 현재 판매하고 있는 와인들을 소개해 드립니다</p></div>
            </div>
            
            <!--  Content Row -->
            <div class="row gx-4 gx-lg-5">
            <!-- swiper슬라이더 메인컨테이너 -->
             <div class="swiper-container"> 
             <!-- 보여지는 영역 --> 
            <div class="swiper-wrapper"> 
                <!--  Card One    -->              
                <c:forEach items="${product}" var="p">
                   <div class="swiper-slide"> 
                   <div class="col mb-5">
                    <div class="card-list">
                  <div class="text-center">
                     <img src="http://klea-home.iptime.org:8081/<c:out value="${p.imageName}" />" height="350" width="150">
                  </div>
                     <div class="card-body">
					      <p class="card-text"><b><c:out value="${p.wineTitle}" /></b></p>
					      <p class="card-text">생산지역 : <c:out value="${p.wineCountry}" /></p>
					      <p class="card-text">와인타입 : <c:out value="${p.wineType}" /></p>
					      <p class="card-text">가격 : <c:out value="${p.sellerPrice}" />원</p>
					 </div>
<<<<<<< HEAD
                  <div class="card-footer"><a class="btn btn-outline-dark btn-sm" href="#!">More Info</a></div>
                  <div class="card-footer">
                  <a class="btn btn-outline-dark btn-sm" href="http://localhost:8080/cart/insert">Add to Cart</a></div>
=======
                  <div class="card-footer">
                  <a class="btn btn-outline-dark btn-sm" href="#!">More Info</a>
                  <a class="btn btn-outline-danger btn-sm" href="#!"><i class="bi-cart-fill me-1"></i>add to cart </a>
                  </div>
>>>>>>> 38d0d5684159b70f487d8e3e689ef2bc515324d2
               </div>
                   </div>
                   </div>
                </c:forEach>
                </div>
                       <!-- 방향 버튼 상황에 따라 추가 삭제가능 --> 
                       <div class="swiper-button-prev"></div> 
                       <div class="swiper-button-next"></div> 
                
                </div>
             </div>
          </div>
          
            

       
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5333d53ac31b106857d8f1c63a600d7&libraries=services"></script>
<script>
      
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                  mapOption = {
                      
         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                       
         level: 3 // 지도의 확대 레벨
         
                };  

      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 

      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();

      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${seller.sellerLocation}' , function(result, status) {

       // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${seller.sellerStoreName}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); //Map End


   const swiper = new Swiper('.swiper-container', {
     //기본 셋팅
     //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
     direction: 'horizontal',
     //한번에 보여지는 페이지 숫자
     slidesPerView: 3,
     //페이지와 페이지 사이의 간격
     spaceBetween: 30,
     //드레그 기능 true 사용가능 false 사용불가
     debugger: false,
     //마우스 휠기능 true 사용가능 false 사용불가
     mousewheel: false,
     //반복 기능 true 사용가능 false 사용불가
     loop: true,
     //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
     centeredSlides: true,
     // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
     // effect: 'fade',
     
     
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
      
   
</script>              
</body>
 <jsp:include page="../includes/footer.jsp" flush="false"/>
</html>