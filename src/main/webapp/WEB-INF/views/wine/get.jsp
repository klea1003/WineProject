<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<style>
@media (min-width: 0) {
    .g-mr-15 {
        margin-right: 1.07143rem !important;
    }
}
@media (min-width: 0){
    .g-mt-3 {
        margin-top: 0.21429rem !important;
    }
}

.g-height-50 {
    height: 50px;
}

.g-width-50 {
    width: 50px !important;
}

@media (min-width: 0){
    .g-pa-30 {
        padding: 2.14286rem !important;
    }
}

.svgicon {
	width: 20px;
	height: 20px;
}

.user {
	color: #b30000;
	font-weight: bold;
}

.rating {
	
	color: #ffcc00;
}

.like{
	color: 	#000000;
	text-decoration:none;
}

.dislike{
	color: 	#000000;
	text-decoration:none;
}

.reply{
	color: 	#000000;
	text-decoration:none;
}

.main-content {
	padding-top: 100px;
	padding-bottom: 100px;
}

.rating-num { 
	margin-top:0px;font-size: 54px; 
}

.progress { 
	margin-bottom: 5px;
}

.rating-desc .col-md-3 {
	padding-right: 0px;
}

.sr-only { 
margin-left: 5px;overflow: visible;clip: auto; 
}
</style>
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
							style="width: 150px; height: 450px; text-align: center;"
							alt="Wine images" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="small mb-1">
						<h4><c:out value="${wine.winenery}" /></h4>
					</div>
					<h3 class="fw-bolder">
						<c:out value="${wine.title}" /></h3>
					<div class="fs-5 mb-5">
						<p class="lead">
							<span>
							<svg class="svgicon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 16 16"><line x1="8" y1="10.8649" x2="8" y2="14.75" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round"></line><path d="M8,10.8649A21.2965,21.2965,0,0,0,11.03,8.431a4.2805,4.2805,0,0,0,.6017-3.5547c-.2314-1.2886-.7634-3.6263-.7634-3.6263H5.1318S4.6,3.5877,4.3683,4.8763A4.2784,4.2784,0,0,0,4.97,8.431,21.3,21.3,0,0,0,8,10.8649" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round"></path><line x1="5.375" y1="14.7498" x2="10.625" y2="14.7498" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round"></line><line x1="4.2775" y1="6.2311" x2="11.7225" y2="6.2311" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round"></line><path d="M4.6782,6.6055a4.1859,4.1859,0,0,0,.7392,1.8224A4.3054,4.3054,0,0,0,8,10.4a4.2965,4.2965,0,0,0,2.5738-1.9721,4.36,4.36,0,0,0,.77-1.8224Z" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round"></path><path d="M5.0782,6.9792c.0087.3122.4443.7875.8557,1.4219A3.8792,3.8792,0,0,0,8,9.9219a3.87,3.87,0,0,0,2.059-1.5208,4.6045,4.6045,0,0,0,.8218-1.4219Z" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round"></path><path d="M5.5823,7.4c.0066.2428.5595.5185.8682,1.0119A2.5878,2.5878,0,0,0,8,9.5,2.5812,2.5812,0,0,0,9.5442,8.4119c.3086-.4934.8258-.769.8323-1.0119Z" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round"></path><path d="M6.3128,7.7c.0054.1735.1387.37.3959.7228A1.8377,1.8377,0,0,0,8,9.0664a1.83,1.83,0,0,0,1.2869-.6436c.2572-.3524.4053-.5493.4107-.7228Z" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round"></path><path d="M6.7378,8.1146c.0044.0694.0234.0336.2292.1745A2.5588,2.5588,0,0,0,8,8.6a2.5478,2.5478,0,0,0,1.03-.3109c.2057-.1409.2283-.1051.2327-.1745Z" fill="none" stroke="#1e1e1e" stroke-linecap="round" stroke-linejoin="round"></path></svg><c:out value="${wine.wineType}" /> from</span>
							<c:out value="${wine.region}" />
							<br>
							<c:out value="${wine.country}" />
							<br>					
						</p>
						<span>￦<fmt:formatNumber pattern="#,###,###" value="${wine.price}" /></span>
					</div>

					<div class="d-flex">
						<button class="btn btn-outline-dark flex-shrink-0" type="button"
						onclick="location.href='/wishList/insert?wno=${wine.wno}'">
							<i class="bi bi-emoji-heart-eyes"></i> Wish List
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;

						<button class="btn btn-outline-dark flex-shrink-0" type="button"
						onclick="location.href='/cart/insert?wineNum=${wine.wno}&wineQty=1'">
							<i class="bi-cart-fill me-1"></i> Add Cart
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Facts about the wine -->
	<div class="container mt-5 mb-5" style="padding-left: 15%; padding-right: 10%;">
	<h3>Facts about the wine</h3>
	
	<table class="table">
		
		<c:if test='${wine.winenery ne null}'>
			<tr class="table">
				<td><svg class="svgicon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28">
				<path fill="#A8A5A3" fill-rule="evenodd" 
				d="M23.596 18.608V5.483c0-.564-.605-1.042-1.322-1.042h-2.057v3.21a.5.5 0 0 1-.5.5h-3.35a.5.5 
				0 0 1-.5-.5V4.44h-3.744v3.21a.5.5 0 0 1-.5.5h-3.34a.5.5 0 0 1-.5-.5V4.44H5.726c-.717 0-1.322.478-1.322 1.042v13.125c0 
				1.785 5.792 4.986 9.587 6.658 4.058-1.942 9.605-5.225 9.605-6.658zM22.274 3.44c1.28 0 2.322.916 2.322 2.042v13.125c0 
				2.614-8.649 6.839-10.383 7.66a.496.496 
				0 0 1-.413.007c-1.736-.754-10.396-4.668-10.396-7.667V5.483c0-1.126 1.042-2.042 2.322-2.042h2.557a.5.5 
				0 0 1 .5.5v3.21h2.34V3.94a.5.5 0 0 1 .5-.5h4.744a.5.5 0 0 1 .5.5v3.21h2.35V3.94a.5.5 
				0 0 1 .5-.5h2.557zM19.76 18.307c.067-.027.099-.057.104-.066l.003-.747c-.46.086-.962.161-1.482.23l-.008 1.043c.486-.138.956-.289 
				1.383-.46zm-2.893 1.147l.447-.062.114-8.356c0-.027-.026-.05-.061-.056l-.445-.067-.087.054-.055 8.433s.085.054.087.054zm-2.861.074c.595.002 1.192-.049 
				1.774-.13v-.004l.008-1.389c-.534.033-1.07.067-1.622.067h-.15a25.353 25.353 0 0 1-1.848-.097l-.008 1.39c.601.096 1.217.16 1.845.163zm-2.934-.108l.088-.054.053-8.434c0-.005 0-.02-.017-.035l-.515.043-.114 8.358.505.122zm-2.963-1.109c.008-.03.061.008.159.04.41.133.85.253 
				1.303.366l.006-1.049a40.52 40.52 0 0 1-1.32-.18c-.055-.01-.095-.032-.146-.044l-.002.867zm.2-6.397a.452.452 
				0 0 0-.18.093l-.004.815c.056-.013.103-.036.162-.045.414-.06.869-.11 1.324-.16l.006-1.054a20.56 20.56 
				0 0 0-1.307.351zm-.188 4.53c.003-.04.097.024.29.054.368.058.774.107 
				1.172.157l.02-3.03c-.4.045-.806.09-1.172.142-.197.03-.288.096-.309.116l-.004 1.176.002 1.384zm7.715-5.487a12.07 12.07 
				0 0 0-1.774-.15 13.92 13.92 0 0 0-1.848.142l-.01 1.373c.606-.04 1.222-.066 1.849-.06a25.69 25.69 
				0 0 1 1.773.09l.009-1.392v-.003zm-3.639 2.38l-.021 3.638a24.69 24.69 0 0 0 1.845.097c.6.006 1.194-.019 1.774-.058l.024-3.663a24.38 24.38 
				0 0 0-1.772-.089 24.187 24.187 0 0 0-1.85.074zm7.696-1.21c-.003.02-.034-.008-.093-.032a14.48 14.48 0 0 0-1.377-.477l-.006 1.044c.518.074 
				1.017.155 1.473.246l.003-.78zm-1.483 1.544l-.02 3.044c.454-.062.89-.128 1.294-.204.122-.023.177-.07.189-.084l.006-1.24.003-1.249c0 .026-.058-.023-.181-.048a25.387 25.387 
				0 0 0-1.291-.219zm1.776-2.499c.44.184.712.55.708.952l-.012 1.82-.009 1.22-.02 3.13c-.002.402-.279.763-.72.941-.584.234-1.229.437-1.91.613a1.054 1.054 0 0 1-.774.535l-.445.062c-.05.007-.1.01-.15.01-.172 0-.333-.053-.484-.129l-.006.002c-.739.133-1.508.2-2.288.2h-.076a12.977 12.977 
				0 0 1-2.424-.24 1.068 1.068 0 0 1-.49.133 1.29 1.29 0 0 1-.163-.012l-.446-.068a1.064 1.064 0 0 1-.774-.562 21.38 21.38 0 0 1-1.745-.478c-.526-.17-.851-.544-.85-.973l.042-6.407c.005-.429.335-.798.862-.962.55-.17 1.14-.322 1.75-.456.159-.287.436-.505.78-.553l.448-.062c.225-.033.44.03.636.131a13.216 13.216 
				0 0 1 4.805.014c.006.001.012.006.018.007.194-.092.401-.147.622-.116l.447.068c.343.052.61.264.765.544.677.183 1.32.394 1.902.636z">
				</path></svg> Winery</td>
				<td><c:out value="${wine.winenery}" /></td>			
			</tr>
		</c:if>
		
		<c:if test='${wine.grapes ne null}'>
			<tr>
				<td><svg class="svgicon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28">
				<path fill="#A8A5A3" fill-rule="evenodd" 
				d="M17.463 13.193a2.234 2.234 0 0 1 2.214-2.54c.482 0 .949.157 1.34.452a2.233 2.233 0 0 1-1.037 3.989 2.236 2.236 
				0 0 1-2.517-1.901m.375 7.282a2.236 2.236 0 0 1-2.518-1.902 2.215 2.215 0 0 1 .43-1.651 2.211 2.211 
				0 0 1 1.78-.887c1.095 0 2.053.809 2.209 1.924a2.234 2.234 0 0 1-1.901 2.516m-.57 4.235a2.233 2.233 
				0 0 1-3.56-2.689 2.22 2.22 0 0 1 1.78-.886c1.096 0 2.054.808 2.209 1.922.082.59-.07 1.178-.43 1.653m-6.491-3.911a2.211 2.211 
				0 0 1-.864-1.471 2.233 2.233 0 0 1 3.553-2.088c.476.359.783.882.865 1.472a2.233 2.233 
				0 0 1-1.901 2.517 2.208 2.208 0 0 1-1.653-.43m-2.14-3.814a2.207 2.207 0 0 1-1.652-.43 2.213 2.213 
				0 0 1-.865-1.472 2.233 2.233 0 0 1 2.21-2.538 2.233 2.233 0 0 1 1.779 3.575 2.22 2.22 
				0 0 1-1.472.865m3.772-8.074c.318.579.607 1.226.879 1.938-.67.19-1.262.58-1.69 1.146a3.242 3.242 
				0 0 0-.53 1.077 3.222 3.222 0 0 0-.791-.874c-.076-.057-.16-.096-.238-.146.235-1.095 1.188-2.654 2.37-3.141m.31-6.41a3.773 3.773 
				0 0 1 2.946-.984 3.806 3.806 0 0 1-1.241 2.856 3.774 3.774 0 0 1-2.945.983 3.8 3.8 0 0 1 1.24-2.855m3.666 11.133a2.234 2.234 
				0 0 1-1.901 2.517 2.207 2.207 0 0 1-1.653-.43 2.217 2.217 0 0 1-.865-1.471 2.234 2.234 0 0 1 2.21-2.538c1.096 
				0 2.054.808 2.209 1.922m-4.948 2.01c.043.07.095.133.144.199-.081.014-.16.038-.24.058.033-.085.07-.17.096-.256m11.436-3.206a3.207 3.207 
				0 0 0-1.253-2.132 3.208 3.208 0 0 0-2.392-.621 3.221 3.221 0 0 0-2.6 2.166 3.233 3.233 0 0 0-2.315-1.131 16.577 16.577 
				0 0 0-1.142-2.502c-.002-.008 0-.016 0-.024a.501.501 0 0 0-.221-.323 12.609 12.609 0 0 0-1.077-1.503 4.835 4.835 
				0 0 0 3.227-1.26 4.801 4.801 0 0 0 1.537-4.078.498.498 0 0 0-.4-.44 4.842 4.842 0 0 0-4.193 1.172 4.784 4.784 
				0 0 0-1.544 3.203C9.672 4.23 8.746 3.549 7.678 2.85a.5.5 0 0 0-.547.837c2.072 1.354 3.57 2.584 4.743 4.35-1.417.659-2.425 2.307-2.764 
				3.604a3.224 3.224 0 0 0-3.36 1.186 3.2 3.2 0 0 0-.621 2.393 3.206 3.206 0 0 0 1.252 2.132 3.205 3.205 
				0 0 0 2.393.622c.115-.016.223-.053.334-.08-.187.497-.262 1.03-.187 1.57.12.855.564 1.612 1.253 2.132a3.2 3.2 
				0 0 0 1.94.654c.12 0 .244-.012.366-.025a3.193 3.193 0 0 0 1.06 3.717 3.207 3.207 0 0 0 2.394.622 3.21 3.21 
				0 0 0 2.132-1.252 3.21 3.21 0 0 0 .62-2.393 3.188 3.188 0 0 0-.621-1.476 3.206 3.206 0 0 0 2.042-1.23 3.208 3.208 
				0 0 0 .622-2.394 3.215 3.215 0 0 0-.808-1.722c.065-.005.13-.004.197-.013a3.236 3.236 0 0 0 2.754-3.646"></path></svg>
				Grapes</td>
				<td><c:out value="${wine.grapes}" /></td>			
			</tr>
		</c:if>
		
		<c:if test='${wine.region ne null}'>
			<tr>
				<td><svg class="svgicon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28">
				<path fill="#A8A5A3" fill-rule="evenodd" 
				d="M17.145 13.928a4.447 4.447 0 0 1-6.281 0 4.448 4.448 0 0 1 0-6.28 4.427 4.427 0 0 1 3.141-1.3c1.137 
				0 2.274.434 3.14 1.3a4.446 4.446 0 0 1 0 6.28m4.197-10.097a10.293 10.293 0 0 1 3.04 7.332c0 2.77-1.08 5.373-3.04 7.332l-6.954 8.527a.498.498 
				0 0 1-.775 0l-6.988-8.565a10.25 10.25 0 0 1-3.007-7.294c0-2.77 1.08-5.374 3.04-7.332 4.049-4.042 10.636-4.042 
				14.684 0zM20.6 17.825c1.806-1.807 2.782-4.16 2.782-6.662a9.3 9.3 0 0 0-2.748-6.624A9.359 9.359 
				0 0 0 14 1.799a9.358 9.358 0 0 0-6.634 2.74 9.3 9.3 0 0 0-2.748 6.624 9.3 9.3 
				0 0 0 2.748 6.624L14 25.915l6.6-8.09zM10.157 6.94a5.447 5.447 0 0 1 7.695 0 5.446 5.446 0 0 1 0 7.695 5.423 5.423 
				0 0 1-3.847 1.591 5.424 5.424 0 0 1-3.848-1.59 5.448 5.448 0 0 1 0-7.696z"></path></svg>
				Region</td>
				<td><c:out value="${wine.region}" /></td>			
			</tr>
		</c:if>
		
		<c:if test='${wine.wineStyle ne null}'>
			<tr>
				<td><svg class="svgicon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28">
				<path fill="#A8A5A3" fill-rule="evenodd" 
				d="M17.736 25.39c0 .45-.366.816-.815.816H11.08a.818.818 0 0 1-.816-.817V12.43a3.78 3.78 0 0 1 2.367-3.476c.001 
				0 .002 0 .003-.002a.525.525 0 0 0 .126-.082c.012-.01.027-.015.038-.025.022-.023.035-.052.053-.079.018-.026.042-.05.054-.08.006-.014.005-.03.01-.045a.52.52 
				0 0 0 .03-.147V1.96c0-.09.086-.165.188-.165h1.736c.101 
				0 .187.075.187.164V8.49l.001.005c0 .05.014.098.03.145.004.015.003.032.01.046.011.03.034.051.051.077.018.027.032.058.055.082.011.01.026.015.036.024.04.033.08.063.128.083l.004.002a3.779 
				3.779 0 0 1 2.366 3.476v12.96zm-1.68-17.21c1.634.792 2.68 2.417 2.68 4.25v12.96a1.818 1.818 
				0 0 1-1.815 1.816H11.08a1.819 1.819 0 0 1-1.816-1.817V12.43c0-1.832 1.046-3.457 2.681-4.25V1.96c0-.643.533-1.165 
				1.188-1.165h1.736c.654 0 1.187.522 1.187 1.164V8.18zm-3.673 9.555v-4.647h3.235v4.647h-3.235zm3.735-5.647h-4.236a.5.5 
				0 0 0-.5.5v5.647a.5.5 0 0 0 .5.5h4.236a.5.5 0 0 0 .5-.5v-5.647a.5.5 0 0 0-.5-.5z"></path></svg>
				Wine style</td>
				<td><c:out value="${wine.wineStyle}" /></td>			
			</tr>
		</c:if>
		
		<c:if test='${wine.allergens ne null}'>
			<tr>
				<td><svg class="svgicon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28">
				<path fill="#A8A5A3" fill-rule="evenodd" 
				d="M18.189 20.318c4.538-1.67 7.43-5.58 8.079-6.536-.505-1.125-2.991-6.039-8.35-7.765a8.234 8.234 
				0 0 1 4.309 7.233c0 3.006-1.625 5.632-4.038 7.068zM2.366 14.65c.315.403 1.649 1.838 2.389 2.425.83.658 2.383 1.788 4.232 2.683-1.95-1.505-3.214-3.859-3.214-6.508a8.232 8.232 
				0 0 1 4.308-7.232c-5.36 1.726-7.845 6.641-8.35 7.765.128.188.342.492.635.867zm4.407-1.4c0 3.985 3.242 7.227 7.228 7.227 3.984 
				0 7.226-3.242 7.226-7.227 0-3.985-3.242-7.227-7.226-7.227-3.986 0-7.228 3.242-7.228 7.227zm-.245 12.383a1.948 1.948 
				0 0 0 1.946-1.946c0-.745-1.07-2.556-1.946-3.842-.877 1.286-1.946 3.098-1.946 3.842 0 1.073.873 1.946 1.946 1.946zM27.3 13.654a.5.5 
				0 0 1-.041.442c-.202.326-5.028 7.993-13.258 7.993-2.06 0-4.14-.75-5.904-1.659.67 1.095 1.377 2.44 1.377 3.257a2.949 2.949 0 0 1-2.946 2.946 2.949 2.949 
				0 0 1-2.946-2.946c0-1.22 1.568-3.61 2.252-4.595a25.526 25.526 0 0 1-1.7-1.233c-.841-.668-2.222-2.166-2.556-2.594-.54-.692-.826-1.15-.837-1.169a.5.5 
				0 0 1-.041-.442C.735 13.561 4.362 4.41 14 4.41c9.639 0 13.265 9.152 13.3 9.244zm-11.289-.228a2.023 2.023 0 0 0-2.015-2.195c-.473 
				0-.927.164-1.294.472a2.004 2.004 0 0 0-.713 1.371 2.007 2.007 0 0 0 .464 1.474c.347.413.834.667 1.372.713a1.99 1.99 
				0 0 0 1.473-.465c.413-.347.666-.833.713-1.37zm-1.748-3.184a3.022 3.022 0 0 1 1.679 5.32 2.998 2.998 0 0 1-2.203.696 3.002 3.002 
				0 0 1-2.051-1.067 2.998 2.998 0 0 1-.696-2.203 3.004 3.004 0 0 1 1.067-2.05 2.983 2.983 0 0 1 2.204-.696z"></path></svg>
				Allergens</td>
				<td><c:out value="${wine.allergens}" /></td>			
			</tr>
		</c:if>
		
		<c:if test='${wine.alcohol ne null}'>
			<tr>
				<td><svg class="svgicon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28">
				<path fill="#A8A5A3" fill-rule="evenodd" d="M17.736 25.39c0 .45-.366.816-.815.816H11.08a.818.818 0 0 1-.816-.817V12.43a3.78 3.78 
				0 0 1 2.367-3.476c.001 0 .002 0 .003-.002a.525.525 0 0 0 .126-.082c.012-.01.027-.015.038-.025.022-.023.035-.052.053-.079.018-.026.042-.05.054-.08.006-.014.005-.03.01-.045a.52.52 
				0 0 0 .03-.147V1.96c0-.09.086-.165.188-.165h1.736c.101 0 .187.075.187.164V8.49l.001.005c0 .05.014.098.03.145.004.015.003.032.01.046.011.03.034.051.051.077.018.027.032.058.055.082.011.01.026.015.036.024.04.033.08.063.128.083l.004.002a3.779 3.779 
				0 0 1 2.366 3.476v12.96zm-1.68-17.21c1.634.792 2.68 2.417 2.68 4.25v12.96a1.818 1.818 
				0 0 1-1.815 1.816H11.08a1.819 1.819 0 0 1-1.816-1.817V12.43c0-1.832 1.046-3.457 2.681-4.25V1.96c0-.643.533-1.165 1.188-1.165h1.736c.654 0 1.187.522 1.187 1.164V8.18zm-3.673 9.555v-4.647h3.235v4.647h-3.235zm3.735-5.647h-4.236a.5.5 
				0 0 0-.5.5v5.647a.5.5 0 0 0 .5.5h4.236a.5.5 0 0 0 .5-.5v-5.647a.5.5 0 0 0-.5-.5z"></path></svg>
				Alcohol content</td>
				<td><c:out value="${wine.alcohol}" />%</td>			
			</tr>
		</c:if>
		
	</table>
	</div>
	<!-- end Facts about the wine -->
	
	<!-- Review -->
	<div class="container mt-3 mb-5" style="margin-left: 30%">
	<div class="row">
    	<div class="col-md-8">
        	<div class="media">
            <div class="media-body">
          
			<h3>Community reviews</h3>
		
			<c:forEach items="${review_list}" var="reviewVO">
				<div class="card mb-3">
					<div class="card-header">
					
	             	<span class="rating mb-2 fw-bold">
	             	<i class="bi bi-star-fill"></i>
					<c:out value="${reviewVO.rating}" />
					</span>&nbsp;&nbsp;
					
	             	<span class="mb-2 user">
	             	<c:out value="${reviewVO.userNum}" />
					<c:out value="${reviewVO.userRealName}" />(총 이 유저가 한 레이팅 갯수)</span>
	             	
					</div>
         
					<div class="card-body fw-bold">
						<c:out value="${reviewVO.content}" />
					</div>
		
				<ul class="list-inline d-sm-flex my-0 mx-3 mb-2">
	            <li class="list-inline-item g-mr-20">
	              <a class="like" href="#!">
	                <i class="bi bi-hand-thumbs-up"></i>
	                <c:out value="${reviewVO.cntLike}" />
				  </a>
				 </li>
				 <li class="list-inline-item g-mr-20">
				    <a class="dislike" href="#!">
				      <i class="bi bi-hand-thumbs-down"></i>
				      34
				    </a>
				 </li>
				 <li class="list-inline-item ml-auto">
				   <a class="reply" href="#!">
				      <i class="bi bi-chat"></i>
				      Reply
				   </a>
				 </li>
				</ul>
				</div>
				</c:forEach>
		
				</div>
		        </div>
    		</div>
		</div>
		<a href="#" class="btn btn-outline-danger">Show more reviews</a>
		</div>	
	<!-- end Review -->
	
	<!-- Rating Range -->
	<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-xs-12 col-md-6 text-center">
                        <h1 class="rating-num">4.0</h1>
                        <div class="rating">
                            <span><i class="bi bi-star-fill"></i></span>
                            <span><i class="bi bi-star-fill"></i></span>
                            <span><i class="bi bi-star-fill"></i></span>
                            <span><i class="bi bi-star-fill"></i></span>
                            <span><i class="bi bi-star"></i></span>
                        </div>
                        <div>
                            <span>총 ratings</span>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <div class="row rating-desc">
                            <div class="col-xs-3 col-md-3 text-right">
                                <span>5</span>
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar bg-warning" role="progressbar" 
									style="width: 50%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
                            </div><!-- end 5 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span>4</span>
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar bg-warning" role="progressbar" 
									style="width: 30%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
                            </div><!-- end 4 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span>3</span>
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar bg-warning" role="progressbar" 
									style="width: 20%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
                            </div><!-- end 3 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span>2</span>
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar bg-warning" role="progressbar" 
									style="width: 70%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
                            </div><!-- end 2 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span>1</span>
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar bg-warning" role="progressbar" 
									style="width: 100%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
                            </div><!-- end 1 -->
                        </div>
                        <!-- end row -->
                    </div>
                </div>
            </div>
        </div>
    </div>
	</div><!-- Rating Range End -->

<%@ include file="../includes/footer.jsp"%>

</body>
<script src="/resources/js/scripts.js"></script>


</html>