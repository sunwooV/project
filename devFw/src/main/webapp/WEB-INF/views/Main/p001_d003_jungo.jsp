_<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼은도끼</title>
<style>
#sale_price {
	color: #BDBDBD;
	font-size: medium;
	text-decoration: line-through;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
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
		<div id="image">
		<div id="text">
		<h1 class="display-3" style="margin: auto;">세상에 없던 MULTI in 1</h1></div>
		<img style="width:101%; margin-top:-55px; opacity: 0.75;" src="${contextPath }/resources/img/main/main111.png"></div> 
		
		<!-- 	<p>
			<a class="btn btn-primary btn-lg" href="#" role="button"
				style="font-size: 20px; margin-left: 83%;">더 알아보기</a> 
		</p> -->
		
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
								<img src="${contextPath }/resources/img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p id="p">7000원</p>

									<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
									<input type="hidden" name="item_num" id="goToCart"> <a
										href="${contextPath}/payInfo.do" class="btn btn-default"
										id="ttt4" role="button">구매하기</a>

								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="${contextPath }/resources/img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="thumbnail">
								<h4>중고상품</h4>
								<img src="${contextPath }/resources/img/케익.jpg" width=230, height=240 alt="...">
								<div class="caption">
									<h3>입점할인❤️생일케이크 캔들[10%]</h3>
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
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
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
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
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
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
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
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
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
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
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="new" class="tab-pane fade">
					<div class="row">
						<c:forEach var="newProduct" items="${newProduct}">
							<div class="col-sm-3">
								<div class="thumbnail">
									<c:if test="${newProduct.reused_yn == 'y' }">
										<!-- 상품 판매 카테고리 -->
										<span class="group">중고</span>
									</c:if>
									<c:if
										test="${newProduct.auction_yn == 'y' or newProduct.auction_yn == 'w' or newProduct.auction_yn == 'f'}">
										<span class="group">경매</span>
									</c:if>
									<c:if test="${newProduct.flea_yn == 'y' }">
										<span class="group">플리</span>
									</c:if>
									<c:if test="${newProduct.auction_yn == 'y' }">
										<span class="group" style="color: red;">(경매 진행 중)</span>
									</c:if>
									<img src="${newProduct.represent_image }"
										style="width: 230px; height: 240px;" alt="..."
										onclick="location.href='./detail.do?prod_number=${newProduct.prod_number }'">
									<div class="caption">
										<h3>${newProduct.prod_title }
											<c:if test="${newProduct.sale_percent != null }">
											[${newProduct.sale_percent }%]
										</c:if>
										</h3>
										<c:choose>
											<c:when test="${newProduct.auction_yn == 'y' }">
												<p id="p">
													<fmt:formatNumber value="${newProduct.auction_bid }"
														type="number" />
													원
												</p>
											</c:when>
											<c:when
												test="${((newProduct.auction_yn == 'f' or newProduct.auction_yn == 'w') and newProduct.reused_yn == 'n' and newProduct.flea_yn == 'n') or newProduct.prod_amount == 0 }">
												<p id="p" style="color: red; font-weight: bold">품절</p>
											</c:when>
											<c:otherwise>
												<c:if test="${newProduct.sale_percent != null }">
													<p>
														<span id="p"><fmt:formatNumber
																value="${newProduct.prod_price * (1-(newProduct.sale_percent*0.01)) }"
																type="number" />원</span> <span id="sale_price"
															style="margin-bottom: 1re;"><fmt:formatNumber
																value="${newProduct.prod_price }" type="number" />원</span>
													</p>
												</c:if>
												<c:if test="${newProduct.sale_percent == null }">
													<p id="p">
														<fmt:formatNumber value="${newProduct.prod_price }"
															type="number" />
														원
													</p>
												</c:if>
											</c:otherwise>
										</c:choose>


										<p id="p">
											<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
											<a href="${contextPath}/payInfo.do" class="btn btn-default"
												id="ttt4" role="button">구매하기</a>
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
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
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
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
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
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
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
									<p id="p">7000원</p>
									<p id="p">
										<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
										<a href="${contextPath}/payInfo.do" class="btn btn-default"
											id="ttt4" role="button">구매하기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="good_store" class="tab-pane fade">
					<div class="row">
						<c:forEach var="bestStore" items="${bestStore}">
							<div class="col-sm-3">
								<div class="thumbnail">
									<img src=${bestStore.profile_photo
										}
										style="width: 230px; height: 240px;" alt="..."
										onclick="location.href='./fleaMystore.do?flea_code=${bestStore.flea_code }'">

									<div class="caption">
										<h3>${bestStore.flea_name }</h3>
										<!-- <h1>"${bestStore.intro_cotent }"</h1> -->
										<p id="p">${bestStore.intro_cotent }</p>
										<p id="p">
											<a href="#" class="btn btn-primary" id="ttt3" role="button">작가홈</a>
											<a href="${contextPath}/payInfo.do" class="btn btn-default"
												id="ttt4" role="button">메세지보내기</a>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
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