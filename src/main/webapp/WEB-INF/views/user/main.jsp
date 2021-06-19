<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="/resources/user_bootstrap/css/yoseptest.css">
<style type="text/css">
.login_success_area{
    height: 62%;
    width: 80%;
    border: 2px solid #7474ad;
    border-radius: 15px;
    margin: 5% auto;
    padding-top: 5%;
}
.login_success_area>span{
    display : block;
    text-align: left;
    margin-left: 10%;
}
 
</style>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<h1>gnb area</h1>
			</div>
			<div class="top_area">
				<div class="logo_area">
					<h1>logo area</h1>
				</div>
				<div class="search_area">
					<h1>Search area</h1>
				</div>
				<div class="login_area">
					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${user == null }">
						<div class="login_button">
							<a href="/user/login">로그인</a>
						</div>
						<span><a href="/user/join">회원가입</a></span>
					</c:if>
					<!-- 로그인한 상태 -->
					<c:if test="${ user != null }">
						<div class="login_success_area">
						<span>번호 : ${user.userNum}</span>
                        <span>닉네임 : ${user.userNickName}</span>
                        <span>실명 : ${user.userRealName}</span>
                        <span>핸드폰번호 : ${user.userPhoneNum}</span>
                    </div>
					</c:if>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="navi_bar_area">
				<h1>navi area</h1>
			</div>
			<div class="content_area">
				<h1>content area</h1>
				<span><a href="/user/userlist">리스트</a></span>
			</div>
		</div>
	</div>

</body>
</html>