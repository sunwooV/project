<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath }/resources/css/shop-homepage.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>-->
<script src="https://kit.fontawesome.com/af7787acb6.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
<!-- 별점 -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg=="
	crossorigin="anonymous">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
	$(document)
			.ready(
					function() {
						var loginCheck = document.getElementById("memberId").value;
						var now = window.location.href;

						$(document)
								.on(
										'click',
										'#heart',
										function() {
											if (loginCheck == null
													|| loginCheck == "") { //로그인 안되어 있을 때
												if (confirm("로그인 후 관심스토어를 등록할 수 있습니다..\n로그인 하시겠습니까?")) {
													window.location.href = "./loginInit.do?redirect="
															+ now;
												} else {
													return false;
												}
											} else { //로그인 되어있을 때 => 관심 스토어 등록
												if ($(this).attr('name') == 'n') { //관심 상품 등록
													var heart = document
															.getElementById("heart");
													$(this)
															.html(
																	'<img src="${contextPath}/resources/img/detailProduct/fillheart.png" style="width:30px; height:30px; float:right; margin-top:-24px;">');
													$(this).css("color",
															"#dd5850");
													heart.setAttribute("name",
															"y");

													var selectflea = heart.dataset.flea;
													var memberId = $(
															"#memberId").val();
													var command = "like";
													console.log(selectflea
															+ '/' + memberId
															+ '/' + command);

													var heart = {
														flea_code : selectflea,
														memberId : memberId,
														command : command
													}

													$
															.ajax({
																type : "post",
																async : false,
																url : "/devFw/Likeflea.do",
																data : heart,
																dataType : 'text',
																success : function(
																		responseData) {
																	var data = JSON
																			.parse(responseData);

																	$(".heart")
																			.html(
																					data.heart);

																	console
																			.log("관심스토어 등록 완료");

																},
																error : function(
																		data,
																		textStatus) {
																	alert("다시 시도해주세요.");
																},
																complete : function(
																		data,
																		textstatus) {
																}
															});
												} else { //관심 상품 해제
													var heart = document
															.getElementById("heart");
													$(this)
															.html(
																	'<img src="${contextPath }/resources/img/detailProduct/heart.png" style="width:30px; height:30px; float:right; margin-top:-24px;">');
													$(this).css("color",
															"black");
													heart.setAttribute("name",
															"n");

													var selectflea = heart.dataset.flea;
													var memberId = $(
															"#memberId").val();
													var command = "dislike";
													var heart = {
														flea_code : selectflea,
														memberId : memberId,
														command : command
													}

													$
															.ajax({
																type : "post",
																async : false,
																url : "/devFw/Likeflea.do",
																data : heart,
																dataType : 'text',
																success : function(
																		responseData) {
																	var data = JSON
																			.parse(responseData);

																	$(".heart")
																			.html(
																					data.heart);

																	console
																			.log("관심스토어 해제 완료");

																},
																error : function(
																		data,
																		textStatus) {
																	alert("다시 시도해주세요.");
																},
																complete : function(
																		data,
																		textstatus) {
																}
															});
												}
											}
										});

					});
</script>

</head>
<style>
ol, ul {
	list-style: none;
}

.ui_card__img {
	position: relative;
	display: block;
	width: 85%;
	height: auto;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: 50%;
	transition: transform .5s ease-in-out;
}

.ui_card__img, .ui_card__imgcover {
	overflow: hidden;
}

.ui_card, .ui_card--flex-orientation, .ui_card--side, .ui_card--white {
	overflow: hidden;
	position: relative;
	display: inline-block;
	background: #f8f9fb;
	border-radius: 4px;
	border: 1px solid #d9d9d9;
	font-size: 12px;
	box-shadow: 0 1px 3px 0 hsla(0, 0%, 86.3%, .3);
}

.ui_card--side .ui_card__imgcover {
	width: 43%;
}

.ui_card--side .ui_card__inner>* {
	display: table-cell;
	vertical-align: top;
}

.ui_card__img, .ui_card__imgcover {
	overflow: hidden;
}

.cardlist_section .split-cardlist .ui_card--side {
	height: 186px;
	width: 100%;
}

