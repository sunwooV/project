<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼 은도끼|글 등록 완료!</title>
<style type="text/css">
.contentText {
	padding-top: 5%;
	font-size: 50px;
	text-align: center;
}

#button_ToOtherPage {
	text-align: center;
}

#button_ToOtherPage button {
	text-align: center;
	border: 1px solid gray;
	background-color: white;
	padding: 5px;
	border: 1px solid gray;
}

#button_ToOtherPage button:hover {
	color: white;
	background-color: black;
}

#StyleOfButton {
	background-color: #E4EsE4; width : 250px;
	height: 100px;
	font-size: 35px;
	text-align: center;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	width: 250px;
}

#ttl_content_csWriteComplete {
	padding:10%;
}
</style>
</head>
<body>
<c:set var="board_num" value="${board_num }"/>
<input type="hidden" id="board_num" name="board_num" value="${board_num }">

<div id="ttl_content_csWriteComplete">
		<div class="contentText">
			문의 접수가 완료되었습니다.<br> <br>
		</div>
		<div id="button_ToOtherPage">
			<input type="button" id="StyleOfButton" value="메인화면"
				onClick="location.href='${Path}/main.do'">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input type="button"
				id="StyleOfButton" value="목록보기" onClick="location.href='${Path}/privateInit.do?board_num=${board_num }'">
		</div>
	</div>
</body>
</html>