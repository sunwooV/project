<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("utf-8");
	String flea_code = request.getParameter("flea_code");
	System.out.println(":::::flea_code" + flea_code);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>금도끼은도끼| 플리마켓</title>
<!-- Bootstrap core CSS -->
<link
	href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${contextPath}/resources/css/shop-homepage.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca839997c3bd98863fdc033319b76889&libraries=services"></script>
<script>	
	$(document).ready(function() {
		$("#chat-header>i").on("click", addMember);
		
		function addMember() {
			$('#user-add').fadeIn();
		}

		//팝업 이벤트
		$("#chat-header>i").on("click", showPopup);
		$("#pop-close").on("click", closePopup);

		//팝업 검색
		$("#pop-search>input[type=text]").on("keydown", function(event) {
			if (event.keyCode == 13) {
				popSearch();
			}
		});
		$("#pop-search>input[type=button]").on("click", function() {
			alert("aa");
			popSearch();
		});

		function popSearch(/*웹소켓 객체*/) {
			alert("확인;;;");
			$('#pop-footer>input').prop('disabled', false);
			var input = $('#pop-search>input[type=text]').toArray()[0];
			//입력값으로 select날려서 결과받아 뿌리기
			var contents = {
				keyword : $(input).val()
			}
			sendText(ws, "search_member", contents);
		}

		function showPopup() {
			$('#pop-list').empty();
			$('#user-add').css('display', 'block');
			$('#pop-footer>input').prop('disabled', true);
		}

		function closePopup() {
			$('#user-add').css('display', 'none');
		}

		function filter() {
			alert("타는지 확인");
			var value, name, item, i;

			value = document.getElementById("value").value.toUpperCase();
			item = document.getElementsByClassName("item");

			for (i = 0; i < item.length; i++) {
				name = item[i].getElementsByClassName("name");
				if (name[0].innerHTML.toUpperCase().indexOf(value) > -1) {
					item[i].style.display = "flex";
				} else {
					item[i].style.display = "none";
				}
			}
		}

		function deselect(e) {
			$('.pop').slideFadeToggle(function() {
				e.removeClass('selected');
			});
		}

		function deselect2(e) {
			$('.pop2').slideFadeToggle(function() {
				e.removeClass('selected2');
			});
		}

		$(function() {
			$('#contact').on('click', function() {
				if ($(this).hasClass('selected')) {
					deselect($(this));
				} else {
					$(this).addClass('selected');
					$('.pop').slideFadeToggle();
				}
				return false;
			});

			$('.close').on('click', function() {
				deselect($('#contact'));
				return false;
			});
		});

		$(function() {
			$('#participants_add').on('click', function() {
				if ($(this).hasClass('selected2')) {
					deselect2($(this));
				} else {
					$(this).addClass('selected2');
					$('.pop2').slideFadeToggle();
				}
				return false;
			});

			$('.close2').on('click', function() {
				deselect2($('#participants_add'));
				return false;
			});
		});

		$.fn.slideFadeToggle = function(easing, callback) {
			return this.animate({
				opacity : 'toggle',
				height : 'toggle'
			}, 'fast', easing, callback);
		};

	});
</script>
</head>

<body>


	<!-- 프로필 수정 팝업창 -->
	<div class="messagepop pop2">
		<h2>참여자 추가</h2>
		<form method="post" id="new_message"
			action="/devFw/participantsInsert.do" enctype="multipart/form-data">
			<p>
				<label for="flea_name">회원 검색&nbsp;</label><input type="text"
					size="30" name="memberid" id="memberid" />
			</p>
			<p>
				<input type="submit" value="확인" name="commit" id="message_submit" /><a
					class="close" href="/">Cancel</a>
			</p>
			<c:forEach var="flea" items="${searchList}">
				<input type="hidden" name="flea_code" value="${flea.flea_code}">
			</c:forEach>
		</form>


	</div>


	<div class="row" id="flea">
		<div class=".col-sm-4">
			<aside class="artist-area">
				<div class="user-info card-style-profile ">
					<!--  
					<h4>
						<a href="/devFw/fleaSearchInit.do">플리마켓 마이페이지(임시)</a>
					</h4>
