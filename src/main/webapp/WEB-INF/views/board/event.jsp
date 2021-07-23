<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%@include file="../includes/header.jsp"%>

<body>
	<!-- Event preview section-->
	<section class="py-5">
		<div class="container px-5">
			<h1 class="fw-bolder mb-5">Event</h1>
			<div class="row gx-5">
				<c:forEach var="list" items="${list}" varStatus="status">
					<div class="col-lg-4 mb-5">
						<div class="card h-100 shadow border-0">
							<img
								src="http://klea-home.iptime.org:8081/<c:out value="${list.eventImage }" />" />

							<div class="card-body p-4">
								<div class="badge bg-primary bg-gradient rounded-pill mb-2">
									<c:if test="${status.index==0 }">News</c:if>
								</div>
								<a class="text-decoration-none link-dark stretched-link"
									href="#!"><div class="h5 card-title mb-3">${list.eventTitle}</div></a>
								<p class="card-text mb-0">${list.eventContent}</p>
							</div>
							<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<div class="small">
											<div class="text-muted">${list.eventStart}~</div>
											<div class="text-muted">${list.eventEnd}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="text-end mb-5 mb-xl-0">
				<a class="btn btn-outline-danger" href="/board/eventAll"> More
					Event </a>
			</div>
		</div>
	</section>

	<%@include file="../includes/footer.jsp"%>
</body>
</html>

