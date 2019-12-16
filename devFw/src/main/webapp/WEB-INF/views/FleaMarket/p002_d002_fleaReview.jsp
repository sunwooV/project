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
<link rel="stylesheet"
	href="${contextPath }/resources/css/shop-homepage.css">

<!-- Bootstrap core CSS -->
<link
	href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- 별점 -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg=="
	crossorigin="anonymous">
<link rel="stylesheet" href="/stylesheets/style.css"
	integrity="sha256-OlSbjYBfrJGGd2zbT3qCsAZsPGxRwKOSGjqqfjF8aiY= sha512-1aDUINxj8c9UXJ76eIMAkG2/ofIjG8FBW4drgHUglwY/rGn+YWUtm8iSkrpAOtwZ9b9LEva02KPrTDx3M5ib3w=="
	crossorigin="anonymous">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca839997c3bd98863fdc033319b76889&libraries=services"></script>
<!-- Jquery Rate Picker-->
<script type="text/javascript"
	src="${contextPath}/resources/js/jquery-rate-picker.js"></script>
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

		$(".selbox_comm").click(function() {
			alert("ssss");
			$(".selbox_comm").attr('class', 'selbox_comm v2 on ');
		});

	});
</script>
<script>
	$.ratePicker("#rating-2", {
		rate : function(stars) {
			alert('Sample 3\'s Rate is ' + stars);
		}
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
					<!-- PROFILE (MIDDLE-CONTAINER) -->
					<!--  
   	<p><a href="/devFw/fleaCreateStoreApproval.do">플리마켓 관리자(임시)</a></p>
   	-->
					<p>
						<a href="/devFw/fleaSearchInit.do">플리마켓 마이페이지(임시)</a>
					</p>

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
								target="_blank" href="#" id="participants_add"><i
									class="fa fa-user-plus pa-5x"></i></a>
							</font>
						</div>

						<div class="profile-description">
							<c:out value="${flea.intro_cotent}" />
						</div>
					</c:forEach>

				</div>
				<fieldset class="ui-field border-row">
					<div id="chat-header">
						<div id="user-info"></div>
						<i class="fa fa-user-plus pa-5x">참가 신청</i>
					</div>

					<div id="chat-header">
						<div id="user-info"></div>
						<button type="button" class="btn btn-m btn-white pseudo-ico-share"
							data-ui="url-copy" data-ui-option="short" data-icon-event="hover"
							data-clipboard-text="#">
							<i class="fa fa-user-plus pa-5x"></i>참가 신청<br>
						</button>

					</div>

					<button type="button"
						class="btn btn-s btn-white toggle-heart detail-like pseudo-ico-love"
						data-name="starred-toolbar" data-starred-type="artist"
						data-init="" data-starred=""
						data-target-id="b20eee2f-b3eb-4fee-bc81-735f1e2318d6">
						<i class="ico-img"> <span class="sp-icon icon-heart"></span> <span
							class="sp-icon icon-heart active"></span>
						</i> <em class="txt"><i class="fa fa-heart"></i>스토어 찜하기</em>
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
					<dl class="list">
						<dt>좋아하는 사람</dt>
						<dd>
							<a href="#t" data-modal-trigger="user-list" data-modal="open"
								data-type="favorite" data-title="좋아하는 사람"><span
								id="like-count"> <!--  
		                  <c:forEach var="flea" items="${searchList}" > 
		              		 <c:out value="${flea.flea_like_count}"/>
		               	  </c:forEach>
		               	  -->
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
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br>
			</aside>
		</div>
		<div class=".col-sm-8"
			style="width: 72%; border-left: 1px solid lightgray;">
			<div class="cardlist_section" style="margin: 24px; width: 50%;">
				<div class="ui_title--sub">
					<h3 class="ui_title__txt">
						<a href="/devFw/fleaReview.do">구매후기</a> <span class="rv_count"
							data-review="count"> (<em class="num">10</em>)
						</span>

					</h3>

				</div>

				<div class="first-part">
					<div class="deal_buy_review" data-review="starInfo">
						<div class="review_rating_box notxt">
							<div class="average">
								<div class="prev" style="font-size: 26px;">
									<!-- 
			    <div class="star_rating">
                    <i class="fa fa-star" class="on" data-state="active"></i>
                    <i class="fa fa-star" class="on" data-state="active"></i>
                    <i class="fa fa-star" class="on" data-state="active"></i>
                    <i class="fa fa-star" class="on" data-state="active"></i>
                    <i class="fa fa-star" class="on" data-state="active"></i>
               	 </div>
               	 -->
									<c:forEach var="review" items="${reviewList}">
										<span id="rating-1" style="cursor: pointer;" data-stars="4">
											<input name="rating-1" type="hidden"
											value="${review.review_score}"> <c:forEach var="i"
												begin="1" end="${review.review_score}">
												<i class="fa fa-star" style="color: rgb(241, 196, 15);"></i>
											</c:forEach> <c:forEach var="i" begin="${review.review_score}" end="4">
												<i class="fa fa-star" style="color: rgb(236, 240, 241);"></i>
											</c:forEach>
										</span>
									</c:forEach>


									<strong class="grade">4.6</strong> <span class="rv_num"
										style="font-size: 13px;">(총 <em>10</em> 건 구매후기 기준)
									</span>
								</div>
							</div>
							<div class="review_btn_area ">
								<a href="#" class="btns_sys red_big_d review_write"><span>구매후기
										작성</span></a>
							</div>
						</div>
					</div>
					<ul class="list_type">
						<li><h6 style="padding-top: 1%;">구매후기는 구매완료 후 마이페이지 &gt;
								주문배송조회에서 작성하실 수 있습니다.</h6></li>
					</ul>
				</div>

				<br>

				<div class="title_area clear" data-review="sort"
					style="display: block; width: 200%;">
					<div class="total-sort" style="font-size: 17px;">
						<span class="active" data-outputtype="1">전체</span><i
							style="display: inline-block;">|</i> <span data-outputtype="2"
							style="display: inline-block;">포토<em
							data-review="photoCount">(8)</em></span>
					</div>
					<select id="fleamarke_sort" name="fleamarket_sort"
						style="float: right;">
						<option value="" selected="selected">--베스트순--</option>
						<option value="베스트순" id="best">베스트순</option>
						<option value="최신순" id="newest">최신순</option>

					</select>
				</div>
				<br>

				<!-- 
            <div class="ui_title hide-m">
                <h2 class="ui_title__txt">구매후기</h2>
            </div> -->
				<c:forEach var="review" items="${reviewList}">
					<ul class="masonry-grid x2" data-col="2"
						style="position: relative; height: 2221.64px;">
						<li class="card-style story"
							style="position: absolute; left: 0px; top: 0px;">
							<div class="bordering">

								<input name="time_stamp" type="hidden" value="1575262761000">
								<div class="area-txt">
									<div class="area-rating">
										<div class="img-bg"
											style="background-image: url(https://image.idus.com/image/files/d6c74ae706ad40f1b6f83af3d5b1334d_512.jpg)"></div>
										<a href="#" class="title ellipsis">${review.review_title}</a>
										<div class="ui_rating" data-ui="rating" data-value="5">
											<i class="ui_icon--star-fill" data-state="active"></i> <i
												class="ui_icon--star-fill" data-state="active"></i> <i
												class="ui_icon--star-fill" data-state="active"></i> <i
												class="ui_icon--star-fill" data-state="active"></i> <i
												class="ui_icon--star-fill" data-state="active"></i>
										</div>
									</div>

									<a href="#" target="_blank">
										<div class="split-hard">
											<span class="split crop-circ"
												style="background-image: url(https://image.idus.com/image/files/37cec8c9f8bd47458facc5bdacfb0b24.jpg)">
											</span>
											<div class="split">


												<span id="rating-1" style="cursor: pointer;" data-stars="4">
													<input name="rating-1" type="hidden"
													value="${review.review_score}"> <c:forEach var="i"
														begin="1" end="${review.review_score}">
														<i class="fa fa-star" style="color: rgb(241, 196, 15);"></i>
													</c:forEach> <c:forEach var="i" begin="${review.review_score}" end="4">
														<i class="fa fa-star" style="color: rgb(236, 240, 241);"></i>
													</c:forEach>
												</span> <span class="txt-strong">뽀또</span> <span class="txt">2019년
													12월 02일</span>
											</div>
										</div>

										<p class="desc">실제로 받아 보니까 더 예뻤어요! 진주 눈꽃송이 등의 조합이라서 옷차림도 안
											타고 웬만한 코디에 다 잘어울릴거 같아요ㅎㅎ 귀찌 변경했는데 잘 착용하고 있어요!♡ 321은 배송도 빠르게
											해주시고 귀찌 가능제품들도 많아서 졸아요 ㅠ_ㅠ 사장님의 친절함은 말모..! 감사합니다 💛</p> <img
										src="${review.review_photo}"
										style="width: 200px; height: 200px;" alt="..."> <br>


									</a>
								</div>

							</div>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>