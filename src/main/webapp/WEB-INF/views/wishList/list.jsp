<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">
$(document).ready (
	function() {
		console.log("wineNum: " + '<c:out value="${wineNum}" />');
		
		var wineNum = '<c:out value="${wineNum}" />'
		
		checkModal(wineNum)
		
		function checkModal(wineNum) {
			
			if (wineNum == '') {
				return;
			}
			
			if(parseInt(wineNum) > 0) {
				
				console.log(wineNum);
				
				$(".modal-body").html(
					"와인이 등록되었습니다" 		
				)
				
				$('#wishModal').modal("show");
			}
			
		}
	}
)
</script>


</head>
<style>
.cart-list {
	padding-left: 10%;
	padding-right: 10%;
}

/* .btn-position {
	float: right;
} */

.btn-outline-danger {
 
  color: #990000;
  background-color: #fff;
  border-radius: 35px;
  border: 1px solid rgb(153, 0, 0, 0.75);   
  font-size: 15px;
  line-height: normal;
  font-weight: 400;
  justify-content: center;
  text-decoration: none;
  min-width: 70px;
  padding: 8px;
 
}

.btn-outline-dark {
	
  border-radius: 35px;
  border: 1px solid rgb(0, 0, 0);
  font-size: 15px;   

}
</style>
<body>

	
	<div class="container px-5 my-5">
		<div class="text-center mb-5">
			<h1 class="fw-bolder">Your WishList</h1>
		</div>
	</div>

	<div class="container px-5 mb-5">

		<c:choose>
			<c:when test="${map.count == 0 }">
        찜한 상품이 없습니다.
        </c:when>

			<c:otherwise>
				<form id="form1" name="form1" method="post" action="update">

					<table class="table">
						<thead>
							<tr>
								<th scope="col">WINE</th>
								<th scope="col">TITLE</th>							
								<th scope="col">PRICE</th>								
								<th scope="col">CART</th>														
								<th scope="col">DELETE</th>							
							</tr>
						</thead>

						<tbody>
							<c:forEach var="wish" items="${map.list}" varStatus="i">
								<tr>
									<td><img src="http://klea-home.iptime.org:8081/<c:out value="${wish.wineImageName}" />"height="100px" width="30px"></td>
									<td><h5 class="fw-bold"><a href= "/wine/get?wno=${wish.wineNum}" > ${wish.wineTitle}</a></h5></td>
									<td>￦ <fmt:formatNumber pattern="#,###,###" value="${wish.winePrice}" /></td>							
									<td><a href="/cart/insert?wineNum=${wish.wineNum}&wineQty=1" class="btn btn-outline-dark">Add Cart</a></td>									
									<td><a href="/wishList/delete?wishNum=${wish.wishNum}" class="btn btn-outline-danger">삭제</a></td>
		
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</c:otherwise>
		</c:choose>
		
		<input class="btn btn-outline-dark" type="button" value="BACK" onClick="history.go(-1)"> 
	</div>
	

	<!-- 와인 등록 확인 Modal-->
	<div class="modal fade" id="wishModal" tabindex="-1" role="dialog" aria-labelledby="wishModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">등록 완료</h5>
				</div>
				<div class="modal-body">내용 입력 !!</div>
			</div>
		</div>
	</div>
	

	<%@include file="../includes/footer.jsp"%>

</body>
</html>
