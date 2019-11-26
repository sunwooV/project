<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인창</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>login</h3>
			</div>
			<div>
			<form name="frm" method="post" action="${contextPath}/login.do">
			
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="memberid" name="memberid" required> 
						<span id="id_check" class="w3-text-red"></span>
					</p>
					<p>
						<label>Password</label> 
						<input class="w3-input" id="pw" name="pw" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">LOGIN</button>
						<button type="button" onClick="location.href='${contextPath}/joinInit.do'" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">JOIN</button>
						<p class="w3-center">
						<a id="kakao_id_login" style="text-align: center" href="https://kauth.kakao.com/oauth/authorize?client_id=6694b0d17c224582f266da703a1a0558&redirect_uri=http://localhost:8090/devFw/kakaoLogin.do&response_type=code"> <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/></a>
					 </p>
					 <p class="w3-center">
					 <a href="./findIdInit.do">❗아이디 찾기</a><br>
					 <a href="./find_pw_form.do">❗비밀번호 찾기</a>
					 </p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>