<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../includes/header.jsp" flush="false"/>    
<!DOCTYPE html>
<html>
  <body>
    
      
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"></div>
                <div class="col-lg-5">
                	<h1 class="font-weight-light"></h1>
                </div>
            </div>
            
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
            	<c:forEach items="${list}" var="seller">    
                
                <!-- Card -->
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title"><c:out value="${seller.sellerStoreName}"/></h2>
                            <p class="card-text"><c:out value="${seller.sellerLocation}"/></p>
                            <p class="card-text"><c:out value="${seller.sellerPhoneNum}"/></p>
                        </div>
                        <a  href="/user/userpage?userNum=<c:out value="${c.userNum }"/>"><c:out value="${c.userId }"/></a>
                        
                        <div class="card-footer"><a class="btn btn-outline-danger btn-sm" href="/seller/get?sellerNum=${seller.sellerNum}">More Info</a></div>
                     </div>
                </div>
              	
              	</c:forEach>	
            </div>
            
        </div>
	
	
    
  </body>
<jsp:include page="../includes/footer.jsp" flush="false"/>
</html>