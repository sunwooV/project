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
<link rel="stylesheet" href="${contextPath }/resources/css/main.css?33">
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
				<li class="active"><a data-toggle="tab" href="#home">주간 TOP5</a></li>
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
						<c:forEach var="newProduct" items="${newProduct}" >	
							<div class="col-sm-3">
								<div class="thumbnail">
									<h4>${newProduct.prod_group }</h4>
									<img src="${newProduct.represent_image }" style="width:230px; height:240px;" alt="..." onclick="location.href='./detail.do?prod_number=${newProduct.prod_number }&prod_category_code=${newProduct.prod_category_code }'">
									<div class="caption">
										<h3>${newProduct.prod_title }</h3>
										<p>${newProduct.prod_price }</p>
										<p>
											<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
											<a href="#" class="btn btn-default" id="ttt4" role="button">구매하기</a>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
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