.ui_grid__item {
	width: 45%;
	margin-bottom: 2%;
	cursor: pointer;
	float: left;
	margin-right: 5%;
}

.ui_card__txtarea {
	padding: 2%;
}

.ui_card__inner {
	height: 169px;
}

#banner {
	margin-top: -1.8%;
	padding: 14em 0 12em 0;
	background-image:
		url(../devFw/resources/photoUpload/bg_flmk_anmtn_01.gif);
	background-size: cover;
	background-position: center top;
	background-repeat: no-repeat;
	text-align: center;
	width: 125.7%;
	height: 100px;
	margin-left: -12.9%;
}

.byKpAP {
	width: 29px;
	height: 56px;
	font-size: 50px;
	font-weight: bold;
	color: rgb(0, 0, 0);
	margin-right: 16px;
}

.banner_content {
	margin-top: -157px;
}

ul li {
	list-style-type: none;
}

#ppp {
	padding-bottom: 1%;
	margin-left: -19%;
	padding-top: 4%;
}

.blinkcss {
	background-color: #004A7F;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	border: none;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-family: Arial;
	font-size: 20px;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	-webkit-animation: glowing 1500ms infinite;
	-moz-animation: glowing 1500ms infinite;
	-o-animation: glowing 1500ms infinite;
	animation: glowing 1500ms infinite;
}

@
-webkit-keyframes glowing { 0% {
	background-color: #B20000;
}

50%
{
background-color












:






 






#FF0000












;
}
100%
{
background-color












:






 






#B20000












;
}
}
@
-moz-keyframes glowing { 0% {
	background-color: #B20000;
}

50%
{
background-color












:






 






#FF0000












;
}
100%
{
background-color












:






 






#B20000












;
}
}
@
-o-keyframes glowing { 0% {
	background-color: #B20000;
}

50%
{
background-color












:






 






#FF0000












;
}
100%
{
background-color












:






 






#B20000












;
}
}
@
keyframes glowing { 0% {
	background-color: #B20000;
}

50%
{
background-color












:






 






#FF0000












;
}
100%
{
background-color












:






 






#B20000












;
}
}
#p {
	padding-top: 1%;
	padding-left: 1%;
}
</style>


