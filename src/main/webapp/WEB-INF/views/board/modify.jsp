<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.w-50 {
	margin-top: 7%;
	margin-left: 25%;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {//모델 보여주기 추가

						//uploadAjax의 checkExtension 부분 복사
						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
						var maxSize = 5242880;
						var cloneObj = $(".uploadDiv").clone()

						function checkExtension(fileName, fileSize) {
							if (fileSize >= maxSize) {
								alert("파일 크기 초과")
								return false
							}
							if (regex.test(fileName)) {
								alert("해당 종류의 파일은 업로드 할 수 없음")
								return false
							}
							return true;
						} //파일 확인

						var formObj = $("form");

						$('button')
								.on(
										"click",
										function(e) {
											e.preventDefault();
											var operation = $(this)
													.data("oper");
											console.log(operation);
											if (operation === 'remove') {
												formObj.attr("action",
														"/board/remove");

											} else if (operation === 'list') {
												formObj.attr("action",
														"/board/list").attr(
														"method", "get");

												var pageNumTag = $(
														"input[name='pageNum']")
														.clone(); //잠시보관용
												var amountTag = $(
														"input[name='amount']")
														.clone();
												var keywordTag = $(
														"input[name='keyword']")
														.clone();
												var typeTag = $(
														"input[name='type']")
														.clone();

												formObj.empty();
												formObj.append(pageNumTag);
												formObj.append(amountTag);
												formObj.append(keywordTag);
												formObj.append(typeTag);//필요한 태그들만 추가
											} else if (operation == 'modify') {
												console.log('submit clicked');
												var str = "";
												$(".uploadResult ul li")
														.each(
																function(i, obj) {
																	var jobj = $(obj);
																	console
																			.dir(jobj);
																	str += "<input type = 'hidden' name='attachList["
																			+ i
																			+ "].fileName' value='"
																			+ jobj
																					.data("filename")
																			+ "'>";
																	str += "<input type='hidden' name='attachList["
																			+ i
																			+ "].uuid' value='"
																			+ jobj
																					.data("uuid")
																			+ "'>";
																	str += "<input type='hidden' name='attachList["
																			+ i
																			+ "].uploadPath' value='"
																			+ jobj
																					.data("path")
																			+ "'>";
																	str += "<input type='hidden' name='attachList["
																			+ i
																			+ "].fileType' value='"
																			+ jobj
																					.data("type")
																			+ "'>";
																});
												formObj.append(str);
											} //else if end

											formObj.submit();
										}) //button function

						//게시물 조회 시 파일 관련 자료를 JSON 데이터로 만들어서 화면에 전송
						var boardNum = '<c:out value="${board.boardNum}"/>';
						$
								.getJSON(
										"/board/getBoardAttachList",
										{
											boardNum : boardNum
										},
										function(arr) {
											console.log(arr);
											//게시물 조회 이미지 출력 부분 
											var str = "";
											$(arr)
													.each(
															function(i, obj) {
																if (!obj.fileType) {
																	//이미지가 아닌경우	            	
																	var fileCallPath = encodeURIComponent(obj.uploadPath
																			+ "/"
																			+ obj.uuid
																			+ "_"
																			+ obj.fileName);
																	str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
																	str += "<span>"
																			+ obj.fileName
																			+ "</span>";
																	str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
																	str += "<img src='/resources/images/attach.png'>"
																	str += "</div></li>";
																} else {
																	//이미지인 경우
																	var fileCallPath = encodeURIComponent(obj.uploadPath
																			+ "/s_"
																			+ obj.uuid
																			+ "_"
																			+ obj.fileName);
																	str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
																	str += "<span>"
																			+ obj.fileName
																			+ "</span>";
																	str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
																	str += "<img src='/display?fileName="
																			+ fileCallPath
																			+ "'>";
																	str += "</div></li>";
																}
															});
											$(".uploadResult ul").html(str);

										}); //end getjson

					

						$("input[type='file']")
								.change(
										function(e) {

											var formData = new FormData()

											var inputFile = $('input[name="uploadFile"]')

											var files = inputFile[0].files;
											/* console.log(files); */
											for (var i = 0; i < files.length; i++) {
												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}
												formData.append("uploadFile",
														files[i])
											}

											$.ajax({
												url : '/uploadAjaxAction',
												processData : false, /* 전달한 데이터틑 query string으로 만들지 말것 */
												contentType : false,
												data : formData,
												type : 'POST',									
												dataType : 'json',
												success : function(result) {
													alert("Uploaded");
													console.log(result);
													showUploadedFile(result); //업로드 결과 처리 함수
													// alert("Uploaded")
													// $(".uploadDiv").html(cloneObj.html())
												}
											}); //ajax
										});

						//업로드된 이미지 처리, 목록을 볼수 있게 함
						function showUploadedFile(uploadResultArr) {
							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}
							var uploadUL = $(".uploadResult ul");

							var str = ''
							$(uploadResultArr)
									.each(
											function(i, obj) {
												if (!obj.image) {
													//이미지가 아닌경우	            	
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
													str += "<span>"
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
													str += "<img src='/resources/images/attach.png'>"
													str += "</div></li>";
												} else {
													//이미지인 경우
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/s_"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													str += "<li  data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
													str += "<span>"
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
													str += "<img src='/display?fileName="
															+ fileCallPath
															+ "'>";
													str += "</div></li>";
												}
											});
							uploadUL.append(str);
						}

						$(".uploadResult").on("click", "button", function(e) {
							if (confirm("이 파일을 삭제하시겠습니까?")) {
								var targetLi = $(this).closest("li");
								targetLi.remove();
							}
						}); //uploadResult click event

					}); //ready function end
