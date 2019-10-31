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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- 상단바 -->
		<a class="navbar-brand" href="#"><img src="${contextPath }/resources/image/logo.jpg"
			width=180px; height=50px; /></a>
		<button class="navbar-toggler collapsed" type="button"
			data-toggle="collapse" data-target="#navbarColor03"
			aria-controls="navbarColor03" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="navbarColor03" style="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Join</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="#">shopping
						list</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" id="searchbar"
					placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" id="btnsearch"
					type="submit">Search</button>
			</form>
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
				style="font-family: 'Nanum Gothic Coding', monospace;">경매</a>
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
	<div class="jumbotron">
		<h1 class="display-3" id="title">세상에 없던 3 in 1</h1>
		<p style="padding-left: 851px;">경매 중고 플리마켓을 한번에</p>
		<p class="lead">
			<a class="btn btn-primary btn-lg" href="#" role="button"
				style="font-size: 17px; margin-left: 963px;">더 알아보기</a>
		</p>
	</div>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container">
		<div class="row">
			<!-- 컨텐츠 -->
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">주간
						TOP5</a></li>
				<li><a data-toggle="tab" href="#new">신제품</a></li>
				<li><a data-toggle="tab" href="#recommend">오늘의 추천상품</a></li>
				<li><a data-toggle="tab" href="#good_store">우수등급 스토어</a></li>
			</ul>
			<div class="tab-content">
				<!--컨텐츠  -->
				<div id="home" class="tab-pane fade in active">
					<div class="row">
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>

									<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
									<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>

								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="new" class="tab-pane fade">
					<div class="row">
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="recommend" class="tab-pane fade">
					<div class="row">
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="good_store" class="tab-pane fade">
					<div class="row">
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="./img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p>7000원</p>
									<p>
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 풋터 -->
	<div class="footer">
		<footer class="footer-inner">
			<div class="container" id="con1">
				<div class="row" id="foot">
					<div class="col-md-4" id="kkk1">
						<h3 class="footer">회사소개</h3>
						<ul class="footer-list" style="font-size: 14px;">
							<li><a href="#" id="ftlist">Our story</a></li>
							<li><a href="#" id="ftlist">Venue</a></li>
							<li><a href="#" id="ftlist">Other</a></li>
						</ul>
					</div>
					<div class="col-md-4" id="kkk1">
						<h3 class="footer">고객센터</h3>
						<ul class="footer-list" id="ftlist" style="font-size: 14px;">
							<li><a href="#" id="ftlist">IKEA</a></li>
							<li><a href="#" id="ftlist">MIO</a></li>
							<li><a href="#" id="ftlist">BAUHAUS</a></li>
						</ul>
					</div>
					<div class="col-md-4" id="kkk1">
						<h3 class="footer">메일문의</h3>
						<ul class="footer-list" id="ftlist" style="font-size: 14px;">
							<li><a href="#" id="ftlist">Chat with us</a></li>
							<li><a href="#" id="ftlist">+46(0)2453 352</a></li>
							<li><a href="#" id="ftlist">E-mail us</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
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