<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding ="UTF-8" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>


<!DOCTYPE html>
<html lang="en">  
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">    
                	<c:forEach items="${list}" var="wine">         
	                    <div class="col mb-5">
	                        <div class="card h-100">
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder"><c:out value="${wine.title}" /></h5>                                                                     			
	                                    <!-- Product price-->
	                                    <c:out value="${wine.price}" />
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
               </div>
            </div>
        </section>        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        
	<%@ include file="../includes/footer.jsp" %>        	
    </body>
</html>