</script>
<body>

	<section class="py-5">
		<div class="container px-3 my-3">
			<div class="text-center mb-5">
				<h1 class="fw-bolder">Modify</h1>
			</div>

			<div class="container-fluid">
				<div class="w-50">
					<form role="form" action="/board/modify" method="post">
						<%-- <input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> 시큐리티--%>
						<div class="form-group mb-2">
							<label>NO</label><input class="form-control" name='boardNum'
								value='<c:out value="${board.boardNum}"/>' readonly="readonly">
						</div>
						<input type="hidden" name="boardType"
							value="${board.boardType}" /> 
						<div class="form-group mb-2">
							<label>제목</label> <input class="form-control" name='title'
								value='<c:out value="${board.title}"/>'>
						</div>
						<div class="form-group mb-2">
							<label>글 내용</label>
							<textarea class="form-control" row="3" name='content'><c:out
									value="${board.content}" /></textarea>
						</div>
						<div class="form-group mb-2">
							<label>작성자</label> <input class="form-control" name='writer'
								value='<c:out value="${board.writer}"/>' readonly="readonly">
						</div>
						<div class="form-group mb-2">
							<label>작성일</label><input class="form-control" name="regdate"
								value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>'
								readonly="readonly">
						</div>
						


						<!-- 파일추가영역 -->
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">File Attach</div>
									<!-- /.panel-heading -->
									<div class="panel-body">
										<div class="form-group uploadDiv">
											<input type="file" name='uploadFile' multiple>
										</div>

										<div class='uploadResult'>
											<ul>

											</ul>
										</div>

									</div>
									<!-- end panel body -->
								</div>
							</div>
						</div>
						<!-- 파일추가영역 끝 -->

						<button type="submit" data-oper='modify'
							class="btn btn-outline-success">Modify</button>
						<button type="submit" data-oper='remove'
							class="btn btn-outline-danger">Remove</button>

						<button type="reset" class="btn btn-outline-dark">back</button>
						<input type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum}"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount}"/>'> <input
							type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
						<input type="hidden" name="keyword"
							value='<c:out value="${cri.keyword}"/>'>

					</form>
				</div>
			</div>
		</div>
	</section>
	<%@include file="../includes/footer.jsp"%>
</body>