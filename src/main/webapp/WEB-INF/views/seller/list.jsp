<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	    
    
    <body>
    	<%@include file="../includes/sellerHeader.jsp" %>
      
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7">
                	
                	<!-- Map API  -->
                	<div id="map" style="width:700px;height:400px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5333d53ac31b106857d8f1c63a600d7"></script>
							<script>
								var container = document.getElementById('map');
									var options = {
										
											center: new kakao.maps.LatLng(33.450701, 126.570667),
										
											level: 3
										
									};

								var map = new kakao.maps.Map(container, options);
							</script>
                </div>
                
                <div class="col-lg-5">
                    <h1 class="font-weight-light">와인365</h1>
                    <p>판매자 소개글</p>
                    <a class="btn btn-primary" href="#!">더 알아보기</a>
                </div>
            </div>
            
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">▼ 판매자가 현재 판매하고 있는 와인들을 소개해 드립니다</p></div>
            </div>
            
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                
                <!-- Card One  -->                
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">판매자 와인1</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
                
                <!-- Card Two  -->
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">판매자 와인2</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id dolore voluptates quos eligendi labore.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
                
                <!-- Card Three  -->
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">판매자 와인3</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="../includes/sellerFooter.jsp" %>
    
    </body>
</html>