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
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbartop">
		<!-- 상단바 -->
		<a class="navbar-brand" href="./main.do"><img src="${contextPath }/resources/img/logo.jpg"
			width=180px; height=50px; /></a>
		<button class="navbar-toggler collapsed" type="button"
			data-toggle="collapse" data-target="#navbarColor03"
			aria-controls="navbarColor03" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="navbarColor03" style="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="./main.do">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="./joinInit.do">Join</a></li>
				<c:set var="member" value="${member }"/>
							<c:if test ="${ member == null}">
							      <li class="nav-item"><a class="nav-link" href="./loginInit.do">Login</a></li>
							      </c:if>
							    <c:if test ="${ member !=null}">
							   <li><a href = "./InfoInit.do">마이페이지(${ member.memberid})</a></li>
							      <li class="nav-item"><a class="nav-link" href="./logout.do">LOGOUT</a></li>
							      </c:if>
				<li class="nav-item"><a class="nav-link" href="${contextPath}/cart.do">shopping list</a></li>
				<li class="nav-item"><a class="nav-link" href="/devFw/fleaCreateStoreType.do">플리마켓 스토어 개설하기</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0" id="searchform">
				<input class="form-control mr-sm-2" type="text" id="searchbar"
					placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" id="btnsearch"
					type="submit">Search</button>
			</form>
			<button type="submit" class="btn btn-outline-warning"  onclick="location.href='./enroll.do'" id="register">상품 등록</button>
		</div>
	</nav>
	<!--  -->
	<div class="menubar">
		<ul>
			<li><a href="./중고메인.jsp" id="current"
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
<script>
	$('.tree-toggle').click(function() {
		$(this).parent().children('ul.tree').toggle(200);
	});
	$(function() {
		$('.tree-toggle').parent().children('ul.tree').toggle(200);
	})
</script>
</html>