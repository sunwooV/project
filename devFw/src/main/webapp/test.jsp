<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img{
	width:50px;
	height:auto;
	padding-left: 14px;
    padding-top: 8px;
}
p{
	font-size: x-small;
	margin: 0px;
	text-align:center;
}
a{
	text-decoration:none;
}
.side{
	position:fixed;
	right:50px;
	top:300px;
    cursor:pointer;
}
.side > div{
	width:84px;
    height:84px;
	border:1px solid lightgray;
	border-collapse:collapse;
	margin:0px auto;
}
.container{
	overflow:hidden;
	width:75%;
	height:600px;
}
.container > img{
	width:100%;
	height:auto;
}
</style>
</head>
<body>
<div class="container">
<img src="${contextPath }/resources/img/main/main11.jpg">
</div>
<div class="side">
	<div id="seller">
	<a href="./fleaCreateStoreType.do">
		<img src="${contextPath }/resources/img/side/seller.png">
		<p>판매자등록</p>
	</a>
	</div>
	<div id="openFlea">
	<a href="./fleaCreateStoreType.do">
		<img src="${contextPath }/resources/img/side/openFlea.png">
		<p>스토어등록</p>
	</a>
	</div>
	<div id="enroll">
	<a href="./enroll.do">
		<img src="${contextPath }/resources/img/side/enroll.png">
		<p>상품등록</p>
	</a>
	</div>
	<div id="chat">
	<a href="./chatInit.do">
		<img src="${contextPath }/resources/img/side/chat.png">
		<p>채팅하기</p>
	</a>
	</div>
</div>
</body>
</html>