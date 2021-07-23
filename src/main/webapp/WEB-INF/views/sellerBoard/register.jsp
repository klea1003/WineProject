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
	
		<form role="form" action="/sellerBoard/register" method="post">
			<div class="form-group mb-3">
				<label for="title">제목</label>
				<input class="form-control" name="title" type="text" id="title" placeholder="제목을 입력해 주세요">
			</div>
		
			<div class="form-group mb-3">
				<label for="writer">작성자</label>
				<input class="form-control" value="${user.userNickName}" name="writer" type="text" id="writer" readonly="readonly">
			</div>
		
			<div class="form-group mb-5">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" name="content" id="content">
					
					<p><b><span>* 해당 정보를 기입해주시면 보다 빠른 안내로 도와드리겠습니다 :)</span></b></p>
					<p><span>&nbsp;</span></p>
					<p>1. 수령날짜 : 2021. 00. 00까지</span></p>
					
					<p>2. 수령장소 : 역삼동 00-00</p>
					
					<p>3. 필요상품 : 레드와인 50병 1병당 4~5만원대 추천해주세요!</p>
					
					<p>4. 수령형태 : 택배 or 퀵 or 픽업 등</p>
					
					<p>5. 입금형태 : 세금계산서 or 법인카드 결제 등</p>
					
					<p>6. 추가내용 : 개별 선물용이라 포장 추가해주세요 ~ ! 등</p>  
					
				</textarea>
			</div>
			
			<div class="mb-5">
				<button type="button" class="btn btn-outline-secondary" id="btnList" onclick="location.href='/sellerBoard/list'">목록</button>
				<button type="submit" class="btn btn-outline-danger" id="btnSave">저장</button>
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