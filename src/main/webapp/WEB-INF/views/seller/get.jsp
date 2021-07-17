<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../includes/header.jsp" flush="false"/>
<!DOCTYPE html>
<html>

<body>
	<!-- Introduce Seller-->
	<div class="container px-5 my-5">
		<div class="text-center mb-5">
            <h4> 직영점 </h4>
            <h2 class="fw-bolder">${getseller.sellerStoreName}</h2>
            <h5>${getseller.sellerPhoneNum}</h5><br>
            <h6 class="fw-bolder">${getseller.sellerContent }</h6>
        </div>
	</div>
	
	<!-- Seller Image -->
	<div class="col-12 mb-5">
		<div class="col-6" style="width: 800px; margin-left: 10%; float: left;">
			<div id="shopImageCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
			  
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#shopImageCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#shopImageCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#shopImageCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  	<button type="button" data-bs-target="#shopImageCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
			  </div>
			  <div class="carousel-inner">
			  <c:forEach items="${sellerImage}" var="c" varStatus="status" begin="0" end="0" step="1">
			    <div class="carousel-item active">
			      <img src="http://klea-home.iptime.org:8081/<c:out value='${c.sellerImage}'/>" style="width: 100%" alt="...">
			    </div>
			  
			  </c:forEach>
			  <c:forEach items="${sellerImage}" var="c" varStatus="status" begin="1" end="3" step="1">
			  
			    <div class="carousel-item">
			      <img src="http://klea-home.iptime.org:8081/<c:out value='${c.sellerImage}'/>" style="width: 100%" alt="...">
			    </div>
			 
			  </c:forEach>
			  </div><!-- inner end -->
			  <button class="carousel-control-prev" type="button" data-bs-target="#shopImageCarousel" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#shopImageCarousel" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div><!-- carousel end -->
		
		<div class="col-5 align-self-center store_info mt-5" style="float: right;">
			<div>
				<div class="mb-5">
				<h5 class="mb-3 fw-bold"><i class="bi bi-geo-alt-fill"></i>&nbsp;매장위치</h5> 
				${getseller.sellerLocation}
				</div>
				<div class="mb-5">
				<h5 class="mb-3 fw-bold"><i class="bi bi-clock"></i>&nbsp;영업시간</h5>
				${getseller.sellerBusinessHour}
				</div>
				<div class="mb-5">
				<h5 class="mb-3 fw-bold"><i class="bi bi-file-person"></i>&nbsp;Shop Master </h5>
				${getseller.sellerManger}
				${getseller.sellerMagEmail}
				</div>
			</div>
		</div>
	</div><!-- Seller Image end -->
	
	<div class="container mt-5 mb-5">
		<div class="text-center mb-5">
		<h3 class="fw-bold">매장위치</h3>
		</div>
	</div>
	
	<!-- Map API  -->
	<div>
		<div class="mb-5" id="map" style="width:100%; height:500px;"></div> 
	</div>
	
	
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5333d53ac31b106857d8f1c63a600d7&libraries=services"></script>
<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			 level: 3 // 지도의 확대 레벨
			};  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${getseller.sellerLocation}' , function(result, status) {

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
				content: '<div style="width:150px;text-align:center;padding:6px 0;">${getseller.sellerStoreName}</div>'
			});
			infowindow.open(map, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
    	} 
	}); //Map End

</script>              
<jsp:include page="../includes/footer.jsp" flush="false"/>
</html>