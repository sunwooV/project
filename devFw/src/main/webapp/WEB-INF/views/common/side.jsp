<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#side {
	width: 67px;
	height: auto;
	padding-left: 14px;
	padding-top: 8px;
}

#sideP {
	font-size: x-small;
	margin: 0px;
	text-align: center;
}

a {
	text-decoration: none;
}

.side {
	position: fixed;
	right: 4%;
	top: 31%;
	cursor: pointer;
}

.side>div {
	width: 84px;
	height: 84px;
	border: 1px solid lightgray;
	border-collapse: collapse;
	margin: 0px auto;
}



</style>
<body>
	<div class="side">
		<div id="seller">
			<a href="./enrollSeller.do"> <img id="side"
				src="${contextPath }/resources/img/side/shop.png">
				<p id="sideP" style="margin: 0px;">판매자등록</p>
			</a>
		</div>
		<div id="openFlea">
			<a href="./fleaCreateStoreForm.do"> <img id="side"
				src="${contextPath }/resources/img/side/open.png">
				<p id="sideP" style="margin: 0px;">스토어등록</p>
			</a>
		</div>
		<div id="enrollProduct">
			<a href="./enroll.do"> <img id="side"
				src="${contextPath }/resources/img/side/online-shop.png">
				<p id="sideP" style="margin: 0px;">상품등록</p>
			</a>
		</div>
		<div id="chat">
			<a href="./chatInit.do"> <img id="side"
				src="${contextPath }/resources/img/side/message.png">
				<p id="sideP" style="margin: 0px;">채팅하기</p>
			</a>
		</div>
	</div>
</body>
</html>