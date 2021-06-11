<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../includes/header.jsp" flush="false"></jsp:include>
<style>
.uploadResult {
	width: 100%;
	background-color: #ddd;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 5px;
}

.uploadResult ul li img {
	width: 20px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	height: 100%;
	width: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 400px;
}
</style>

<script>

</script>

<!-- 위가 header.jsp -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/user/join" method="post">
					<div class="form-group">
						<label>유저아이디</label> <input type="text" class="form-control"
							placeholder="아이디" name="userId" maxlength="20">
					</div>
					<div class="form-group">
						<label>유저비밀번호</label><input type="password" class="form-control"
							placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<label>유저닉네임</label><input type="text" class="form-control"
							placeholder="닉네임" name="userNickName" maxlength="20">
					</div>
					<div class="form-group">
						<label>유저이메일</label><input type="email" class="form-control" 
						placeholder="이메일" name="userEmail" maxlength="20">
					</div>
					<div class="form-group">
						<label>유저핸드폰</label><input type="text" class="form-control"
							placeholder="핸드폰" name="userPhoneNum" maxlength="20">
					</div>
					<div class="form-group">
						<label>유저실명</label><input type="text" class="form-control"
							placeholder="실명" name="userRealName" maxlength="20">
					</div>
					<div class="form-group">
						<label>유저생년월일</label><input type="text" class="form-control"
							placeholder="생년월일" name="userBirthDay" maxlength="20">
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="reset" class="btn btn-danger">Reset</button>




				</form>
				<!-- /.table-responsive -->

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- 새로 추가하는 부분 -->


<!-- /.row -->

<!-- /.row -->

<!-- /.row -->
<jsp:include page="../includes/footer.jsp" flush="false"></jsp:include>