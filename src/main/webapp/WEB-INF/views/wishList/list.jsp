<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

	<div class="container px-5">

		<c:choose>
			<c:when test="${map.count == 0 }">
        찜한 상품이 없습니다.
        </c:when>

			<c:otherwise>
				<form id="form1" name="form1" method="post" action="update">

					<table class="table">
						<thead>
							<tr>
								<th scope="col">PRODUCT</th>
								<th scope="col"></th>
								<th scope="col">CART</th>
								<th scope="col"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="wish" items="${map.list}" varStatus="i">
								<tr>
									<td><img
										src="http://klea-home.iptime.org:8081/<c:out value="${wish.wineImageName}" />"height="100px" width="30px"></td>
									<td><h5 class="fw-bold"><a href= "/wine/get?wno=${wish.wineNum}" > ${wish.wineTitle}</a></h5></td>									
								
								<%-- 	<td><input type="hidden" name="count"
										value="${map.count }"></td> --%>
									<td><a href="/seller/listWine?wineNum=${wish.wineNum}" class="btn btn-outline-dark">Add Cart</a></td>
									<td><a href="/wishList/delete?wishNum=${wish.wishNum}" class="btn btn-outline-danger">삭제</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</c:otherwise>
		</c:choose>
	</div>

	<%@include file="../includes/footer.jsp"%>


</body>
</html>
