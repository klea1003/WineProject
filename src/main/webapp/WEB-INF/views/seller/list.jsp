<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>

<jsp:include page="../includes/header.jsp" flush="false"/>
   
<body>
	<div class="container px-5 my-5">
		<div class="text-center mb-5">
            <h1 class="fw-bolder"> 직영매장안내 </h1><br>
            <h4>와인이 필요한 순간 너와,IN 매장을 찾아주세요!</h4>
            <h6>6개 직영매장 (압구정점 / 경희궁점 / 양평점 / 청담점 / 코엑스점/ 서래마을점)으로 운영됩니다.</h6><br>
        </div>
	</div>
    
	<!-- Page Content-->
	<div class="container px-4 px-lg-5 mb-5">
    		
	<!-- Table Content -->
	<table class="table">
		<thead>
			<tr class="table">
		      <th scope="col">매장명</th>
		      <th scope="col">주소</th>
		      <th scope="col">전화번호</th>
		      <th scope="col">매장정보</th>
		    </tr>
		</thead>
			
		<tbody>
			<c:forEach items="${list}" var="seller">    
				<tr>
				<td>${seller.sellerStoreName}</td>
				<td>${seller.sellerLocation}</td>
				<td>${seller.sellerPhoneNum}</td>
				<td>
				<a class="btn btn-outline-secondary btn-sm" href="/seller/get?sellerNum=${seller.sellerNum}">매장 정보</a></td>
				</tr>
			</c:forEach>
		</tbody>
			
	</table><!-- End Table Content -->
	</div>

<jsp:include page="../includes/footer.jsp" flush="false"/>  
</body>
</html>