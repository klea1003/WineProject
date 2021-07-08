<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cart-list {
	padding-left: 10%;
	padding-right: 10%;
}

.btn-position {
	float: right;
}
</style>

</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="container px-5 my-5">
		<div class="text-center mb-5">
			<h1 class="fw-bolder">Your WishList</h1>
		</div>
	</div>

	<div class="wish-list">

		<c:choose>
			<c:when test="${map.count == 0 }">
        찜한 상품이 없습니다.
        </c:when>

			<c:otherwise>
				<form id="form1" name="form1" method="post" action="update">

					<table class="table">
						<thead>
							<tr>
								<th scope="col">IMAGE</th>
								<th scope="col">PRODUCT</th>
								<th scope="col">-</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="wish" items="${map.list}" varStatus="i">
								<tr>
									<td><img
										src="http://klea-home.iptime.org:8081/<c:out value="${wish.wineImageName}" />"height="100" width="50"></td>
									<th scope="row">${wish.wineTitle}</th>
								<%-- 	<td><input type="hidden" name="count"
										value="${map.count }"></td> --%>
								    <td><a href="/seller/listWine?wineNum=${wish.wineNum}">Find Seller</a></td>
									<td><a href="/wishList/delete?wishNum=${wish.wishNum}">삭제</a></td>
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
