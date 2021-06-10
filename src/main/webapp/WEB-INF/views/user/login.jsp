<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../includes/header.jsp" flush="false"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function() {
	  $("#joinBtn").on("click",function(){
	         self.location = "/user/join";
	      });
}

</script>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

login 페이지임<button id='joinBtn' type="button" class="btn btn-xs pull-right">가입하기</button>
</body>
</html>