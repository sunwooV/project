<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/플리메인.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>-->
<script src="https://kit.fontawesome.com/af7787acb6.js" crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
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
   box-shadow: 0 1px 3px 0 hsla(0,0%,86.3%,.3);
}
.ui_card--side .ui_card__imgcover {
    width: 40%;
}
.ui_card--side .ui_card__inner>* {
    display: table-cell;
    vertical-align: top;
}
.ui_card__img, .ui_card__imgcover {
    overflow: hidden;
}
.cardlist_section .split-cardlist .ui_card--side {
    width: 100%;
}
.ui_grid__item{
	width: 500px;
	margin-bottom: 12px;
	cursor: pointer;
}
.ui_card__txtarea{
	padding: 15px;
}

.ui_card__inner{
	height: 169px;
}

#banner {
    padding: 14em 0 12em 0;
    background-image: url(../devFw/resources/photoUpload/bg_flmk_anmtn_01.gif);
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
.banner_content{	
	margin-top: -157px;
}

ul li {list-style-type: none;}

#ppp{
    padding: 6px;
}

</style>

<body>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container">
	<!-- 상단 그림 -->
		
		<!-- Banner -->
		<div class="banner_div">
			<section id="banner">
				<div class="banner_content">
				<span class="MarketMain__Quotes-c10k9n-5 byKpAP">"</span>
					<h1>Ipsum sed lorem</h1>
					<p>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod<br />sed arcu cras consecuat lorem ipsum dolor sit amet.</p>
					<ul class="actions">
						<li><a href="#one" class="button scrolly">Get Started</a></li>
					</ul>
				</div>
			</section>
		</div>
		
		<br><br>
		
		
		<h1 style="font-size: 25px;">
			<span class="glyphicon glyphicon-tree-deciduous"></span>플리마켓 일정
		</h1>
		
		<!--  
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
		-->
		<!--  카테고리 ----------------------------------------------------------------->

		<!-- 컨텐츠 -->
		<div class="row">
			<p style="padding-left: 3%; padding-bottom: 0%; font-size: 23px;">지금까지 10개의 마켓이 열렸고, 3개의 마켓이 셀러를 기다리고 있습니다:)</p>
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
<section class="cardlist_section">
<div class="ui_title_sub">
<ul class="split-cardlist">
	<c:forEach var="bestStore" items="${searchList}">
		<li class="ui_grid__item">
            <div class="ui_card--side">
                <div class="ui_card__inner">
                    <div class="ui_card__imgcover">
                    	<img src="${bestStore.profile_photo}" class="ui_card__img"
							style="width: 230; height: 240; " alt="..." onclick="location.href='./fleaMystore.do?flea_code=${bestStore.flea_code }'">
                       <!--  <a href="#" class="ui_card__img" target="_blank" style="background-image: url('${bestStore.profile_photo}')">-->
                        </a>
                    </div>

                    <div class="ui_card__txtarea">
                        <div class="ui_card__info">
                            <a href="#" target="_blank" class="ui_card__title">${bestStore.flea_name }</a>
                            <br>
                            <span class="ui_card__para">
                            	${bestStore.intro_cotent }
                            </span>
                        </div>

						<div class="Relrr">
					          <div class="bdycMe">
					             <div class="gFsGXG">
					             	일시: ${bestStore.join_offline_date}
					             <!-- 
					                 <time datetime="1576162800000">12.13</time>&nbsp;~&nbsp;<time datetime="1577804400000">01.01</time>&nbsp;</div>
					             -->
					                    <div class="iGGFft">장소:${bestStore.join_offline_location}</div>
					                       <div class="fQIbEE">
					                           <i class="fas fa-clock">${bestStore.join_offline_time}</i>
					                       </div>
					             </div>
					          </div>
					      </div>


                        <div class="ui_card__rating">
                            <div class="ui_card__vcenter">
                                <div class="ui_rating" data-ui="rating" data-value="5">
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <span>&nbsp;| ${bestStore.memberid }</span>
                                </div>
                            </div>
                            <input name="paging_param" type="hidden" value="1574744451000">
                        </div>
                        
                        
                        <p id="ppp">
								<a href="#" class="btn btn-primary" id="ttt3" role="button">메세지 보내기</a>
								<a href="#" class="btn btn-default"
									id="ttt4" role="button">모집중</a>
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