<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>비밀번호 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
				<div class="container"
			style="padding-top: 3%; margin-top: 1%; width: 37%; margin: auto;">
			<div class="w3-center w3-large w3-margin-top">
				<h2 style="margin-top: -8%; padding-bottom: 8%;">🔐비밀번호 찾기</h2>
			</div>
			<div>
			<form name="frn" method="post" action="${contextPath}/find_pw.do">
				<p>
					<label>아이디</label>
					<input class="w3-input" type="text" id="memberid" name="memberid" required>
				</p>
				<p>
					<label>이메일</label>
					<input class="w3-input" type="text" id="email" name="email" required>
				</p>
				<p class="w3-center">
					<button type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">찾기</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
				</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>