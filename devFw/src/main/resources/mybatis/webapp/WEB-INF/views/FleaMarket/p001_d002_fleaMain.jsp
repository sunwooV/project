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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/플리메인.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/af7787acb6.js" crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
</head>
<body>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container" style="padding-top: 3%; max-width: 60%;">
		<h1 style="padding-bottom: 27px; font-size: 32px;">
			<span class="glyphicon glyphicon-tree-deciduous"></span>플리마켓
		</h1>
		<div class="container" style="border: 2px solid lightgray; max-width: 100%;">
			<div class="row"
				style="margin-right: -9%; padding-left: 16%; margin-bottom: 1%; margin-left: -3%;">
				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="color: black; font-size: 13px;">뷰티잡화</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>
				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="color: black; font-size: 13px;">패션의류</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>

				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="color: black; font-size: 13px;">유아용품</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>

				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="color: black; font-size: 13px;">가구생활</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>

				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="font-size: 13px;">취미컬렉션</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>

				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="font-size: 13px;">디지털</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>

			</div>
			<!-- 카테고리------------------------------------------------------------>

			<div class="row"
				style="margin-right: -9%; padding-left: 16%; margin-bottom: 1%; margin-left: -3%;">
				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="font-size: 13px;">컴퓨터</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>
				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="font-size: 13px;">스포츠레저</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>
				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="font-size: 13px;">뷰티잡화</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>
				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="font-size: 13px;">생활가전</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>
				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="font-size: 13px;">자동차공구</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>
				<div class="btn-group" role="group"
					aria-label="Button group with nested dropdown"
					style="padding-right: 3%; width: 14%;">
					<button type="button" class="btn btn-default"
						style="font-size: 13px;">도서기타</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-default dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"
							x-placement="bottom-start"
							style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 48px, 0px);">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  카테고리 ----------------------------------------------------------------->

		<!-- 컨텐츠 -->
		<div class="row">
			<h1 style="padding-top: 3%; padding-left: 3%; padding-bottom: 0%; font-size: 23px;">인기 스토어
			</h1>
		</div>
		<!-- 플리마켓 맵-->
        <div class="fleaMap">
        	<a href="/devFw/fleaMap.do" id="fleaMap">
           	   <i class="fas fa-map-marked-alt pa-5x">오프라인 맵</i>
            </a>
            &nbsp;
            <a href="/devFw/fleaAddMap.do" id="addMap">
           	   <i class="fas fa-map-marked-alt pa-5x">맵 등록 </i>
            </a>
        </div>
        
		<div class="row">
		  <c:forEach var="bestStore" items="${searchList}">
				<div class="col-sm-3">
					<div class="thumbnail">
						<!--  <h4>우수 스토어</h4> -->
					  
						<img src="${bestStore.profile_photo}"
							style="width: 230; height: 240; " alt="..." onclick="location.href='./fleaMystore.do?flea_code=${bestStore.flea_code}'">

						<div class="caption">
							<h3>${bestStore.flea_name}</h3>
							<p id="p">${bestStore.intro_cotent}</p>
							<p id="p">
								<a href="#" class="btn btn-primary" id="ttt3" role="button">메세지 보내기</a>
								<a href="${contextPath}/payInfo.do" class="btn btn-default"
									id="ttt4" role="button">작가홈</a>
							</p>
						</div>

					</div>
				</div>
			</c:forEach>
			<!-- 상품 예시 
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
		-->
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