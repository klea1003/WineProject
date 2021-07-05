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
						<img class="card-img-top"
							src="http://klea-home.iptime.org:8081/<c:out value="${wine.imageName}" />"
							style="width: 300px; height: 700px; text-align: center;"
							alt="Wine images" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="small mb-1">
						<h3><c:out value="${wine.winenery}" /></h3>
					</div>
					<h2 class="display-5 fw-bolder">
						<c:out value="${wine.title}" /></h2>
					<div class="fs-5 mb-5">
						<p class="lead">
							<span><c:out value="${wine.wineType}" /> from</span>
							<c:out value="${wine.region}" />
							<br>
							<c:out value="${wine.country}" />
							<br>					
						</p>
						<span><c:out value="${wine.price}" />원</span>
					</div>

					<div class="d-flex">
						<input class="form-control text-center me-3" id="inputQuantity"
							type="num" value="1" style="max-width: 3rem" />

						<button class="btn btn-outline-dark flex-shrink-0" type="button"
						onclick="location.href='/wishList/insert?wno=${wine.wno}'">
							<i class="bi bi-emoji-heart-eyes"></i> Wish List
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;

						<button class="btn btn-outline-dark flex-shrink-0" type="button"
						onclick="location.href='/seller/listWine?wineNum=${wine.wno}'">
							<i class="bi-cart-fill me-1"></i> Add to cart
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<h3>Facts about the wine</h3>
	
	<table width="300">	
		<c:if test='${wine.winenery ne null}'>
			<tr>
				<td>Winery</td>
				<td><c:out value="${wine.winenery}" /></td>			
			</tr>
		</c:if>
		
		<c:if test='${wine.grapes ne null}'>
			<tr>
				<td>Grapes</td>
				<td><c:out value="${wine.grapes}" /></td>			
			</tr>
		</c:if>
		
		<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">별점</th>
				      <th scope="col">내용</th>
				      <th scope="col">유저번호</th>
				      <th scope="col">리뷰날짜</th>
				      <th scope="col">좋아요</th>
				    </tr>
				  </thead>
				  
				  <tbody>
				    <c:forEach var="re" items="${reply5}" varStatus="i">
				    <tr>
				      <td>${re.reviewRating }</td>
				       <td>${re.review }</td>
				         <td>${re.userNum }</td>
				         <td>${re.reviewDate }</td>
				         <td>${re.reviewLike }</td>
				    
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
		
		
		<c:if test='${wine.region ne null}'>
			<tr>
				<td>Region</td>
				<td><c:out value="${wine.region}" /></td>			
			</tr>
		</c:if>
		
		<c:if test='${wine.wineStyle ne null}'>
			<tr>
				<td>Wine style</td>
				<td><c:out value="${wine.wineStyle}" /></td>			
			</tr>
		</c:if>
		
		<c:if test='${wine.allergens ne null}'>
			<tr>
				<td>Allergens</td>
				<td><c:out value="${wine.allergens}" /></td>			
			</tr>
		</c:if>
		
		<c:if test='${wine.alcohol ne null}'>
			<tr>
				<td>Alcohol content</td>
				<td><c:out value="${wine.alcohol}" />%</td>			
			</tr>
		</c:if>
		
	</table>
	
	
	
	
	<%@ include file="../includes/footer.jsp"%>

</body>
<script src="/resources/js/scripts.js"></script>
</html>