<body>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container">
		<!-- 상단 그림 -->
		<input type="hidden" id="memberId" value="${member.getMemberid() }" />
		<br>
		<!-- Banner -->
		<div class="banner_div">
			<section id="banner">
				<div class="banner_content">
					<span class="MarketMain__Quotes-c10k9n-5 byKpAP">"</span>
					<h1
						style="color: white; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black; font-weight: bold; margin-top: -30px;">
						Welcome! Flea Market<br> <br>상품이 있다면 마켓인유에 참여해보세요.
					</h1>
					<ul class="actions">
						<li><a href="#one" class="button scrolly">Get Started</a></li>
					</ul>
				</div>
			</section>
		</div>
		<br> <br>
		<div>
			<h2>🏡플리마켓 일정</h2>
			<!-- 컨텐츠 -->
			<div id="p">
				<h3>지금까지 5개의 마켓이 열렸고, 3개의 마켓이 셀러를 기다리고 있습니다😃</h3>
			</div>
			<!-- 플리마켓 맵
        <div class="fleaMap">
        	<a href="/devFw/fleaMap.do" id="fleaMap">
           	   <i class="fas fa-map-marked-alt pa-5x">오프라인 맵</i>
            </a>
        </div>
        -->

			<!--  
		<div class="row">
		  <c:forEach var="bestStore" items="${searchList}">
				<div class="col-sm-3">
					<div class="thumbnail">
					
					  
						<img src="${bestStore.profile_photo}"
							style="width: 230; height: 240; " alt="..." onclick="location.href='./fleaMystore.do?flea_code=${bestStore.flea_code }'">

						<div class="caption">
							<h3>${bestStore.flea_name }</h3>
							<p id="p">${bestStore.intro_cotent }</p>
							
							<div class="Relrr">
					          <div class="bdycMe">
					             <div class="gFsGXG">
					             	${bestStore.join_offline_date}
					           
					                    <div class="iGGFft">${bestStore.join_offline_location}</div>
					                       <div class="fQIbEE">
					                           <i class="fas fa-clock">${bestStore.join_offline_time}</i>
					                       </div>
					             </div>
					          </div>
					      </div>
							
							
							
							<p id="p">
								<a href="#" class="btn btn-primary" id="ttt3" role="button">메세지 보내기</a>
								<a href="${contextPath}/payInfo.do" class="btn btn-default"
									id="ttt4" role="button">작가홈</a>
							</p>
							
							
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
		-->


			<div class="row">
				<section class="cardlist_section" style="width: 230%;">
					<div class="ui_title_sub">
						<ul class="split-cardlist">
							<c:forEach var="bestStore" items="${searchList}">
								<li class="ui_grid__item">
									<div class="ui_card--side">
										<div class="ui_card__inner">
											<div class="ui_card__imgcover">
												<img src="${bestStore.profile_photo}" class="ui_card__img"
													style="width: 230; height: 240;" alt="..."
													onclick="location.href='./fleaMystore.do?flea_code=${bestStore.flea_code }'">
												<!--  <a href="#" class="ui_card__img" target="_blank" style="background-image: url('${bestStore.profile_photo}')">-->
											</div>

											<div class="ui_card__txtarea">
												<div class="ui_card__info">
													<a href="#" target="_blank" class="ui_card__title"
														style="font-size: medium;">${bestStore.flea_name }</a> <br>
													<c:set var="likeProd" value="${likeProd}" />

													<c:if test="${likeProd == null}">
														<div id="heart" name="n"
															data-flea="${bestStore.flea_code }">
															<img
																src="${contextPath }/resources/img/detailProduct/heart.png"
																style="width: 30px; height: 30px; float: right; margin-top: -24px;">
														</div>
													</c:if>
													<c:if test="${likeProd == '0' }">
														<div id="heart" name="n"
															data-flea="${bestStore.flea_code }">
															<img
																src="${contextPath }/resources/img/detailProduct/heart.png"
																style="width: 30px; height: 30px; float: right; margin-top: -24px;">
														</div>
													</c:if>
													<c:if test="${likeProd == '1' }">
														<div id="heart" name="y"
															data-flea="${bestStore.flea_code }">
															<img
																src="${contextPath }/resources/img/detailProduct/fillheart.png"
																style="width: 30px; height: 30px; float: right; margin-top: -24px;">
														</div>
													</c:if>


													<span class="ui_card__para">
														${bestStore.intro_cotent } </span>
												</div>

												<div class="Relrr">
													<div class="bdycMe">
														<div class="gFsGXG">
															일시: ${bestStore.join_offline_date} <i
																class="fas fa-clock">${bestStore.join_offline_time}</i>
															<!-- 
					                 <time datetime="1576162800000">12.13</time>&nbsp;~&nbsp;<time datetime="1577804400000">01.01</time>&nbsp;</div>
					             -->
															<div class="iGGFft">장소:${bestStore.join_offline_location}</div>

														</div>
													</div>
												</div>


												<div class="ui_card__rating">
													<div class="ui_card__vcenter">
														<!-- <span>&nbsp;| ${bestStore.memberid }</span>-->
														<span><b>모집날짜: ${bestStore.join_date} ~
																${bestStore.join_offline_date}</b></span>

													</div>
													<input name="paging_param" type="hidden"
														value="1574744451000">
												</div>


												<p id="ppp">
													<a href="#" class="btn btn-primary" id="ttt3" role="button">메세지
														보내기</a>



													<c:if test="${bestStore.recruit_yn == 'n'}">
														<a href="#" class="btn btn-default" id="ttt4"
															role="button">모집종료</a>
													</c:if>
													<c:if test="${bestStore.recruit_yn == 'y'}">
														<a href="#" class="btn btn-default blinkcss" id="ttt4"
															role="button" style="background: red;">모집중</a>
													</c:if>
												</p>

											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
<!-- 
<script>
	$('.tree-toggle').click(function() {
		$(this).parent().children('ul.tree').toggle(200);
	});
	$(function() {
		$('.tree-toggle').parent().children('ul.tree').toggle(200);
	})
</script>
 -->
</html>
