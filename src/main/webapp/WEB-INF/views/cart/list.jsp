<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.cart-list{
		padding-left:10%;
		padding-right: 10%;
	}
	
	.btn-position{
		float:right;
	}
	
	.img {
		display: block; margin: 0px auto;
	}
</style>
	
</head>

<body>
	<%@include file="../includes/header.jsp" %>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$(".btnCartUpdate").on("click", function(e) {
			e.preventDefault();
			
			console.log("click add cart");
			
			var wineNumArr = [];
			var wineQtyArr = [];
			
			$("input[name='wineNum']").each(function(){
				wineNumArr.push($(this).val());
			})			
			
			$("input[name='wineQty']").each(function(){
				wineQtyArr.push($(this).val());
			})
			
			console.log("wineNumArr: " + wineNumArr);
			console.log("wineQtyArr: " + wineQtyArr);
			
			$.ajax({
				url: 'update',
				type: 'get',
				dataType: "JSON",
				data: {
					wineNum: wineNumArr,
					wineQty: wineQtyArr
				}
			})
		});
	});
	</script>
	
	<div class="container px-5 my-5">
		<div class="text-center mb-5">
			<h1 class="fw-bolder">Your Cart</h1>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${map.count == 0 }">
        	장바구니에 담긴 상품이 없습니다.
		</c:when>
	
		<c:otherwise>		
		<div class="container px-5">
			<table class="table">
				<thead>
					<tr>
						<th scope="col"><input id="checkAll" type="checkbox"></th>
						<th scope="col">WINE</th>
						<th scope="col">TITLE</th>
						<th scope="col">PRICE</th>
						<th scope="col">QTY</th>
						<th scope="col">TOTAL</th>
						<th scope="col">DELETE</th>
					</tr>
				</thead>
					  
				<tbody>
					<c:forEach var="row" items="${map.list}" varStatus="i">
						<tr>
							<td><input class="checkBox" type="checkbox"></td>
							<td> <img src= "http://klea-home.iptime.org:8081/<c:out value="${row.imageName}" />" height="100px" width="30px"> </td>
							<td><h5 class="fw-bold">${row.title}</h5></td>
							<td><fmt:formatNumber pattern="#,###,###" value="${row.price}" /></td>
							<td><input type="number" style="width: 40px;" name="wineQty" value="${row.wineQty}" min="1"> 
							
							<input type="hidden" name="wineNum" value="${row.wineNum}">
							
							<button class="btn btn-outline-secondary btn-sm btnCartUpdate" id="btnCartUpdate">수정</button>
							
							<td><fmt:formatNumber pattern="###,###,###" value="${row.totalPrice}" /></td>
							<td><a href="/cart/delete?cartNum=${row.cartNum}" class="btn-sm btn-outline-danger">삭제</a></td>
					    </tr>
					</c:forEach>
					    
					<tr>
						<td colspan="6" align="right">금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumTotalPrice}" /><br>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
				
			<input type="hidden" name="count" value="${map.count}"></td>
			
			<button type="button" class="btn btn-outline-dark" onclick="location.href='/wine/list'">상품목록</button>
			
			<div style="float: right;"> 
				<button type="button" class="btn btn-outline-danger" onclick="location.href='/order/ordering'">예약하기</button>
			</div>
				
		</div>
		</c:otherwise>
	</c:choose>
	
<%@include file="../includes/footer.jsp" %>
</body>
</html>
