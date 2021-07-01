<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<body>
	<%@ include file="../includes/header.jsp"%>
	
	<!-- Product section-->
       <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
               		<div class="col-md-6">
               		<div class="text-center">
               		<img class="card-img-top" src="http://klea-home.iptime.org:8081/<c:out value="${wine.imageName}" />" 
               			style="width: 300px; height: 700px; text-align: center;" alt="Wine images" /></div>
                    </div>	
                    	<div class="col-md-6">
	                        <div class="small mb-1"><c:out value="${wine.winenery}" /></div>
	                        <h2 class="display-5 fw-bolder"><c:out value="${wine.title}" /></h2>
	                        <div class="fs-5 mb-5">
	                        	<p class="lead"><c:out value="${wine.grapes}" />
								<br>
								<c:out value="${wine.region}" />
								<br>
								<c:out value="${wine.country}" />
								<br>
								<c:out value="${wine.wineStyle}" />
								<br></p>
	                            <span><c:out value="${wine.price}" />원</span>
	                        </div>
                        
	                        <div class="d-flex">
	                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
	                            
	                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
	                                <i class="bi bi-emoji-heart-eyes"></i>
	                                Wish List
	                            </button>&nbsp;&nbsp;&nbsp;&nbsp;
	                            
	                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
	                                <i class="bi-cart-fill me-1"></i>
	                                Add to cart
	                            </button>
	                       </div>
                    </div>
                </div>
            </div>
        </section>
		
		
	<%-- <%@ include file="../includes/footer.jsp"%> --%>
		

</body>
<script src="/resources/js/scripts.js"></script>
</html>