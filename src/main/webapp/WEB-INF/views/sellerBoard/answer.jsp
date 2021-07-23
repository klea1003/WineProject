<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
</head>

<jsp:include page="../includes/header.jsp" flush="false"/>

<body>

	<div class="container px-5 my-5">
		<div class="text-center mb-5">
            <h1 class="fw-bolder">특판 문의</h1>
        </div>
	</div>

	<div class="container">
		<form role="form" action="/sellerBoard/answer" method="post">
			<div class="form-group mb-3">
				<label for="title">제목</label>
				<input class="form-control" name="title" value='RE : <c:out value="${sellerBoard.title }"/>' readonly="readonly">
			</div>
	
			<div class="form-group mb-3">
				<label for="writer">작성자</label>
				<input class="form-control" name="answerWriter" value="관리자" readonly="readonly">
			</div>
	
			<div class="form-group mb-5">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" name="content" id="content">
				</textarea>
			</div>
			
			<input type="hidden" name="childSellerBno" value='<c:out value="${sellerBoard.parentSellerBno }"/>'>
			<input type="hidden" name="groupOrder" value='<c:out value="${sellerBoard.groupOrder }"/>' >
			<input type="hidden" name="writer" value='<c:out value="${sellerBoard.writer }"/>'>
			
			<div class="mb-5">
				<button type="button" class="btn btn-outline-secondary" id="btnList" onclick="location.href='/sellerBoard/list'">목록</button>
				<button type="submit" class="btn btn-outline-danger" id="btnSave" >답변 달기</button>
			</div>
		</form>
	</div>


<jsp:include page="../includes/footer.jsp" flush="false"/>  
</body>
<script type="text/javascript">

	ClassicEditor
		.create(document.querySelector('#content'))
		.catch(error=>{
			console.error(error);
			
		});
</script>
</html>