-->

					<!-- 
		            <div id="chat-header">
						<div id="user-info"></div>
						<i class="fa fa-user-plus pa-5x"></i>
			         </div>
		             -->
					<c:forEach var="flea" items="${searchList}">
						<div class="profile-picture big-profile-picture clear">
							<img width="120px" height="120px" alt="no picture"
								src="${flea.profile_photo}" />
							<!-- 
					              <img width="120px" height="120px" alt="Anne Hathaway picture" src= "<c:url value="/img/${file.profile_photo }" />" >
					             -->
						</div>

						<!-- 프로필 수정 아이콘 버튼-->
						<div class="profile-setting">
							<a href="" id="contact"
								onclick="window.open('./editProfile.do?flea_code=${flea.flea_code}', 'window팝업', 'width=520, height=620, menubar=no, status=no, toolbar=no')">
								<i class="fa fa-cog pa-5x"></i>
							</a>
						</div>

						<div class="user-name">
							<font size="3"> <c:out value="${flea.flea_name}" /> <a
								target="_blank" href="#" id="participants_add">
								<!-- <i class="fa fa-user-plus pa-5x"></i> -->
								</a>
							</font>
						</div>

						<div class="profile-description">
							<c:out value="${flea.intro_cotent}" />
						</div>
					</c:forEach>
				</div>
				<fieldset class="ui-field border-row">
					<button type="button"
						class="btn btn-s btn-white toggle-heart detail-like pseudo-ico-love"
						data-name="starred-toolbar" data-starred-type="artist"
						data-init="" data-starred=""
						data-target-id="b20eee2f-b3eb-4fee-bc81-735f1e2318d6">
						<div id="chat-header">
							<div id="user-info"></div>
							<i class="fa fa-user-plus pa-5x">참가 신청</i>
						</div>
					</button>

					<div id="chat-header">
						<div id="user-info"></div>
						<button type="button" class="btn btn-m btn-white pseudo-ico-share"
							data-ui="url-copy" data-ui-option="short" data-icon-event="hover"
							data-clipboard-text="#" onclick="location.href='/devFw/fleaSearchInit.do'">
							<i class="fa fa-list-alt pa-5x"></i>
							참여자 리스트<br>
						</button>

					</div>

					<button type="button"
						class="btn btn-s btn-white toggle-heart detail-like pseudo-ico-love"
						data-name="starred-toolbar" data-starred-type="artist"
						data-init="" data-starred=""
						data-target-id="b20eee2f-b3eb-4fee-bc81-735f1e2318d6">
						<div id="chat-header">
							<div id="user-info"></div>
							<i class="ico-img"> <span class="sp-icon icon-heart"></span> <span
								class="sp-icon icon-heart active"></span>
							</i> <em class="txt"><i class="fa fa-heart"></i> 스토어 찜하기</em>
						</div>
					</button>
					<br> <a href="#"
						class="btn btn-s btn-white pseudo-ico-message"> <i
						class="fa fa-envelope"></i>&nbsp;메세지
					</a><br>
					<button type="button" class="btn btn-m btn-white pseudo-ico-share"
						data-ui="url-copy" data-ui-option="short" data-icon-event="hover"
						data-clipboard-text="#">
						<i class="fa fa-share-alt"></i> 공유하기<br>
					</button>

				</fieldset>

				<div class="border-row">
					<nav class="nav-links">
						<span>🏠홈<br></span> <span>📜스토리<br></span> <span>🧸판매
							작품<br>
						</span> <span>✍️구매 후기<br></span>
					</nav>
				</div>

				<div class="list-def border-row">
					<!--  
		        <strong class="caption"><font size="3">활동정보</font></strong>
		        -->
					<c:forEach var="flea" items="${searchList}" begin="0" end="3">
						<dl class="list">
							<dt>좋아하는 사람</dt>
							<dd>
								<a href="#t" data-modal-trigger="user-list" data-modal="open"
									data-type="favorite" data-title="좋아하는 사람"><span
									id="like-count"> <c:out value="${flea.flea_like_count}" />

								</span><em>명</em> </a>
							</dd>
							<dt>판매중인 작품</dt>
							<dd>
								<a href="#">11<em>개</em></a>
							</dd>
							<dt>
								<a href="/devFw/fleaReview.do">구매후기</a>
							</dt>
							<dd>
								<a href="#">124<em>개</em></a>
							</dd>
						</dl>
					</c:forEach>
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br>
			</aside>
		</div>

		<!-- /.col-lg-3 -->
		<div class=".col-sm-8"
			style="width: 74%; border-left: 1px solid lightgray; padding-left: 1%;">
			<!--   <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel"> -->
			<!-- 
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
           -->
			<div class="carousel-inner" role="listbox">
				<!--  
           <c:forEach var="flea" items="${searchList}" > 
            <div class="carousel-item active">
              <img class="d-block img-fluid" id="img-full" src="${flea.main_photo}" alt="First slide">
            </div>
           </c:forEach>
           -->
				<!--  
            <div class="carousel-item">
              <img class="d-block img-fluid" id="img-full" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" id="img-full" src="http://placehold.it/900x350" alt="Third slide">
            </div>
          </div>
          -->
				<!--  
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
          -->
			</div>

			<!-- 플리마켓 맵 
   	<div class="fleaMap">
    	<a href="/devFw/fleaMap.do" id="fleaMap">
       	   <i class="fa fa-map-marker-alt pa-5x">오프라인 맵<br></i>
        </a>
    </div>
    -->
			<div class="ui_title__txt" style="width: 101%;">
				<font size="3">📌오프라인 플리마켓 정보</font>
			</div>
			<!-- 플리 맵 추가 -->
			<div id="map" style="width: 100%; height: 250px;"></div>


			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				<c:forEach var="addressList" items="${searchList}">

				// 주소로 좌표를 검색합니다
				geocoder
						.addressSearch(
								'${addressList.join_offline_location}',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">일자:  <c:out value="${addressList.join_offline_date}"/><br>시간: <i class="fas fa-clock"></i><c:out value="${addressList.join_offline_time}"/><br><i class="fas fa-map-marker-alt"></i>장소: <c:out value="${addressList.join_offline_location}"/><br></div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
				</c:forEach>
			</script>

			<br>
			<c:set var="flea_code" value="${flea_code }" />


			<div class="ui_title__txt" style="width: 101%;">
				<font size="3"><a
					href="/devFw/fleaProduct.do?flea_code=<%=flea_code%>">🎁판매 상품</a></font>
			</div>
			<div class="row">
				<c:forEach var="newProduct" items="${newProduct}">
					<c:if test="${newProduct.flea_yn == 'y'}">
						<c:if test="${newProduct.fleamarket == flea_code}">
							<div class="col-lg-3 col-md-4 mb-3">

								<div class="card h-100">
									<a href="#"><img class="card-img-top"
										src="${newProduct.represent_image }" alt="..."
										onclick="location.href='./detail.do?prod_number=${newProduct.prod_number }'"></a>
									<div class="card-body">
										<h4 class="card-title">
											<a href="#"><font size="3">${newProduct.prod_title }
													<c:if test="${newProduct.sale_percent != null }">
						[${newProduct.sale_percent }%]
				 	  </c:if>
											</font></a>
										</h4>
										<h5>
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
										</h5>
										<!-- 상품 간략 설명 -->
										<p class="card-text">
											<font size="3"><br></font>
										</p>
									</div>
									<div class="card-footer">
										<small class="text-muted">&#9733; &#9733; &#9733;
											&#9733; &#9734;</small>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
			<a href="/devFw/fleaProduct.do?flea_code=<%=flea_code%>"
				class="ui_btn--large" style="margin-top: 2%; margin-left: 41%;">더보기</a>
			<br>
			<div class="row">
				<div id="cardlist_section">
					<div class="ui_title--sub">
						<h3 class="ui_title__txt" style="width:100%;">
							<font size="3"><a
								href="/devFw/fleaReview.do?flea_code=<%=flea_code%>">✏️구매후기</a></font>
						</h3>
					</div>
					<ul class="split-cardlist">
						<c:forEach var="bestStore" items="${searchList}">
							<li class="ui_grid__item" style="width: 400px;">
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
												<a href="#" target="_blank" class="ui_card__title"> <12색상> 폼폼♥ 스마트톡/폰케이스</a>
												<br> <span class="ui_card__para">
													다행히 오늘 다같이 모이는 마지막 날이라서 오늘까지 와야했는데!!!했는데 오늘와서 배송은 괜찮았어요. 눈도 이뿌게 달려있고
													막 털 빠지는 폼폼이 아니라서 좋았어요
													다같이 모으면 진짜 귀여웅 </span>
											</div>

											<div class="ui_card__rating">
												<div class="ui_card__vcenter">
													<div class="ui_rating" data-ui="rating" data-value="5">
														<i class="ui_icon--star-fill" data-state="active"></i> <i
															class="ui_icon--star-fill" data-state="active"></i> <i
															class="ui_icon--star-fill" data-state="active"></i> <i
															class="ui_icon--star-fill" data-state="active"></i> <i
															class="ui_icon--star-fill" data-state="active"></i> <span>&nbsp;|
															${bestStore.memberid }</span>
													</div>
												</div>
												<input name="paging_param" type="hidden"
													value="1574744451000">
											</div>


										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>

					<a href="/devFw/fleaReview.do?flea_code=<%=flea_code%>"
						class="ui_btn--large" style="margin-left: 32%;">더보기</a>
				</div>


				<div id="cardlist_section">
					<div class="ui_title--sub">
						<h3 class="ui_title__txt" >
							<font size="3"><a
								href="/devFw/fleaStory.do?flea_code=<%=flea_code%>">📝스토리</a></font>
						</h3>
					</div>
					<c:forEach var="story" items="${storyList}" begin="0" end="3">

						<ul class="split-cardlist lines5">
							<li class="ui_card--side">
								<div class="ui_card__inner">
								<!--  
									<div class="ui_card__imgcover">
										<a href="#" class="ui_card__img"
											style="background-image: url(https://image.idus.com/image/files/4b1b9b058f5046d99b0ade714ecdc0c4_720.jpg)"></a>
									</div>
								-->
									<div class="ui_card__txtarea ">
										<div class="ui_card__info">
											<a href="${contextPath}/FleaMarket/P002/D003/searchList.do"
												class="ui_card__title">${story.story_title }</a> <span
												class="ui_card__para">${story.story_cotent }</span>

										</div>
									</div>
								</div>
							</li>
						</ul>
					</c:forEach>
					<a href="/devFw/fleaStory.do?flea_code=<%=flea_code%>"
						class="ui_btn--large" style="margin-left: 32%;">더보기</a>
				</div>

			</div>

		</div>
	</div>


	<div id="user-add">
		<div id="pop-up">
			<form method="post" id="new_message"
				action="/devFw/participantsInsert.do" enctype="multipart/form-data">
				<div id="pop-header">
					<div>참여자 신청</div>
					<a id="pop-close">&times;</a>
				</div>
				<div id="pop-search">
					<input onkeyup="filter()" type="text" placeholder="본인 아이디를 입력해주세요." /> <input
						type="submit" id="value" value="선택">
				</div>
				<div id="pop-list"></div>
				<!--  
				<div id="pop-footer">
					<input type="button" value="선택" />
				</div>
				-->
				<c:forEach var="flea" items="${searchList}">
					<input type="hidden" name="flea_code" value="${flea.flea_code}">
				</c:forEach>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		function filter() {
			var value, name, item, i;
			var addressArray = [];

			/*
			value = document.getElementById("value").value.toUpperCase();
			item = document.getElementsByClassName("item");

			for(i=0;i<item.length;i++){
			  name = item[i].getElementsByClassName("name");
			  if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
			    item[i].style.display = "flex";
			  }else{
			    item[i].style.display = "none";
			  }
			}
			 */
		}
	</script>

</body>
</html>