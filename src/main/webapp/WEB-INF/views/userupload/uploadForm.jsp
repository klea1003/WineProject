<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>upload</title>
</head>
<body>
<form action="uploadFormAction" method="post" enctype="multipart/form-data">
<input type="file" name="uploadFile" multiple>
<button>파일 업로드</button>
</form>
</body>
</html>
