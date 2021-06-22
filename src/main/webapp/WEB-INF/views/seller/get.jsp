<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
  <body>
    	<%@include file="../includes/header.jsp" %>
      
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
				});    
				</script>
							

                </div>
                
                <div class="col-lg-5">
                	<h1 class="font-weight-light">${seller.sellerId}</h1>
                	<p>판매자 소개글</p>
                    <a class="btn btn-danger" href="#!">더 알아보기</a>
                </div>
            </div>
            
            <!-- Introduce Seller Wine Card-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">▼ 판매자가 현재 판매하고 있는 와인들을 소개해 드립니다</p></div>
              
            </div>
            
            <!--  Content Row -->
            <div class="row gx-4 gx-lg-5">
             
                <!--  Card One    -->              
                <c:forEach items="${product}" var="p">
                	<div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                        <div class="text-center">
                        <img src="http://klea-home.iptime.org:8081/<c:out value="${p.imageName}" />" height="350" width="150"></div>
                            <h3 class="card-title"><c:out value="${p.wineTitle}" /></h3>
                            <p class="card-text">생산지역 : <c:out value="${p.wineCountry}" /><br>
                            와인타입 : <c:out value="${p.wineType}" /><br>
                            도수 : <c:out value="${p.wineAlcohol}" />%<br>
                            가격 : <c:out value="${p.sellerPrice}" />원</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-outline-dark btn-sm" href="#!">More Info</a></div>
                    </div>
                	</div>
                </c:forEach>
            </div>
        </div>
       <%@include file="../includes/footer.jsp" %>       
  </body>
</html>