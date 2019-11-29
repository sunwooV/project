<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼은도끼</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/main.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
<script type="text/javascript">
	$(document).on('click', '#btnsearch', function() {
		var searchVal = $("#searchbar").val();
		var frm = document.searchform;

		//검색어 유효성 검사
		if (searchVal == "") {
			alert("검색어를 입력해주세요.");
			return false;
		}

		frm.method = "get";
		frm.action = "./searchProduct.do";
		frm.submit();

	});

	$('.tree-toggle').click(function() {
		$(this).parent().children('ul.tree').toggle(200);
	});
	$(function() {
		$('.tree-toggle').parent().children('ul.tree').toggle(200);
	})
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		id="navbartop">
		<!-- 상단바 -->
		<a class="navbar-brand" href="./main.do"><img
			src="${contextPath }/resources/img/logo.jpg" width=180px;
			height=50px; /></a>
		<button class="navbar-toggler collapsed" type="button"
			data-toggle="collapse" data-target="#navbarColor03"
			aria-controls="navbarColor03" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="navbarColor03" style="">
			<ul class="navbar-nav mr-auto">
				<!-- 	<li class="nav-item active"><a class="nav-link" href="./main.do">Home
						<span class="sr-only">(current)</span>
				</a></li> -->
				<c:set var="member" value="${member }" />
				<c:if test="${ member == null}">
					<li class="nav-item"><a class="nav-link" href="./joinInit.do">회원가입</a></li>
				</c:if>
				<c:if test="${ member.verify == 'N'}">
					<li class="nav-item"><a class="nav-link" href="./mypage.do">마이페이지&nbsp;(${ member.nickname}님)</a></li>
				</c:if>

				<c:if test="${ member.verify == 'Y'}">
					<li class="nav-item"><a class="nav-link" href="./admin.do">Administrate<br>&nbsp;(${ member.nickname}님)
					</a></li>
				</c:if>

				<c:set var="member" value="${member }" />
				<c:if test="${ member == null}">
					<li class="nav-item"><a class="nav-link" href="./loginInit.do">로그인</a></li>
				</c:if>
				<c:if test="${ member != null}">
					<li class="nav-item"><a class="nav-link" href="./logout.do">로그아웃</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/cart.do">장바구니</a></li>
			</ul>
	<!-- 		<form class="form-inline my-2 my-lg-0" id="searchform"
				name="searchform">
				<input class="form-control mr-sm-2" type="text" id="searchbar"
					name="searchVal" value="" placeholder="검색어를 입력하세요♡"> <input
					type="button" class="btn btn-secondary my-2 my-sm-0" id="btnsearch"
					value="Search" onclick="SearchProduct()">
			</form> -->
			<a href="/devFw/fleaCreateStoreType.do" style="font-size: 15px;">✚플리마켓
				스토어&nbsp;&nbsp;&nbsp;</a> <a href="${contextPath}/chatInit.do"
				style="font-size: 15px;">🖂채팅</a>

		</div>
	</nav>
	<!--  -->
	<div class="menubar">
		<ul>
			<li><a href="${contextPath}/cart.do" id="current"
				style="font-family: 'Nanum Gothic Coding', monospace;">중고 거래</a>
				<ul>
					<li><a href="#">패션의류</a></li>
					<li><a href="#">뷰티 잡화</a></li>
					<li><a href="#">유아 용품</a></li>
					<li><a href="#">가구 생활</a></li>
					<li><a href="#">취미 컬렉션</a></li>
					<li><a href="#">디지털</a></li>
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">스포츠 레저</a></li>
					<li><a href="#">뷰티</a></li>
					<li><a href="#">생활 가전</a></li>
					<li><a href="#">자동차 공구</a></li>
					<li><a href="#">도서 기타</a></li>
				</ul></li>
			<li><a href="#" id="current"
				style="font-family: 'Nanum Gothic Coding', monospace;">경&nbsp&nbsp&nbsp&nbsp&nbsp매</a>
				<ul>
					<li><a href="#">패션의류</a></li>
					<li><a href="#">뷰티 잡화</a></li>
					<li><a href="#">유아 용품</a></li>
					<li><a href="#">가구 생활</a></li>
					<li><a href="#">취미 컬렉션</a></li>
					<li><a href="#">디지털</a></li>
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">스포츠 레저</a></li>
					<li><a href="#">뷰티</a></li>
					<li><a href="#">생활 가전</a></li>
					<li><a href="#">자동차 공구</a></li>
					<li><a href="#">도서 기타</a></li>
				</ul></li>
			<li><a href="/devFw/fleaMain.do" id="current"
				style="font-family: 'Nanum Gothic Coding', monospace;">플리 마켓</a>
				<ul>
					<li><a href="#">패션의류</a></li>
					<li><a href="#">뷰티 잡화</a></li>
					<li><a href="#">유아 용품</a></li>
					<li><a href="#">가구 생활</a></li>
					<li><a href="#">취미 컬렉션</a></li>
					<li><a href="#">디지털</a></li>
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">스포츠 레저</a></li>
					<li><a href="#">뷰티</a></li>
					<li><a href="#">생활 가전</a></li>
					<li><a href="#">자동차 공구</a></li>
					<li><a href="#">도서 기타</a></li>
				</ul></li>
		</ul>
	</div>
</body>

</html>